unit AWSTests.S3.GeneratePresignedUrlTests;

interface

uses
  System.Generics.Collections, System.SysUtils, System.StrUtils, System.Classes, System.IOUtils, System.DateUtils,
  System.Net.HttpClient,
  TestFramework, TestExtensions,
  AWSTests.TestBase,
  AWSTests.S3.TestUtils,
  AWSTests.UtilityMethods,
  AWS.Runtime.Model,
  AWS.RegionEndpoint,
  AWS.RegionEndpoints,
  AWS.SDKUtils,
  AWS.S3,
  AWS.S3.Exception,
  AWS.S3.Enums,
  AWS.S3.Internal.AWSConfigsS3;

type
  TGeneratePresignedUrlTests = class(TAWSTestBase<TAmazonS3Client, IAmazonS3>)
  private const
    TestContent = 'This is the content body!';
    TestKey = 'key';
    MegSize = 1048576;
  private
    function CreateBucketAndObject(Client: IAmazonS3): string;
    procedure AssertPreSignedUrl(Client: IAmazonS3; const BucketName: string; Expires: TDateTime; ExpectSigV4Url: Boolean);
    procedure DeleteBucket(Client: IAmazonS3; const BucketName: string);
    procedure AssertSignedUrlParameters(Client: IAmazonS3; const BucketName: string; Expires: TDateTime; ExpectSigV4Url: Boolean);
    procedure MultipartUploadPresignedUrl_Internal;
  private
    procedure TestPreSignedUrl(Region: IRegionEndpointEx; Expires: TDateTime; UseSigV4: Boolean; ExpectSigV4Url: Boolean);
    procedure TestPreSignedUrlWithSessionToken(Region: IRegionEndpointEx; Expires: TDateTime; UseSigV4: Boolean; ExpectSigV4Url: Boolean);
    procedure TestSignedUrlParameters(Region: IRegionEndpointEx; Expires: TDateTime);
  published
    procedure USEastUnder7Days;
    procedure USEastOver7Days;
    procedure EUCentral1Under7Days;
    procedure EUCentral1Over7Days;
    procedure USEastSignedParameters;
    procedure GeneratePresigned;
    procedure MultipartUploadPresignedUrlV2;
    procedure MultipartUploadPresignedUrlV4;
  end;

implementation

{ TGeneratePresignedUrlTests }

procedure TGeneratePresignedUrlTests.AssertPreSignedUrl(Client: IAmazonS3; const BucketName: string; Expires: TDateTime;
  ExpectSigV4Url: Boolean);
begin
  // generate url
  var Request: IGetPreSignedUrlRequest := TGetPreSignedUrlRequest.Create;
  Request.BucketName := BucketName;
  Request.Key := TestKey;
  Request.Expires := Expires;
  var url := Client.GetPreSignedURL(Request);

  // make sure we used the correct signtaure version
  var urlIsSigV4 := url.Contains('aws4_request');
  CheckEquals(expectSigV4Url, urlIsSigV4, 'expected sigv4');

  // use independent web client make sure the URL actually works
  var wc := THttpClient.Create;
  try
    var Response: IHTTPResponse := wc.Get(url);
    ChecKEquals(Response.ContentAsString, TestContent);
  finally
    wc.Free;
  end;
end;

procedure TGeneratePresignedUrlTests.AssertSignedUrlParameters(Client: IAmazonS3; const BucketName: string; Expires: TDateTime;
  ExpectSigV4Url: Boolean);
const
  paramKey = 'x-test-param';
  paramValue = 'TestParamValue';
  badParamKey = 'x-test-param2';
  badParamValue = 'TestParamValue2';
begin
  var preSignedRequest: IGetPreSignedUrlRequest := TGetPreSignedUrlRequest.Create;
  preSignedRequest.BucketName := BucketName;
  preSignedRequest.Key := TestKey;
  preSignedRequest.Expires := Expires;

  // Add a parameter & value to be signed
  preSignedRequest.Parameters.Add(paramKey, paramValue);

  // generate url
  var url := Client.GetPreSignedURL(preSignedRequest);

  // make sure we used the correct signtaure version
  var urlIsSigV4 := url.Contains('aws4_request');
  CheckEquals(expectSigV4Url, urlIsSigV4);

  // use independent web client make sure the URL actually works
  var wc := THttpClient.Create;
  try
    var Response: IHTTPResponse := wc.Get(url);
    ChecKEquals(Response.ContentAsString, TestContent);
    CheckEquals(200, Response.StatusCode);

    // change parameter and we should get a 403 response
    var badParamURL := url.Replace(paramKey, badParamKey);

    // Using a modified parameter name should throw an exception
    Response := wc.Get(badParamURL);
    CheckEquals(403, Response.StatusCode);

    // change value and we should get a 403 response
    var badValueURL := url.Replace(paramValue, badParamValue);

    // Using a modified parameter value should throw an exception
    Response := wc.Get(badValueURL);
    CheckEquals(403, Response.StatusCode);

  finally
    wc.Free;
  end;
end;

function TGeneratePresignedUrlTests.CreateBucketAndObject(Client: IAmazonS3): string;
begin
  Result := TS3TestUtils.CreateBucketWithWait(Client);
  var Request: IPutObjectRequest := TPutObjectRequest.Create;
  Request.BucketName := Result;
  Request.Key := TestKey;
  Request.ContentBody := TestContent;
  Client.PutObject(Request);
  TS3TestUtils.WaitForObject(Client, Result, TestKey, 30);
end;

procedure TGeneratePresignedUrlTests.DeleteBucket(Client: IAmazonS3; const BucketName: string);
begin
  TS3TestUtils.DeleteS3BucketWithObjects(Client, BucketName);
end;

procedure TGeneratePresignedUrlTests.EUCentral1Over7Days;
begin
  // EUCentral1 doesn't allow SigV2 so we expect an error since the expiration > 7 days
  CheckRaise<EArgumentException>(
    procedure
    begin
      TestPreSignedUrl(TRegionEndpoints.EUCentral1, Now.IncDay(7).IncHour(2), True, True);
    end,
    procedure(E: EArgumentException)
    begin
      CheckEquals(E.Message, 'The maximum expiry period for a presigned url using AWS4 signing is 604800 seconds');
    end);

//  CheckRaise<EArgumentException>(
//    procedure
//    begin
//      TestPreSignedUrlWithSessionToken(TRegionEndpoints.EUCentral1, Now.IncDay(7).IncHour(2), True, True);
//    end,
//    procedure(E: EArgumentException)
//    begin
//      CheckEquals(E.Message, 'The maximum expiry period for a presigned url using AWS4 signing is 604800 seconds');
//    end);
end;

procedure TGeneratePresignedUrlTests.EUCentral1Under7Days;
begin
  TestPreSignedUrl(TRegionEndpoints.EUCentral1, Now.IncDay(7).IncHour(-2), True, True);
  TestPreSignedUrlWithSessionToken(TRegionEndpoints.EUCentral1, Now.IncDay(7).IncHour(-2), True, True);
end;

procedure TGeneratePresignedUrlTests.GeneratePresigned;
begin
  var key := 'multipart';
  var client: IAmazonS3 := TAmazonS3Client.Create(TRegionEndpoints.USEast1);
  var bucketName := 'bla';
  var uploadId := 'jkNGZEc0jy9nEJqt_L1rLb6k4uWNH5MXvF5o5jEnPWm4DKOL6GSGvYIKMtG4wq2G5sr6Ca7N5CiGAPevY5jYKN_2eWURQsv6MmtjmINjlBViJWcZ9LjMtOMH533i_jab';
  var part := 1;
  var request: IGetPreSignedUrlRequest := TGetPreSignedUrlRequest.Create;
  request.BucketName := bucketName;
  request.Key := key;
  request.Expires := EncodeDate(2024, 7, 1);
  request.PartNumber := part;
  request.UploadId := uploadId;
  request.Verb := THttpVerb.PUT;
  request.ContentType := 'text/plain';
  request.Protocol := TProtocol.HTTPS;
  var url := client.GetPreSignedURL(request);
  Status(url);
end;

procedure TGeneratePresignedUrlTests.MultipartUploadPresignedUrlV2;
begin
  var originalUseSigV4 := TAWSConfigsS3.UseSignatureVersion4;
  var originalExplicit := TAWSConfigsS3.UseSigV4SetExplicitly;
  try
    TAWSConfigsS3.UseSignatureVersion4 := False;
    TAWSConfigsS3.UseSigV4SetExplicitly := False;
    MultipartUploadPresignedUrl_Internal;
  finally
    TAWSConfigsS3.UseSignatureVersion4 := originalUseSigV4;
    TAWSConfigsS3.UseSigV4SetExplicitly := originalExplicit;
  end;
end;

procedure TGeneratePresignedUrlTests.MultipartUploadPresignedUrlV4;
begin
  var originalUseSigV4 := TAWSConfigsS3.UseSignatureVersion4;
  var originalExplicit := TAWSConfigsS3.UseSigV4SetExplicitly;
  try
    TAWSConfigsS3.UseSignatureVersion4 := True;
    MultipartUploadPresignedUrl_Internal;
  finally
    TAWSConfigsS3.UseSignatureVersion4 := originalUseSigV4;
    TAWSConfigsS3.UseSigV4SetExplicitly := originalExplicit;
  end;
end;

procedure TGeneratePresignedUrlTests.MultipartUploadPresignedUrl_Internal;
begin
  var key := 'multipart';
  var client: IAmazonS3 := TAmazonS3Client.Create(TRegionEndpoints.USEast1);
  var bucketName := CreateBucketAndObject(client);
  var totalMegs := 15;

  var initRequest: IInitiateMultipartUploadRequest := TInitiateMultipartUploadRequest.Create;
  initRequest.BucketName := bucketName;
  initRequest.Key := key;
  initRequest.ContentType := 'text/plain';
  var initiateMultipartResponse := client.InitiateMultipartUpload(initRequest);

  var abortedMessage := '';
  var partETags := TObjectList<TPartETag>.Create;
  try
    try
      var part := 1;
      while part <= totalMegs div 5 do
      begin
        var request: IGetPreSignedUrlRequest := TGetPreSignedUrlRequest.Create;
        request.BucketName := bucketName;
        request.Key := key;
        request.Expires := Now.IncDay(1);
        request.PartNumber := part;
        request.UploadId := initiateMultipartResponse.UploadId;
        request.Verb := THttpVerb.PUT;
        request.ContentType := 'text/plain';
        request.Protocol := TProtocol.HTTPS;
        var url := client.GetPreSignedURL(request);

        var wc := THTTPClient.Create;
        try
          // workaround THTTPClient, it considers ; in query string as a parameter separator, and it shouldn't.
          // this failes when the pre-signed url has a construction like "X-Amz-SignedHeaders=content-type;host"
          url := url.Replace(';', '%3B');
          var httpReq := wc.GetRequest('PUT', url);
          httpReq.AddHeader('Content-Length', IntToStr(MegSize * 5));
          httpReq.AddHeader('Content-Type', 'text/plain');

          var buffer: TBytes;
          SetLength(buffer, MegSize * 5);
          for var I := 0 to Length(buffer) - 1 do
            buffer[I] := Random(256);
          var dataStream := TBytesStream.Create(buffer);
          try
            httpReq.SourceStream := dataStream;
            var httpResp := wc.Execute(httpReq);
            Check((httpResp.StatusCode >= 200) and (httpResp.StatusCode < 300), 'returnded status code: ' + IntToStr(httpResp.StatusCode));

            var partETag := TPartETag.Create;
            partETags.Add(partETag);
            partETag.PartNumber := part;
            partETag.ETag := httpResp.HeaderValue['ETag'];
            Check(partETag.ETag <> '', 'e-tag should not be empty');
          finally
            dataStream.Free;
          end;
        finally
          wc.Free;
        end;
        Inc(part);
      end;

      var endRequest: ICompleteMultipartUploadRequest := TCompleteMultipartUploadRequest.Create;
      endRequest.BucketName := BucketName;
      endRequest.Key := Key;
      endRequest.UploadId := initiateMultipartResponse.UploadId;
      endRequest.PartETags := partETags;
      endRequest.KeepPartETags := True;
      client.CompleteMultipartUpload(endRequest);
    except
      on E: Exception do
      begin
        abortedMessage := E.Message;
        Client.AbortMultipartUpload(bucketName, key, initiateMultipartResponse.UploadId);
        raise;
      end;
    end;
  finally
    partETags.Free;
    DeleteBucket(client, bucketName);
    if abortedMessage <> '' then
      Check(False, abortedMessage);
  end;
end;

procedure TGeneratePresignedUrlTests.TestPreSignedUrl(Region: IRegionEndpointEx; Expires: TDateTime; UseSigV4,
  ExpectSigV4Url: Boolean);
begin
  var Client: IAmazonS3 := TAmazonS3Client.Create(Region);
  var originalUseSigV4 := TAWSConfigsS3.UseSignatureVersion4;
  var originalExplicit := TAWSConfigsS3.UseSigV4SetExplicitly;
  var BucketName := '';
  try
    TAWSConfigsS3.UseSignatureVersion4 := true;
    BucketName := CreateBucketAndObject(Client);
    AssertPreSignedUrl(Client, BucketName, Expires, ExpectSigV4Url);
  finally
    TAWSConfigsS3.UseSignatureVersion4 := originalUseSigV4;
    TAWSConfigsS3.UseSigV4SetExplicitly := originalExplicit;
    if BucketName <> '' then
      DeleteBucket(Client, BucketName);
  end;
end;

procedure TGeneratePresignedUrlTests.TestPreSignedUrlWithSessionToken(Region: IRegionEndpointEx; Expires: TDateTime; UseSigV4,
  ExpectSigV4Url: Boolean);
begin
//  Check(False);
end;

procedure TGeneratePresignedUrlTests.TestSignedUrlParameters(Region: IRegionEndpointEx; Expires: TDateTime);
begin
  var client: IAmazonS3 := TAmazonS3Client.Create(region);
  var originalUseSigV4 := TAWSConfigsS3.UseSignatureVersion4;
  var originalExplicit := TAWSConfigsS3.UseSigV4SetExplicitly;
  var bucketName := '';
  try
    TAWSConfigsS3.UseSignatureVersion4 := True;
    bucketName := CreateBucketAndObject(client);
    AssertSignedUrlParameters(client, bucketName, Expires, True);
  finally
    TAWSConfigsS3.UseSignatureVersion4 := originalUseSigV4;
    TAWSConfigsS3.UseSigV4SetExplicitly := originalExplicit;
    if bucketName <> '' then
      DeleteBucket(client, bucketName);
  end;
end;

procedure TGeneratePresignedUrlTests.USEastOver7Days;
begin
  TestPreSignedUrl(TRegionEndpoints.USEast1, Now.IncDay(7).IncHour(2), True, False);
  TestPreSignedUrlWithSessionToken(TRegionEndpoints.USEast1, Now.IncDay(7).IncHour(2), True, False);
end;

procedure TGeneratePresignedUrlTests.USEastSignedParameters;
begin
  TestSignedUrlParameters(TRegionEndpoints.USEast1, TDateTime.Now.IncDay(1));
end;

procedure TGeneratePresignedUrlTests.USEastUnder7Days;
begin
  TestPreSignedUrl(TRegionEndpoints.USEast1, Now.IncDay(7).IncHour(-2), True, True);
  TestPreSignedUrlWithSessionToken(TRegionEndpoints.USEast1, Now.IncDay(7).IncHour(-2), True, True);
end;

initialization
  RegisterTest('AWS.S3', TGeneratePresignedUrlTests.Suite);
end.

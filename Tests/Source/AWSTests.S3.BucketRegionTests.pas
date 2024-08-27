unit AWSTests.S3.BucketRegionTests;

interface

uses
  System.Generics.Collections, System.SysUtils, System.StrUtils, System.Classes, System.Net.HttpClient,
  TestFramework, TestExtensions,
  AWSTests.TestBase,
  AWS.RegionEndpoint,
  AWS.Runtime.Model,
  AWS.RegionEndpoints,
  AWS.S3,
  AWS.S3.Util.BucketRegionDetector,
  AWS.S3.Util.AmazonS3Util,
  AWSTests.S3.TestUtils,
  AWSTests.S3.BucketRegionTestRunner;

type
  TBucketRegionTests = class(TAWSTestBase)
  strict private
    runner: TBucketRegionTestRunner;
    function GetHttpStatusCode(const Url: string): Integer;
  public
    procedure TearDown; override;
  published
    procedure HappyCaseSigV2;
    procedure HappyCaseSigV4;
    procedure HappyCaseGetObjectMetedata;
//    procedure GetObjectMetedataSessionCredentials;
    procedure HappyCaseDoesS3BucketExist;
    procedure BucketRecreatedInDifferentRegion;
    procedure GetPreSignedUrlSigV2;
    procedure GetPreSignedUrlSigV4ImplicitlySet;
    procedure GetPreSignedUrlSigV4ExplicitlySet;
    procedure DeleteBucketUsingS3RegionUSEast1Enum;
  end;

implementation

{ TBucketRegionTests }

procedure TBucketRegionTests.BucketRecreatedInDifferentRegion;
begin
  runner := TBucketRegionTestRunner.Create(True);
  if runner.TestBucketIsReady then
  begin
    TBucketRegionDetector.BucketRegionCache.AddOrUpdate(runner.BucketName, TRegionEndpoints.APNortheast2);
    runner.USEast1Client.PutObject(runner.PutObjectRequest);
    var cachedRegion: IRegionEndpointEx;
    Check(TBucketRegionDetector.BucketRegionCache.TryGetValue(runner.BucketName, cachedRegion));
    CheckEquals(TRegionEndpoints.USWest1.SystemName, cachedRegion.SystemName);
  end
  else
    Fail('bucket not ready');
end;

procedure TBucketRegionTests.DeleteBucketUsingS3RegionUSEast1Enum;
begin
  runner := TBucketRegionTestRunner.Create(True, True);
  var bucketName := TS3TestUtils.CreateBucketWithWait(runner.USEast1Client);

  var request: IDeleteBucketRequest := TDeleteBucketRequest.Create;
  request.BucketName := bucketName;
  request.BucketRegionName := TRegionEndpoints.USEast1.SystemName;
  runner.USWest1Client.DeleteBucket(request);
end;

function TBucketRegionTests.GetHttpStatusCode(const Url: string): Integer;
begin
  var Client := THttpClient.Create;
  try
    var Response := Client.Get(Url);
    Result := Response.StatusCode;
  finally
    Client.Free;
  end;
end;

//procedure TBucketRegionTests.GetObjectMetedataSessionCredentials;
//begin
//  runner := TBucketRegionTestRunner.Create(False);
//  if runner.TestBucketIsReady then
//  begin
//    Check(False, 'implement');
//  end
//  else
//    Fail('bucket not ready');
//end;

procedure TBucketRegionTests.GetPreSignedUrlSigV2;
begin
  runner := TBucketRegionTestRunner.Create(False);
  if runner.TestBucketIsReady then
  begin
    CheckEquals(200, GetHttpStatusCode(runner.USEast1Client.GetPreSignedURL(runner.PreSignedUrlRequest)));
  end
  else
    Fail('bucket not ready');
end;

procedure TBucketRegionTests.GetPreSignedUrlSigV4ExplicitlySet;
begin
  runner := TBucketRegionTestRunner.Create(True, True);
  if runner.TestBucketIsReady then
  begin
    CheckEquals(400, GetHttpStatusCode(runner.USEast1Client.GetPreSignedURL(runner.PreSignedUrlRequest)));
  end
  else
    Fail('bucket not ready');
end;

procedure TBucketRegionTests.GetPreSignedUrlSigV4ImplicitlySet;
begin
  runner := TBucketRegionTestRunner.Create(True);
  if runner.TestBucketIsReady then
  begin
    CheckEquals(200, GetHttpStatusCode(runner.USEast1Client.GetPreSignedURL(runner.PreSignedUrlRequest)));
  end
  else
    Fail('bucket not ready');
end;

procedure TBucketRegionTests.HappyCaseDoesS3BucketExist;
begin
  runner := TBucketRegionTestRunner.Create(True, True);
  if runner.TestBucketIsReady then
  begin
    Check(TAmazonS3Util.DoesS3BucketExistV2(runner.USEast1Client, runner.BucketName));
    var cachedRegion: IRegionEndpointEx;
    Check(TBucketRegionDetector.BucketRegionCache.TryGetValue(runner.BucketName, cachedRegion));
    CheckEquals(TRegionEndpoints.USWest1.SystemName, cachedRegion.SystemName);
  end
  else
    Fail('bucket not ready');
end;

procedure TBucketRegionTests.HappyCaseGetObjectMetedata;
begin
  // make sure the cache works when it gets the region from a HEAD bucket request
  runner := TBucketRegionTestRunner.Create(True);
  if runner.TestBucketIsReady then
  begin
    // ensure the object exists then clear the cache
    runner.USEast1Client.PutObject(runner.PutObjectRequest);
    TBucketRegionDetector.BucketRegionCache.Clear;
    runner.USEast1Client.GetObjectMetadata(runner.GetObjectMetadataRequest);
    var cachedRegion: IRegionEndpointEx;
    Check(TBucketRegionDetector.BucketRegionCache.TryGetValue(runner.BucketName, cachedRegion));
    CheckEquals(TRegionEndpoints.USWest1.SystemName, cachedRegion.SystemName);
  end
  else
    Fail('bucket not ready');
end;

procedure TBucketRegionTests.HappyCaseSigV2;
begin
  // make sure we're not using the cache with SigV2 requests
  runner := TBucketRegionTestRunner.Create(False);
  if runner.TestBucketIsReady then
  begin
    runner.USEast1Client.PutObject(runner.PutObjectRequest);
    var cachedRegion: IRegionEndpointEx;
    Check(not TBucketRegionDetector.BucketRegionCache.TryGetValue(runner.BucketName, cachedRegion), 'should not be cached');
    Check(cachedRegion = nil, 'cachedRegion not nil');
  end
  else
    Fail('bucket not ready');
end;

procedure TBucketRegionTests.HappyCaseSigV4;
begin
  // make sure we're not using the cache with SigV2 requests
  runner := TBucketRegionTestRunner.Create(True);
  if runner.TestBucketIsReady then
  begin
    runner.USEast1Client.PutObject(runner.PutObjectRequest);
    var cachedRegion: IRegionEndpointEx;
    Check(TBucketRegionDetector.BucketRegionCache.TryGetValue(runner.BucketName, cachedRegion));
    CheckEquals(TRegionEndpoints.USWest1.SystemName, cachedRegion.SystemName);
  end
  else
    Fail('bucket not ready');
end;

procedure TBucketRegionTests.TearDown;
begin
  FreeAndNil(runner);
  inherited;
end;

initialization
  RegisterTest('AWS.S3', TBucketRegionTests.Suite);

end.

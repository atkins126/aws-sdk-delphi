unit AWS.Transcribe.Transform.ListCallAnalyticsCategoriesRequestMarshaller;

interface

uses
  System.Classes, 
  System.SysUtils, 
  Bcl.Json.Writer, 
  AWS.Internal.Request, 
  AWS.Transform.RequestMarshaller, 
  AWS.Runtime.Model, 
  AWS.Transcribe.Model.ListCallAnalyticsCategoriesRequest, 
  AWS.Internal.DefaultRequest, 
  AWS.SDKUtils;

type
  IListCallAnalyticsCategoriesRequestMarshaller = IMarshaller<IRequest, TAmazonWebServiceRequest>;
  
  TListCallAnalyticsCategoriesRequestMarshaller = class(TInterfacedObject, IMarshaller<IRequest, TListCallAnalyticsCategoriesRequest>, IListCallAnalyticsCategoriesRequestMarshaller)
  strict private
    class var FInstance: IListCallAnalyticsCategoriesRequestMarshaller;
    class constructor Create;
  public
    function Marshall(AInput: TAmazonWebServiceRequest): IRequest; overload;
    function Marshall(PublicRequest: TListCallAnalyticsCategoriesRequest): IRequest; overload;
    class function Instance: IListCallAnalyticsCategoriesRequestMarshaller; static;
  end;
  
implementation

{ TListCallAnalyticsCategoriesRequestMarshaller }

function TListCallAnalyticsCategoriesRequestMarshaller.Marshall(AInput: TAmazonWebServiceRequest): IRequest;
begin
  Result := Marshall(TListCallAnalyticsCategoriesRequest(AInput));
end;

function TListCallAnalyticsCategoriesRequestMarshaller.Marshall(PublicRequest: TListCallAnalyticsCategoriesRequest): IRequest;
var
  Request: IRequest;
begin
  Request := TDefaultRequest.Create(PublicRequest, 'Amazon.TranscribeService');
  Request.Headers.Add('X-Amz-Target', 'Transcribe.ListCallAnalyticsCategories');
  Request.Headers.AddOrSetValue('Content-Type', 'application/x-amz-json-1.1');
  Request.Headers.AddOrSetValue(THeaderKeys.XAmzApiVersion, '2017-10-26');
  Request.HttpMethod := 'POST';
  Request.ResourcePath := '/';
  var Stream: TStringStream := TStringStream.Create('', TEncoding.UTF8, False);
  try
    var Writer: TJsonWriter := TJsonWriter.Create(Stream);
    try
      var Context: TJsonMarshallerContext := TJsonMarshallerContext.Create(Request, Writer);
      try
        Writer.WriteBeginObject;
        if PublicRequest.IsSetMaxResults then
        begin
          Context.Writer.WriteName('MaxResults');
          Context.Writer.WriteInteger(PublicRequest.MaxResults);
        end;
        if PublicRequest.IsSetNextToken then
        begin
          Context.Writer.WriteName('NextToken');
          Context.Writer.WriteString(PublicRequest.NextToken);
        end;
        Writer.WriteEndObject;
        Writer.Flush;
        var Snippet: string := Stream.DataString;
        Request.Content := TEncoding.UTF8.GetBytes(Snippet);
      finally
        Context.Free;
      end;
    finally
      Writer.Free;
    end;
  finally
    Stream.Free;
  end;
  Result := Request;
end;

class constructor TListCallAnalyticsCategoriesRequestMarshaller.Create;
begin
  FInstance := TListCallAnalyticsCategoriesRequestMarshaller.Create;
end;

class function TListCallAnalyticsCategoriesRequestMarshaller.Instance: IListCallAnalyticsCategoriesRequestMarshaller;
begin
  Result := FInstance;
end;

end.

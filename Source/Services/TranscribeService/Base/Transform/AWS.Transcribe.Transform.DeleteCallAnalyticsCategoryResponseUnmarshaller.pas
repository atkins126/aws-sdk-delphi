unit AWS.Transcribe.Transform.DeleteCallAnalyticsCategoryResponseUnmarshaller;

interface

uses
  AWS.Transcribe.Model.DeleteCallAnalyticsCategoryResponse, 
  AWS.Transform.ResponseUnmarshaller, 
  AWS.Runtime.Model, 
  AWS.Transform.JsonUnmarshallerContext, 
  AWS.Runtime.Exceptions, 
  System.SysUtils, 
  AWS.Internal.ErrorResponse, 
  AWS.Transform.JsonErrorResponseUnmarshaller, 
  System.Classes, 
  AWS.Transcribe.Transform.BadRequestExceptionUnmarshaller, 
  AWS.Transcribe.Transform.InternalFailureExceptionUnmarshaller, 
  AWS.Transcribe.Transform.LimitExceededExceptionUnmarshaller, 
  AWS.Transcribe.Transform.NotFoundExceptionUnmarshaller, 
  AWS.Transcribe.Exception;

type
  IDeleteCallAnalyticsCategoryResponseUnmarshaller = IResponseUnmarshaller;
  
  TDeleteCallAnalyticsCategoryResponseUnmarshaller = class(TJsonResponseUnmarshaller, IDeleteCallAnalyticsCategoryResponseUnmarshaller)
  strict private
    class var FInstance: IDeleteCallAnalyticsCategoryResponseUnmarshaller;
    class constructor Create;
  public
    function Unmarshall(AContext: TJsonUnmarshallerContext): TAmazonWebServiceResponse; overload; override;
    function UnmarshallException(AContext: TJsonUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException; override;
    class function Instance: IDeleteCallAnalyticsCategoryResponseUnmarshaller; static;
  end;
  
implementation

{ TDeleteCallAnalyticsCategoryResponseUnmarshaller }

function TDeleteCallAnalyticsCategoryResponseUnmarshaller.Unmarshall(AContext: TJsonUnmarshallerContext): TAmazonWebServiceResponse;
var
  Response: TDeleteCallAnalyticsCategoryResponse;
begin
  Response := TDeleteCallAnalyticsCategoryResponse.Create;
  try
    Result := Response;
    Response := nil;
  finally
    Response.Free;
  end;
end;

function TDeleteCallAnalyticsCategoryResponseUnmarshaller.UnmarshallException(AContext: TJsonUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException;
var
  ErrorResponse: TErrorResponse;
  StreamCopy: TStream;
  ContextCopy: TJsonUnmarshallerContext;
begin
  ErrorResponse := TJsonErrorResponseUnmarshaller.Instance.Unmarshall(AContext);
  try
    ErrorResponse.InnerException := AInnerException;
    ErrorResponse.StatusCode := AStatusCode;
    StreamCopy := TBytesStream.Create(AContext.GetResponseBodyBytes);
    try
      ContextCopy := TJsonUnmarshallerContext.Create(StreamCopy, False, nil);
      try
        if ErrorResponse.Code = 'BadRequestException' then
          Exit(TBadRequestExceptionUnmarshaller.Instance.Unmarshall(ContextCopy, ErrorResponse));
        if ErrorResponse.Code = 'InternalFailureException' then
          Exit(TInternalFailureExceptionUnmarshaller.Instance.Unmarshall(ContextCopy, ErrorResponse));
        if ErrorResponse.Code = 'LimitExceededException' then
          Exit(TLimitExceededExceptionUnmarshaller.Instance.Unmarshall(ContextCopy, ErrorResponse));
        if ErrorResponse.Code = 'NotFoundException' then
          Exit(TNotFoundExceptionUnmarshaller.Instance.Unmarshall(ContextCopy, ErrorResponse));
      finally
        ContextCopy.Free;
      end;
    finally
      StreamCopy.Free;
    end;
    Exit(EAmazonTranscribeServiceException.Create(ErrorResponse.Message, AInnerException, ErrorResponse.ErrorType, ErrorResponse.Code, ErrorResponse.RequestId, AStatusCode));
  finally
    ErrorResponse.Free;
  end;
end;

class constructor TDeleteCallAnalyticsCategoryResponseUnmarshaller.Create;
begin
  FInstance := TDeleteCallAnalyticsCategoryResponseUnmarshaller.Create;
end;

class function TDeleteCallAnalyticsCategoryResponseUnmarshaller.Instance: IDeleteCallAnalyticsCategoryResponseUnmarshaller;
begin
  Result := FInstance;
end;

end.

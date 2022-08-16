unit AWS.SESv2.Transform.CreateConfigurationSetEventDestinationResponseUnmarshaller;

interface

uses
  AWS.SESv2.Model.CreateConfigurationSetEventDestinationResponse, 
  AWS.Transform.ResponseUnmarshaller, 
  AWS.Runtime.Model, 
  AWS.Transform.JsonUnmarshallerContext, 
  AWS.Runtime.Exceptions, 
  System.SysUtils, 
  AWS.Internal.ErrorResponse, 
  AWS.Transform.JsonErrorResponseUnmarshaller, 
  System.Classes, 
  AWS.SESv2.Transform.AlreadyExistsExceptionUnmarshaller, 
  AWS.SESv2.Transform.BadRequestExceptionUnmarshaller, 
  AWS.SESv2.Transform.LimitExceededExceptionUnmarshaller, 
  AWS.SESv2.Transform.NotFoundExceptionUnmarshaller, 
  AWS.SESv2.Transform.TooManyRequestsExceptionUnmarshaller, 
  AWS.SESv2.Exception;

type
  ICreateConfigurationSetEventDestinationResponseUnmarshaller = IResponseUnmarshaller;
  
  TCreateConfigurationSetEventDestinationResponseUnmarshaller = class(TJsonResponseUnmarshaller, ICreateConfigurationSetEventDestinationResponseUnmarshaller)
  strict private
    class var FInstance: ICreateConfigurationSetEventDestinationResponseUnmarshaller;
    class constructor Create;
  public
    function Unmarshall(AContext: TJsonUnmarshallerContext): TAmazonWebServiceResponse; overload; override;
    function UnmarshallException(AContext: TJsonUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException; override;
    class function Instance: ICreateConfigurationSetEventDestinationResponseUnmarshaller; static;
  end;
  
implementation

{ TCreateConfigurationSetEventDestinationResponseUnmarshaller }

function TCreateConfigurationSetEventDestinationResponseUnmarshaller.Unmarshall(AContext: TJsonUnmarshallerContext): TAmazonWebServiceResponse;
var
  Response: TCreateConfigurationSetEventDestinationResponse;
begin
  Response := TCreateConfigurationSetEventDestinationResponse.Create;
  try
    Result := Response;
    Response := nil;
  finally
    Response.Free;
  end;
end;

function TCreateConfigurationSetEventDestinationResponseUnmarshaller.UnmarshallException(AContext: TJsonUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException;
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
        if ErrorResponse.Code = 'AlreadyExistsException' then
          Exit(TAlreadyExistsExceptionUnmarshaller.Instance.Unmarshall(ContextCopy, ErrorResponse));
        if ErrorResponse.Code = 'BadRequestException' then
          Exit(TBadRequestExceptionUnmarshaller.Instance.Unmarshall(ContextCopy, ErrorResponse));
        if ErrorResponse.Code = 'LimitExceededException' then
          Exit(TLimitExceededExceptionUnmarshaller.Instance.Unmarshall(ContextCopy, ErrorResponse));
        if ErrorResponse.Code = 'NotFoundException' then
          Exit(TNotFoundExceptionUnmarshaller.Instance.Unmarshall(ContextCopy, ErrorResponse));
        if ErrorResponse.Code = 'TooManyRequestsException' then
          Exit(TTooManyRequestsExceptionUnmarshaller.Instance.Unmarshall(ContextCopy, ErrorResponse));
      finally
        ContextCopy.Free;
      end;
    finally
      StreamCopy.Free;
    end;
    Exit(EAmazonSimpleEmailServiceV2Exception.Create(ErrorResponse.Message, AInnerException, ErrorResponse.ErrorType, ErrorResponse.Code, ErrorResponse.RequestId, AStatusCode));
  finally
    ErrorResponse.Free;
  end;
end;

class constructor TCreateConfigurationSetEventDestinationResponseUnmarshaller.Create;
begin
  FInstance := TCreateConfigurationSetEventDestinationResponseUnmarshaller.Create;
end;

class function TCreateConfigurationSetEventDestinationResponseUnmarshaller.Instance: ICreateConfigurationSetEventDestinationResponseUnmarshaller;
begin
  Result := FInstance;
end;

end.

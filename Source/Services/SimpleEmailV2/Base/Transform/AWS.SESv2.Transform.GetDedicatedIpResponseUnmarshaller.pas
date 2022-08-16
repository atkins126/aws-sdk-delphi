unit AWS.SESv2.Transform.GetDedicatedIpResponseUnmarshaller;

interface

uses
  AWS.SESv2.Model.GetDedicatedIpResponse, 
  AWS.Transform.ResponseUnmarshaller, 
  AWS.Runtime.Model, 
  AWS.Transform.JsonUnmarshallerContext, 
  AWS.SESv2.Transform.DedicatedIpUnmarshaller, 
  AWS.Runtime.Exceptions, 
  System.SysUtils, 
  AWS.Internal.ErrorResponse, 
  AWS.Transform.JsonErrorResponseUnmarshaller, 
  System.Classes, 
  AWS.SESv2.Transform.BadRequestExceptionUnmarshaller, 
  AWS.SESv2.Transform.NotFoundExceptionUnmarshaller, 
  AWS.SESv2.Transform.TooManyRequestsExceptionUnmarshaller, 
  AWS.SESv2.Exception;

type
  IGetDedicatedIpResponseUnmarshaller = IResponseUnmarshaller;
  
  TGetDedicatedIpResponseUnmarshaller = class(TJsonResponseUnmarshaller, IGetDedicatedIpResponseUnmarshaller)
  strict private
    class var FInstance: IGetDedicatedIpResponseUnmarshaller;
    class constructor Create;
  public
    function Unmarshall(AContext: TJsonUnmarshallerContext): TAmazonWebServiceResponse; overload; override;
    function UnmarshallException(AContext: TJsonUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException; override;
    class function Instance: IGetDedicatedIpResponseUnmarshaller; static;
  end;
  
implementation

{ TGetDedicatedIpResponseUnmarshaller }

function TGetDedicatedIpResponseUnmarshaller.Unmarshall(AContext: TJsonUnmarshallerContext): TAmazonWebServiceResponse;
var
  Response: TGetDedicatedIpResponse;
begin
  Response := TGetDedicatedIpResponse.Create;
  try
    AContext.Read;
    var TargetDepth := AContext.CurrentDepth;
    while AContext.ReadAtDepth(TargetDepth) do
      if AContext.TestExpression('DedicatedIp', TargetDepth) then
      begin
        var Unmarshaller := TDedicatedIpUnmarshaller.JsonInstance;
        Response.DedicatedIp := Unmarshaller.Unmarshall(AContext);
        Continue;
      end;
    Result := Response;
    Response := nil;
  finally
    Response.Free;
  end;
end;

function TGetDedicatedIpResponseUnmarshaller.UnmarshallException(AContext: TJsonUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException;
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

class constructor TGetDedicatedIpResponseUnmarshaller.Create;
begin
  FInstance := TGetDedicatedIpResponseUnmarshaller.Create;
end;

class function TGetDedicatedIpResponseUnmarshaller.Instance: IGetDedicatedIpResponseUnmarshaller;
begin
  Result := FInstance;
end;

end.

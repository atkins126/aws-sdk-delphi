unit AWS.SNS.Transform.ConcurrentAccessExceptionUnmarshaller;

interface

uses
  AWS.Transform.IErrorResponseUnmarshaller, 
  AWS.Transform.UnmarshallerContext, 
  AWS.SNS.Model.ConcurrentAccessException, 
  AWS.Internal.ErrorResponse;

type
  IConcurrentAccessExceptionUnmarshaller = IErrorResponseUnmarshaller<EConcurrentAccessException, TXmlUnmarshallerContext>;
  
  TConcurrentAccessExceptionUnmarshaller = class(TInterfacedObject, IErrorResponseUnmarshaller<EConcurrentAccessException, TXmlUnmarshallerContext>)
  strict private
    class var FInstance: IConcurrentAccessExceptionUnmarshaller;
    class constructor Create;
  public
    function Unmarshall(AContext: TXmlUnmarshallerContext): EConcurrentAccessException; overload;
    function Unmarshall(AContext: TXmlUnmarshallerContext; AErrorResponse: TErrorResponse): EConcurrentAccessException; overload;
    class function Instance: IConcurrentAccessExceptionUnmarshaller; static;
  end;
  
implementation

{ TConcurrentAccessExceptionUnmarshaller }

function TConcurrentAccessExceptionUnmarshaller.Unmarshall(AContext: TXmlUnmarshallerContext): EConcurrentAccessException;
var
  ErrorResponse: TErrorResponse;
begin
  ErrorResponse := TErrorResponse.Create;
  try
    Result := Unmarshall(AContext, ErrorResponse);
  finally
    ErrorResponse.Free;
  end;
end;

function TConcurrentAccessExceptionUnmarshaller.Unmarshall(AContext: TXmlUnmarshallerContext; AErrorResponse: TErrorResponse): EConcurrentAccessException;
var
  OriginalDepth: Integer;
  Response: EConcurrentAccessException;
begin
  Response := EConcurrentAccessException.Create(AErrorResponse.Message, AErrorResponse.InnerException, AErrorResponse.ErrorType, AErrorResponse.Code, AErrorResponse.RequestId, AErrorResponse.StatusCode);
  try
    OriginalDepth := AContext.CurrentDepth;
    while AContext.ReadAtDepth(OriginalDepth) do
      if AContext.IsStartElement or AContext.IsAttribute then
      begin
      end;
    Result := Response;
    Response := nil;
  finally
    Response.Free;
  end;
end;

class constructor TConcurrentAccessExceptionUnmarshaller.Create;
begin
  FInstance := TConcurrentAccessExceptionUnmarshaller.Create;
end;

class function TConcurrentAccessExceptionUnmarshaller.Instance: IConcurrentAccessExceptionUnmarshaller;
begin
  Result := FInstance;
end;

end.

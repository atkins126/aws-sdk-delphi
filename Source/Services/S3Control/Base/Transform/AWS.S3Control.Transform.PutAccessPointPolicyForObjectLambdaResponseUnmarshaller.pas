unit AWS.S3Control.Transform.PutAccessPointPolicyForObjectLambdaResponseUnmarshaller;

interface

uses
  AWS.S3Control.Model.PutAccessPointPolicyForObjectLambdaResponse, 
  AWS.Transform.ResponseUnmarshaller, 
  AWS.Runtime.Model, 
  AWS.Transform.UnmarshallerContext, 
  AWS.Runtime.Exceptions, 
  System.SysUtils, 
  AWS.Internal.ErrorResponse, 
  AWS.Transform.ErrorResponseUnmarshaller, 
  System.Classes, 
  AWS.S3Control.Exception;

type
  IPutAccessPointPolicyForObjectLambdaResponseUnmarshaller = IResponseUnmarshaller;
  
  TPutAccessPointPolicyForObjectLambdaResponseUnmarshaller = class(TXmlResponseUnmarshaller, IPutAccessPointPolicyForObjectLambdaResponseUnmarshaller)
  strict private
    class var FInstance: IPutAccessPointPolicyForObjectLambdaResponseUnmarshaller;
    class constructor Create;
  public
    function Unmarshall(AContext: TXmlUnmarshallerContext): TAmazonWebServiceResponse; overload; override;
    function UnmarshallException(AContext: TXmlUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException; override;
    class function Instance: IPutAccessPointPolicyForObjectLambdaResponseUnmarshaller; static;
  end;
  
implementation

{ TPutAccessPointPolicyForObjectLambdaResponseUnmarshaller }

function TPutAccessPointPolicyForObjectLambdaResponseUnmarshaller.Unmarshall(AContext: TXmlUnmarshallerContext): TAmazonWebServiceResponse;
var
  Response: TPutAccessPointPolicyForObjectLambdaResponse;
begin
  Response := TPutAccessPointPolicyForObjectLambdaResponse.Create;
  try
    Result := Response;
  except
    Response.Free;
    raise;
  end;
end;

function TPutAccessPointPolicyForObjectLambdaResponseUnmarshaller.UnmarshallException(AContext: TXmlUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException;
var
  ErrorResponse: TErrorResponse;
  StreamCopy: TStream;
  ContextCopy: TXmlUnmarshallerContext;
begin
  ErrorResponse := TErrorResponseUnmarshaller.Instance.Unmarshall(AContext);
  try
    ErrorResponse.InnerException := AInnerException;
    ErrorResponse.StatusCode := AStatusCode;
    StreamCopy := TBytesStream.Create(AContext.GetResponseBodyBytes);
    try
      ContextCopy := TXmlUnmarshallerContext.Create(StreamCopy, False, nil);
      try
      finally
        ContextCopy.Free;
      end;
    finally
      StreamCopy.Free;
    end;
    Exit(EAmazonS3ControlException.Create(ErrorResponse.Message, AInnerException, ErrorResponse.ErrorType, ErrorResponse.Code, ErrorResponse.RequestId, AStatusCode));
  finally
    ErrorResponse.Free;
  end;
end;

class constructor TPutAccessPointPolicyForObjectLambdaResponseUnmarshaller.Create;
begin
  FInstance := TPutAccessPointPolicyForObjectLambdaResponseUnmarshaller.Create;
end;

class function TPutAccessPointPolicyForObjectLambdaResponseUnmarshaller.Instance: IPutAccessPointPolicyForObjectLambdaResponseUnmarshaller;
begin
  Result := FInstance;
end;

end.

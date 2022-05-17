unit AWS.Transcribe.Transform.DeleteMedicalTranscriptionJobResponseUnmarshaller;

interface

uses
  AWS.Transcribe.Model.DeleteMedicalTranscriptionJobResponse, 
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
  AWS.Transcribe.Exception;

type
  IDeleteMedicalTranscriptionJobResponseUnmarshaller = IResponseUnmarshaller;
  
  TDeleteMedicalTranscriptionJobResponseUnmarshaller = class(TJsonResponseUnmarshaller, IDeleteMedicalTranscriptionJobResponseUnmarshaller)
  strict private
    class var FInstance: IDeleteMedicalTranscriptionJobResponseUnmarshaller;
    class constructor Create;
  public
    function Unmarshall(AContext: TJsonUnmarshallerContext): TAmazonWebServiceResponse; overload; override;
    function UnmarshallException(AContext: TJsonUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException; override;
    class function Instance: IDeleteMedicalTranscriptionJobResponseUnmarshaller; static;
  end;
  
implementation

{ TDeleteMedicalTranscriptionJobResponseUnmarshaller }

function TDeleteMedicalTranscriptionJobResponseUnmarshaller.Unmarshall(AContext: TJsonUnmarshallerContext): TAmazonWebServiceResponse;
var
  Response: TDeleteMedicalTranscriptionJobResponse;
begin
  Response := TDeleteMedicalTranscriptionJobResponse.Create;
  try
    Result := Response;
    Response := nil;
  finally
    Response.Free;
  end;
end;

function TDeleteMedicalTranscriptionJobResponseUnmarshaller.UnmarshallException(AContext: TJsonUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException;
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

class constructor TDeleteMedicalTranscriptionJobResponseUnmarshaller.Create;
begin
  FInstance := TDeleteMedicalTranscriptionJobResponseUnmarshaller.Create;
end;

class function TDeleteMedicalTranscriptionJobResponseUnmarshaller.Instance: IDeleteMedicalTranscriptionJobResponseUnmarshaller;
begin
  Result := FInstance;
end;

end.

unit AWS.SESv2.Model.UpdateCustomVerificationEmailTemplateResponse;

interface

uses
  AWS.Runtime.Model;

type
  TUpdateCustomVerificationEmailTemplateResponse = class;
  
  IUpdateCustomVerificationEmailTemplateResponse = interface(IAmazonWebServiceResponse)
    function Obj: TUpdateCustomVerificationEmailTemplateResponse;
  end;
  
  TUpdateCustomVerificationEmailTemplateResponse = class(TAmazonWebServiceResponse, IUpdateCustomVerificationEmailTemplateResponse)
  strict protected
    function Obj: TUpdateCustomVerificationEmailTemplateResponse;
  end;
  
implementation

{ TUpdateCustomVerificationEmailTemplateResponse }

function TUpdateCustomVerificationEmailTemplateResponse.Obj: TUpdateCustomVerificationEmailTemplateResponse;
begin
  Result := Self;
end;

end.

unit AWS.SESv2.Model.SendCustomVerificationEmailResponse;

interface

uses
  Bcl.Types.Nullable, 
  AWS.Runtime.Model;

type
  TSendCustomVerificationEmailResponse = class;
  
  ISendCustomVerificationEmailResponse = interface(IAmazonWebServiceResponse)
    function GetMessageId: string;
    procedure SetMessageId(const Value: string);
    function Obj: TSendCustomVerificationEmailResponse;
    function IsSetMessageId: Boolean;
    property MessageId: string read GetMessageId write SetMessageId;
  end;
  
  TSendCustomVerificationEmailResponse = class(TAmazonWebServiceResponse, ISendCustomVerificationEmailResponse)
  strict private
    FMessageId: Nullable<string>;
    function GetMessageId: string;
    procedure SetMessageId(const Value: string);
  strict protected
    function Obj: TSendCustomVerificationEmailResponse;
  public
    function IsSetMessageId: Boolean;
    property MessageId: string read GetMessageId write SetMessageId;
  end;
  
implementation

{ TSendCustomVerificationEmailResponse }

function TSendCustomVerificationEmailResponse.Obj: TSendCustomVerificationEmailResponse;
begin
  Result := Self;
end;

function TSendCustomVerificationEmailResponse.GetMessageId: string;
begin
  Result := FMessageId.ValueOrDefault;
end;

procedure TSendCustomVerificationEmailResponse.SetMessageId(const Value: string);
begin
  FMessageId := Value;
end;

function TSendCustomVerificationEmailResponse.IsSetMessageId: Boolean;
begin
  Result := FMessageId.HasValue;
end;

end.

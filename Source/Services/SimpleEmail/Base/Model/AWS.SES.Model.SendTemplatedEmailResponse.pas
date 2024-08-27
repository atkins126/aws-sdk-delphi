unit AWS.SES.Model.SendTemplatedEmailResponse;

interface

uses
  AWS.Runtime.Model, 
  AWS.Nullable;

type
  TSendTemplatedEmailResponse = class;
  
  ISendTemplatedEmailResponse = interface(IAmazonWebServiceResponse)
    function GetMessageId: string;
    procedure SetMessageId(const Value: string);
    function Obj: TSendTemplatedEmailResponse;
    function IsSetMessageId: Boolean;
    property MessageId: string read GetMessageId write SetMessageId;
  end;
  
  TSendTemplatedEmailResponse = class(TAmazonWebServiceResponse, ISendTemplatedEmailResponse)
  strict private
    FMessageId: Nullable<string>;
    function GetMessageId: string;
    procedure SetMessageId(const Value: string);
  strict protected
    function Obj: TSendTemplatedEmailResponse;
  public
    function IsSetMessageId: Boolean;
    property MessageId: string read GetMessageId write SetMessageId;
  end;
  
implementation

{ TSendTemplatedEmailResponse }

function TSendTemplatedEmailResponse.Obj: TSendTemplatedEmailResponse;
begin
  Result := Self;
end;

function TSendTemplatedEmailResponse.GetMessageId: string;
begin
  Result := FMessageId.ValueOrDefault;
end;

procedure TSendTemplatedEmailResponse.SetMessageId(const Value: string);
begin
  FMessageId := Value;
end;

function TSendTemplatedEmailResponse.IsSetMessageId: Boolean;
begin
  Result := FMessageId.HasValue;
end;

end.

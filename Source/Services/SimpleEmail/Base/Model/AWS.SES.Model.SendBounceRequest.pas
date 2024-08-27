unit AWS.SES.Model.SendBounceRequest;

interface

uses
  System.Generics.Collections, 
  AWS.SES.Model.Request, 
  AWS.Nullable, 
  AWS.SES.Model.BouncedRecipientInfo, 
  AWS.SES.Model.MessageDsn;

type
  TSendBounceRequest = class;
  
  ISendBounceRequest = interface
    function GetBounceSender: string;
    procedure SetBounceSender(const Value: string);
    function GetBounceSenderArn: string;
    procedure SetBounceSenderArn(const Value: string);
    function GetBouncedRecipientInfoList: TObjectList<TBouncedRecipientInfo>;
    procedure SetBouncedRecipientInfoList(const Value: TObjectList<TBouncedRecipientInfo>);
    function GetKeepBouncedRecipientInfoList: Boolean;
    procedure SetKeepBouncedRecipientInfoList(const Value: Boolean);
    function GetExplanation: string;
    procedure SetExplanation(const Value: string);
    function GetMessageDsn: TMessageDsn;
    procedure SetMessageDsn(const Value: TMessageDsn);
    function GetKeepMessageDsn: Boolean;
    procedure SetKeepMessageDsn(const Value: Boolean);
    function GetOriginalMessageId: string;
    procedure SetOriginalMessageId(const Value: string);
    function Obj: TSendBounceRequest;
    function IsSetBounceSender: Boolean;
    function IsSetBounceSenderArn: Boolean;
    function IsSetBouncedRecipientInfoList: Boolean;
    function IsSetExplanation: Boolean;
    function IsSetMessageDsn: Boolean;
    function IsSetOriginalMessageId: Boolean;
    property BounceSender: string read GetBounceSender write SetBounceSender;
    property BounceSenderArn: string read GetBounceSenderArn write SetBounceSenderArn;
    property BouncedRecipientInfoList: TObjectList<TBouncedRecipientInfo> read GetBouncedRecipientInfoList write SetBouncedRecipientInfoList;
    property KeepBouncedRecipientInfoList: Boolean read GetKeepBouncedRecipientInfoList write SetKeepBouncedRecipientInfoList;
    property Explanation: string read GetExplanation write SetExplanation;
    property MessageDsn: TMessageDsn read GetMessageDsn write SetMessageDsn;
    property KeepMessageDsn: Boolean read GetKeepMessageDsn write SetKeepMessageDsn;
    property OriginalMessageId: string read GetOriginalMessageId write SetOriginalMessageId;
  end;
  
  TSendBounceRequest = class(TAmazonSimpleEmailServiceRequest, ISendBounceRequest)
  strict private
    FBounceSender: Nullable<string>;
    FBounceSenderArn: Nullable<string>;
    FBouncedRecipientInfoList: TObjectList<TBouncedRecipientInfo>;
    FKeepBouncedRecipientInfoList: Boolean;
    FExplanation: Nullable<string>;
    FMessageDsn: TMessageDsn;
    FKeepMessageDsn: Boolean;
    FOriginalMessageId: Nullable<string>;
    function GetBounceSender: string;
    procedure SetBounceSender(const Value: string);
    function GetBounceSenderArn: string;
    procedure SetBounceSenderArn(const Value: string);
    function GetBouncedRecipientInfoList: TObjectList<TBouncedRecipientInfo>;
    procedure SetBouncedRecipientInfoList(const Value: TObjectList<TBouncedRecipientInfo>);
    function GetKeepBouncedRecipientInfoList: Boolean;
    procedure SetKeepBouncedRecipientInfoList(const Value: Boolean);
    function GetExplanation: string;
    procedure SetExplanation(const Value: string);
    function GetMessageDsn: TMessageDsn;
    procedure SetMessageDsn(const Value: TMessageDsn);
    function GetKeepMessageDsn: Boolean;
    procedure SetKeepMessageDsn(const Value: Boolean);
    function GetOriginalMessageId: string;
    procedure SetOriginalMessageId(const Value: string);
  strict protected
    function Obj: TSendBounceRequest;
  public
    constructor Create;
    destructor Destroy; override;
    function IsSetBounceSender: Boolean;
    function IsSetBounceSenderArn: Boolean;
    function IsSetBouncedRecipientInfoList: Boolean;
    function IsSetExplanation: Boolean;
    function IsSetMessageDsn: Boolean;
    function IsSetOriginalMessageId: Boolean;
    property BounceSender: string read GetBounceSender write SetBounceSender;
    property BounceSenderArn: string read GetBounceSenderArn write SetBounceSenderArn;
    property BouncedRecipientInfoList: TObjectList<TBouncedRecipientInfo> read GetBouncedRecipientInfoList write SetBouncedRecipientInfoList;
    property KeepBouncedRecipientInfoList: Boolean read GetKeepBouncedRecipientInfoList write SetKeepBouncedRecipientInfoList;
    property Explanation: string read GetExplanation write SetExplanation;
    property MessageDsn: TMessageDsn read GetMessageDsn write SetMessageDsn;
    property KeepMessageDsn: Boolean read GetKeepMessageDsn write SetKeepMessageDsn;
    property OriginalMessageId: string read GetOriginalMessageId write SetOriginalMessageId;
  end;
  
implementation

{ TSendBounceRequest }

constructor TSendBounceRequest.Create;
begin
  inherited;
  FBouncedRecipientInfoList := TObjectList<TBouncedRecipientInfo>.Create;
end;

destructor TSendBounceRequest.Destroy;
begin
  MessageDsn := nil;
  BouncedRecipientInfoList := nil;
  inherited;
end;

function TSendBounceRequest.Obj: TSendBounceRequest;
begin
  Result := Self;
end;

function TSendBounceRequest.GetBounceSender: string;
begin
  Result := FBounceSender.ValueOrDefault;
end;

procedure TSendBounceRequest.SetBounceSender(const Value: string);
begin
  FBounceSender := Value;
end;

function TSendBounceRequest.IsSetBounceSender: Boolean;
begin
  Result := FBounceSender.HasValue;
end;

function TSendBounceRequest.GetBounceSenderArn: string;
begin
  Result := FBounceSenderArn.ValueOrDefault;
end;

procedure TSendBounceRequest.SetBounceSenderArn(const Value: string);
begin
  FBounceSenderArn := Value;
end;

function TSendBounceRequest.IsSetBounceSenderArn: Boolean;
begin
  Result := FBounceSenderArn.HasValue;
end;

function TSendBounceRequest.GetBouncedRecipientInfoList: TObjectList<TBouncedRecipientInfo>;
begin
  Result := FBouncedRecipientInfoList;
end;

procedure TSendBounceRequest.SetBouncedRecipientInfoList(const Value: TObjectList<TBouncedRecipientInfo>);
begin
  if FBouncedRecipientInfoList <> Value then
  begin
    if not KeepBouncedRecipientInfoList then
      FBouncedRecipientInfoList.Free;
    FBouncedRecipientInfoList := Value;
  end;
end;

function TSendBounceRequest.GetKeepBouncedRecipientInfoList: Boolean;
begin
  Result := FKeepBouncedRecipientInfoList;
end;

procedure TSendBounceRequest.SetKeepBouncedRecipientInfoList(const Value: Boolean);
begin
  FKeepBouncedRecipientInfoList := Value;
end;

function TSendBounceRequest.IsSetBouncedRecipientInfoList: Boolean;
begin
  Result := (FBouncedRecipientInfoList <> nil) and (FBouncedRecipientInfoList.Count > 0);
end;

function TSendBounceRequest.GetExplanation: string;
begin
  Result := FExplanation.ValueOrDefault;
end;

procedure TSendBounceRequest.SetExplanation(const Value: string);
begin
  FExplanation := Value;
end;

function TSendBounceRequest.IsSetExplanation: Boolean;
begin
  Result := FExplanation.HasValue;
end;

function TSendBounceRequest.GetMessageDsn: TMessageDsn;
begin
  Result := FMessageDsn;
end;

procedure TSendBounceRequest.SetMessageDsn(const Value: TMessageDsn);
begin
  if FMessageDsn <> Value then
  begin
    if not KeepMessageDsn then
      FMessageDsn.Free;
    FMessageDsn := Value;
  end;
end;

function TSendBounceRequest.GetKeepMessageDsn: Boolean;
begin
  Result := FKeepMessageDsn;
end;

procedure TSendBounceRequest.SetKeepMessageDsn(const Value: Boolean);
begin
  FKeepMessageDsn := Value;
end;

function TSendBounceRequest.IsSetMessageDsn: Boolean;
begin
  Result := FMessageDsn <> nil;
end;

function TSendBounceRequest.GetOriginalMessageId: string;
begin
  Result := FOriginalMessageId.ValueOrDefault;
end;

procedure TSendBounceRequest.SetOriginalMessageId(const Value: string);
begin
  FOriginalMessageId := Value;
end;

function TSendBounceRequest.IsSetOriginalMessageId: Boolean;
begin
  Result := FOriginalMessageId.HasValue;
end;

end.

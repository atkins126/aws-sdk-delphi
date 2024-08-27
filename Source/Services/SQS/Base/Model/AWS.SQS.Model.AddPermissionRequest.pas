unit AWS.SQS.Model.AddPermissionRequest;

interface

uses
  System.Generics.Collections, 
  AWS.SQS.Model.Request, 
  AWS.Nullable;

type
  TAddPermissionRequest = class;
  
  IAddPermissionRequest = interface
    function GetAWSAccountIds: TList<string>;
    procedure SetAWSAccountIds(const Value: TList<string>);
    function GetKeepAWSAccountIds: Boolean;
    procedure SetKeepAWSAccountIds(const Value: Boolean);
    function GetActions: TList<string>;
    procedure SetActions(const Value: TList<string>);
    function GetKeepActions: Boolean;
    procedure SetKeepActions(const Value: Boolean);
    function GetLabel: string;
    procedure SetLabel(const Value: string);
    function GetQueueUrl: string;
    procedure SetQueueUrl(const Value: string);
    function Obj: TAddPermissionRequest;
    function IsSetAWSAccountIds: Boolean;
    function IsSetActions: Boolean;
    function IsSetLabel: Boolean;
    function IsSetQueueUrl: Boolean;
    property AWSAccountIds: TList<string> read GetAWSAccountIds write SetAWSAccountIds;
    property KeepAWSAccountIds: Boolean read GetKeepAWSAccountIds write SetKeepAWSAccountIds;
    property Actions: TList<string> read GetActions write SetActions;
    property KeepActions: Boolean read GetKeepActions write SetKeepActions;
    property &Label: string read GetLabel write SetLabel;
    property QueueUrl: string read GetQueueUrl write SetQueueUrl;
  end;
  
  TAddPermissionRequest = class(TAmazonSQSRequest, IAddPermissionRequest)
  strict private
    FAWSAccountIds: TList<string>;
    FKeepAWSAccountIds: Boolean;
    FActions: TList<string>;
    FKeepActions: Boolean;
    FLabel: Nullable<string>;
    FQueueUrl: Nullable<string>;
    function GetAWSAccountIds: TList<string>;
    procedure SetAWSAccountIds(const Value: TList<string>);
    function GetKeepAWSAccountIds: Boolean;
    procedure SetKeepAWSAccountIds(const Value: Boolean);
    function GetActions: TList<string>;
    procedure SetActions(const Value: TList<string>);
    function GetKeepActions: Boolean;
    procedure SetKeepActions(const Value: Boolean);
    function GetLabel: string;
    procedure SetLabel(const Value: string);
    function GetQueueUrl: string;
    procedure SetQueueUrl(const Value: string);
  strict protected
    function Obj: TAddPermissionRequest;
  public
    constructor Create; overload;
    destructor Destroy; override;
    constructor Create(const AQueueUrl: string; const ALabel: string; const AAWSAccountIds: TList<string>; const AActions: TList<string>); overload;
    function IsSetAWSAccountIds: Boolean;
    function IsSetActions: Boolean;
    function IsSetLabel: Boolean;
    function IsSetQueueUrl: Boolean;
    property AWSAccountIds: TList<string> read GetAWSAccountIds write SetAWSAccountIds;
    property KeepAWSAccountIds: Boolean read GetKeepAWSAccountIds write SetKeepAWSAccountIds;
    property Actions: TList<string> read GetActions write SetActions;
    property KeepActions: Boolean read GetKeepActions write SetKeepActions;
    property &Label: string read GetLabel write SetLabel;
    property QueueUrl: string read GetQueueUrl write SetQueueUrl;
  end;
  
implementation

{ TAddPermissionRequest }

constructor TAddPermissionRequest.Create;
begin
  inherited;
  FAWSAccountIds := TList<string>.Create;
  FActions := TList<string>.Create;
end;

destructor TAddPermissionRequest.Destroy;
begin
  Actions := nil;
  AWSAccountIds := nil;
  inherited;
end;

function TAddPermissionRequest.Obj: TAddPermissionRequest;
begin
  Result := Self;
end;

constructor TAddPermissionRequest.Create(const AQueueUrl: string; const ALabel: string; const AAWSAccountIds: TList<string>; const AActions: TList<string>);
begin
  Create;
  QueueUrl := AQueueUrl;
  &Label := ALabel;
  AWSAccountIds := AAWSAccountIds;
  Actions := AActions;
end;

function TAddPermissionRequest.GetAWSAccountIds: TList<string>;
begin
  Result := FAWSAccountIds;
end;

procedure TAddPermissionRequest.SetAWSAccountIds(const Value: TList<string>);
begin
  if FAWSAccountIds <> Value then
  begin
    if not KeepAWSAccountIds then
      FAWSAccountIds.Free;
    FAWSAccountIds := Value;
  end;
end;

function TAddPermissionRequest.GetKeepAWSAccountIds: Boolean;
begin
  Result := FKeepAWSAccountIds;
end;

procedure TAddPermissionRequest.SetKeepAWSAccountIds(const Value: Boolean);
begin
  FKeepAWSAccountIds := Value;
end;

function TAddPermissionRequest.IsSetAWSAccountIds: Boolean;
begin
  Result := (FAWSAccountIds <> nil) and (FAWSAccountIds.Count > 0);
end;

function TAddPermissionRequest.GetActions: TList<string>;
begin
  Result := FActions;
end;

procedure TAddPermissionRequest.SetActions(const Value: TList<string>);
begin
  if FActions <> Value then
  begin
    if not KeepActions then
      FActions.Free;
    FActions := Value;
  end;
end;

function TAddPermissionRequest.GetKeepActions: Boolean;
begin
  Result := FKeepActions;
end;

procedure TAddPermissionRequest.SetKeepActions(const Value: Boolean);
begin
  FKeepActions := Value;
end;

function TAddPermissionRequest.IsSetActions: Boolean;
begin
  Result := (FActions <> nil) and (FActions.Count > 0);
end;

function TAddPermissionRequest.GetLabel: string;
begin
  Result := FLabel.ValueOrDefault;
end;

procedure TAddPermissionRequest.SetLabel(const Value: string);
begin
  FLabel := Value;
end;

function TAddPermissionRequest.IsSetLabel: Boolean;
begin
  Result := FLabel.HasValue;
end;

function TAddPermissionRequest.GetQueueUrl: string;
begin
  Result := FQueueUrl.ValueOrDefault;
end;

procedure TAddPermissionRequest.SetQueueUrl(const Value: string);
begin
  FQueueUrl := Value;
end;

function TAddPermissionRequest.IsSetQueueUrl: Boolean;
begin
  Result := FQueueUrl.HasValue;
end;

end.

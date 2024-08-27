unit AWS.S3Control.Model.LifecycleRuleFilter;

interface

uses
  AWS.S3Control.Model.LifecycleRuleAndOperator, 
  AWS.Nullable, 
  AWS.S3Control.Model.S3Tag;

type
  TLifecycleRuleFilter = class;
  
  ILifecycleRuleFilter = interface
    function GetAnd: TLifecycleRuleAndOperator;
    procedure SetAnd(const Value: TLifecycleRuleAndOperator);
    function GetKeepAnd: Boolean;
    procedure SetKeepAnd(const Value: Boolean);
    function GetPrefix: string;
    procedure SetPrefix(const Value: string);
    function GetTag: TS3Tag;
    procedure SetTag(const Value: TS3Tag);
    function GetKeepTag: Boolean;
    procedure SetKeepTag(const Value: Boolean);
    function Obj: TLifecycleRuleFilter;
    function IsSetAnd: Boolean;
    function IsSetPrefix: Boolean;
    function IsSetTag: Boolean;
    property &And: TLifecycleRuleAndOperator read GetAnd write SetAnd;
    property KeepAnd: Boolean read GetKeepAnd write SetKeepAnd;
    property Prefix: string read GetPrefix write SetPrefix;
    property Tag: TS3Tag read GetTag write SetTag;
    property KeepTag: Boolean read GetKeepTag write SetKeepTag;
  end;
  
  TLifecycleRuleFilter = class
  strict private
    FAnd: TLifecycleRuleAndOperator;
    FKeepAnd: Boolean;
    FPrefix: Nullable<string>;
    FTag: TS3Tag;
    FKeepTag: Boolean;
    function GetAnd: TLifecycleRuleAndOperator;
    procedure SetAnd(const Value: TLifecycleRuleAndOperator);
    function GetKeepAnd: Boolean;
    procedure SetKeepAnd(const Value: Boolean);
    function GetPrefix: string;
    procedure SetPrefix(const Value: string);
    function GetTag: TS3Tag;
    procedure SetTag(const Value: TS3Tag);
    function GetKeepTag: Boolean;
    procedure SetKeepTag(const Value: Boolean);
  strict protected
    function Obj: TLifecycleRuleFilter;
  public
    destructor Destroy; override;
    function IsSetAnd: Boolean;
    function IsSetPrefix: Boolean;
    function IsSetTag: Boolean;
    property &And: TLifecycleRuleAndOperator read GetAnd write SetAnd;
    property KeepAnd: Boolean read GetKeepAnd write SetKeepAnd;
    property Prefix: string read GetPrefix write SetPrefix;
    property Tag: TS3Tag read GetTag write SetTag;
    property KeepTag: Boolean read GetKeepTag write SetKeepTag;
  end;
  
implementation

{ TLifecycleRuleFilter }

destructor TLifecycleRuleFilter.Destroy;
begin
  Tag := nil;
  &And := nil;
  inherited;
end;

function TLifecycleRuleFilter.Obj: TLifecycleRuleFilter;
begin
  Result := Self;
end;

function TLifecycleRuleFilter.GetAnd: TLifecycleRuleAndOperator;
begin
  Result := FAnd;
end;

procedure TLifecycleRuleFilter.SetAnd(const Value: TLifecycleRuleAndOperator);
begin
  if FAnd <> Value then
  begin
    if not KeepAnd then
      FAnd.Free;
    FAnd := Value;
  end;
end;

function TLifecycleRuleFilter.GetKeepAnd: Boolean;
begin
  Result := FKeepAnd;
end;

procedure TLifecycleRuleFilter.SetKeepAnd(const Value: Boolean);
begin
  FKeepAnd := Value;
end;

function TLifecycleRuleFilter.IsSetAnd: Boolean;
begin
  Result := FAnd <> nil;
end;

function TLifecycleRuleFilter.GetPrefix: string;
begin
  Result := FPrefix.ValueOrDefault;
end;

procedure TLifecycleRuleFilter.SetPrefix(const Value: string);
begin
  FPrefix := Value;
end;

function TLifecycleRuleFilter.IsSetPrefix: Boolean;
begin
  Result := FPrefix.HasValue;
end;

function TLifecycleRuleFilter.GetTag: TS3Tag;
begin
  Result := FTag;
end;

procedure TLifecycleRuleFilter.SetTag(const Value: TS3Tag);
begin
  if FTag <> Value then
  begin
    if not KeepTag then
      FTag.Free;
    FTag := Value;
  end;
end;

function TLifecycleRuleFilter.GetKeepTag: Boolean;
begin
  Result := FKeepTag;
end;

procedure TLifecycleRuleFilter.SetKeepTag(const Value: Boolean);
begin
  FKeepTag := Value;
end;

function TLifecycleRuleFilter.IsSetTag: Boolean;
begin
  Result := FTag <> nil;
end;

end.

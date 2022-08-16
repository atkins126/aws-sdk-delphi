unit AWS.SQS.Model.UntagQueueRequest;

interface

uses
  Bcl.Types.Nullable, 
  System.Generics.Collections, 
  AWS.SQS.Model.Request;

type
  TUntagQueueRequest = class;
  
  IUntagQueueRequest = interface
    function GetQueueUrl: string;
    procedure SetQueueUrl(const Value: string);
    function GetTagKeys: TList<string>;
    procedure SetTagKeys(const Value: TList<string>);
    function GetKeepTagKeys: Boolean;
    procedure SetKeepTagKeys(const Value: Boolean);
    function Obj: TUntagQueueRequest;
    function IsSetQueueUrl: Boolean;
    function IsSetTagKeys: Boolean;
    property QueueUrl: string read GetQueueUrl write SetQueueUrl;
    property TagKeys: TList<string> read GetTagKeys write SetTagKeys;
    property KeepTagKeys: Boolean read GetKeepTagKeys write SetKeepTagKeys;
  end;
  
  TUntagQueueRequest = class(TAmazonSQSRequest, IUntagQueueRequest)
  strict private
    FQueueUrl: Nullable<string>;
    FTagKeys: TList<string>;
    FKeepTagKeys: Boolean;
    function GetQueueUrl: string;
    procedure SetQueueUrl(const Value: string);
    function GetTagKeys: TList<string>;
    procedure SetTagKeys(const Value: TList<string>);
    function GetKeepTagKeys: Boolean;
    procedure SetKeepTagKeys(const Value: Boolean);
  strict protected
    function Obj: TUntagQueueRequest;
  public
    constructor Create;
    destructor Destroy; override;
    function IsSetQueueUrl: Boolean;
    function IsSetTagKeys: Boolean;
    property QueueUrl: string read GetQueueUrl write SetQueueUrl;
    property TagKeys: TList<string> read GetTagKeys write SetTagKeys;
    property KeepTagKeys: Boolean read GetKeepTagKeys write SetKeepTagKeys;
  end;
  
implementation

{ TUntagQueueRequest }

constructor TUntagQueueRequest.Create;
begin
  inherited;
  FTagKeys := TList<string>.Create;
end;

destructor TUntagQueueRequest.Destroy;
begin
  TagKeys := nil;
  inherited;
end;

function TUntagQueueRequest.Obj: TUntagQueueRequest;
begin
  Result := Self;
end;

function TUntagQueueRequest.GetQueueUrl: string;
begin
  Result := FQueueUrl.ValueOrDefault;
end;

procedure TUntagQueueRequest.SetQueueUrl(const Value: string);
begin
  FQueueUrl := Value;
end;

function TUntagQueueRequest.IsSetQueueUrl: Boolean;
begin
  Result := FQueueUrl.HasValue;
end;

function TUntagQueueRequest.GetTagKeys: TList<string>;
begin
  Result := FTagKeys;
end;

procedure TUntagQueueRequest.SetTagKeys(const Value: TList<string>);
begin
  if FTagKeys <> Value then
  begin
    if not KeepTagKeys then
      FTagKeys.Free;
    FTagKeys := Value;
  end;
end;

function TUntagQueueRequest.GetKeepTagKeys: Boolean;
begin
  Result := FKeepTagKeys;
end;

procedure TUntagQueueRequest.SetKeepTagKeys(const Value: Boolean);
begin
  FKeepTagKeys := Value;
end;

function TUntagQueueRequest.IsSetTagKeys: Boolean;
begin
  Result := (FTagKeys <> nil) and (FTagKeys.Count > 0);
end;

end.

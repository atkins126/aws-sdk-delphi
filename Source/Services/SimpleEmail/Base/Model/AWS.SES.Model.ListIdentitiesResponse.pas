unit AWS.SES.Model.ListIdentitiesResponse;

interface

uses
  System.Generics.Collections, 
  AWS.Runtime.Model, 
  AWS.Nullable;

type
  TListIdentitiesResponse = class;
  
  IListIdentitiesResponse = interface(IAmazonWebServiceResponse)
    function GetIdentities: TList<string>;
    procedure SetIdentities(const Value: TList<string>);
    function GetKeepIdentities: Boolean;
    procedure SetKeepIdentities(const Value: Boolean);
    function GetNextToken: string;
    procedure SetNextToken(const Value: string);
    function Obj: TListIdentitiesResponse;
    function IsSetIdentities: Boolean;
    function IsSetNextToken: Boolean;
    property Identities: TList<string> read GetIdentities write SetIdentities;
    property KeepIdentities: Boolean read GetKeepIdentities write SetKeepIdentities;
    property NextToken: string read GetNextToken write SetNextToken;
  end;
  
  TListIdentitiesResponse = class(TAmazonWebServiceResponse, IListIdentitiesResponse)
  strict private
    FIdentities: TList<string>;
    FKeepIdentities: Boolean;
    FNextToken: Nullable<string>;
    function GetIdentities: TList<string>;
    procedure SetIdentities(const Value: TList<string>);
    function GetKeepIdentities: Boolean;
    procedure SetKeepIdentities(const Value: Boolean);
    function GetNextToken: string;
    procedure SetNextToken(const Value: string);
  strict protected
    function Obj: TListIdentitiesResponse;
  public
    constructor Create;
    destructor Destroy; override;
    function IsSetIdentities: Boolean;
    function IsSetNextToken: Boolean;
    property Identities: TList<string> read GetIdentities write SetIdentities;
    property KeepIdentities: Boolean read GetKeepIdentities write SetKeepIdentities;
    property NextToken: string read GetNextToken write SetNextToken;
  end;
  
implementation

{ TListIdentitiesResponse }

constructor TListIdentitiesResponse.Create;
begin
  inherited;
  FIdentities := TList<string>.Create;
end;

destructor TListIdentitiesResponse.Destroy;
begin
  Identities := nil;
  inherited;
end;

function TListIdentitiesResponse.Obj: TListIdentitiesResponse;
begin
  Result := Self;
end;

function TListIdentitiesResponse.GetIdentities: TList<string>;
begin
  Result := FIdentities;
end;

procedure TListIdentitiesResponse.SetIdentities(const Value: TList<string>);
begin
  if FIdentities <> Value then
  begin
    if not KeepIdentities then
      FIdentities.Free;
    FIdentities := Value;
  end;
end;

function TListIdentitiesResponse.GetKeepIdentities: Boolean;
begin
  Result := FKeepIdentities;
end;

procedure TListIdentitiesResponse.SetKeepIdentities(const Value: Boolean);
begin
  FKeepIdentities := Value;
end;

function TListIdentitiesResponse.IsSetIdentities: Boolean;
begin
  Result := (FIdentities <> nil) and (FIdentities.Count > 0);
end;

function TListIdentitiesResponse.GetNextToken: string;
begin
  Result := FNextToken.ValueOrDefault;
end;

procedure TListIdentitiesResponse.SetNextToken(const Value: string);
begin
  FNextToken := Value;
end;

function TListIdentitiesResponse.IsSetNextToken: Boolean;
begin
  Result := FNextToken.HasValue;
end;

end.

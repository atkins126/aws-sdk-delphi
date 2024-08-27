unit AWS.SNS.Model.ListEndpointsByPlatformApplicationResponse;

interface

uses
  System.Generics.Collections, 
  AWS.Runtime.Model, 
  AWS.SNS.Model.Endpoint, 
  AWS.Nullable;

type
  TListEndpointsByPlatformApplicationResponse = class;
  
  IListEndpointsByPlatformApplicationResponse = interface(IAmazonWebServiceResponse)
    function GetEndpoints: TObjectList<TEndpoint>;
    procedure SetEndpoints(const Value: TObjectList<TEndpoint>);
    function GetKeepEndpoints: Boolean;
    procedure SetKeepEndpoints(const Value: Boolean);
    function GetNextToken: string;
    procedure SetNextToken(const Value: string);
    function Obj: TListEndpointsByPlatformApplicationResponse;
    function IsSetEndpoints: Boolean;
    function IsSetNextToken: Boolean;
    property Endpoints: TObjectList<TEndpoint> read GetEndpoints write SetEndpoints;
    property KeepEndpoints: Boolean read GetKeepEndpoints write SetKeepEndpoints;
    property NextToken: string read GetNextToken write SetNextToken;
  end;
  
  TListEndpointsByPlatformApplicationResponse = class(TAmazonWebServiceResponse, IListEndpointsByPlatformApplicationResponse)
  strict private
    FEndpoints: TObjectList<TEndpoint>;
    FKeepEndpoints: Boolean;
    FNextToken: Nullable<string>;
    function GetEndpoints: TObjectList<TEndpoint>;
    procedure SetEndpoints(const Value: TObjectList<TEndpoint>);
    function GetKeepEndpoints: Boolean;
    procedure SetKeepEndpoints(const Value: Boolean);
    function GetNextToken: string;
    procedure SetNextToken(const Value: string);
  strict protected
    function Obj: TListEndpointsByPlatformApplicationResponse;
  public
    constructor Create;
    destructor Destroy; override;
    function IsSetEndpoints: Boolean;
    function IsSetNextToken: Boolean;
    property Endpoints: TObjectList<TEndpoint> read GetEndpoints write SetEndpoints;
    property KeepEndpoints: Boolean read GetKeepEndpoints write SetKeepEndpoints;
    property NextToken: string read GetNextToken write SetNextToken;
  end;
  
implementation

{ TListEndpointsByPlatformApplicationResponse }

constructor TListEndpointsByPlatformApplicationResponse.Create;
begin
  inherited;
  FEndpoints := TObjectList<TEndpoint>.Create;
end;

destructor TListEndpointsByPlatformApplicationResponse.Destroy;
begin
  Endpoints := nil;
  inherited;
end;

function TListEndpointsByPlatformApplicationResponse.Obj: TListEndpointsByPlatformApplicationResponse;
begin
  Result := Self;
end;

function TListEndpointsByPlatformApplicationResponse.GetEndpoints: TObjectList<TEndpoint>;
begin
  Result := FEndpoints;
end;

procedure TListEndpointsByPlatformApplicationResponse.SetEndpoints(const Value: TObjectList<TEndpoint>);
begin
  if FEndpoints <> Value then
  begin
    if not KeepEndpoints then
      FEndpoints.Free;
    FEndpoints := Value;
  end;
end;

function TListEndpointsByPlatformApplicationResponse.GetKeepEndpoints: Boolean;
begin
  Result := FKeepEndpoints;
end;

procedure TListEndpointsByPlatformApplicationResponse.SetKeepEndpoints(const Value: Boolean);
begin
  FKeepEndpoints := Value;
end;

function TListEndpointsByPlatformApplicationResponse.IsSetEndpoints: Boolean;
begin
  Result := (FEndpoints <> nil) and (FEndpoints.Count > 0);
end;

function TListEndpointsByPlatformApplicationResponse.GetNextToken: string;
begin
  Result := FNextToken.ValueOrDefault;
end;

procedure TListEndpointsByPlatformApplicationResponse.SetNextToken(const Value: string);
begin
  FNextToken := Value;
end;

function TListEndpointsByPlatformApplicationResponse.IsSetNextToken: Boolean;
begin
  Result := FNextToken.HasValue;
end;

end.

unit AWS.SES.Model.ListVerifiedEmailAddressesResponse;

interface

uses
  System.Generics.Collections, 
  AWS.Runtime.Model;

type
  TListVerifiedEmailAddressesResponse = class;
  
  IListVerifiedEmailAddressesResponse = interface(IAmazonWebServiceResponse)
    function GetVerifiedEmailAddresses: TList<string>;
    procedure SetVerifiedEmailAddresses(const Value: TList<string>);
    function GetKeepVerifiedEmailAddresses: Boolean;
    procedure SetKeepVerifiedEmailAddresses(const Value: Boolean);
    function Obj: TListVerifiedEmailAddressesResponse;
    function IsSetVerifiedEmailAddresses: Boolean;
    property VerifiedEmailAddresses: TList<string> read GetVerifiedEmailAddresses write SetVerifiedEmailAddresses;
    property KeepVerifiedEmailAddresses: Boolean read GetKeepVerifiedEmailAddresses write SetKeepVerifiedEmailAddresses;
  end;
  
  TListVerifiedEmailAddressesResponse = class(TAmazonWebServiceResponse, IListVerifiedEmailAddressesResponse)
  strict private
    FVerifiedEmailAddresses: TList<string>;
    FKeepVerifiedEmailAddresses: Boolean;
    function GetVerifiedEmailAddresses: TList<string>;
    procedure SetVerifiedEmailAddresses(const Value: TList<string>);
    function GetKeepVerifiedEmailAddresses: Boolean;
    procedure SetKeepVerifiedEmailAddresses(const Value: Boolean);
  strict protected
    function Obj: TListVerifiedEmailAddressesResponse;
  public
    constructor Create;
    destructor Destroy; override;
    function IsSetVerifiedEmailAddresses: Boolean;
    property VerifiedEmailAddresses: TList<string> read GetVerifiedEmailAddresses write SetVerifiedEmailAddresses;
    property KeepVerifiedEmailAddresses: Boolean read GetKeepVerifiedEmailAddresses write SetKeepVerifiedEmailAddresses;
  end;
  
implementation

{ TListVerifiedEmailAddressesResponse }

constructor TListVerifiedEmailAddressesResponse.Create;
begin
  inherited;
  FVerifiedEmailAddresses := TList<string>.Create;
end;

destructor TListVerifiedEmailAddressesResponse.Destroy;
begin
  VerifiedEmailAddresses := nil;
  inherited;
end;

function TListVerifiedEmailAddressesResponse.Obj: TListVerifiedEmailAddressesResponse;
begin
  Result := Self;
end;

function TListVerifiedEmailAddressesResponse.GetVerifiedEmailAddresses: TList<string>;
begin
  Result := FVerifiedEmailAddresses;
end;

procedure TListVerifiedEmailAddressesResponse.SetVerifiedEmailAddresses(const Value: TList<string>);
begin
  if FVerifiedEmailAddresses <> Value then
  begin
    if not KeepVerifiedEmailAddresses then
      FVerifiedEmailAddresses.Free;
    FVerifiedEmailAddresses := Value;
  end;
end;

function TListVerifiedEmailAddressesResponse.GetKeepVerifiedEmailAddresses: Boolean;
begin
  Result := FKeepVerifiedEmailAddresses;
end;

procedure TListVerifiedEmailAddressesResponse.SetKeepVerifiedEmailAddresses(const Value: Boolean);
begin
  FKeepVerifiedEmailAddresses := Value;
end;

function TListVerifiedEmailAddressesResponse.IsSetVerifiedEmailAddresses: Boolean;
begin
  Result := (FVerifiedEmailAddresses <> nil) and (FVerifiedEmailAddresses.Count > 0);
end;

end.

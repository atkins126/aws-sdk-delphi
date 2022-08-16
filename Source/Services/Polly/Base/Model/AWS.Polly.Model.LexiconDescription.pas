unit AWS.Polly.Model.LexiconDescription;

interface

uses
  Bcl.Types.Nullable, 
  AWS.Polly.Model.LexiconAttributes;

type
  TLexiconDescription = class;
  
  ILexiconDescription = interface
    function GetAttributes: TLexiconAttributes;
    procedure SetAttributes(const Value: TLexiconAttributes);
    function GetKeepAttributes: Boolean;
    procedure SetKeepAttributes(const Value: Boolean);
    function GetName: string;
    procedure SetName(const Value: string);
    function Obj: TLexiconDescription;
    function IsSetAttributes: Boolean;
    function IsSetName: Boolean;
    property Attributes: TLexiconAttributes read GetAttributes write SetAttributes;
    property KeepAttributes: Boolean read GetKeepAttributes write SetKeepAttributes;
    property Name: string read GetName write SetName;
  end;
  
  TLexiconDescription = class
  strict private
    FAttributes: TLexiconAttributes;
    FKeepAttributes: Boolean;
    FName: Nullable<string>;
    function GetAttributes: TLexiconAttributes;
    procedure SetAttributes(const Value: TLexiconAttributes);
    function GetKeepAttributes: Boolean;
    procedure SetKeepAttributes(const Value: Boolean);
    function GetName: string;
    procedure SetName(const Value: string);
  strict protected
    function Obj: TLexiconDescription;
  public
    destructor Destroy; override;
    function IsSetAttributes: Boolean;
    function IsSetName: Boolean;
    property Attributes: TLexiconAttributes read GetAttributes write SetAttributes;
    property KeepAttributes: Boolean read GetKeepAttributes write SetKeepAttributes;
    property Name: string read GetName write SetName;
  end;
  
implementation

{ TLexiconDescription }

destructor TLexiconDescription.Destroy;
begin
  Attributes := nil;
  inherited;
end;

function TLexiconDescription.Obj: TLexiconDescription;
begin
  Result := Self;
end;

function TLexiconDescription.GetAttributes: TLexiconAttributes;
begin
  Result := FAttributes;
end;

procedure TLexiconDescription.SetAttributes(const Value: TLexiconAttributes);
begin
  if FAttributes <> Value then
  begin
    if not KeepAttributes then
      FAttributes.Free;
    FAttributes := Value;
  end;
end;

function TLexiconDescription.GetKeepAttributes: Boolean;
begin
  Result := FKeepAttributes;
end;

procedure TLexiconDescription.SetKeepAttributes(const Value: Boolean);
begin
  FKeepAttributes := Value;
end;

function TLexiconDescription.IsSetAttributes: Boolean;
begin
  Result := FAttributes <> nil;
end;

function TLexiconDescription.GetName: string;
begin
  Result := FName.ValueOrDefault;
end;

procedure TLexiconDescription.SetName(const Value: string);
begin
  FName := Value;
end;

function TLexiconDescription.IsSetName: Boolean;
begin
  Result := FName.HasValue;
end;

end.

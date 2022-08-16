unit AWS.SNS.Model.MessageAttributeValue;

interface

uses
  Bcl.Types.Nullable, 
  System.Classes;

type
  TMessageAttributeValue = class;
  
  IMessageAttributeValue = interface
    function GetBinaryValue: TBytesStream;
    procedure SetBinaryValue(const Value: TBytesStream);
    function GetKeepBinaryValue: Boolean;
    procedure SetKeepBinaryValue(const Value: Boolean);
    function GetDataType: string;
    procedure SetDataType(const Value: string);
    function GetStringValue: string;
    procedure SetStringValue(const Value: string);
    function Obj: TMessageAttributeValue;
    function IsSetBinaryValue: Boolean;
    function IsSetDataType: Boolean;
    function IsSetStringValue: Boolean;
    property BinaryValue: TBytesStream read GetBinaryValue write SetBinaryValue;
    property KeepBinaryValue: Boolean read GetKeepBinaryValue write SetKeepBinaryValue;
    property DataType: string read GetDataType write SetDataType;
    property StringValue: string read GetStringValue write SetStringValue;
  end;
  
  TMessageAttributeValue = class
  strict private
    FBinaryValue: TBytesStream;
    FKeepBinaryValue: Boolean;
    FDataType: Nullable<string>;
    FStringValue: Nullable<string>;
    function GetBinaryValue: TBytesStream;
    procedure SetBinaryValue(const Value: TBytesStream);
    function GetKeepBinaryValue: Boolean;
    procedure SetKeepBinaryValue(const Value: Boolean);
    function GetDataType: string;
    procedure SetDataType(const Value: string);
    function GetStringValue: string;
    procedure SetStringValue(const Value: string);
  strict protected
    function Obj: TMessageAttributeValue;
  public
    destructor Destroy; override;
    function IsSetBinaryValue: Boolean;
    function IsSetDataType: Boolean;
    function IsSetStringValue: Boolean;
    property BinaryValue: TBytesStream read GetBinaryValue write SetBinaryValue;
    property KeepBinaryValue: Boolean read GetKeepBinaryValue write SetKeepBinaryValue;
    property DataType: string read GetDataType write SetDataType;
    property StringValue: string read GetStringValue write SetStringValue;
  end;
  
implementation

{ TMessageAttributeValue }

destructor TMessageAttributeValue.Destroy;
begin
  BinaryValue := nil;
  inherited;
end;

function TMessageAttributeValue.Obj: TMessageAttributeValue;
begin
  Result := Self;
end;

function TMessageAttributeValue.GetBinaryValue: TBytesStream;
begin
  Result := FBinaryValue;
end;

procedure TMessageAttributeValue.SetBinaryValue(const Value: TBytesStream);
begin
  if FBinaryValue <> Value then
  begin
    if not KeepBinaryValue then
      FBinaryValue.Free;
    FBinaryValue := Value;
  end;
end;

function TMessageAttributeValue.GetKeepBinaryValue: Boolean;
begin
  Result := FKeepBinaryValue;
end;

procedure TMessageAttributeValue.SetKeepBinaryValue(const Value: Boolean);
begin
  FKeepBinaryValue := Value;
end;

function TMessageAttributeValue.IsSetBinaryValue: Boolean;
begin
  Result := FBinaryValue <> nil;
end;

function TMessageAttributeValue.GetDataType: string;
begin
  Result := FDataType.ValueOrDefault;
end;

procedure TMessageAttributeValue.SetDataType(const Value: string);
begin
  FDataType := Value;
end;

function TMessageAttributeValue.IsSetDataType: Boolean;
begin
  Result := FDataType.HasValue;
end;

function TMessageAttributeValue.GetStringValue: string;
begin
  Result := FStringValue.ValueOrDefault;
end;

procedure TMessageAttributeValue.SetStringValue(const Value: string);
begin
  FStringValue := Value;
end;

function TMessageAttributeValue.IsSetStringValue: Boolean;
begin
  Result := FStringValue.HasValue;
end;

end.

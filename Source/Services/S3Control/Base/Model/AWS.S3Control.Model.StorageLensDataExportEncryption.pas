unit AWS.S3Control.Model.StorageLensDataExportEncryption;

interface

uses
  AWS.S3Control.Model.SSEKMS, 
  AWS.S3Control.Model.SSES3;

type
  TStorageLensDataExportEncryption = class;
  
  IStorageLensDataExportEncryption = interface
    function GetSSEKMS: TSSEKMS;
    procedure SetSSEKMS(const Value: TSSEKMS);
    function GetKeepSSEKMS: Boolean;
    procedure SetKeepSSEKMS(const Value: Boolean);
    function GetSSES3: TSSES3;
    procedure SetSSES3(const Value: TSSES3);
    function GetKeepSSES3: Boolean;
    procedure SetKeepSSES3(const Value: Boolean);
    function Obj: TStorageLensDataExportEncryption;
    function IsSetSSEKMS: Boolean;
    function IsSetSSES3: Boolean;
    property SSEKMS: TSSEKMS read GetSSEKMS write SetSSEKMS;
    property KeepSSEKMS: Boolean read GetKeepSSEKMS write SetKeepSSEKMS;
    property SSES3: TSSES3 read GetSSES3 write SetSSES3;
    property KeepSSES3: Boolean read GetKeepSSES3 write SetKeepSSES3;
  end;
  
  TStorageLensDataExportEncryption = class
  strict private
    FSSEKMS: TSSEKMS;
    FKeepSSEKMS: Boolean;
    FSSES3: TSSES3;
    FKeepSSES3: Boolean;
    function GetSSEKMS: TSSEKMS;
    procedure SetSSEKMS(const Value: TSSEKMS);
    function GetKeepSSEKMS: Boolean;
    procedure SetKeepSSEKMS(const Value: Boolean);
    function GetSSES3: TSSES3;
    procedure SetSSES3(const Value: TSSES3);
    function GetKeepSSES3: Boolean;
    procedure SetKeepSSES3(const Value: Boolean);
  strict protected
    function Obj: TStorageLensDataExportEncryption;
  public
    destructor Destroy; override;
    function IsSetSSEKMS: Boolean;
    function IsSetSSES3: Boolean;
    property SSEKMS: TSSEKMS read GetSSEKMS write SetSSEKMS;
    property KeepSSEKMS: Boolean read GetKeepSSEKMS write SetKeepSSEKMS;
    property SSES3: TSSES3 read GetSSES3 write SetSSES3;
    property KeepSSES3: Boolean read GetKeepSSES3 write SetKeepSSES3;
  end;
  
implementation

{ TStorageLensDataExportEncryption }

destructor TStorageLensDataExportEncryption.Destroy;
begin
  SSES3 := nil;
  SSEKMS := nil;
  inherited;
end;

function TStorageLensDataExportEncryption.Obj: TStorageLensDataExportEncryption;
begin
  Result := Self;
end;

function TStorageLensDataExportEncryption.GetSSEKMS: TSSEKMS;
begin
  Result := FSSEKMS;
end;

procedure TStorageLensDataExportEncryption.SetSSEKMS(const Value: TSSEKMS);
begin
  if FSSEKMS <> Value then
  begin
    if not KeepSSEKMS then
      FSSEKMS.Free;
    FSSEKMS := Value;
  end;
end;

function TStorageLensDataExportEncryption.GetKeepSSEKMS: Boolean;
begin
  Result := FKeepSSEKMS;
end;

procedure TStorageLensDataExportEncryption.SetKeepSSEKMS(const Value: Boolean);
begin
  FKeepSSEKMS := Value;
end;

function TStorageLensDataExportEncryption.IsSetSSEKMS: Boolean;
begin
  Result := FSSEKMS <> nil;
end;

function TStorageLensDataExportEncryption.GetSSES3: TSSES3;
begin
  Result := FSSES3;
end;

procedure TStorageLensDataExportEncryption.SetSSES3(const Value: TSSES3);
begin
  if FSSES3 <> Value then
  begin
    if not KeepSSES3 then
      FSSES3.Free;
    FSSES3 := Value;
  end;
end;

function TStorageLensDataExportEncryption.GetKeepSSES3: Boolean;
begin
  Result := FKeepSSES3;
end;

procedure TStorageLensDataExportEncryption.SetKeepSSES3(const Value: Boolean);
begin
  FKeepSSES3 := Value;
end;

function TStorageLensDataExportEncryption.IsSetSSES3: Boolean;
begin
  Result := FSSES3 <> nil;
end;

end.

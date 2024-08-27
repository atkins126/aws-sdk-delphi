unit AWS.S3.Model.UploadPartResponse;

interface

uses
  AWS.Runtime.Model, 
  AWS.Nullable, 
  AWS.S3.Enums;

type
  TUploadPartResponse = class;
  
  IUploadPartResponse = interface(IAmazonWebServiceResponse)
    function GetBucketKeyEnabled: Boolean;
    procedure SetBucketKeyEnabled(const Value: Boolean);
    function GetETag: string;
    procedure SetETag(const Value: string);
    function GetRequestCharged: TRequestCharged;
    procedure SetRequestCharged(const Value: TRequestCharged);
    function GetSSECustomerAlgorithm: string;
    procedure SetSSECustomerAlgorithm(const Value: string);
    function GetSSECustomerKeyMD5: string;
    procedure SetSSECustomerKeyMD5(const Value: string);
    function GetSSEKMSKeyId: string;
    procedure SetSSEKMSKeyId(const Value: string);
    function GetServerSideEncryption: TServerSideEncryption;
    procedure SetServerSideEncryption(const Value: TServerSideEncryption);
    function GetPartNumber: Integer;
    procedure SetPartNumber(const Value: Integer);
    function Obj: TUploadPartResponse;
    function IsSetBucketKeyEnabled: Boolean;
    function IsSetETag: Boolean;
    function IsSetRequestCharged: Boolean;
    function IsSetSSECustomerAlgorithm: Boolean;
    function IsSetSSECustomerKeyMD5: Boolean;
    function IsSetSSEKMSKeyId: Boolean;
    function IsSetServerSideEncryption: Boolean;
    property BucketKeyEnabled: Boolean read GetBucketKeyEnabled write SetBucketKeyEnabled;
    property ETag: string read GetETag write SetETag;
    property RequestCharged: TRequestCharged read GetRequestCharged write SetRequestCharged;
    property SSECustomerAlgorithm: string read GetSSECustomerAlgorithm write SetSSECustomerAlgorithm;
    property SSECustomerKeyMD5: string read GetSSECustomerKeyMD5 write SetSSECustomerKeyMD5;
    property SSEKMSKeyId: string read GetSSEKMSKeyId write SetSSEKMSKeyId;
    property ServerSideEncryption: TServerSideEncryption read GetServerSideEncryption write SetServerSideEncryption;
    property PartNumber: Integer read GetPartNumber write SetPartNumber;
  end;
  
  TUploadPartResponse = class(TAmazonWebServiceResponse, IUploadPartResponse)
  strict private
    FBucketKeyEnabled: Nullable<Boolean>;
    FETag: Nullable<string>;
    FRequestCharged: Nullable<TRequestCharged>;
    FSSECustomerAlgorithm: Nullable<string>;
    FSSECustomerKeyMD5: Nullable<string>;
    FSSEKMSKeyId: Nullable<string>;
    FServerSideEncryption: Nullable<TServerSideEncryption>;
    FPartNumber: Integer;
    function GetBucketKeyEnabled: Boolean;
    procedure SetBucketKeyEnabled(const Value: Boolean);
    function GetETag: string;
    procedure SetETag(const Value: string);
    function GetRequestCharged: TRequestCharged;
    procedure SetRequestCharged(const Value: TRequestCharged);
    function GetSSECustomerAlgorithm: string;
    procedure SetSSECustomerAlgorithm(const Value: string);
    function GetSSECustomerKeyMD5: string;
    procedure SetSSECustomerKeyMD5(const Value: string);
    function GetSSEKMSKeyId: string;
    procedure SetSSEKMSKeyId(const Value: string);
    function GetServerSideEncryption: TServerSideEncryption;
    procedure SetServerSideEncryption(const Value: TServerSideEncryption);
    function GetPartNumber: Integer;
    procedure SetPartNumber(const Value: Integer);
  strict protected
    function Obj: TUploadPartResponse;
  public
    function IsSetBucketKeyEnabled: Boolean;
    function IsSetETag: Boolean;
    function IsSetRequestCharged: Boolean;
    function IsSetSSECustomerAlgorithm: Boolean;
    function IsSetSSECustomerKeyMD5: Boolean;
    function IsSetSSEKMSKeyId: Boolean;
    function IsSetServerSideEncryption: Boolean;
    property BucketKeyEnabled: Boolean read GetBucketKeyEnabled write SetBucketKeyEnabled;
    property ETag: string read GetETag write SetETag;
    property RequestCharged: TRequestCharged read GetRequestCharged write SetRequestCharged;
    property SSECustomerAlgorithm: string read GetSSECustomerAlgorithm write SetSSECustomerAlgorithm;
    property SSECustomerKeyMD5: string read GetSSECustomerKeyMD5 write SetSSECustomerKeyMD5;
    property SSEKMSKeyId: string read GetSSEKMSKeyId write SetSSEKMSKeyId;
    property ServerSideEncryption: TServerSideEncryption read GetServerSideEncryption write SetServerSideEncryption;
    property PartNumber: Integer read GetPartNumber write SetPartNumber;
  end;
  
implementation

{ TUploadPartResponse }

function TUploadPartResponse.Obj: TUploadPartResponse;
begin
  Result := Self;
end;

function TUploadPartResponse.GetBucketKeyEnabled: Boolean;
begin
  Result := FBucketKeyEnabled.ValueOrDefault;
end;

procedure TUploadPartResponse.SetBucketKeyEnabled(const Value: Boolean);
begin
  FBucketKeyEnabled := Value;
end;

function TUploadPartResponse.IsSetBucketKeyEnabled: Boolean;
begin
  Result := FBucketKeyEnabled.HasValue;
end;

function TUploadPartResponse.GetETag: string;
begin
  Result := FETag.ValueOrDefault;
end;

procedure TUploadPartResponse.SetETag(const Value: string);
begin
  FETag := Value;
end;

function TUploadPartResponse.IsSetETag: Boolean;
begin
  Result := FETag.HasValue;
end;

function TUploadPartResponse.GetRequestCharged: TRequestCharged;
begin
  Result := FRequestCharged.ValueOrDefault;
end;

procedure TUploadPartResponse.SetRequestCharged(const Value: TRequestCharged);
begin
  FRequestCharged := Value;
end;

function TUploadPartResponse.IsSetRequestCharged: Boolean;
begin
  Result := FRequestCharged.HasValue;
end;

function TUploadPartResponse.GetSSECustomerAlgorithm: string;
begin
  Result := FSSECustomerAlgorithm.ValueOrDefault;
end;

procedure TUploadPartResponse.SetSSECustomerAlgorithm(const Value: string);
begin
  FSSECustomerAlgorithm := Value;
end;

function TUploadPartResponse.IsSetSSECustomerAlgorithm: Boolean;
begin
  Result := FSSECustomerAlgorithm.HasValue;
end;

function TUploadPartResponse.GetSSECustomerKeyMD5: string;
begin
  Result := FSSECustomerKeyMD5.ValueOrDefault;
end;

procedure TUploadPartResponse.SetSSECustomerKeyMD5(const Value: string);
begin
  FSSECustomerKeyMD5 := Value;
end;

function TUploadPartResponse.IsSetSSECustomerKeyMD5: Boolean;
begin
  Result := FSSECustomerKeyMD5.HasValue;
end;

function TUploadPartResponse.GetSSEKMSKeyId: string;
begin
  Result := FSSEKMSKeyId.ValueOrDefault;
end;

procedure TUploadPartResponse.SetSSEKMSKeyId(const Value: string);
begin
  FSSEKMSKeyId := Value;
end;

function TUploadPartResponse.IsSetSSEKMSKeyId: Boolean;
begin
  Result := FSSEKMSKeyId.HasValue;
end;

function TUploadPartResponse.GetServerSideEncryption: TServerSideEncryption;
begin
  Result := FServerSideEncryption.ValueOrDefault;
end;

procedure TUploadPartResponse.SetServerSideEncryption(const Value: TServerSideEncryption);
begin
  FServerSideEncryption := Value;
end;

function TUploadPartResponse.IsSetServerSideEncryption: Boolean;
begin
  Result := FServerSideEncryption.HasValue;
end;

function TUploadPartResponse.GetPartNumber: Integer;
begin
  Result := FPartNumber;
end;

procedure TUploadPartResponse.SetPartNumber(const Value: Integer);
begin
  FPartNumber := Value;
end;

end.

unit AWS.SNS.Model.ListSubscriptionsByTopicResponse;

interface

uses
  Bcl.Types.Nullable, 
  System.Generics.Collections, 
  AWS.Runtime.Model, 
  AWS.SNS.Model.Subscription;

type
  TListSubscriptionsByTopicResponse = class;
  
  IListSubscriptionsByTopicResponse = interface(IAmazonWebServiceResponse)
    function GetNextToken: string;
    procedure SetNextToken(const Value: string);
    function GetSubscriptions: TObjectList<TSubscription>;
    procedure SetSubscriptions(const Value: TObjectList<TSubscription>);
    function GetKeepSubscriptions: Boolean;
    procedure SetKeepSubscriptions(const Value: Boolean);
    function Obj: TListSubscriptionsByTopicResponse;
    function IsSetNextToken: Boolean;
    function IsSetSubscriptions: Boolean;
    property NextToken: string read GetNextToken write SetNextToken;
    property Subscriptions: TObjectList<TSubscription> read GetSubscriptions write SetSubscriptions;
    property KeepSubscriptions: Boolean read GetKeepSubscriptions write SetKeepSubscriptions;
  end;
  
  TListSubscriptionsByTopicResponse = class(TAmazonWebServiceResponse, IListSubscriptionsByTopicResponse)
  strict private
    FNextToken: Nullable<string>;
    FSubscriptions: TObjectList<TSubscription>;
    FKeepSubscriptions: Boolean;
    function GetNextToken: string;
    procedure SetNextToken(const Value: string);
    function GetSubscriptions: TObjectList<TSubscription>;
    procedure SetSubscriptions(const Value: TObjectList<TSubscription>);
    function GetKeepSubscriptions: Boolean;
    procedure SetKeepSubscriptions(const Value: Boolean);
  strict protected
    function Obj: TListSubscriptionsByTopicResponse;
  public
    constructor Create;
    destructor Destroy; override;
    function IsSetNextToken: Boolean;
    function IsSetSubscriptions: Boolean;
    property NextToken: string read GetNextToken write SetNextToken;
    property Subscriptions: TObjectList<TSubscription> read GetSubscriptions write SetSubscriptions;
    property KeepSubscriptions: Boolean read GetKeepSubscriptions write SetKeepSubscriptions;
  end;
  
implementation

{ TListSubscriptionsByTopicResponse }

constructor TListSubscriptionsByTopicResponse.Create;
begin
  inherited;
  FSubscriptions := TObjectList<TSubscription>.Create;
end;

destructor TListSubscriptionsByTopicResponse.Destroy;
begin
  Subscriptions := nil;
  inherited;
end;

function TListSubscriptionsByTopicResponse.Obj: TListSubscriptionsByTopicResponse;
begin
  Result := Self;
end;

function TListSubscriptionsByTopicResponse.GetNextToken: string;
begin
  Result := FNextToken.ValueOrDefault;
end;

procedure TListSubscriptionsByTopicResponse.SetNextToken(const Value: string);
begin
  FNextToken := Value;
end;

function TListSubscriptionsByTopicResponse.IsSetNextToken: Boolean;
begin
  Result := FNextToken.HasValue;
end;

function TListSubscriptionsByTopicResponse.GetSubscriptions: TObjectList<TSubscription>;
begin
  Result := FSubscriptions;
end;

procedure TListSubscriptionsByTopicResponse.SetSubscriptions(const Value: TObjectList<TSubscription>);
begin
  if FSubscriptions <> Value then
  begin
    if not KeepSubscriptions then
      FSubscriptions.Free;
    FSubscriptions := Value;
  end;
end;

function TListSubscriptionsByTopicResponse.GetKeepSubscriptions: Boolean;
begin
  Result := FKeepSubscriptions;
end;

procedure TListSubscriptionsByTopicResponse.SetKeepSubscriptions(const Value: Boolean);
begin
  FKeepSubscriptions := Value;
end;

function TListSubscriptionsByTopicResponse.IsSetSubscriptions: Boolean;
begin
  Result := (FSubscriptions <> nil) and (FSubscriptions.Count > 0);
end;

end.

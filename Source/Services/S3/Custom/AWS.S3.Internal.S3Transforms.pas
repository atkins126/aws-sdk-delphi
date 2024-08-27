unit AWS.S3.Internal.S3Transforms;

interface

uses
  System.SysUtils, System.DateUtils,
  AWS.SDKUtils;

type
  TS3Transforms = class
  public
    class function ToDateTime(const Value: string): TDateTime; static;
    class function ToStringValue(const Value: string): string; overload; static;
    class function ToStringValue(const Value: Integer): string; overload; static;
    class function ToStringValue(const Value: Boolean): string; overload; static;
    class function ToStringValue(const Value: TDateTime; const DateFormat: string = TAWSSDKUtils.RFC822DateFormat): string; overload; static;
    class function ValueToString(const Value: string): string; static;
    class function ToBool(const Value: string): Boolean; static;
    class function ToInt(const Value: string): Integer; static;

    class function ToXmlStringValue(const Value: string): string; overload; static;
    class function ToXmlStringValue(const Value: Boolean): string; overload; static;
  end;

implementation

{ TS3Transforms }

class function TS3Transforms.ToBool(const Value: string): Boolean;
begin
  Result := StrToBool(Value);
end;

class function TS3Transforms.ToDateTime(const Value: string): TDateTime;
begin
  Result := TAWSSDKUtils.Rfc822ToDateTime(Value);
end;

class function TS3Transforms.ToInt(const Value: string): Integer;
begin
  Result := StrToInt(Value);
end;

class function TS3Transforms.ToStringValue(const Value: string): string;
begin
  Result := Value;
end;

class function TS3Transforms.ToStringValue(const Value: Integer): string;
begin
  Result := IntToStr(Value);
end;

class function TS3Transforms.ValueToString(const Value: string): string;
begin
  Result := Value;
end;

class function TS3Transforms.ToStringValue(const Value: TDateTime; const DateFormat: string = TAWSSDKUtils.RFC822DateFormat): string;
begin
  Result := FormatDateTime(DateFormat, TTimeZone.Local.ToUniversalTime(Value));
end;

class function TS3Transforms.ToXmlStringValue(const Value: Boolean): string;
begin
  Result := ToStringValue(Value);
end;

class function TS3Transforms.ToStringValue(const Value: Boolean): string;
begin
  if Value then
    Result := 'true'
  else
    Result := 'false';
end;

class function TS3Transforms.ToXmlStringValue(const Value: string): string;
begin
  Result := Value;
end;

end.

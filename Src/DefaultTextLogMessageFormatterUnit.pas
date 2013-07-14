unit DefaultTextLogMessageFormatterUnit;

{$mode objfpc}{$H+}

interface

uses
  SysUtils,
  StrUtils,
  LogMessageUnit,
  TextLogMessageFormatterUnit;

type

  { TDefaultTextLogMessageFormatter }

  TDefaultTextLogMessageFormatter = class(TTextLogMessageFormatter)
  protected
    function FormatNumber(const aNumber: Cardinal): string;
  public
    function Format(const aMessage: TLogMessage): string; override;
  end;

implementation

const
  LogMessageNumberDigitCountLimit = 10;
  LogMessageDateTimeFormat = 'yyyy.mm.dd hh:nn:ss';

{ TDefaultTextLogMessageFormatter }

function TDefaultTextLogMessageFormatter.FormatNumber(const aNumber: Cardinal): string;
const
  Total = LogMessageNumberDigitCountLimit;
var
  s: string;
  mean: Cardinal;
begin
  result := DupeString('0', Total);
  s := IntToStr(aNumber);
  mean := Length(s);
  Move(s, result[1 + Total - mean], mean);
end;

function TDefaultTextLogMessageFormatter.Format(const aMessage: TLogMessage): string;
begin
  result :=
    '#' + FormatNumber(aMessage.Number)
    + '@' + FormatDateTime(LogMessageDateTimeFormat, aMessage.Moment)
    + '[' + aMessage.Tags.ToString(' ') + '] '
    + aMessage.Names.ToString('.')
    + '"' + aMessage.Name + '": '
    + aMessage.Text;
end;

end.


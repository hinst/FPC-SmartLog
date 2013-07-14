unit TextLogMessageFormatterUnit;

interface

uses
  SmartObjectUnit,
  LogMessageUnit;

type
  TTextLogMessageFormatter = class(TSmartObject)
  public
    function Format(const aMessage: TLogMessage): string; virtual; abstract;
  end;

implementation

end.


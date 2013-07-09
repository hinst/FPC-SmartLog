unit CustomLoggerUnit;

interface

uses
  SmartObjectUnit,
  LogMessageUnit;

type
  TCustomLogger = class(TSmartObject)
  public
    procedure Write(const aMessage: TLogMessage); virtual; abstract;
  end;

implementation

end.


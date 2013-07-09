unit CustomLogWriterUnit;

interface

uses
  SmartObjectUnit,
  LogMessageUnit;

type
  TCustomLogWriter = class(TSmartObject)
  public
    procedure Write(const aMessage: TLogMessage); virtual; abstract;
  end;

implementation

end.


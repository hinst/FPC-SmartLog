unit CustomLoggerUnit;

interface

uses
  SmartObjectUnit,
  LogMessageUnit;

type
  TCustomLogger = class(TSmartObject)
  public
    function Emit: TLogMessage; virtual; abstract;
    procedure Write(const aMessage: TLogMessage); virtual; abstract;
  end;

implementation

end.


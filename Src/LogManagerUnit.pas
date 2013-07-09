unit LogManagerUnit;

interface

uses
  SysUtils,
  LogMessageUnit;

type

  { TLogManager }

  TLogManager = class
  protected
    FCounter: Cardinal;
  public
    property Counter: Cardinal read FCounter;
    function Emit: TLogMessage;
  end;

implementation

{ TLogManager }

function TLogManager.Emit: TLogMessage;
begin
  result := TLogMessage.Create;
  result.Moment := Now;
  Inc(FCounter);
  result.Number := FCounter;
end;

end.


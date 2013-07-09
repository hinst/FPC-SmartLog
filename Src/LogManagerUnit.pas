unit LogManagerUnit;

interface

uses
  SysUtils,
  Classes,
  ghashset,
  SmartObjectUnit,
  LogMessageUnit,
  CustomLogWriterUnit,
  CustomLogWriterHashSetUnit;

type

  { TLogManager }

  TLogManager = class(TSmartObject)
  protected
    FCounter: Cardinal;
    FWriters: TCustomLogWriterHashSet;
    property Writers: TCustomLogWriterHashSet read FWriters;
  public
    property Counter: Cardinal read FCounter;
    constructor Create; override;
    procedure Add(const aWriter: TCustomLogWriter);
    function Emit: TLogMessage;
    procedure Write(const aMessage: TLogMessage);
    destructor Destroy; override;
  end;

implementation

{ TLogManager }

constructor TLogManager.Create;
begin
  inherited Create;
  FCounter := 0;
  FWriters := TCustomLogWriterHashSet.create;
end;

procedure TLogManager.Add(const aWriter: TCustomLogWriter);
begin
  Writers.insert(aWriter);
end;

function TLogManager.Emit: TLogMessage;
begin
  result := TLogMessage.Create;
  result.Moment := Now;
  Inc(FCounter);
  result.Number := FCounter;
end;

procedure TLogManager.Write(const aMessage: TLogMessage);
var
  i: TCustomLogWriterHashSet.TIterator;
  w: TCustomLogWriter;
begin
  if not Writers.IsEmpty then
  begin
    i := Writers.Iterator;
    repeat
      w := i.Data;
      w.Write(aMessage);
    until not i.Next;
  end;
end;

destructor TLogManager.Destroy;
begin
  Writers.Free;
  inherited Destroy;
end;

end.


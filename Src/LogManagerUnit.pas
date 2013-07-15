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
    procedure ReleaseWriters;
  public
    property Counter: Cardinal read FCounter;
    constructor Create; override;
    procedure Add(const aWriter: TCustomLogWriter);
    procedure Remove(const aWriter: TCustomLogWriter);
    function Emit: TLogMessage;
    procedure Write(const aMessage: TLogMessage);
    destructor Destroy; override;
  end;

implementation

{ TLogManager }

procedure TLogManager.ReleaseWriters;
var
  i: TCustomLogWriterHashSet.TIterator;
begin
  if
    not Writers.IsEmpty
  then
  begin
    i := Writers.Iterator;
    repeat
      i.Data.Release;
    until not i.Next;
    i.Free;
  end;
end;

constructor TLogManager.Create;
begin
  inherited Create;
  FCounter := 0;
  FWriters := TCustomLogWriterHashSet.create;
end;

procedure TLogManager.Add(const aWriter: TCustomLogWriter);
begin
  aWriter.Acquire;
  Writers.insert(aWriter);
end;

procedure TLogManager.Remove(const aWriter: TCustomLogWriter);
begin
  if
    Writers.contains(aWriter)
  then
  begin
    Writers.delete(aWriter);
    aWriter.Release;
  end;
end;

function TLogManager.Emit: TLogMessage;
begin
  result := TLogMessage.Create;
  result.Acquire;
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
    i.Free;
  end;
  aMessage.Release;
end;

destructor TLogManager.Destroy;
begin
  ReleaseWriters;
  Writers.Free;
  inherited Destroy;
end;

end.


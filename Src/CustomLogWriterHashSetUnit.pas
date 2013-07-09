unit CustomLogWriterHashSetUnit;

interface

uses
  ghashset,
  SmartPointerHashUnit,
  CustomLogWriterUnit;

type

  { TCustomLogWriterHash }

  TCustomLogWriterHash = class
  public
    class function hash(aWriter: TCustomLogWriter; aCount: Longint): Longint;
  end;

  TCustomLogWriterHashSet = specialize THashSet<TCustomLogWriter, TCustomLogWriterHash>;

implementation

{ TCustomLogWriterHash }

class function TCustomLogWriterHash.hash(aWriter: TCustomLogWriter; aCount: Longint): Longint;
var
  x: PtrUInt;
begin
  x := SmartPointerHashUnit.hash(aWriter);
  result := x mod aCount;
end;

end.


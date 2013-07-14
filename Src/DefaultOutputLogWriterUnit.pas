unit DefaultOutputLogWriterUnit;

interface

uses
  TextLogWriterUnit;

type

  { TDefaultOutputLogWriter }

  TDefaultOutputLogWriter = class(TTextLogWriter)
  protected
    procedure Write(const aText: string); override;
  end;

implementation

{ TDefaultOutputLogWriter }

procedure TDefaultOutputLogWriter.Write(const aText: string);
begin
  WriteLN(aText);
end;

end.


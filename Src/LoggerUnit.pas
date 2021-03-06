unit LoggerUnit;

interface

uses
  LogMessageUnit,
  CustomLoggerUnit;

type

  { TLogger }

  TLogger = class(TCustomLogger)
  protected
    FParent: TCustomLogger;
  public
    property Parent: TCustomLogger read FParent;
    constructor Create(const aParent: TCustomLogger);
    function Emit: TLogMessage; override;
    procedure Write(const aMessage: TLogMessage); override;
    procedure Write(const aText: string);
    procedure Write(const aTags, aText: string);
  end;

implementation

{ TLogger }

constructor TLogger.Create(const aParent: TCustomLogger);
begin
  inherited Create;
  FParent := aParent;
end;

function TLogger.Emit: TLogMessage;
begin
  result := Parent.Emit;
  result.Name := Name;
end;

procedure TLogger.Write(const aMessage: TLogMessage);
begin
  Parent.Write(aMessage);
end;

procedure TLogger.Write(const aText: string);
var
  m: TLogMessage;
begin
  m := Emit;
  m.Text := aText;
  Write(m);
end;

procedure TLogger.Write(const aTags, aText: string);
var
  m: TLogMessage;
begin
  m := Emit;
  m.Tags.Add(aTags);
  m.Text := aText;
  Write(m);
end;

end.


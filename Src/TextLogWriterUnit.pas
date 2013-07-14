unit TextLogWriterUnit;

interface

uses
  SysUtils,
  Classes,
  LogMessageUnit,
  CustomLogWriterUnit,
  TextLogMessageFormatterUnit;

type

  { TTextLogWriter }

  TTextLogWriter = class(TCustomLogWriter)
  protected
    FFormatter: TTextLogMessageFormatter;
    procedure Write(const aText: string); virtual; abstract;
    procedure SetFormatter(const aFormatter: TTextLogMessageFormatter);
  public
    property Formatter: TTextLogMessageFormatter read FFormatter write SetFormatter;
    constructor Create; override;
    constructor Create(const aFormatter: TTextLogMessageFormatter);
    procedure Write(const aMessage: TLogMessage); override;
    destructor Destroy; override;
  end;

implementation

{ TTextLogWriter }

procedure TTextLogWriter.SetFormatter(const aFormatter: TTextLogMessageFormatter);
begin
  FFormatter.Release;
  FFormatter := aFormatter;
  FFormatter.Acquire;
end;

constructor TTextLogWriter.Create;
begin
  inherited Create;
end;

constructor TTextLogWriter.Create(const aFormatter: TTextLogMessageFormatter);
begin
  Create;
  aFormatter.Acquire;
  FFormatter := aFormatter;
end;

procedure TTextLogWriter.Write(const aMessage: TLogMessage);
var
  text: string;
begin
  text := Formatter.Format(aMessage);
  Write(text);
end;

destructor TTextLogWriter.Destroy;
begin
  FFormatter.Release;
  inherited Destroy;
end;

end.


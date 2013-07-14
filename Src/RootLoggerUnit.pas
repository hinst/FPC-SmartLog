unit RootLoggerUnit;

interface

uses
  LogMessageUnit,
  CustomLoggerUnit,
  LogManagerUnit;

type

  { TRootLogger }

  TRootLogger = class(TCustomLogger)
  protected
    FManager: TLogManager;
  public
    property Manager: TLogManager read FManager;
    constructor Create; override;
    constructor Create(const aManager: TLogManager);
    function Emit: TLogMessage; override;
    procedure Write(const aMessage: TLogMessage); override;
    destructor Destroy; override;
  end;

implementation

{ TRootLogger }

constructor TRootLogger.Create;
begin
  inherited Create;
end;

constructor TRootLogger.Create(const aManager: TLogManager);
begin
  Create;
  FManager := aManager;
end;

function TRootLogger.Emit: TLogMessage;
begin
  result := Manager.Emit;
end;

procedure TRootLogger.Write(const aMessage: TLogMessage);
begin
  Manager.Write(aMessage);
end;

destructor TRootLogger.Destroy;
begin
  inherited Destroy;
end;

end.


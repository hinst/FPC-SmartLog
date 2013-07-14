program project1;

uses
  DefaultOutputLogWriterUnit,
  DefaultTextLogMessageFormatterUnit,
  LogManagerUnit,
  RootLoggerUnit,
  LoggerUnit;

var
  LogManager: TLogManager;
  RootLogger: TRootLogger;
  Logger: TLogger;

begin
  LogManager := TLogManager.Create;
  LogManager.Add(
    TDefaultOutputLogWriter.Create(
      TDefaultTextLogMessageFormatter.Create
    )
  );
  RootLogger := TRootLogger.Create(LogManager);
  Logger := TLogger.Create(RootLogger);
  Logger.Name := 'SampleLogger';
  Logger.Write('LOL');
  Logger.Free;
  RootLogger.Free;
  LogManager.Free;
end.


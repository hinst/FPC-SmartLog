unit LogMessageUnit;

interface

uses
  SmartObjectUnit,
  StringBlockUnit;

const
  LogMessageNameCountLimit = 10;

type

  { TLogMessage }

  TLogMessage = class(TSmartObject)
  protected
    FNumber: Cardinal;
    FMoment: TDateTime;
    FNames: TStringBlock;
    FTags: TStringBlock;
    FText: string;
  public
    constructor Create; override;
    property Number: Cardinal read FNumber write FNumber;
    property Moment: TDateTime read FMoment write FMoment;
    property Names: TStringBlock read FNames;
    property Tags: TStringBlock read FTags;
    property Text: string read FText write FText;
    destructor Destroy; override;
  end;

implementation

{ TLogMessage }

constructor TLogMessage.Create;
begin
  inherited Create;
  FNames := TStringBlock.Create;
  FTags := TStringBlock.Create;
end;

destructor TLogMessage.Destroy;
begin
  Tags.Free;
  Names.Free;
  inherited Destroy;
end;

end.


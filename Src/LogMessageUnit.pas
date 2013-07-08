unit LogMessageUnit;

interface

uses
  SmartObjectUnit;

type
  TLogMessage = class(TSmartObject)
  protected
    FNumber: Cardinal;
    FMoment: TDateTime;
    FTags: string;
    FText: string;
  public
    property Number: Cardinal read FNumber write FNumber;
    property Moment: TDateTime read FMoment write FMoment;
    property Tags: string read FTags write FTags;
    property Text: string read FText write FText;
  end;

implementation

end.


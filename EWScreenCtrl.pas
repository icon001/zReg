unit EWScreenCtrl;

interface

uses
  Classes;

type
  PEWScreenItem = ^TEWScreenItem;
  TEWScreenItem = packed record
    ESI_Width  : Word;
    ESI_Height : Word;
    ESI_BitsperPel : Byte;
    ESI_DisplayFrequency : Byte;
    ESI_tempWord : Word;
  end;

//  TEWScreenItemList

  TEWScreenCtrl = class
  public
//    property TotalList: TList  
  end;

implementation

end.

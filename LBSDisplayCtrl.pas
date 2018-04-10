unit LBSDisplayCtrl;

interface

uses
  Classes, Windows;

type
  POINTL = packed record
    x,y: LongWord;
  end;

  _devicemodeA2 = packed record
    dmDeviceName: array[0..CCHDEVICENAME - 1] of AnsiChar;
    dmSpecVersion: Word;
    dmDriverVersion: Word;
    dmSize: Word;
    dmDriverExtra: Word;
    dmFields: DWORD;
(*
    dmOrientation: SHORT;
    dmPaperSize: SHORT;
    dmPaperLength: SHORT;
    dmPaperWidth: SHORT;
    dmScale: SHORT;
    dmCopies: SHORT;
    dmDefaultSource: SHORT;
    dmPrintQuality: SHORT;
(*)
    dmPosition: POINTL;
    dmDisplayOrientation: DWORD;
    dmDisplayFixedOutput: DWORD;
(**)
    dmColor: SHORT;
    dmDuplex: SHORT;
    dmYResolution: SHORT;
    dmTTOption: SHORT;
    dmCollate: SHORT;
    dmFormName: array[0..CCHFORMNAME - 1] of AnsiChar;
    dmLogPixels: Word;
    dmBitsPerPel: DWORD;
    dmPelsWidth: DWORD;
    dmPelsHeight: DWORD;
    dmDisplayFlags: DWORD;
    dmDisplayFrequency: DWORD;
    dmICMMethod: DWORD;
    dmICMIntent: DWORD;
    dmMediaType: DWORD;
    dmDitherType: DWORD;
    dmICCManufacturer: DWORD;
    dmICCModel: DWORD;
    dmPanningWidth: DWORD;
    dmPanningHeight: DWORD;
  end;

  PMonitorDevMode = ^TMonitorDevMode;
  TMonitorDevMode = _devicemodeA2;

  PLBSDisplayItem = ^TLBSDisplayItem;
  TLBSDisplayItem = packed record
    LSI_Index : Word;
    LSI_DisplayFrequency : Byte;
    LSI_Height : Word;
    LSI_Width  : Word;
    LSI_BitsperPel : Byte;
  end;

  TLBSDisplayItemList = class(TList)
  private
    function getItems(index: integer): PLBSDisplayItem;
//    procedure setItems(index: integer; const Value: PLBSDisplayItem);
  public
    function IndexOfBWHF(_LBSDisplayItem: PLBSDisplayItem): integer;
    function IndexOfSafety(_Bpp: Byte; _Wid, _Hei: Word): integer;
    procedure SortBWHF;
    property Items[index: integer]: PLBSDisplayItem read getItems;// write setItems;
  end;

  TLBSDisplayItemListMem = class(TLBSDisplayItemList)
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
  public
    function Add: integer; overload;
    function Add(_idx, _wid,_hei: Word; _bpp,_df : Byte): integer; overload;
  end;

  TLBSDisplayCtrl = class
  private
    fDisplayTotal: TLBSDisplayItemList;
    fDisplay_4_3: TLBSDisplayItemList;
    fDisplay_wide: TLBSDisplayItemList;
    fReady: Boolean;
    fIsDisplayWide: Boolean;
    fIsSafety: Boolean;
    function get_NowDispayItem: TLBSDisplayItem;
    procedure Set_IsSafety(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    procedure InitScreenInfo;
    property Display_Total: TLBSDisplayItemList read fDisplayTotal;
    property Display_4_3  : TLBSDisplayItemList read fDisplay_4_3;
    property Display_wide : TLBSDisplayItemList read fDisplay_wide;
    property Ready: Boolean read fReady;
    property NowDisplayItem : TLBSDisplayItem read get_NowDispayItem;
    property IsDisplayWide : Boolean read fIsDisplayWide;
    property IsSafety : Boolean read fIsSafety write Set_IsSafety;
  end;

function DisplayItem2DevMode(const _LBSDisplayItem: TLBSDisplayItem): TDevMode;
function Index2DevMode(_Index: LongWord): TDevMode; overload;
function Index2DevMode(const _LBSDisplayItem: TLBSDisplayItem): TDevMode; overload;

function ChangeDisplayItem(const _LBSDisplayItem: TLBSDisplayItem; _Flags: LongWord): Boolean;
function ChangeDisplayIndex(_Index: LongWord; _Flags: LongWord): Boolean; overload;
function ChangeDisplayIndex(const _LBSDisplayItem: TLBSDisplayItem; _Flags: LongWord): Boolean; overload;

implementation

{ TLBSDisplayItemList }

function TLBSDisplayItemList.getItems(index: integer): PLBSDisplayItem;
begin
  result := inherited Items[index];
end;
{
procedure TLBSDisplayItemList.setItems(index: integer; const Value: PLBSDisplayItem);
begin
  inherited Items[index] := Value;
end;
}

function B_W_H_F_Compare(Item1, Item2: Pointer): Integer;
begin
  if uint64(Item1^) > uint64(Item2^) then
    Result := 1
  else if uint64(Item1^) < uint64(Item2^) then
    Result := -1
  else
    Result := 0;
end;
// 찾다가 못찾더라도 원래 찾을려고 했던 바로 전값을 리턴해준다.
function TLBSDisplayItemList.IndexOfBWHF(_LBSDisplayItem: PLBSDisplayItem): integer;
var
  L, H, I: LongInt;
begin
  Result := -1;
  if Count > 1 then
  begin
    L := 0;
    H := Count-1;
    While L <= H do
    begin
      I := (L + H) div 2;
      If B_W_H_F_Compare(Items[I], _LBSDisplayItem) < 0 then
        L := I + 1
      else
      begin
        H := I - 1;
        If B_W_H_F_Compare(Items[I], _LBSDisplayItem) = 0 then
        begin
          Result := i;
          Exit;
        end;
      end;
    end;
    if H<0 then Result := 0
    else Result := H;
  end else if Count = 1 then Result := 0;
end;
// 찾다가 못찾더라도 원래 찾을려고 했던 바로 다음값을 리턴해준다.
function TLBSDisplayItemList.IndexOfSafety(_Bpp: Byte; _Wid, _Hei: Word): integer;
var
  L, H, I: LongInt;
  _LBSDisplayItem: TLBSDisplayItem;
begin
  Result := -1;
  if Count < 2 then
  begin
    if Count = 1 then Result := 0;
    Exit;
  end;
  With _LBSDisplayItem do
  begin
    LSI_Index := 0;
    LSI_DisplayFrequency := 0;
    LSI_Height := _Hei;
    LSI_Width := _Wid;
    LSI_BitsperPel := _Bpp;
  end;
  L := 0;
  H := Count-1;
  While L <= H do
  begin
    I := (L + H) div 2;
    If B_W_H_F_Compare(Items[I], @_LBSDisplayItem) < 0 then
      L := I + 1
    else
    begin
      H := I - 1;
      If B_W_H_F_Compare(Items[I], @_LBSDisplayItem) = 0 then
      begin
        Result := i;
        Exit;
      end;
    end;
  end;
  if L < Count then Result := L
  else Result := Count-1;
end;

procedure TLBSDisplayItemList.SortBWHF;
begin
  Sort(B_W_H_F_Compare);
end;

{ TLBSDisplayItemListMem }

procedure TLBSDisplayItemListMem.Notify(Ptr: Pointer; Action: TListNotification);
begin
  case Action of
    lnDeleted : FreeMemory(Ptr);
  end;
end;

function TLBSDisplayItemListMem.Add: integer;
begin
  Result := inherited Add(GetMemory(SizeOf(TLBSDisplayItem)));
end;

function TLBSDisplayItemListMem.Add(_idx, _wid, _hei: Word; _bpp, _df: Byte): integer;
begin
  Result := Add;
  With Items[Result]^ do
  begin
    LSI_Index := _idx;
    LSI_Width := _wid;
    LSI_Height := _hei;
    LSI_BitsperPel := _bpp;
    LSI_DisplayFrequency := _df;
  end;
end;

{ TLBSDisplayCtrl }

constructor TLBSDisplayCtrl.Create;
begin
  inherited Create;

  fReady := False;
  fIsDisplayWide := false;
  fIsSafety := True;

  fDisplayTotal := TLBSDisplayItemListMem.Create;
  fDisplay_4_3  := TLBSDisplayItemList.Create;
  fDisplay_wide := TLBSDisplayItemList.Create;
end;

destructor TLBSDisplayCtrl.Destroy;
begin
  fDisplay_wide.Free;
  fDisplay_4_3.Free;
  fDisplayTotal.Free;

  inherited;
end;

procedure TLBSDisplayCtrl.InitScreenInfo;
var
  cnt : Integer;
  tmpItem: PLBSDisplayItem;
  DevMode : TDevMode;
  maxwwid,max43wid: Word;
label
  LoopInc;
begin
  cnt := 0;

  maxwwid := 0;
  max43wid := 0;
  fDisplay_wide.Clear;
  fDisplay_4_3.Clear;
  fDisplayTotal.Clear;
  while EnumDisplaySettings(nil,cnt,DevMode) do
  begin
    if fIsSafety then
      if TMonitorDevMode(DevMode).dmDisplayOrientation <> 0 then
        goto LoopInc;
    with Devmode do
    begin
      tmpItem := fDisplayTotal.Items[TLBSDisplayItemListMem(fDisplayTotal).Add(cnt, dmPelsWidth,dmPelsHeight,dmBitsperPel,dmDisplayFrequency)];
      if (dmPelsWidth * 3) div 4 > dmPelsHeight then // 와이드
      begin
        fDisplay_wide.Add(tmpItem);
        if maxwwid < tmpItem^.LSI_Width then
          maxwwid := tmpItem^.LSI_Width;
      end else // 일반 4:3
      begin
        fDisplay_4_3.Add(tmpItem);
        if max43wid < tmpItem^.LSI_Width then
          max43wid := tmpItem^.LSI_Width;
      end;
    end;
    LoopInc:
    Inc(cnt) ;
  end;

  fDisplayTotal.SortBWHF;
  fDisplay_wide.SortBWHF;
  fDisplay_4_3.SortBWHF;

  fIsDisplayWide := maxwwid > max43wid; // 이런 허접한거 말고 제대로 알수 있는 방법이 없을까?

  fReady := True;
end;

procedure TLBSDisplayCtrl.Set_IsSafety(const Value: Boolean);
begin
  fIsSafety := Value;

  if fReady then InitScreenInfo;
end;

function TLBSDisplayCtrl.get_NowDispayItem: TLBSDisplayItem;
var
  DevMode : TDevMode;
  i: integer;
begin
  if EnumDisplaySettings(nil, $FFFFFFFF{ENUM_CURRENT_SETTINGS}, DevMode) then // 지금 디스플레이 모드
    with Result, Devmode do
    begin
      LSI_Index := $FFFF;
      LSI_Width := dmPelsWidth;
      LSI_Height := dmPelsHeight;
      LSI_BitsperPel := dmBitsperPel;
      LSI_DisplayFrequency := dmDisplayFrequency;
    end;
  i := fDisplayTotal.IndexOfBWHF(@Result);
  if i > -1 then
    Result.LSI_Index := fDisplayTotal.Items[i]^.LSI_Index;
end;

function DisplayItem2DevMode(const _LBSDisplayItem: TLBSDisplayItem): TDevMode;
begin
  FillChar(Result, SizeOf(TDevMode), 0);
  With Result, _LBSDisplayItem do
  begin
    dmSize       := SizeOf(TDevMode);
    dmPelsWidth  := LSI_Width;
    dmPelsHeight := LSI_Height;
    dmBitsPerPel := LSI_BitsperPel;
    if LSI_DisplayFrequency > 0 then
    begin
      dmDisplayFrequency := LSI_DisplayFrequency;
      dmFields := DM_PELSWIDTH or DM_PELSHEIGHT or DM_DISPLAYFREQUENCY or DM_BITSPERPEL;
    end else
      dmFields     := DM_PELSWIDTH or DM_PELSHEIGHT or DM_BITSPERPEL;
  end;
end;

function Index2DevMode(_Index: LongWord): TDevMode;
begin
  EnumDisplaySettings(nil, _Index, Result);
end;

function Index2DevMode(const _LBSDisplayItem: TLBSDisplayItem): TDevMode;
begin
  EnumDisplaySettings(nil, _LBSDisplayItem.LSI_Index, Result);
end;

function ChangeDisplayItem(const _LBSDisplayItem: TLBSDisplayItem; _Flags: LongWord): Boolean;
var
  DevMode : TDevMode;
begin
  DevMode := DisplayItem2DevMode(_LBSDisplayItem);

  Result := ChangeDisplaySettings(DevMode, _Flags) = DISP_CHANGE_SUCCESSFUL;
end;

function ChangeDisplayIndex(_Index: LongWord; _Flags: LongWord): Boolean;
var
  DevMode : TDevMode;
begin
  Result := EnumDisplaySettings (nil,_Index, DevMode)
        and (ChangeDisplaySettings(DevMode, _Flags) = DISP_CHANGE_SUCCESSFUL);
end;

function ChangeDisplayIndex(const _LBSDisplayItem: TLBSDisplayItem; _Flags: LongWord): Boolean;
var
  DevMode : TDevMode;
begin
  Result := EnumDisplaySettings (nil, _LBSDisplayItem.LSI_Index, DevMode)
        and (ChangeDisplaySettings(DevMode, _Flags) = DISP_CHANGE_SUCCESSFUL);
end;

end.

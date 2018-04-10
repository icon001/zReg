unit UStateIndicate;

interface

uses
  uMain,
  uLomosUtil,
  uFunction,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton, Grids, RzGrids, RzCmboBx, ExtCtrls, RzPanel,
  LMDCustomScrollBox, LMDListBox, RzRadChk;

const
  DelayTime = 300;
  LoopCount = 3;

type
  TfmStateIndicate = class(TForm)
    Panel1: TPanel;
    Group_StateIndicate: TGroupBox;
    chk_SCU0: TCheckBox;
    chk_SCU1: TCheckBox;
    chk_SCU2: TCheckBox;
    chk_SCU3: TCheckBox;
    chk_SCU4: TCheckBox;
    chk_SCU5: TCheckBox;
    chk_SCU6: TCheckBox;
    chk_SCU7: TCheckBox;
    chk_SCU8: TCheckBox;
    chk_SCU9: TCheckBox;
    chk_SCU10: TCheckBox;
    chk_SCU11: TCheckBox;
    chk_SCU12: TCheckBox;
    chk_SCU13: TCheckBox;
    chk_SCU14: TCheckBox;
    chk_SCU15: TCheckBox;
    btn_StateIndiReg: TRzBitBtn;
    btn_StateIndiSearch: TRzBitBtn;
    GroupBox1: TGroupBox;
    RzGroupBox5: TRzGroupBox;
    cb_stateindicate1: TRzComboBox;
    sgstateindicate1: TRzStringGrid;
    cbDevice1: TRzComboBox;
    RzGroupBox1: TRzGroupBox;
    cb_stateindicate2: TRzComboBox;
    sgstateindicate2: TRzStringGrid;
    cbDevice2: TRzComboBox;
    RzGroupBox2: TRzGroupBox;
    cb_stateindicate3: TRzComboBox;
    sgstateindicate3: TRzStringGrid;
    cbDevice3: TRzComboBox;
    btnSearch: TRzBitBtn;
    btnReg: TRzBitBtn;
    btnClose: TRzBitBtn;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ComboBox_SCU: TRzComboBox;
    Button1: TButton;
    GroupBox3: TGroupBox;
    Memo_CardNo: TMemo;
    GroupBox4: TGroupBox;
    Memo2: TMemo;
    GroupBox5: TGroupBox;
    cbAutoReg: TRzCheckBox;
    Btn_RegCardNo: TRzBitBtn;
    Btn_CheckCardNo: TRzBitBtn;
    Btn_DelCardNo: TRzBitBtn;
    Btn_DelCardNoBtn_DelAllCardNo: TRzBitBtn;
    Label2: TLabel;
    ComboBox_SCU2: TRzComboBox;
    LMDListBox1: TLMDListBox;
    procedure FormShow(Sender: TObject);
    procedure chk_SCU0Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btn_StateIndiRegClick(Sender: TObject);
    procedure btn_StateIndiSearchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sgstateindicate1SelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure cbDevice1Change(Sender: TObject);
    procedure sgstateindicate1Click(Sender: TObject);
    procedure cbDevice1Exit(Sender: TObject);
    procedure btnRegClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure Btn_RegCardNoClick(Sender: TObject);
    procedure Btn_CheckCardNoClick(Sender: TObject);
    procedure Btn_DelCardNoClick(Sender: TObject);
    procedure Btn_DelCardNoBtn_DelAllCardNoClick(Sender: TObject);
  private
    { Private declarations }
    procedure InitSG; //스트링 그리드 초기화
    procedure InitCB; //컴보박스 초기화
    function GetUsedSCU : string;  //SCU 사용 현황
    function GetStateIndicateMatching(StringGrid:TStringGrid):string;
    procedure RcvStateIndicateshow(aData:string;StringGrid:TStringGrid);
    procedure SCUDeviceShow(aData:string);
    procedure RcvStateIndicate(aData:string;aRegCode:Char);
    procedure SCUDeviceInitial;
    procedure SGColorInitial;
    function  StateIndicateGroup1Send:Boolean;
    function  StateIndicateGroup2Send:Boolean;
    function  StateIndicateGroup3Send:Boolean;
    function ChkStateIndicate(aGroup:string):Boolean;
    Procedure CardAllDownLoad(aFunc:Char);
    Procedure CD_DownLoad(aDevice: String;aCardNo:String;func:Char);
    Procedure Append_Memo_CardNo(aCardNo:String);
  public
    DeviceID : string;
    bStateIndicateRcv : Boolean;
    ECUList :TStringList;
    SCUList :TStringList;
    { Public declarations }
    //상태표시기 등록 처리
    procedure RegStateIndicateProcess(aPacketData:string);
    procedure StateIndicateAccessDataProcess(aPacketData:string);
    procedure RcvStateIndicateAccEventData(aRealData:string);
    procedure RcvStateIndicateCardRegAck(aRealData:string);
    procedure AutoCardDownLoad(bCardNo,aMode:string); //카드 자동등록모드

  end;

var
  fmStateIndicate: TfmStateIndicate;

implementation

uses
  uCommon;
{$R *.dfm}

procedure TfmStateIndicate.InitCB;
var
  i:integer;
  stDevice : string;
begin
  cbDevice1.Clear;
  cbDevice2.Clear;
  cbDevice3.Clear;
  cbDevice1.Add('      ');
  cbDevice2.Add('      ');
  cbDevice3.Add('      ');
  if ECUList.Count < 1 then
  begin
    cbDevice1.Add('00.MCU');
    cbDevice2.Add('00.MCU');
    cbDevice3.Add('00.MCU');
  end else
  begin
    for i := 0 to ECUList.Count - 1 do
    begin
      if ECUList.Strings[i] = '00' then stDevice := ECUList.Strings[i] + '.MCU'
      else stDevice := ECUList.Strings[i] + '.ECU';
      cbDevice1.Add(stDevice);
      cbDevice2.Add(stDevice);
      cbDevice3.Add(stDevice);
    end;

  end;
end;

procedure TfmStateIndicate.InitSG;
var
  i:integer;
begin

  with sgstateindicate1 do
  begin
    Cells[0, 0] := '표시기번호';
    Cells[1, 0] := '기기번호';
    for i:=1 to 16 do
    begin
      Cells[0, i] := FillZeroNumber(i,2);
    end;
  end;
  with sgstateindicate2 do
  begin
    Cells[0, 0] := '표시기번호';
    Cells[1, 0] := '기기번호';
    for i:=1 to 16 do
    begin
      Cells[0, i] := FillZeroNumber(i,2);
    end;
  end;
  with sgstateindicate3 do
  begin
    Cells[0, 0] := '표시기번호';
    Cells[1, 0] := '기기번호';
    for i:=1 to 16 do
    begin
      Cells[0, i] := FillZeroNumber(i,2);
    end;
  end;
end;

procedure TfmStateIndicate.FormShow(Sender: TObject);
begin
  SCUList := TStringList.Create;
  SCUList.Clear;
  ComboBox_SCU.Clear;
  ComboBox_SCU2.Clear;

  ComboBox_SCU.Add('00.SCU');
  ComboBox_SCU.ItemIndex := 0;
  ComboBox_SCU2.Add('00.SCU');
  //ComboBox_SCU2.Add('99.전체');
  ComboBox_SCU2.ItemIndex := 0;
  InitSG;
  InitCB;
  cbDevice1.Visible := False;
  cbDevice2.Visible := False;
  cbDevice3.Visible := False;
end;

procedure TfmStateIndicate.chk_SCU0Click(Sender: TObject);
var
  stSCU : string;
  nIndex : integer;
  nIndex2 : integer;
begin
  stSCU := (Sender as TcheckBox).Caption + '.SCU';
  nIndex := ComboBox_SCU.Items.IndexOf(stSCU);
  nIndex2 := ComboBox_SCU2.Items.IndexOf(stSCU);
  if (Sender as TcheckBox).Checked then
  begin
    if nIndex < 0 then ComboBox_SCU.Items.Add(stSCU);
    if nIndex2 < 0 then ComboBox_SCU2.Items.Add(stSCU);
  end else
  begin
    if nIndex > -1 then ComboBox_SCU.Items.Delete(nIndex);
    if nIndex2 > -1 then ComboBox_SCU2.Items.Delete(nIndex2);
  end;
  ComboBox_SCU.Sorted := True;
  ComboBox_SCU2.Sorted := True;
end;

procedure TfmStateIndicate.btnCloseClick(Sender: TObject);
begin
  Close;
end;

function TfmStateIndicate.GetUsedSCU: string;
var
  stUsed:string;
  i : integer;
  check:TCheckBox;
begin
  stUsed:='1';  //00은 항상 사용
  for i:=1 to 15 do
  begin
    check := TravelCheckBoxItem(Group_StateIndicate,'chk_SCU',i);
    if check.checked then stUsed := stUsed + '1'
    else stUsed := stUsed + '0';
  end;
  result := stUsed;
end;

procedure TfmStateIndicate.btn_StateIndiRegClick(Sender: TObject);
var
  stSendData : string;
begin
  SCUDeviceInitial;
  stSendData := ' '; //CODE
  stSendData := stSendData + ' ';  //ERROR CODE
  stSendData := stSendData + ' ';  //Position
  stSendData := stSendData + '0';  //Record1
  stSendData := stSendData + '0';  //Record2
  stSendData := stSendData + '0';  //SCU 등록 0x30
  stSendData := stSendData + GetUsedSCU ;
  MainForm.SendPacket(DeviceID + '00','I',stSendData,'AD');
end;

procedure TfmStateIndicate.btn_StateIndiSearchClick(Sender: TObject);
var
  stSendData : string;
begin
  SCUDeviceInitial;
  stSendData := ' '; //CODE
  stSendData := stSendData + ' ';  //ERROR CODE
  stSendData := stSendData + ' ';  //Position
  stSendData := stSendData + '0';  //Record1
  stSendData := stSendData + '0';  //Record2
  stSendData := stSendData + '0';  //SCU 등록 0x30
  MainForm.SendPacket(DeviceID + '00','Q',stSendData,'AD');

end;

procedure TfmStateIndicate.RegStateIndicateProcess(aPacketData: string);
var
  stDeviceCode: String;
  stSCUCode : string;
  cRegCode: char;
  stData : string;
begin
  stDeviceCode := Copy(aPacketData, 8,G_nIDLength);
  stSCUCode := Copy(aPacketData,G_nIDLength + 8,2);
  stData := copy(aPacketData,G_nIDLength + 12,length(aPacketData) - 20);
  cRegCode := stData[6];

  case cRegCode of
    '0': SCUDeviceShow(copy(stData,7,16));
    '1'..'3': RcvStateIndicate(stData,cRegCode);
    else {error 발생: [E003]정의 되지 않은 커맨드}
  end;


//
end;

procedure TfmStateIndicate.SCUDeviceShow(aData: string);
var
  i : integer;
  check:TCheckBox;
begin
  for i :=1 to 16 do
  begin
    check := TravelCheckBoxItem(Group_StateIndicate,'chk_SCU',i-1);
    if aData[I] = '1' then check.Checked := True
    else check.Checked := False;
    check.Color := clYellow;
  end;
end;

procedure TfmStateIndicate.Button1Click(Sender: TObject);
begin
showmessage(GetStateIndicateMatching(sgstateindicate1));
end;

procedure TfmStateIndicate.SCUDeviceInitial;
var
  i : integer;
  check:TCheckBox;
begin
  for i :=1 to 16 do
  begin
    check := TravelCheckBoxItem(Group_StateIndicate,'chk_SCU',i-1);
    check.Color := clBtnFace;
  end;
end;

procedure TfmStateIndicate.sgstateindicate1SelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
  stName : String;
begin
  stName := (sender as TStringGrid).Name;
  if ACol = 1 then    // 1번째열로 포커스가 이동됐을때 combobox 보여주기
  begin
    Rect := (sender as TStringGrid).CellRect(ACol, ARow);
    if stName = 'sgstateindicate1' then
    begin
      // 현재 Cell의 좌표를 Rect로 저장
      with cbDevice1 do
      begin
        ItemIndex := 0;
        Visible := true;
        Left := (sender as TStringGrid).Left + Rect.Left + 2;
        Top := (sender as TStringGrid).Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := (sender as TStringGrid).Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end else if stName = 'sgstateindicate2' then
    begin
      // 현재 Cell의 좌표를 Rect로 저장
      with cbDevice2 do
      begin
        ItemIndex := 0;
        Visible := true;
        Left := (sender as TStringGrid).Left + Rect.Left + 2;
        Top := (sender as TStringGrid).Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := (sender as TStringGrid).Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end else if stName = 'sgstateindicate3' then
    begin
      // 현재 Cell의 좌표를 Rect로 저장
      with cbDevice3 do
      begin
        ItemIndex := 0;
        Visible := true;
        Left := (sender as TStringGrid).Left + Rect.Left + 2;
        Top := (sender as TStringGrid).Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := (sender as TStringGrid).Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end;

  end;
end;

procedure TfmStateIndicate.cbDevice1Change(Sender: TObject);
var
  nIndex:integer;
  st:string;
begin
  nIndex := (Sender as TRzCombobox).tag;
  with Sender as TRzCombobox do
  begin
    //hide;
    if ItemIndex >= 0 then
    begin
      if nIndex = 1 then
      begin
        with sgstateindicate1 do
        begin
          st := Items[ItemIndex];
          Cells[Col, row] := st;
        end;
      end else if nIndex = 2 then
      begin
        with sgstateindicate2 do
        begin
          st := Items[ItemIndex];
          Cells[Col, row] := st;
        end;
      end else if nIndex = 3 then
      begin
        with sgstateindicate3 do
        begin
          st := Items[ItemIndex];
          Cells[Col, row] := st;
        end;
      end;

    end;
  end;

end;

procedure TfmStateIndicate.sgstateindicate1Click(Sender: TObject);
var
  bResult:Boolean;
begin
  sgstateindicate1SelectCell(Sender,
  (sender as TStringGrid).Col, (sender as TStringGrid).Row,bResult);

end;

procedure TfmStateIndicate.cbDevice1Exit(Sender: TObject);
begin
  (Sender as TRzComboBox).Hide;
end;

function TfmStateIndicate.GetStateIndicateMatching(
  StringGrid: TStringGrid): string;
var
  stData:string;
  nRow : integer;
  i : integer;
begin
  stData := '';
  nRow := StringGrid.RowCount;
  for i := 1 to nRow - 1 do
  begin
    with StringGrid do
    begin
      if Cells[1,i] <> '' then stData := stData + Copy(Cells[1,i],1,2)
      else stData := stData + '  ';
    end;
  end;
  result := stData;
end;

procedure TfmStateIndicate.btnRegClick(Sender: TObject);
var
  nLoop : integer;
  bResult : Boolean;
begin

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := StateIndicateGroup1Send;
    if bResult then break;
  end;
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := StateIndicateGroup2Send;
    if bResult then break;
  end;
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := StateIndicateGroup3Send;
    if bResult then break;
  end;

  SGColorInitial;

end;

procedure TfmStateIndicate.SGColorInitial;
var
  i:integer;
begin
  for i := 1 to 16 do
  begin
    with sgstateindicate1 do
    begin
      Color := clWindow;
      Cells[1,i]:='';
    end;
    with sgstateindicate2 do
    begin
      Color := clWindow;
      Cells[1,i]:='';
    end;
    with sgstateindicate3 do
    begin
      Color := clWindow;
      Cells[1,i]:='';
    end;
  end;

end;

function TfmStateIndicate.StateIndicateGroup1Send: Boolean;
var
  stSendData : string;
  PastTime : dword;
begin
  Result := False;
  stSendData := ' '; //CODE
  stSendData := stSendData + ' ';  //ERROR CODE
  stSendData := stSendData + ' ';  //Position
  stSendData := stSendData + '0';  //Record1
  stSendData := stSendData + '1';  //Record2
//  stSendData := stSendData + '1';  //0x31 Group 1 등록
  stSendData := stSendData + copy(cb_stateindicate1.Text,1,1);
  stSendData := stSendData + GetStateIndicateMatching(sgstateindicate1) ;
  bStateIndicateRcv := False;
  MainForm.SendPacket(DeviceID + copy(ComboBox_SCU.text,1,2),'I',stSendData,'AD');

  PastTime := GetTickCount + DelayTime;
  while Not bStateIndicateRcv do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //300밀리동안 응답 없으면 실패로 처리함
  end;
  Result := True;

end;

function TfmStateIndicate.StateIndicateGroup2Send: Boolean;
var
  stSendData : string;
  PastTime : dword;
begin
  Result := False;
  stSendData := ' '; //CODE
  stSendData := stSendData + ' ';  //ERROR CODE
  stSendData := stSendData + ' ';  //Position
  stSendData := stSendData + '0';  //Record1
  stSendData := stSendData + '2';  //Record2
//  stSendData := stSendData + '2';  //0x32 Group 2 등록
  stSendData := stSendData + copy(cb_stateindicate2.Text,1,1);
  stSendData := stSendData + GetStateIndicateMatching(sgstateindicate2) ;
  bStateIndicateRcv := False;
  MainForm.SendPacket(DeviceID + copy(ComboBox_SCU.text,1,2),'I',stSendData,'AD');

  PastTime := GetTickCount + DelayTime;
  while Not bStateIndicateRcv do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //300밀리동안 응답 없으면 실패로 처리함
  end;
  Result := True;

end;

function TfmStateIndicate.StateIndicateGroup3Send: Boolean;
var
  stSendData : string;
  PastTime : dword;
begin
  Result := False;
  stSendData := ' '; //CODE
  stSendData := stSendData + ' ';  //ERROR CODE
  stSendData := stSendData + ' ';  //Position
  stSendData := stSendData + '0';  //Record1
  stSendData := stSendData + '3';  //Record2
//  stSendData := stSendData + '3';  //0x33 Group 3 등록
  stSendData := stSendData + copy(cb_stateindicate3.Text,1,1);
  stSendData := stSendData + GetStateIndicateMatching(sgstateindicate3) ;
  bStateIndicateRcv := False;
  MainForm.SendPacket(DeviceID + copy(ComboBox_SCU.text,1,2),'I',stSendData,'AD');

  PastTime := GetTickCount + DelayTime;
  while Not bStateIndicateRcv do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //300밀리동안 응답 없으면 실패로 처리함
  end;
  Result := True;

end;

procedure TfmStateIndicate.RcvStateIndicate(aData: string; aRegCode: Char);
begin
  bStateIndicateRcv := True;
  //aRegCode 1:1번 그룹 2: 2번 그룹 3:3번 그룹 
  case aRegCode of
    '1':{Group1}
      begin
        cb_stateindicate1.ItemIndex := strtoint(copy(aData,7,1));
        RcvStateIndicateshow(copy(aData,8,length(aData)-7),sgstateindicate1);
      end;
    '2':{Group2}
      begin
        cb_stateindicate2.ItemIndex := strtoint(copy(aData,7,1));
        RcvStateIndicateshow(copy(aData,8,length(aData)-7),sgstateindicate2);
      end;
    '3':{Group3}
      begin
        cb_stateindicate3.ItemIndex := strtoint(copy(aData,7,1));
        RcvStateIndicateshow(copy(aData,8,length(aData)-7),sgstateindicate3);
      end;
  end;
end;

procedure TfmStateIndicate.RcvStateIndicateshow(aData:string;
  StringGrid: TStringGrid);
var
  i,nPoint :integer;
  stState : string;
begin
  with StringGrid do
  begin
    for i:= 0 to 15 do
    begin
      nPoint := (i * 2) + 1;
      stState := copy(aData,nPoint,2);
      if stState <> '  ' then stState := stState + '.SCU';
      Cells[1,i + 1] := stState;
    end;
    Color := clYellow;
  end;
end;

procedure TfmStateIndicate.btnSearchClick(Sender: TObject);
var
  nLoop : integer;
  bResult : Boolean;
begin
  SGColorInitial;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := ChkStateIndicate('1');
    if bResult then break;
  end;
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := ChkStateIndicate('2');
    if bResult then break;
  end;
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := ChkStateIndicate('3');
    if bResult then break;
  end;

end;

function TfmStateIndicate.ChkStateIndicate(aGroup:string): Boolean;
var
  stSendData : string;
  PastTime : dword;
begin
  Result := False;
  stSendData := ' '; //CODE
  stSendData := stSendData + ' ';  //ERROR CODE
  stSendData := stSendData + ' ';  //Position
  stSendData := stSendData + '0';  //Record1
  stSendData := stSendData + aGroup;  //Record2
//  stSendData := stSendData + aGroup;  //0x33 Group 3 등록
  bStateIndicateRcv := False;
  MainForm.SendPacket(DeviceID + copy(ComboBox_SCU.text,1,2),'Q',stSendData,'AD');

  PastTime := GetTickCount + DelayTime;
  while Not bStateIndicateRcv do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //300밀리동안 응답 없으면 실패로 처리함
  end;
  Result := True;
end;

procedure TfmStateIndicate.StateIndicateAccessDataProcess(aPacketData: string);
var
  stDeviceCode: String;
  stSCUCode : string;
  stData : string;
  stVer : string;
  msgCode: Char;
  st : string;
begin
  stDeviceCode := Copy(aPacketData, 8,G_nIDLength);
  stSCUCode := Copy(aPacketData,G_nIDLength + 8,2);
  stData := copy(aPacketData,G_nIDLength + 12,length(aPacketData) - (G_nIDLength + 13));
  msgCode:= stData[1];
  stVer := copy(aPacketData,6,2);

  {ACK 응답:출입과 DOOR}
  if (msgCode <> 'a') and (msgCode <> 'b') and (msgCode <> 'c') and
     (msgCode <> 'l') and (msgCode <> 'm') and (msgCode <> 'n')
  then
  begin
    st:='Y' + Copy(aPacketData,(G_nIDLength + 13),2)+'  '+'a';
    //st:='Y' + '01'+'  '+'a';
    MainForm.ACC_sendData(stDeviceCode + stSCUCode , st,stVer);
  end;

  {출입통제 데이터 처리}
//0460K1100000400c2a51  005000000010000000009E
  case msgcode of
//    'F': RcvTelEventData(accData);
    'E': RcvStateIndicateAccEventData(stData);
//    'X': RcvAccXEventData(accData);
//    'D': RcvDoorEventData(accData);
//    'a': RcvSysinfo2(accData);        //기기 등록 응답
//    'b': RcvSysinfo2(accData);        //기기 조회 응답
//    'c': RcvAccControl(accData);      //기기 제어 응답
'l','n','m': RcvStateIndicateCardRegAck(stData);  //카드등록응답
//'s','p': RcvSch(accData);             // 스케줄 응답
//    'v': RcvFoodTime(accData);        //식사시간응답
  end;
end;

procedure TfmStateIndicate.RcvStateIndicateAccEventData(aRealData: string);
var
  st: String;
  aCardNo: String;
  bCardNo: String;
  NoStr: String;
  i : Integer;
begin

  st := GetAccEventString(aRealData);

  aCardNo:= copy(aRealData,26,8);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)

  bCardNo:= DecodeCardNo(aCardNo);
  st:= st+ bCardNo;//+ '000000';
  //st:= st + DecodeCardNo(aCardNo);
  NoStr:= InttoStr(CountCardReadData);
  st:= NoStr + ' ;'+st;
  st := st + ' ;' + Dec2Hex64(StrtoInt64(bCardNo),8);

  LMDListBox1.Items.Add(st);
  //LMDListBox1.Selected[LMDListBox1.ItemIndex]:= True;
  for i := 0 to LMDListBox1.Count-1 do
  begin
     if LMDListBox1.Selected[i] then LMDListBox1.Selected[i]:= False;
  end;
  LMDListBox1.Selected[LMDListBox1.Count-1]:= True;


  Inc(CountCardReadData);
  LMDListBox1.ItemIndex:= LMDListBox1.Items.Count -1;
   // 자동 등록 모드이면...
  if cbAutoReg.Checked = True then AutoCardDownLoad(bCardNo,'E');

end;

procedure TfmStateIndicate.RcvStateIndicateCardRegAck(aRealData: string);
var
  aMsg: String;
  aCardNo: string;
  LinkusNo: String;
begin

  //if Copy(aData,7,10) <> '0000000000' then Exit;

  case aRealData[1] of
    'l':aMsg:='[등록]';
    'm':aMsg:='[조회]';
    'n':aMsg:='[삭제]';
  end;
  aCardNo:= Copy(aRealData,9,8);

  aMsg:= aMsg + DeCodeCardNo(aCardNo)+ ':';
  aMsg:= aMsg + Copy(aRealData,17,6)+':';

  LinkusNo:= Copy(aRealData,4,3);
  aMsg:= aMsg + Hex2DecStr(LinkusNo)+':';

  case aRealData[23] of
    '0': aMsg:= aMsg +'0'+':';
    '1': aMsg:= aMsg +'미등록'+':';
    '2': aMsg:= aMsg +'  등록'+':';
  end;

  case aRealData[24] of
    '0': aMsg:= aMsg +'출입';
    '1': aMsg:= aMsg +'방범';
    '2': aMsg:= aMsg +'출입방범';
  end;

  Memo2.Lines.Add(aMsg);

end;

procedure TfmStateIndicate.Btn_RegCardNoClick(Sender: TObject);
var
  I: Integer;
begin
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('등록할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;
  Memo2.Clear;
  CardAllDownLoad('L');

end;

procedure TfmStateIndicate.CardAllDownLoad(aFunc: Char);
var
  I,j: Integer;
  aCardNo: String;
begin
  // aFunc:L등록,N삭제,M조회
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('등록할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;


  for I:= 0 to Memo_CardNo.Lines.Count -1 do
  begin
    
    aCardNo:= Memo_CardNo.Lines[I];

    CD_DownLoad(DeviceID + copy(ComboBox_SCU2.Text,1,2),aCardNo,aFunc);
    Sleep(100);
    Application.ProcessMessages;
  end;

end;

procedure TfmStateIndicate.CD_DownLoad(aDevice, aCardNo: String;
  func: Char);
var
  aData: String;
  I: Integer;
  xCardNo: String;
  RealCardNo: String;
  ValidDay: String;
  aLength: Integer;
  stYY,stMM,stDD:String;
  aRegCode,aCardAuth,aInOutMode : String;
begin

  aLength:= Length(aCardNo);
  if aLength < 10 then
    aCardNo:= FillZeroStrNum(aCardNo,10);

  if aLength < 16 then
  begin
    for I := 1  to 16 - aLength do
    begin
      aCardNo:= aCardNo + '0';
    end;
  end;


  RealCardNo:= Copy(aCardNo,1,10);
  ValidDay:=   Copy(aCardNo,11,6);
  //xCardNo:=  '00'+Dec2Hex64(StrtoInt64(RealCardNo),8);
  xCardNo:=  '00'+EncodeCardNo(RealCardNo);

  stYY := '0';
  stMM := '0';
  stDD := '0';

  aRegCode := '0';
  aCardAuth := '0';
  aInOutMode := '0';

  aData:= '';
  aData:= func +
          //InttoStr(Send_MsgNo)+     // Message Count
          '0'+
          aRegCode+                      //등록코드(0:1,2   1:1번문,  2:2번문, 3:방범전용)
          '  '+                     //RecordCount #$20 #$20
          '0'+                      //예비
          xCardNo+                  //카드번호
//          ValidDay+                 //유효기간
          FillZeroNumber(strtoint(stYY),2) +
          FillZeroNumber(strtoint(stMM),2) +
          FillZeroNumber(strtoint(stDD),2) + //유효기간
          '0'+                      //등록 결과
          aCardAuth+                      //카드권한(0:출입전용,1:방범전용,2:방범+출입)
          aInOutMode;                      //타입패턴

  MainForm.SendPacket(aDevice,'c',aData,'AD');
end;

procedure TfmStateIndicate.Btn_CheckCardNoClick(Sender: TObject);
var
  I: Integer;
begin
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('조회할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;
  Memo2.Clear;
  CardAllDownLoad('M');

end;

procedure TfmStateIndicate.Btn_DelCardNoClick(Sender: TObject);
var
  I: Integer;
begin
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('삭제할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;
  Memo2.Clear;
  CardAllDownLoad('N');
end;

procedure TfmStateIndicate.Btn_DelCardNoBtn_DelAllCardNoClick(
  Sender: TObject);
begin
  CD_DownLoad(DeviceID + copy(ComboBox_SCU2.Text,1,2),'0000000000','O');

end;

procedure TfmStateIndicate.AutoCardDownLoad(bCardNo, aMode: string);
var
  stDeviceID : string;
begin
    stDeviceID:= DeviceID + copy(ComboBox_SCU2.Text,1,2);
    //메모장에 등록
    Append_Memo_CardNo(bCardNo);
    // 다운로드
    CD_DownLoad(stDeviceID,bCardNo+'000000' ,'L');

end;

procedure TfmStateIndicate.Append_Memo_CardNo(aCardNo: String);
begin
  if Memo_CardNo.Lines.Indexof(aCardNo) < 0 then
  begin
    Memo_CardNo.Lines.Add(aCardNo);
  end;

end;

end.

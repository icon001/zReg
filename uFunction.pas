unit uFunction;

interface
uses
uLomosUtil,
SysUtils,
stdCtrls,
RzButton,
Gauges,
Forms,
RzEdit,
ExtCtrls,
RzBtnEdt;

var
  G_bSendStop : Boolean = False;  //전송 중지

//출입문 Event 의 string
Function GetAccEventString(aData:string):string;
//Hex Code로 표시
Function ConvertToHex(aData:string):string;
//전송 포맷을 보여주기 위해 Hex 형태 변경
Function BroadToHex(aMsgData:String):String;
Function SendStop():Boolean;
Function StringXOR(Src:String;Org:String):Boolean;
Function StrToHex(const S: string): string;
Function StringAND(Src:String;Org:String;len:integer):String;

//Edit 찾는 함수
Function TravelEditItem(GroupBox:TGroupBox;stName:string; no:Integer):TEdit;
Function TravelRzEditItem(GroupBox:TGroupBox;stName:string; no:Integer):TRzEdit;
//RzBitBtn 찾는 함수
Function TravelRzBitBtnItem(GroupBox:TGroupBox;stName:string; no:Integer):TRzBitBtn;
//CheckBox 찾는 함수
Function TravelCheckBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TCheckBox;
//ComboBox 찾는 함수
Function TravelComboBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TComboBox;
//Panel에서 콤보박스 찾는 함수
Function TravelComboBoxItemFromPanel(Panelname:TPanel;stName:string; no:Integer):TComboBox;
//Label 찾는 함수
Function TravelLabelItem(GroupBox:TGroupBox;stName:string; no:string):TLabel;
//Gauge 찾는 함수
Function TravelGaugeItem(GroupBox:TGroupBox;stName:string; no:string):TGauge;
//TRzButtonEdit 찾는 함수
Function TraveTRzButtonEditItem(GroupBox:TGroupBox;stName:string; no:string):TRzButtonEdit;
//TStaticText 찾는 함수
Function TravelTStaticTextItem(GroupBox:TGroupBox;stName:string; no:Integer):TStaticText;


Function GetDay(aMin:integer):integer;
Function GetHour(aMin:integer):integer;


implementation


//출입문 Event 의 string
Function GetAccEventString(aData:string):string;
var
  st: String;
begin
  {1.시간}
  st:= Copy(aData,6,2)+'-'+
       Copy(aData,8,2)+'-'+
       Copy(aData,10,2)+' '+
       Copy(aData,12,2)+':'+
       Copy(aData,14,2)+':'+
       Copy(aData,16,2)+';';

  {2.버튼}
  st:= st + aData[23] +';'; //버튼 추가
  {3.문번호}
  st:= st + aData[3]+';';
  {4.문위치}
  if aData[5] = '0' then
    st:= st + '내부' +';'
  else st:= st + '외부' +';'; //버튼 추가

  {5.Posi/Nega}
  case aData[18] of
    '0': st:=st + 'Positive;';
    '1': st:= st + 'Negative;';
    '2': st:=st + 'Positive-ACK;';
    '3': st:= st + 'Negative-ACK;';
    '4': st:= st + 'Positive-NAK;';
    else   st:= st+ aData[18] + ';';
  end;
  {6.운영모드}
  case aData[19] of
    '0': st:= st+'운영모드;';
    '1': st:= st+'개방모드;';
    '2': st:= st+'폐쇄모드;';
    '3': st:= st+'마스터모드;';
    else   st:= st+aData[19]+ ';';
  end;
  {7.변경사유}
  case aData[20] of
    'C': st:= st + '카드;';
    'P': st:= st + '전화;';
    'R': st:= st + '원격제어;';
    'B': st:= st + '버튼;';
    'S': st:= st + '스케쥴;';
    else st:= st + aData[20];
  end;
  {8.출입승인결과}
  st := st + '(' + aData[21] + ')';
  case aData[21]of
    #$30: st:= st + '해당사항없음;';
    #$31: st:= st + '출입승인;';
    #$32: st:= st + '방범카드조작;'; //방범카드조작(*)
    #$33: st:= st + '경계조작;'; //방범카드조작(*)
    #$34: st:= st + '해제조작;'; //방범카드조작(*)
    #$41: st:= st + '미등록카드;';
    #$42: st:= st + '출입불가;';
    #$43: st:= st + '방범카드불가;'; //미등록카드(*)
    #$44: st:= st + '경계모드출입불가;';
    #$45: st:= st + '출입제한시간;';
    #$46: st:= st + '유효기간만료;';
    'G' : st:= st + '근태;';
    'H' : st:= st + '폐쇄모드출입불가;';
    'I' : st:= st + '구역 다름;';
    'J' : st:= st + '안티패스백;';
    'K' : st:= st + 'DS열림출입불가;';
    'L' : st:= st + '마스터모드출입불가;';
    else st:= st +';';        //aData[21]
  end;
  {9.출입문 상태}
  case aData[22]of
    'C': st:= st +'닫힘;';
    'O': st:= st +'열림;';
    else st:= st +aData[22];
  end;

  Result := st;

end;
//Hex Code로 표시
Function ConvertToHex(aData:string):string;
var
  nLength : integer;
  stData : string;
  stHex :string;
  i : integer;
begin
  nLength := Length(aData);
  stData := '';
  for i:=1 to nLength do
  begin
    stHex := Dec2Hex(Ord(aData[i]),2);
    if ( stHex <= '1F') OR ( stHex >= '7F') then
      stData := stData + '[' + stHex + ']'
    else stData := stData + aData[i];
  end;
  result := stData;
end;

//브로드 파일중 확장기 부분 Hex값 표시 안되는 부분때문에 강제로 Hex표시 함
function BroadToHex(aMsgData: String): String;
var
  StTemp : String;
  Loop : Integer;
  nASC : Integer;
begin
  StTemp := copy(aMsgData,1,11);
  for Loop := 1 to 9 do
  begin
     nASC := 0;
     nASC := byte(aMsgData[Loop + 11]);
     StTemp := StTemp + '[' + IntToHex(nASC,2) + ']';
  end;

  StTemp := StTemp + copy(aMsgData,21,Length(aMsgData) - 20);
  Result := stTemp;
end;

Function SendStop():Boolean;
begin
  while G_bSendStop do
  begin
    sleep(1);
    Application.ProcessMessages;
  end;
end;

Function StringXOR(Src:String;Org:String):Boolean;
var
  bSrc : Byte;
  bOrg : Byte;
  stSrc,stOrg : String;
  Loop : integer;
  Temp : Byte;
  len : integer;
begin

  Result:= False;
  len := length(src);
  for Loop:=1 to len do
  begin
    bSrc := Byte( Src[Loop] );
    bOrg := Byte( Org[Loop] );
    Temp := bSrc Xor bOrg;
    if Temp = $00 then continue  //0x00 이면 같으므로 계속 비교
    else exit;
  end;

  Result:= True;
end;

Function StrToHex(const S: string): string;
var
 Index: Integer;
 bSrc : Byte;
begin
 Result := '';
 for Index := 1 to Length(S) do
 begin
   bSrc := Byte( S[Index] );
   if bSrc = $20 then bSrc := $00;
   Result := Result + IntToHex( bSrc, 2 );
 end;
end;

Function StringAND(Src:String;Org:String;len:integer):String;
var
  bSrc : Byte;
  bOrg : Byte;
  stSrc,stOrg : String;
  Loop : integer;
  Temp : Byte;
begin

  Result:= '';
//  Src := stringreplace(src,' ',inttostring($00));

  for Loop:=1 to len do
  begin
    bSrc := Byte( Src[Loop] );
    if bSrc = $20 then bSrc := $00;
    bOrg := Byte( Org[Loop] );
    Temp := bSrc And bOrg;
    Result:= Result + IntToHex( Temp, 2 );
  end;
end;

Function TravelEditItem(GroupBox:TGroupBox;stName:string; no:Integer):TEdit;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TEdit(GroupBox.Controls[Loop]);
      exit;
    End;
  End;

end;

Function TravelRzEditItem(GroupBox:TGroupBox;stName:string; no:Integer):TRzEdit;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TRzEdit(GroupBox.Controls[Loop]);
      exit;
    End;
  End;

end;

Function TravelRzBitBtnItem(GroupBox:TGroupBox;stName:string; no:Integer):TRzBitBtn;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TRzBitBtn(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;
//CheckBox 찾는 함수
Function TravelCheckBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TCheckBox;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TCheckBox(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;
//ComboBox 찾는 함수
Function TravelComboBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TComboBox;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TComboBox(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

Function TravelComboBoxItemFromPanel(Panelname:TPanel;stName:string; no:Integer):TComboBox;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to Panelname.ControlCount-1 do
  Begin
    If LowerCase(Panelname.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TComboBox(Panelname.Controls[Loop]);
      exit;
    End;
  End;
end;
//Label 찾는 함수
Function TravelLabelItem(GroupBox:TGroupBox;stName:string; no:string):TLabel;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + no then
    Begin
      Result:=TLabel(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

//Gauge 찾는 함수
Function TravelGaugeItem(GroupBox:TGroupBox;stName:string; no:string):TGauge;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + no then
    Begin
      Result:=TGauge(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

Function TraveTRzButtonEditItem(GroupBox:TGroupBox;stName:string; no:string):TRzButtonEdit;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + no then
    Begin
      Result:=TRzButtonEdit(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

Function TravelTStaticTextItem(GroupBox:TGroupBox;stName:string; no:Integer):TStaticText;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TStaticText(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

Function GetDay(aMin:integer):integer;
begin
  Result := aMin Div ( 60 * 24 );
end;

Function GetHour(aMin:integer):integer;
var
  nHour:integer;
begin
  nHour := aMin Div 60;
  Result := nHour mod 24;
end;
end.




(*

Procedure BroadDownLoadRom(aDeviceID:String;aFileName: String);
Procedure BroadSendRomData(aDeviceID:String; adata: String);
Procedure BroadFirmwareProcess(aData: String);
Procedure CreateLogDB;
Procedure DoorModeChange(DeviceID: String;  aMode:Char);
Procedure Cnt_Lamp(aDeviceID: String; aOn:Boolean);
Procedure Cnt_Siren(aDeviceID: String; aOn:Boolean);
procedure CheckLocate(aDeviceID: String);
procedure RegLocate(aDeviceID: String;aLocate:String);
function  RecevieDataProcess(aData:String; var bData:String):Boolean;

procedure TMainForm.BroadDownLoadRom(aDeviceID:String;aFileName: String);
var
  I: Integer;
  st: string;
begin
  DownLoadList.Clear;
  DownLoadList.LoadFromFile(aFileName);
  st:= DownLoadList[0];
  BroadSendRomData(aDeviceID,st);

  OffCount:= 0;
  DownLoadCount:= 0;
  ProgressBar1.Position:= 0;
  ProgressBar1.Max:= DownLoadList.Count;
  Label1.Caption:= InttoStr(ProgressBar1.Position)+'/'+ InttoStr(ProgressBar1.Max);
end;

procedure TMainForm.BroadSendRomData(aDeviceID:String; adata: String);
var
  st: string;
  stData: String;
begin

  if BroadID = '03' then
  begin
    st:= 'FP00'+aData;
    Write_ListBox_DownLoadInfo('RomData 전송');
  end
  else if BroadID = '04' then
  begin
    st:= 'FD00'+aData;
  end;

  if rdMode.ItemIndex = 3 then stData := 'BI' + '02' + FillZeroNumber(1,7)
  else if rdMode.ItemIndex = 2 then  stData := 'BS' + '02' + FillZeroNumber(1,7);

  st:= 'BD' + BroadID + FillZeroNumber(1,7) + BroadControlerNum + st;

  BroadOrgDataList.Clear;
  BroadOrgDataList.Add(st);
  BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

  SendPacket(aDeviceID,'*',st);

end;


procedure TMainForm.BroadFirmwareProcess(aData: String);
var
  aRegCode: String;
begin

  aRegCode:= Copy(aData,19,2);
  //FI:Flash Memory Map
  //FP:Flash Writer File Name
  //FD:Flash Data File Name
  //FX:Flash Start Command

  if aRegCode = 'FI' then
  begin
    IsDownLoad:= True;
    //if cb_Download.Checked = False then  ReceiveFI(aData)
    if rdMode.ItemIndex = 1 then ReceiveFI(aData)
    else Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 응답');
  end else if aRegCode = 'FP' then
  begin
    //if cb_Download.Checked = False then ReceiveFPFD(aData)
    if rdMode.ItemIndex = 0 then ReceiveFPFD(aData)
    else Write_ListBox_DownLoadInfo('flash write program 응답');
  end else if aRegCode = 'FD' then
  begin
    //if cb_Download.Checked = False then ReceiveFPFD(aData)
    if rdMode.ItemIndex = 1 then ReceiveFPFD(aData)
    else Write_ListBox_DownLoadInfo('flash Data program 응답');
  end else if aRegCode = 'FX' then
  begin
    //if cb_Download.Checked = False then ReceiveFX(aData)
    if rdMode.ItemIndex = 0 then ReceiveFX(aData)
    else Write_ListBox_DownLoadInfo('flash exec data 요청 응답');
  end else  if aRegCode = 'FU' then
  begin

  end else
  begin

  end;
end;

{LOG 데이터용 메모리 DB생성}
procedure TMainForm.CreateLogDB;
begin
  with DBISAMTable1.FieldDefs do
  begin
     Clear;
     Add('SeqNo',ftInteger,0,True);
     Add('EventTime',ftDatetime,0,False);
     Add('IP',ftString,20,False);
     Add('DeviceID',ftString,10,False);
     Add('DEviceNo',ftString,2,False);
     Add('Cmmd',ftString,3,False);
     Add('Data',ftString,200,False);
     Add('FullData',ftString,200,False);
  end;
  with DBISAMTable1.IndexDefs do
  begin
     Clear;
     Add('','SeqNo',[ixPrimary]);
     Add('ByCompany','Company',[ixCaseInsensitive],'',icDuplicateByte);
  end;
  if not DBISAMTable1.Exists then DBISAMTable1.CreateTable;
end;
Procedure TMainForm.DoorModeChange(DeviceID: String;  aMode:Char);
var
  st: string;
begin

  st:= #$32 +
       //IntToStr(Send_MsgNo)+                      //Msg Count
       '0'+
       InttoStr(gbDoorNo2.ItemIndex +1)+
       //ComboBox_DoorNo3.Text[1]+
       '  '+
       aMode; //'0':운영 ,'1':개방

  ACC_sendData(DeviceID, st);
end;


procedure TMainForm.Cnt_Lamp(aDeviceID: String; aOn: Boolean);
begin
  if aOn then SendPacket(aDeviceID,'R','RY00'+'LP1')
  else        SendPacket(aDeviceID,'R','RY00'+'LP0')
end;

procedure TMainForm.Cnt_Siren(aDeviceID: String; aOn: Boolean);
begin
  if aOn then SendPacket(aDeviceID,'R','RY00'+'SI1')
  else        SendPacket(aDeviceID,'R','RY00'+'SI0');

end;


procedure TMainForm.CheckLocate(aDeviceID: String);
begin
  Edit_Locate.Color:= clWhite;
  Edit_Locate.Text:= '';
  SendPacket(aDeviceID,'Q','IF00');
end;

procedure TMainForm.RegLocate(aDeviceID: String;aLocate:String);
var
  aNo: String[2];
begin

  aLocate:= Setlength(aLocate,16);
  aNo:= Copy(aDeviceID,8,2);
  if   Length(aDeviceID) = 9 then
  begin
    SendPacket(aDeviceID,'I','IF'+aNo+aLocate);
  end else
  begin
    SHowMessage('장비ID를  확인하세요');
  end;
end;



function TMainForm.RecevieDataProcess(aData:String; var bData :String):Boolean;
var
//  st: string;
  aIndex: Integer;
  Lenstr: String;
  RealDataLength: Integer;
  StrBuff: String;
begin

  Result:= False;

  Lenstr:= Copy(aData,2,3);
  if not isDigit(Lenstr) then
  begin
    Delete(aData,1,1);
    aIndex:= Pos(STX,aData);
    if aIndex = 0 then
    begin
      aIndex:= Length(aData);
      StrBuff:= Copy(aData,1,aIndex);
    end else
    begin
      StrBuff:= Copy(aData,1,aIndex-1);
    end;


    Delete(aData, 1, Length(StrBuff));
    bData:= aData;
    Exit;
  end;

  RealDataLength:= StrtoInt(Lenstr);

  if aData[RealDataLength] = ETX then
  begin
    RealDataLength:= StrtoInt(LenStr);
    StrBuff:= Copy(aData,1,RealDataLength);
    Result:= True;
    bData:=StrBuff;
    Delete(aData, 1, RealDataLength);
  end else
  begin
    if Length(aData) < RealDataLength then
    begin
      bData:= aData;
      Exit;
    end;
    Delete(aData,1,1);
    aIndex:= Pos(STX,aData);
    StrBuff:= Copy(aData,1,aIndex-1);
    //ReceviePackettoListView(ListView_Comm,2,ClientThread.Socket.PeerIPAddress,'[E0002]'+STX+StrBuff);
    //Codesite.SendError('DATA ERROR:'+STX+StrBuff);
    Delete(aData, 1, aIndex-1);
    bData:= aData;
  end;
end;
*)


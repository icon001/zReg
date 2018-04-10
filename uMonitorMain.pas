unit uMonitorMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,LBSDisplayCtrl, ImgList, ComCtrls, ToolWin, Menus, ActnList;

type
  TfmMonitorMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    ToolBar1: TToolBar;
    btnCurrentState: TToolButton;
    Menu_ImageList: TImageList;
    N2: TMenuItem;
    ActionList1: TActionList;
    Action_MonitorSetting: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Action_MonitorSettingExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    LBSDisplayCtrl: TLBSDisplayCtrl;
    Monitor_Width : Integer;
    Monitor_Height : Integer;
    MonitorList : TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMonitorMain: TfmMonitorMain;

implementation

{$R *.dfm}

procedure TfmMonitorMain.FormCreate(Sender: TObject);
begin
  MonitorList := TStringList.Create;
  LBSDisplayCtrl := TLBSDisplayCtrl.Create();
  LBSDisplayCtrl.InitScreenInfo;
  with LBSDisplayCtrl.NowDisplayItem do
  begin
    Monitor_Width := LSI_Width;
    Monitor_Height := LSI_Height;
  end;
end;

procedure TfmMonitorMain.FormActivate(Sender: TObject);
begin
  with fmMonitorMain do
  begin
    Top := 1;
    Left := 1;
    Width := Monitor_Width - Left;
  end;

end;

procedure TfmMonitorMain.N2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmMonitorMain.Action_MonitorSettingExecute(Sender: TObject);
begin
  //MonitorFormClear;
  //
end;

procedure TfmMonitorMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MonitorList.Free;
end;

end.

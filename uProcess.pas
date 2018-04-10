unit uProcess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, ExtCtrls;

type
  TfmPrograss = class(TForm)
    WaitTimer: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
    SpeedButton1: TSpeedButton;
    PrograssTimer1: TTimer;
    procedure WaitTimerTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure PrograssTimer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    L_bSetting : Boolean;
    { Public declarations }
    procedure DataReceive;
    procedure CloseEvent;
  end;

var
  fmPrograss: TfmPrograss;
  nProcess : integer;


implementation
uses uMain;
{$R *.dfm}

procedure TfmPrograss.WaitTimerTimer(Sender: TObject);
begin
  if MainForm.bWizeNetLanRecv then  Close
  else Panel1.Caption := 'Failed...';
end;

procedure TfmPrograss.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmPrograss.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrograssTimer1.Enabled := False;
  MainForm.IdUDPServer1.Active := false;
  MainForm.IdUDPServer2.Active := false;
end;

procedure TfmPrograss.FormActivate(Sender: TObject);
begin
  nProcess := 1;
end;

procedure TfmPrograss.PrograssTimer1Timer(Sender: TObject);
begin
  if L_bSetting then
  begin
    if MainForm.bWizeNetLanRecv then
    begin
      Close;
      Exit;
    end;
  end;
  ProgressBar1.Max := WaitTimer.Interval div 1000;
  ProgressBar1.Position := nProcess;
  inc(nProcess);
end;

procedure TfmPrograss.DataReceive;
begin
  Close;
end;

procedure TfmPrograss.FormCreate(Sender: TObject);
begin
  L_bSetting := False;
end;

procedure TfmPrograss.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Close;
  end;

end;

procedure TfmPrograss.CloseEvent;
begin
  Close;
end;

end.

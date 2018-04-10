unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, LMDCustomComponent, LMDIniCtrl;

type
  TfmLogin = class(TForm)
    Label1: TLabel;
    ed_OrgPw: TEdit;
    Bevel1: TBevel;
    sbLogin: TSpeedButton;
    sbCancel: TSpeedButton;
    LMDIniCtrl1: TLMDIniCtrl;
    procedure sbCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbLoginClick(Sender: TObject);
    procedure ed_OrgPwKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    bLogined:Boolean;
    OrgPW:string;
    nErrCount : integer;
  end;

var
  fmLogin: TfmLogin;

implementation

{$R *.dfm}

procedure TfmLogin.sbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLogin.FormCreate(Sender: TObject);
begin
  bLogined := False;
  nErrCount := 0;
end;

procedure TfmLogin.sbLoginClick(Sender: TObject);
begin
  if ed_OrgPw.Text = OrgPW then
  begin
    bLogined := True;
    with LMDIniCtrl1 do
    begin
      WriteString('Config','PasswdErr','TRUE');
    end;
    Close;
    Exit;
  end;
  inc(nErrCount);
  if nErrCount > 3 then
  begin
    showmessage('비밀번호를 3회 이상 틀려 프로그램을 종료 합니다.');
    with LMDIniCtrl1 do
    begin
      WriteString('Config','PasswdErr','FALSE');
    end;
    Close;
    Exit;
  end;
  showmessage('비밀번호가 틀렸습니다');
  ed_OrgPw.SetFocus;
end;

procedure TfmLogin.ed_OrgPwKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
      sbLogin.Click;
    end;
end;

end.

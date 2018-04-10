unit uDeviceRegMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TfmDeviceRegMessage = class(TForm)
    btn_DisAlarmSet: TSpeedButton;
    btn_Set: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StaticText1: TStaticText;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SetClick(Sender: TObject);
    procedure btn_DisAlarmSetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    L_bResult : LongInt;
  end;

var
  fmDeviceRegMessage: TfmDeviceRegMessage;

implementation

{$R *.dfm}

procedure TfmDeviceRegMessage.btn_CancelClick(Sender: TObject);
begin
  L_bResult := IDCANCEL;
  Close;
end;

procedure TfmDeviceRegMessage.btn_SetClick(Sender: TObject);
begin
  L_bResult := IDNO;
  Close;

end;

procedure TfmDeviceRegMessage.btn_DisAlarmSetClick(Sender: TObject);
begin
  L_bResult := IDYES;
  Close;

end;

end.

unit uMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfmMessage = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    CloseTimer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CloseTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    L_stMessage : string;
    { Public declarations }
  end;

var
  fmMessage: TfmMessage;

implementation

{$R *.dfm}

procedure TfmMessage.FormShow(Sender: TObject);
begin
  Panel1.Caption := L_stMessage;
end;

procedure TfmMessage.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmMessage.CloseTimerTimer(Sender: TObject);
begin
  Close;
end;

end.

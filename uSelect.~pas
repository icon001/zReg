unit uSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfmSelect = class(TForm)
    rg_CardType: TRadioGroup;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure rg_CardTypeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    L_nSelected : integer;
    { Public declarations }
  end;

var
  fmSelect: TfmSelect;

implementation

{$R *.dfm}

procedure TfmSelect.FormCreate(Sender: TObject);
begin
  L_nSelected := 0;
end;

procedure TfmSelect.rg_CardTypeClick(Sender: TObject);
begin
  L_nSelected := rg_CardType.ItemIndex;
end;

procedure TfmSelect.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.

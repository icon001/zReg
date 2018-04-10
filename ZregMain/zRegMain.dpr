program zRegMain;

uses
  Forms,
  uMain in 'uMain.pas' {Form1},
  DIMime in '..\DIMime.pas',
  uLomosUtil in '..\uLomosUtil.pas';

{$R *.res}
{$R manifest.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

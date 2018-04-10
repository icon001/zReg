unit CCHint;

interface

uses
SysUtils, Windows, Messages, Classes, Graphics, Controls,
Forms, Dialogs;

Const
Sqrt2 = 1.4142135624;

type
TDrawHint =
procedure (Sender : TObject; Canvas : TCanvas; var R : TRect) of object;
TOnHint =
procedure (Sender : TObject; Hint : string) of object;

TCCHint = class(TComponent)
private
{ Private declarations }
FHintPauseTime : Integer;
FFontColor : TColor;
FHintColor : TColor;
FPen : TPen;
FBrush : TBrush;
fFont : TFont;

fDrawHint : TDrawHint;
fOnShowHint : TShowHintEvent;
fOnHint : TOnHint;

procedure SetHintPauseTime(Value:Integer);
Procedure SetPen(Value : TPen);
Procedure SetBrush(Value : TBrush);
procedure fSetFont(Font : TFont);

procedure DoOnShowHint(var HintStr: string; var CanShow:
Boolean; var HintInfo: THintInfo);
procedure DoOnHint(Sender: TObject);

protected
{ Protected declarations }
public
{ Public declarations }
constructor Create(AOwner:TComponent); Override;
destructor Destroy; Override;
published
{ Published declarations }
property HintPauseTime : Integer read FHintPauseTime
write SetHintPauseTime default 600;
property Pen : TPen Read FPen Write SetPen;
property Brush : TBrush Read FBrush Write SetBrush;
property FontColor : TColor Read FFontColor
Write FFontColor Default clBlack;
property HintColor : TColor Read FHintColor
Write FHintColor Default clYellow;
property Font : TFont read fFont write fSetFont;

property OnDrawHint : TDrawHint read fDrawHint write fDrawHint;
property OnHint : TOnHint read fOnHint write fOnHint;
property OnShowHint : TShowHintEvent read fOnShowHint write fOnShowHint;

end;

TNxHintWindow = class(THintWindow)
private
{ Private declarations }
FNxHint : TCCHint;
function FindNxHint : TCCHint;
protected
{ Protected declarations }
procedure Paint; Override;
procedure CreateParams(var Params: TCreateParams); Override;
public
{ Public declarations }
procedure ActivateHint(Rect: TRect; const AHint: string); Override;
published
{ Published declarations }
end;

procedure Register;

implementation

var
MemBmp : TBitmap;

procedure Register;
begin
RegisterComponents('C¿Ô¿Ã≥◊', [TCCHint]);
end;

Constructor TCCHint.Create(AOwner:TComponent);
begin
inherited Create(AOwner);

FPen := TPen.Create;
FBrush := TBrush.Create;
fFont := TFont.Create;
FBrush.Color := clYellow;
FFontColor := clBlack;
FHintColor := clYellow;

FHintPauseTime := 600;

if not (csReading in ComponentState) then
begin
Application.OnShowHint := DoOnShowHint;
Application.OnHint := DoOnHint;

Application.HintPause := FHintPauseTime;
HintWindowClass := TNxHintWindow;
Application.ShowHint := not Application.ShowHint;
Application.ShowHint := not Application.ShowHint;
end;
end;

destructor TCCHint.Destroy;
begin
FPen.Free;
FBrush.Free;
fFont.Free;
inherited Destroy;
end;


Procedure TCCHint.fSetFont(Font : TFont);
begin
fFont := Font;
end;

Procedure TCCHint.SetHintPauseTime(Value : Integer);
Begin
If (Value <> FHintPauseTime) Then Begin
FHintPauseTime := Value;
Application.HintPause := Value;
End;
End;

Procedure TCCHint.SetPen(Value : TPen);
Begin
FPen.Assign(Value);
End;

Procedure TCCHint.SetBrush(Value : TBrush);
Begin
FBrush.Assign(Value);
End;

Function TNxHintWindow.FindNxHint : TCCHint;
var
I : Integer;
begin
Result := nil;
For I := 0 To Application.MainForm.ComponentCount-1 Do
If Application.MainForm.Components[I] Is TCCHint Then Begin
Result := TCCHint(Application.MainForm.Components[I]);
Exit;
End;
End;

procedure TNxHintWindow.CreateParams(var Params : TCreateParams);
begin
inherited CreateParams(Params);
Params.Style := Params.Style-WS_BORDER;
end;

procedure TNxHintWindow.Paint;
var
R : TRect;
OfstX,OfstY : Integer;
begin
R := ClientRect;
With MemBMP.Canvas Do Begin
Pen.Assign(FNxHint.FPen);
Brush.Assign(FNxHint.FBrush);
Font.Assign(FNxHint.FFont);

Brush.Color := FNxHint.FHintColor;
Font.Color := FNxHint.FFontColor;

OfstX := (R.Right-R.Left-TextWidth(Caption)) Div 2;
OfstY := (R.Bottom-R.Top-TextHeight(Caption)) Div 2;

if Assigned (FNxHint.fDrawHint) then
FNxHint.fDrawHint(self, MemBMP.Canvas, R)
else
begin
Ellipse(R.Left,R.Top,R.Right,R.Bottom);
{
RoundRect( R.Left,R.Top,R.Right,R.Bottom,
(R.Bottom - R.Right) div 3, (R.Bottom - R.Right) div 3);
}
end;

Brush.Style := bsClear;
TextOut(R.Left+OfstX,R.Top+OfstY,Caption);
End;
Canvas.CopyMode:=cmSrcCopy;
Canvas.CopyRect(ClientRect,MemBmp.Canvas,ClientRect);
MemBmp.Free;
end;

procedure TNxHintWindow.ActivateHint(Rect: TRect; const AHint: string);
var
ScreenDC : HDC;
Pnt : TPoint;
OfstX,OfstY : Integer;
begin
MemBmp := TBitmap.Create;

Caption := AHint;
FNxHint := FindNxHint;

MemBmp.Canvas.Font := FNxHint.FFont ;
Rect.Right := Rect.Left + MemBmp.Canvas.TextWidth(AHint);
Rect.Bottom := Rect.Top + MemBmp.Canvas.TextHeight(AHint);

OfstX := Round((Rect.Right-Rect.Left-4)*(Sqrt2-1)*0.5);
OfstY := Round((Rect.Bottom-Rect.Top-4)*(Sqrt2-1)*0.5);
With Rect Do Begin
Top := Top-OfstY;
Left := Left-OfstX;
Right := Right+OfstX;
Bottom := Bottom+OfstY;
End;
BoundsRect := Rect;
MemBmp.Width := Width;
MemBmp.Height := Height;
ScreenDC := CreateDC('DISPLAY',nil,nil,nil);
Pnt.X := 0;
Pnt.Y := 0;
Pnt := ClientToScreen(Pnt);
BitBlt(MemBmp.Canvas.Handle,0,0,Width,Height,ScreenDC,Pnt.X,Pnt.Y,SRCCOPY);
SetWindowPos(Handle,HWND_TOPMOST,Pnt.X,Pnt.Y,0,0,
SWP_SHOWWINDOW or SWP_NOACTIVATE or SWP_NOSIZE);
BitBlt(Canvas.Handle,0,0,Width,Height,MemBmp.Canvas.Handle,0,0,SRCCOPY);
DeleteDC(ScreenDC);
end;

procedure TCCHint.DoOnShowHint(var HintStr: string; var CanShow: Boolean;
var HintInfo: THintInfo);
begin
if Assigned(fOnShowHint) then fOnShowHint(HintStr, CanShow, HintInfo);
end;

procedure TCCHint.DoOnHint(Sender: TObject);
begin
if Assigned(fOnHint) then fOnHint(Sender, Application.Hint);
end;

end.

 
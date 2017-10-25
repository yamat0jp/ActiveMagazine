unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FormPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.iPhone.fmx IOS}

procedure TForm1.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.Location.Y < 125 then
  begin
    if Image1.Tag = 0 then
      Image1.Tag := 1
    else
      Image1.Tag := 0;
  end
  else if EventInfo.Location.Y < 125 * 2 then
  begin
    if Image2.Tag = 0 then
      Image2.Tag := 1
    else
      Image2.Tag := 0;
  end
  else if EventInfo.Location.Y < 125 * 3 then
  begin
    if Image3.Tag = 0 then
      Image3.Tag := 1
    else
      Image3.Tag := 0;
  end;
  DoPaint(Canvas,ClientRect);
end;

procedure TForm1.FormPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
  s: TRectF;
  i: integer;
begin
  s := RectF(0, 0, Image1.Bitmap.Width, 125);
  if Image1.Tag = 0 then
    i := 0
  else
    i := 20;
  Canvas.DrawBitmap(Image1.Bitmap, s, RectF(i, 0, ClientWidth + i, 125), 1);
  if Image2.Tag = 0 then
    i := 0
  else
    i := 20;
  Canvas.DrawBitmap(Image2.Bitmap, s, RectF(i, 125, ClientWidth + i,
    125 * 2), 1);
  if Image3.Tag = 0 then
    i := 0
  else
    i := 20;
  Canvas.DrawBitmap(Image3.Bitmap, s, RectF(i, 125 * 2, ClientWidth + i, 125 * 3), 1);
end;

end.

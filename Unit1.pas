unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Image1Gesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FloatAnimation1Finish(Sender: TObject);
  private
    { private êÈåæ }
    procedure Scroll;
  public
    { public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.iPhone.fmx IOS}

procedure TForm1.FloatAnimation1Finish(Sender: TObject);
begin
  FormCreate(Sender);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Width := ClientWidth;
  Image2.Width := ClientWidth;
  Image3.Width := ClientWidth;
  Image1.Position.X := 0;
  Image2.Position.X := 0;
  Image3.Position.X := 0;
  Image1.Position.Y := 10;
  Image2.Position.Y := 135 + 10;
  Image3.Position.Y := 135 * 2 + 10;
  Image1.Tag := 0;
  Image2.Tag := 0;
  Image3.Tag := 0;
  FloatAnimation1.StopValue := -ClientHeight;
  Panel1.Position.Y := 0;
  Panel1.Opacity := 1;
end;

procedure TForm1.Image1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  s: TComponent;
begin
  if EventInfo.InertiaVector.Y < 0 then
  begin
    Scroll;
    Exit;
  end;
  with Sender as TImage do
  begin
    if Tag = 0 then
    begin
      Tag := 1;
      Position.X := -20;
    end
    else
    begin
      Tag := 0;
      Position.X := 0;
    end;
  end;
  for s in Children do
    if (s is TImage) and (s.Tag = 0) then
      Exit;
  Scroll;
end;

procedure TForm1.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  s: TGestureEventInfo;
  t: Boolean;
begin
  Image1Gesture(Sender, s, t);
end;

procedure TForm1.Scroll;
begin
  FloatAnimation1.Start;
  FloatAnimation2.Start;
end;

end.

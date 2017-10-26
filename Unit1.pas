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
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FloatAnimation2Finish(Sender: TObject);
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

procedure TForm1.FloatAnimation1Finish(Sender: TObject);
begin
  FormCreate(Sender);
end;

procedure TForm1.FloatAnimation2Finish(Sender: TObject);
begin
  if FloatAnimation1.Inverse = true then
  begin
    Panel1.Position.Y := -ClientHeight;
    Panel1.Opacity := 1;
    FloatAnimation1.Start;
  end;
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

procedure TForm1.Image1Click(Sender: TObject);
var
  s: TGestureEventInfo;
  t: Boolean;
begin
  s.InertiaVector.Y := 0;   //0,1,-1
  Image1Gesture(Sender, s, t);
end;

procedure TForm1.Image1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  s: TComponent;
begin
  if EventInfo.InertiaVector.Y < 0 then
  begin
    FloatAnimation1.Start;
    FloatAnimation2.Start;
    Exit;
  end
  else if EventInfo.InertiaVector.Y > 0 then
  begin
    FloatAnimation1.Inverse := true;
    FloatAnimation2.Start;
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
  for s in Panel1.Children do
    if (s is TImage) and (s.Tag = 0) then
      Exit;
  FloatAnimation1.Start;
  FloatAnimation2.Start;
end;

end.

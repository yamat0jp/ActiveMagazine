unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.Gestures, FMX.Objects, FMX.StdCtrls, FMX.Ani;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    up: TAction;
    down: TAction;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    procedure FormCreate(Sender: TObject);
    procedure FloatAnimation2Finish(Sender: TObject);
    procedure upExecute(Sender: TObject);
    procedure downExecute(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.downExecute(Sender: TObject);
begin
  FloatAnimation1.Inverse := true;
  FloatAnimation2.Start;
end;

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
  FloatAnimation1.Inverse := false;
  FloatAnimation1.StopValue := -ClientHeight;
  Panel1.Position.Y := 0;
  Panel1.Opacity := 1;
end;

procedure TForm1.upExecute(Sender: TObject);
begin
  FloatAnimation1.Start;
  FloatAnimation2.Start;
end;

end.

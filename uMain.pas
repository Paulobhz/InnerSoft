unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani;

type
  TfrmMain = class(TForm)
    IS_Image: TImage;
    EncolherW: TFloatAnimation;
    EncolherH: TFloatAnimation;
    PraEsquerda1: TFloatAnimation;
    PraCima1: TFloatAnimation;
    PraDireita1: TFloatAnimation;
    PraBaixo1: TFloatAnimation;
    PraEsquerda2: TFloatAnimation;
    PraCima2: TFloatAnimation;
    PraDireita2: TFloatAnimation;
    procedure IS_ImageClick(Sender: TObject);
    procedure EncolherWFinish(Sender: TObject);
    procedure PraEsquerda1Finish(Sender: TObject);
    procedure PraCima1Finish(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PraDireita1Finish(Sender: TObject);
    procedure PraBaixo1Finish(Sender: TObject);
    procedure PraEsquerda2Finish(Sender: TObject);
    procedure PraCima2Finish(Sender: TObject);
    procedure PraDireita2Finish(Sender: TObject);
    procedure IS_ImageDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  Movimentando : Boolean;
  OriginalX,OriginalY : Single;

implementation

{$R *.fmx}


procedure TfrmMain.FormShow(Sender: TObject);
begin
    Movimentando := False;
end;

procedure TfrmMain.IS_ImageClick(Sender: TObject);
begin
    if not Movimentando then begin
        Movimentando := True;
        EncolherW.Inverse := False;
        EncolherH.Inverse := False;
        EncolherW.Start;
        EncolherH.Start;
    end
end;

procedure TfrmMain.IS_ImageDblClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmMain.EncolherWFinish(Sender: TObject);
begin
    if Movimentando then
    begin
    IS_Image.Align          := TAlignLayout.None;
    OriginalX               := IS_Image.Position.X;
    OriginalY               := IS_Image.Position.Y;
    PraEsquerda1.StartValue := IS_Image.Position.X;
    PraEsquerda1.Start;

    end;
end;

procedure TfrmMain.PraEsquerda1Finish(Sender: TObject);
begin
    PraCima1.StartValue := IS_Image.Position.Y;
    PraCima1.Start;
end;

procedure TfrmMain.PraCima1Finish(Sender: TObject);
begin
    PraDireita1.StopValue := frmMain.Width-Is_Image.Width-10;
    PraDireita1.Start;
end;


procedure TfrmMain.PraDireita1Finish(Sender: TObject);
begin
    PraBaixo1.StopValue := frmMain.Height-Is_Image.Height-40;
    PraBaixo1.Start;
end;

procedure TfrmMain.PraBaixo1Finish(Sender: TObject);
begin
    PraEsquerda2.StartValue := Is_Image.Position.X;
    PraEsquerda2.Start;
end;

procedure TfrmMain.PraEsquerda2Finish(Sender: TObject);
begin
    PraCima2.StartValue := Is_Image.Position.Y;
    PraCima2.StopValue  := OriginalY;
    PraCima2.Start
end;

procedure TfrmMain.PraCima2Finish(Sender: TObject);
begin
    PraDireita2.StopValue := OriginalX;
    PraDireita2.Start;
end;

procedure TfrmMain.PraDireita2Finish(Sender: TObject);
begin
    Movimentando      := False;
    IS_Image.Align    := TAlignLayout.Center;
    EncolherW.Inverse := True;
    EncolherH.Inverse := True;
    EncolherW.Start;
    EncolherH.Start;

end;



end.

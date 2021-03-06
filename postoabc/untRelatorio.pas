unit untRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RLReport, Vcl.Imaging.jpeg,
  RLPreview, rlconsts;

type
  TfrmRelatorio = class(TForm)
    dsRelatorio: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLImage1: TRLImage;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLBand3: TRLBand;
    RLLabel11: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure imprimirRelatorio();
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

uses untDM;

{ TfrmRelatorio }

procedure TfrmRelatorio.imprimirRelatorio;
begin
   dm.cdsRelatorio.Close;
   try
      dm.cdsRelatorio.Open;

      RLReport1.Preview;

   finally
      dm.cdsRelatorio.Close;
   end;
end;

initialization
   rlconsts.setVersion(3,71,'B');

end.

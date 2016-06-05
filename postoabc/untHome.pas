unit untHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TfrmHome = class(TForm)
    mnHome: TMainMenu;
    mnCadastros: TMenuItem;
    mnCombustivel: TMenuItem;
    mnTanque: TMenuItem;
    mnBomba: TMenuItem;
    mnSair: TMenuItem;
    Image1: TImage;
    mmRelatorios: TMenuItem;
    Cadastrais1: TMenuItem;
    Combustvel1: TMenuItem;
    anque1: TMenuItem;
    Bomba1: TMenuItem;
    Abastecimento1: TMenuItem;
    Personalizado1: TMenuItem;
    mmAbastecimento: TMenuItem;
    procedure mnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnCombustivelClick(Sender: TObject);
    procedure mnTanqueClick(Sender: TObject);
    procedure mnBombaClick(Sender: TObject);
    procedure mmAbastecimentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

{$R *.dfm}

uses untDM, untCombustivel, untBomba, untTanque, untAbastecimento;

procedure TfrmHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if MessageDlg('Tem certeza que deseja fechar?', mtConfirmation, mbYesNo, 0) <> mrYes then
      abort;
end;

procedure TfrmHome.mmAbastecimentoClick(Sender: TObject);
begin
   frmAbastecimento := TfrmAbastecimento.Create(nil);
   try
     frmAbastecimento.ShowModal;
   finally
      FreeAndNil(frmAbastecimento);
   end;
end;

procedure TfrmHome.mnBombaClick(Sender: TObject);
begin
   frmBomba := TfrmBomba.Create(nil);
   try
     frmBomba.ShowModal;
   finally
      FreeAndNil(frmBomba);
   end;
end;

procedure TfrmHome.mnCombustivelClick(Sender: TObject);
begin
   frmCombustivel := TfrmCombustivel.Create(nil);
   try
     frmCombustivel.ShowModal;
   finally
      FreeAndNil(frmCombustivel);
   end;
end;

procedure TfrmHome.mnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmHome.mnTanqueClick(Sender: TObject);
begin
   frmTanque := TfrmTanque.Create(nil);
   try
     frmTanque.ShowModal;
   finally
      FreeAndNil(frmTanque);
   end;
end;

end.

unit untAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.FMTBcd, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, Datasnap.Provider, Datasnap.DBClient,
  Data.SqlExpr, Vcl.DBLookup;

type
  TfrmAbastecimento = class(TForm)
    Image1: TImage;
    pcCadastro: TPageControl;
    tbsLista: TTabSheet;
    tbsCadastro: TTabSheet;
    dbgLista: TDBGrid;
    Panel1: TPanel;
    btnInserir: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    dsAbastecimento: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsAbastecimentoDataChange(Sender: TObject; Field: TField);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbgListaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure tratarBotoes(isEdicao: boolean);
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmAbastecimento.btnAlterarClick(Sender: TObject);
begin
   dm.cdsAbastecimento.Edit;
end;

procedure TfrmAbastecimento.btnCancelarClick(Sender: TObject);
begin
   dm.cdsAbastecimento.CancelUpdates;
end;

procedure TfrmAbastecimento.btnConfirmarClick(Sender: TObject);
begin
   dm.salvar(dm.cdsAbastecimento);

   pcCadastro.ActivePageIndex := 0;
end;

procedure TfrmAbastecimento.btnExcluirClick(Sender: TObject);
begin
   dm.cdsAbastecimento.Delete;
end;

procedure TfrmAbastecimento.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TfrmAbastecimento.btnInserirClick(Sender: TObject);
begin
   dm.cdsAbastecimento.Insert;
end;


procedure TfrmAbastecimento.dbgListaDblClick(Sender: TObject);
begin
   pcCadastro.ActivePageIndex := 1;
end;

procedure TfrmAbastecimento.dsAbastecimentoDataChange(Sender: TObject;
  Field: TField);
begin
   tratarBotoes(dm.cdsAbastecimento.State in [dsEdit, dsInsert]);
end;

procedure TfrmAbastecimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dm.cdsAbastecimento.Close;
end;

procedure TfrmAbastecimento.FormShow(Sender: TObject);
begin
   dm.cdsAbastecimento.Open;

   pcCadastro.ActivePageIndex := 0;
end;

procedure TfrmAbastecimento.tratarBotoes(isEdicao: boolean);
begin

   btnInserir.Enabled := not isEdicao;
   btnAlterar.Enabled := not isEdicao;
   btnExcluir.Enabled := not isEdicao;
   btnConfirmar.Enabled := isEdicao;
   btnCancelar.Enabled := isEdicao;

   if isEdicao then
      pcCadastro.ActivePageIndex := 1
   else pcCadastro.ActivePageIndex := 0;

end;

end.

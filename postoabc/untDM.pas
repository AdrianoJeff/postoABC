unit untDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Vcl.Dialogs, Vcl.Controls;

type
  Tdm = class(TDataModule)
    conn: TSQLConnection;
    qryCombustivel: TSQLQuery;
    dspCombustivel: TDataSetProvider;
    cdsCombustivel: TClientDataSet;
    cdsCombustivelID_COMBUSTIVEL: TIntegerField;
    cdsCombustivelDESCRICAO: TStringField;
    cdsCombustivelVALOR: TFMTBCDField;
    cdsCombustivelIMPOSTO: TFMTBCDField;
    qryTanque: TSQLQuery;
    dspTanque: TDataSetProvider;
    cdsTanque: TClientDataSet;
    cdsTanqueID_TANQUE: TIntegerField;
    cdsTanqueID_COMBUSTIVEL: TIntegerField;
    qryBomba: TSQLQuery;
    dspBomba: TDataSetProvider;
    cdsBomba: TClientDataSet;
    cdsBombaID_BOMBA: TIntegerField;
    cdsBombaID_TANQUE: TIntegerField;
    cdsTanqueCOMBUSTIVEL: TStringField;
    cdsBombaCOMBUSTIVEL: TStringField;
    qryAbastecimento: TSQLQuery;
    dspAbastecimento: TDataSetProvider;
    cdsAbastecimento: TClientDataSet;
    cdsAbastecimentoID_ABASTECIMENTO: TIntegerField;
    cdsAbastecimentoID_BOMBA: TIntegerField;
    cdsAbastecimentoDATA: TSQLTimeStampField;
    cdsAbastecimentoQUANTIDADE: TFMTBCDField;
    cdsAbastecimentoVALOR: TFMTBCDField;
    cdsAbastecimentoVALOR_IMPOSTO: TFMTBCDField;
    cdsAbastecimentoBOMBA: TStringField;
    procedure cdsCombustivelAfterInsert(DataSet: TDataSet);
    procedure cdsCombustivelBeforeDelete(DataSet: TDataSet);
    procedure cdsTanqueAfterInsert(DataSet: TDataSet);
    procedure cdsTanqueBeforeDelete(DataSet: TDataSet);
    procedure cdsTanqueAfterDelete(DataSet: TDataSet);
    procedure cdsCombustivelAfterDelete(DataSet: TDataSet);
    procedure cdsBombaAfterDelete(DataSet: TDataSet);
    procedure cdsBombaAfterInsert(DataSet: TDataSet);
    procedure cdsBombaBeforeDelete(DataSet: TDataSet);
    procedure cdsAbastecimentoAfterDelete(DataSet: TDataSet);
    procedure cdsAbastecimentoBeforeDelete(DataSet: TDataSet);
    procedure cdsAbastecimentoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
    procedure confirmaExclusao;
  public
    { Public declarations }
    procedure salvar(oCds: TClientDataSet);
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure Tdm.cdsAbastecimentoAfterDelete(DataSet: TDataSet);
begin
   salvar(cdsAbastecimento);
end;

procedure Tdm.cdsAbastecimentoAfterInsert(DataSet: TDataSet);
begin
   if(cdsAbastecimento.Aggregates.Find('seq').Value = nil)then
      cdsAbastecimentoID_ABASTECIMENTO.AsInteger :=  1
   else cdsAbastecimentoID_ABASTECIMENTO.AsInteger :=  cdsAbastecimento.Aggregates.Find('seq').Value + 1;
end;

procedure Tdm.cdsAbastecimentoBeforeDelete(DataSet: TDataSet);
begin
   confirmaExclusao();
end;

procedure Tdm.cdsBombaAfterDelete(DataSet: TDataSet);
begin
   salvar(cdsBomba);
end;

procedure Tdm.cdsBombaAfterInsert(DataSet: TDataSet);
begin
   cdsBombaID_BOMBA.AsInteger :=  cdsBomba.Aggregates.Find('seq').Value + 1;
end;

procedure Tdm.cdsBombaBeforeDelete(DataSet: TDataSet);
begin
   confirmaExclusao();
end;

procedure Tdm.cdsCombustivelAfterDelete(DataSet: TDataSet);
begin
   salvar(cdsCombustivel);
end;

procedure Tdm.cdsCombustivelAfterInsert(DataSet: TDataSet);
begin
   cdsCombustivelID_COMBUSTIVEL.AsInteger :=  cdsCombustivel.Aggregates.Find('seq').Value + 1;
end;

procedure Tdm.cdsCombustivelBeforeDelete(DataSet: TDataSet);
begin
   confirmaExclusao();
end;

procedure Tdm.cdsTanqueAfterDelete(DataSet: TDataSet);
begin
   salvar(cdsTanque);
end;

procedure Tdm.cdsTanqueAfterInsert(DataSet: TDataSet);
begin
   cdsTanqueID_TANQUE.AsInteger :=  cdsTanque.Aggregates.Find('seq').Value + 1;
end;

procedure Tdm.cdsTanqueBeforeDelete(DataSet: TDataSet);
begin
   confirmaExclusao();
end;

procedure Tdm.confirmaExclusao;
begin
   if MessageDlg('Tem certeza que excluir?', mtConfirmation, mbYesNo, 0) <> mrYes then
      abort;
end;

procedure Tdm.salvar(oCds: TClientDataSet);
begin
   try
      if oCds.State in [dsInsert, dsEdit] then
         oCds.Post;

      oCds.ApplyUpdates(0);

   except
      on e: Exception do
         MessageDlg('N�o foi poss�vel concluir essa opera��o, motivo: '+e.Message, mtError, [mbOk], 0);
   end;
end;

end.

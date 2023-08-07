unit botoes;

interface

uses
  Data.DB,
  Vcl.Forms,
  Vcl.Dialogs,
  System.UITypes,
  System.SysUtils,
  Datasnap.DBClient,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TBotoes = class
  private
  public
    procedure botaoNovo(DataSet: TDataSet; IDField: String; CampoData: TField);
    procedure botaoEditar(DataSet: TDataSet; CampoData: TField);
    procedure botaoCancelar(DataSet: TDataSet);
    procedure botaoExcluir(DataSet: TDataSet);
    procedure botaoSalvar(DataSet: TDataSet; MsgSalvar: String);

  end;

implementation

{ TBotoes }

procedure TBotoes.botaoCancelar(DataSet: TDataSet);
begin
  if DataSet.State in dsEditModes then
    DataSet.Cancel;
end;

procedure TBotoes.botaoEditar(DataSet: TDataSet; CampoData: TField);
begin
  if DataSet.State = dsBrowse then
    DataSet.Edit;
  if CampoData.AsDateTime = 0 then
    CampoData.AsDateTime := now;
end;

procedure TBotoes.botaoExcluir(DataSet: TDataSet);
var
  aviso: Integer;
begin
  Application.Title := 'Aten��o!';
  aviso := MessageDlg('Deseja mesmo excluir o registro?', mtConfirmation,
    [mbYes, mbNo], 0);
  if aviso = mrYes then
  begin
    if not (DataSet.State in [dsEdit, dsInsert]) then
      DataSet.Edit;
      TFDDataSet(DataSet).CachedUpdates := True;
  end;
  DataSet.Delete;
  TFDDataSet(DataSet).ApplyUpdates;
  TFDDataSet(DataSet).CommitUpdates;
  DataSet.Refresh;
end;


procedure TBotoes.botaoNovo(DataSet: TDataSet; IDField: string; CampoData: TField);
var
  registro: Integer;
begin
  if (DataSet.State in [dsBrowse, dsEdit]) then
  begin
    DataSet.Last;   // �ltimo registro
    registro := DataSet.FieldByName(IDField).AsInteger + 1;
    DataSet.Insert; // Coloca o dataset em modo de inser��o / antes eu usava DataSet.Append;
    DataSet.FieldByName(IDField).AsInteger := registro; // Atribuir o novo ID ao novo registro
    CampoData.AsDateTime := Now;
  end;
end;


procedure TBotoes.botaoSalvar(DataSet: TDataSet; MsgSalvar: String);
begin
  if DataSet is TFDDataSet then
  begin
    MessageDlg(MsgSalvar, mtInformation, [mbOK], 0);
    TFDDataSet(DataSet).CachedUpdates := True; // Habilita cached updates
  end;
  DataSet.Post;
  TFDDataSet(DataSet).ApplyUpdates;
  TFDDataSet(DataSet).CommitUpdates;
  DataSet.Refresh;

end;

end.

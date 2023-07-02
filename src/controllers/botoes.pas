unit botoes;

interface

uses
  Data.DB, Vcl.Forms, Vcl.Dialogs, System.UITypes, Datasnap.DBClient, SimpleDS;

type
  TBotoes = class
  private
  public
    procedure botaoNovo(Dataset: TDataSet; IDField: String);
    procedure botaoEditar(Dataset: TDataSet);
    procedure botaoCancelar(Dataset: TDataSet);
    procedure botaoExcluir(Dataset: TSimpleDataSet);
    procedure botaoSalvar(Dataset: TSimpleDataSet; MsgSalvar: String);

  end;

implementation

{ TBotoes }

procedure TBotoes.botaoCancelar(Dataset: TDataSet);
begin
  if Dataset.State in dsEditModes then
    Dataset.Cancel;
end;

procedure TBotoes.botaoEditar(Dataset: TDataSet);
begin
  if Dataset.State = dsBrowse then
    Dataset.Edit;
end;

procedure TBotoes.botaoExcluir(Dataset: TSimpleDataSet);
var
  aviso: Integer;
begin
  Application.Title := 'Aten��o!';
  aviso := MessageDlg('Deseja mesmo excluir o registro?', mtConfirmation, [mbYes, mbNo], 0);
  if aviso = mrYes then
  begin
    Dataset.Delete;
    Dataset.ApplyUpdates(0);
  end;
end;


procedure TBotoes.botaoNovo(Dataset: TDataSet; IDField: string);
var
  registro: Integer;
begin
  Dataset.Last; // �ltimo registro
  registro := Dataset.FieldByName(IDField).AsInteger + 1;
  Dataset.Append; // pr�ximo registro em branco
  Dataset.FieldByName(IDField).AsInteger := registro; // atribuir o novo ID ao novo registro

end;

procedure TBotoes.botaoSalvar(Dataset: TSimpleDataSet; MsgSalvar: String);
begin
  Dataset.Post;
  Dataset.ApplyUpdates(0);
  MessageDlg(MsgSalvar, mtInformation, [mbOK], 0);
end;

end.

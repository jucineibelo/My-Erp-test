unit view.funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.base.lista, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  dm.conexao, DB, Vcl.Grids, Vcl.DBGrids;

type
  TviewFuncionarios = class(TviewBaseListas)
    Panel2: TPanel;
    edtSenha: TDBEdit;
    lblSenha: TLabel;
    edtUsuario: TDBEdit;
    lblUsuario: TLabel;
    lblSetor: TLabel;
    edtSetor: TDBEdit;
    lblCargo: TLabel;
    edtCargo: TDBEdit;
    edtNome: TDBEdit;
    lblNome: TLabel;
    lblCodi: TLabel;
    dbTxtCodi: TDBText;
    DBGrid1: TDBGrid;
    lblData: TLabel;
    edtData: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewFuncionarios: TviewFuncionarios;

implementation

{$R *.dfm}

procedure TviewFuncionarios.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if DmConexao.sdsFuncionarios.State in dsEditModes then
    DmConexao.sdsFuncionarios.Cancel;
  PageControl1.TabIndex := 1;
  btnNovo.Visible := True;
end;

procedure TviewFuncionarios.btnNovoClick(Sender: TObject);
var
  proxregistro: Integer;
begin
  inherited;
  if DmConexao.sdsFuncionarios.State in dsEditModes then
    btnNovo.Visible := False;
  PageControl1.TabIndex := 0;
  DmConexao.sdsFuncionarios.Last;
  proxregistro := DmConexao.sdsFuncionariosCODIGO.AsInteger + 1;
  DmConexao.sdsFuncionarios.Append;
  DmConexao.sdsFuncionariosCODIGO.AsInteger := proxregistro;
  DmConexao.sdsFuncionariosDATA_CADASTRO.AsDateTime := Now;
  edtNome.SetFocus;
end;

procedure TviewFuncionarios.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  DmConexao.sdsFuncionarios.Filtered := False;
  DmConexao.sdsFuncionarios.IndexFieldNames := DBGrid1.SelectedField.FieldName;
  DmConexao.sdsFuncionarios.FindNearest([edtPesquisa.Text]);
end;

procedure TviewFuncionarios.btnSalvarClick(Sender: TObject);
begin
  inherited;
  DmConexao.sdsFuncionarios.Post;
  DmConexao.sdsFuncionarios.ApplyUpdates(0);
  MessageDlg('Usu�rio salvo com sucesso!', mtInformation, [mbOK], 0);
  PageControl1.TabIndex := 1;
  btnNovo.Visible := True;
end;

procedure TviewFuncionarios.FormCreate(Sender: TObject);
begin
  inherited;
  DmConexao.sdsFuncionarios.Open;
  DmConexao.sdsFuncionarios.Append;
end;

procedure TviewFuncionarios.tbsCadastroShow(Sender: TObject);
begin
  inherited;
  DmConexao.sdsFuncionarios.Append;
end;

end.

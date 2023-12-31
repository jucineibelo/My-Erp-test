unit view.login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dm.conexao,
  Vcl.Buttons, view.principal;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtSenha: TEdit;
    edtUsuario: TEdit;
    Panel2: TPanel;
    btnLogin: TBitBtn;
    Panel5: TPanel;
    Panel6: TPanel;
    btnFechar: TBitBtn;
    Panel7: TPanel;
    Panel8: TPanel;
    Label1: TLabel;
    lblInfo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Panel3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure logarSistema;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  view.funcionarios;

{$R *.dfm}

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  logarSistema;
end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    logarSistema;
end;

procedure TfrmLogin.edtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    logarSistema;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  if not DmConexao.sdsFuncionarios.Active then
    DmConexao.sdsFuncionarios.Open;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  lblInfo.Caption := DateToStr(Now);
end;

procedure TfrmLogin.logarSistema;
var
  usuario, senha: string;
  encontrouUsuario: Boolean;
begin
  encontrouUsuario := False;
  DmConexao.sdsFuncionarios.First; // posicionar no primeiro registro da tabela
  while not DmConexao.sdsFuncionarios.Eof do
  // enquanto n�o for o final da tabela
  begin
    usuario := DmConexao.sdsFuncionariosUSUARIO.AsString;
    senha := DmConexao.sdsFuncionariosSENHA.AsString;

    if (usuario = edtUsuario.Text) and (senha = edtSenha.Text) then
    begin
      encontrouUsuario := True;
      Break; // interrompe o loop se encontrar um usu�rio com os dados informados
    end;

    DmConexao.sdsFuncionarios.Next; // avan�a para o pr�ximo registro da tabela
  end;

  if encontrouUsuario then
    frmPrincipal.Show
  else
    ShowMessage('Dados incorretos por favor tente novamente!');
end;

procedure TfrmLogin.Panel2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
const
  sc_DragMove = $F012;
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, sc_DragMove, 0);
end;

procedure TfrmLogin.Panel3Click(Sender: TObject);
const
  sc_DragMove = $F012;
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, sc_DragMove, 0);
end;

end.

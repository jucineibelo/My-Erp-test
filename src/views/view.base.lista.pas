unit view.base.lista;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  view.base,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Data.DB,
  Vcl.Imaging.pngimage,
  Vcl.Mask,
  Vcl.DBCtrls;

type
  TviewBaseListas = class(TviewBase)
    panelTop: TPanel;
    panelIcone: TPanel;
    pnlFechar: TPanel;
    btnSair: TSpeedButton;
    lblTitulo: TLabel;
    pnlLinhaFundo: TPanel;
    PageControl1: TPageControl;
    tsConsulta: TTabSheet;
    tbsCadastro: TTabSheet;
    pnlPesquisa: TPanel;
    edtPesquisa: TEdit;
    btnPesquisa: TButton;
    Panel1: TPanel;
    imgTitulo: TImage;
    lblTituloCadastro: TLabel;
    panelRodape: TPanel;
    pnlBotoesButton: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    DBEdit1: TDBEdit;
    procedure btnSairClick(Sender: TObject);
    procedure lblTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlBotoesButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);

  private
    { Private declarations }
  public

    procedure somenteLeitura(Value : Boolean);
    procedure ativaDesativaBotoes(status : boolean );

  end;

var
  viewBaseListas: TviewBaseListas;

implementation

{$R *.dfm}

procedure TviewBaseListas.ativaDesativaBotoes(status: boolean);
begin
  btnNovo.Enabled := status;
  btnEditar.Enabled := status;
  btnCancelar.Enabled := not status;
  btnSalvar.Enabled := not status;
  btnExcluir.Enabled := status;

end;

procedure TviewBaseListas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  somenteLeitura(True);
  ativaDesativaBotoes(True);
end;

procedure TviewBaseListas.btnEditarClick(Sender: TObject);
begin
  inherited;
  somenteLeitura(False);
  ativaDesativaBotoes(False);
end;

procedure TviewBaseListas.btnNovoClick(Sender: TObject);
begin
  inherited;
  somenteLeitura(False);
  ativaDesativaBotoes(False);
end;

procedure TviewBaseListas.btnSairClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TviewBaseListas.btnSalvarClick(Sender: TObject);
begin
  inherited;
  ativaDesativaBotoes(True);
end;

procedure TviewBaseListas.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 1;
  somenteLeitura(True);
  ativaDesativaBotoes(True);
end;

procedure TviewBaseListas.lblTituloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $F012;
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, sc_DragMove, 0);
end;

procedure TviewBaseListas.pnlBotoesButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $F012;
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, sc_DragMove, 0);
end;

procedure TviewBaseListas.somenteLeitura(Value: Boolean);
// colocar todos os componentes tdedit em modo de leitura
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      TDBEdit(Components[i]).ReadOnly := Value;
  end;

  // Desativar radiogroups quando est� em modo de leitura
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TRadioGroup then
      TRadioGroup(Components[i]).Enabled := not Value;

  end;
end;

end.

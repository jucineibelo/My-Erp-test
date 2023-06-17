unit view.empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.base.lista, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, dm.conexao,
  Vcl.Grids, Vcl.DBGrids, DB;

type
  TviewEmpresa = class(TviewBaseListas)
    Label1: TLabel;
    edtRazao: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewEmpresa: TviewEmpresa;

implementation

{$R *.dfm}

procedure TviewEmpresa.btnCancelarClick(Sender: TObject);
begin
  inherited;
    if DmConexao.sdsEmpresa.State in dsEditModes then
    DmConexao.sdsEmpresa.Cancel;
end;

procedure TviewEmpresa.btnEditarClick(Sender: TObject);
begin
  inherited;
  if DmConexao.sdsEmpresa.State = dsBrowse then
    DmConexao.sdsEmpresa.Edit;
    edtRazao.SetFocus;
end;

procedure TviewEmpresa.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtRazao.SetFocus;
  DmConexao.sdsEmpresa.Last;
end;


procedure TviewEmpresa.btnSalvarClick(Sender: TObject);
begin
  inherited;
  DmConexao.sdsEmpresa.Post;
  DmConexao.sdsEmpresa.ApplyUpdates(0);
  DmConexao.sdsEmpresa.Refresh;
  MessageDlg('Empresa cadastrada com sucesso!', mtInformation, [mbOK], 0);
end;

procedure TviewEmpresa.FormCreate(Sender: TObject);
var
desativarPageDois : Boolean;
begin
  inherited;
  DmConexao.sdsEmpresa.Open;
  //desativando o pagecontrol.TabIndex indice 1
  PageControl1.Pages[1].TabVisible := False;
end;

end.
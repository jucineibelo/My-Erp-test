unit view.mensagens;

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
  Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TMyButtons = (mbSim, mbNao, mbOk);

type
  TviewMensagens = class(TviewBase)
    pnlMensagens: TPanel;
    pnlConteudo: TPanel;
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    mmoTexto: TMemo;
    lblTitulo: TLabel;
    btnOK: TSpeedButton;
    btnSIM: TSpeedButton;
    btnNAO: TSpeedButton;
    imgAlerta: TImage;
    imgInformation: TImage;
    imgError: TImage;
    procedure btnSIMClick(Sender: TObject);
    procedure btnNAOClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function Mensagem(Texto: String; Titulo: string; Tipo: Char;
      Botoes: array of TMyButtons): Boolean;
  end;

var
  viewMensagens: TviewMensagens;

implementation

{$R *.dfm}
{ TviewMensagens }

procedure TviewMensagens.btnNAOClick(Sender: TObject);
// Não
begin
  inherited;
  Self.ModalResult := mrNo;
end;

procedure TviewMensagens.btnOKClick(Sender: TObject);
//Ok
begin
  inherited;
  Self.ModalResult := mrOk;
end;

procedure TviewMensagens.btnSIMClick(Sender: TObject);
//Sim
begin
  inherited;
  Self.ModalResult := mrYes;
end;

class function TviewMensagens.Mensagem(Texto: string; Titulo: string;
  Tipo: Char; Botoes: array of TMyButtons): Boolean;

var
  i: Integer;
  view: TviewMensagens;

begin
  view := TviewMensagens.Create(nil);
  try

    view.lblTitulo.Caption := Titulo;
    view.mmoTexto.Text := Texto;

    for i := 0 to Length(Botoes) - 1 do // Tratamento de botões
    begin
      case (Botoes[i]) of
        mbOk:
          begin
            view.btnOK.Visible := True;
            view.btnOK.Align := alRight;
          end;

        mbSim:
          begin
            view.btnSIM.Visible := True;
            view.btnSIM.Align := alRight;
          end;

        mbNao:
          begin
            view.btnNAO.Visible := True;
            view.btnNAO.Align := alRight;
          end;

      else
        begin
          view.btnOK.Visible := True;
          view.btnOK.Align := alRight;
        end;
      end;
    end;
    case (Tipo) of
      'I':
        begin
          view.imgInformation.Visible := True; // Informação
        end;

      'A':
        begin
          view.imgAlerta.Visible := True; // Alerta
        end;

      'Q':
        begin
          view.imgError.Visible := True; // Erro
        end

    else
      begin
        view.imgInformation.Visible := True;
      end;
    end;

    // Mostrar o formulario

    view.ShowModal;

  finally
    if view <> nil then
      FreeAndNil(view);

  end;

end;

end.

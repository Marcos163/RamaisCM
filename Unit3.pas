unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    btnCadastrar: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtRamal: TDBEdit;
    Label2: TLabel;
    txtSetor: TDBEdit;
    Label3: TLabel;
    txtContato: TDBEdit;
    Label4: TLabel;
    txtDescricao: TDBEdit;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    nAcesso: TLabel;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure txtRamalKeyPress(Sender: TObject; var Key: Char);
    procedure txtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure txtContatoKeyPress(Sender: TObject; var Key: Char);
    procedure txtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1, Unit2;

{$R *.dfm}

procedure Habilitar;
begin
form3.txtRamal.enabled := true;
form3.txtSetor.Enabled := true;
form3.txtContato.Enabled := true;
form3.txtDescricao.Enabled := true;
form3.btnCadastrar.Enabled := false;
form3.btnEditar.Enabled := false;
form3.btnExcluir.Enabled := false;
form3.btnSalvar.Enabled := true;
form3.btnCancelar.Enabled := true;

end;

procedure Desabilitar;
begin
form3.txtRamal.enabled := false;
form3.txtSetor.Enabled := false;
form3.txtContato.Enabled := false;
form3.txtDescricao.Enabled := false;
form3.btnCadastrar.Enabled := true;
form3.btnEditar.Enabled := true;
form3.btnExcluir.Enabled := true;
form3.btnSalvar.Enabled := false;
form3.btnCancelar.Enabled := false;

end;

procedure TForm3.btnCadastrarClick(Sender: TObject);
begin
form1.adoquery1.Append;
form2.show;
dbgrid1.Enabled := false;
speedbutton1.Enabled := false;
btnCadastrar.Enabled := false;
end;

procedure TForm3.btnEditarClick(Sender: TObject);
begin
habilitar;
form1.ADOQuery1.Edit;
end;

procedure TForm3.btnSalvarClick(Sender: TObject);
begin
desabilitar;
form1.ADOQuery1.Post;
end;

procedure TForm3.btnCancelarClick(Sender: TObject);
begin
desabilitar;
form1.ADOQuery1.Cancel;
end;

procedure TForm3.btnExcluirClick(Sender: TObject);
begin
if messagedlg('Deseja realmente excluir este ramal?', mtWarning, [mbYes,mbNo], 0)= mrYes then
begin
form1.ADOQuery1.Delete;
end;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
//form1.ADOQuery1.Refresh;
form1.Show;
form3.Hide;
end;

procedure TForm3.txtRamalKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', chr(8)]) then 
Key:=#0;
end;

procedure TForm3.txtSetorKeyPress(Sender: TObject; var Key: Char);
begin
if (Key in [ chr(39)]) then
Key:=#0;
end;

procedure TForm3.txtContatoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key in [ chr(39)]) then
Key:=#0;
end;

procedure TForm3.txtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key in [ chr(39)]) then 
Key:=#0;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form1.Show;
form3.Hide;

end;

end.

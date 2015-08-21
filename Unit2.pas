unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Mask, DBCtrls;

type
  TForm2 = class(TForm)
    Image2: TImage;
    Panel2: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    txtRamal: TDBEdit;
    txtSetor: TDBEdit;
    Label2: TLabel;
    txtContato: TDBEdit;
    Label3: TLabel;
    txtDescricao: TDBEdit;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure txtRamalKeyPress(Sender: TObject; var Key: Char);
    procedure txtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure txtContatoKeyPress(Sender: TObject; var Key: Char);
    procedure txtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
if (txtRamal.Text = '') or (txtSetor.Text = '' ) or (txtContato.Text = '') then
begin
messagedlg('Verifique se os campos Ramal, Setor e Contato foram preenchidos corretamente!', mtInformation, [mbOk], 0);
end
else
begin
form1.adoquery1.post;
form2.Hide;
end;
form3.DBGrid1.Enabled := true;
form3.SpeedButton1.Enabled := true;
form3.btnCadastrar.Enabled :=true;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
form1.ADOQuery1.Cancel;
form2.Hide;
form3.DBGrid1.Enabled := true;
form3.SpeedButton1.Enabled := true;
form3.btnCadastrar.Enabled := true;
end;

procedure TForm2.txtRamalKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', chr(8)]) then
Key:=#0;
end;

procedure TForm2.txtSetorKeyPress(Sender: TObject; var Key: Char);
begin
if (Key in [ chr(39)]) then
Key:=#0;
end;

procedure TForm2.txtContatoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key in [ chr(39)]) then
Key:=#0;
end;

procedure TForm2.txtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key in [ chr(39)]) then
Key:=#0;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
txtRamal.SetFocus;
end;

end.

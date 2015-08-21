unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TForm7 = class(TForm)
    GroupBox1: TGroupBox;
    DBNum_Ordem: TDBEdit;
    Num_Ordem: TLabel;
    Label1: TLabel;
    DBDescricao: TDBEdit;
    Label2: TLabel;
    DBData_Solicitada: TDBEdit;
    Label3: TLabel;
    DBData_Inicio: TDBEdit;
    Label4: TLabel;
    DBSolicitante: TDBEdit;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    GroupBox4: TGroupBox;
    DBMemo2: TDBMemo;
    Image1: TImage;
    LBSTATUS: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

uses Unit4, Unit6;

procedure MakeRounded(Control: TWinControl);
var
R: TRect;
Rgn: HRGN;
begin
with Control do
begin
 R := ClientRect;
 rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 80, 80);
 Perform(EM_GETRECT, 0, lParam(@r));
 InflateRect(r, - 5, - 5);
 Perform(EM_SETRECTNP, 0, lParam(@r));
 SetWindowRgn(Handle, rgn, True);
 Invalidate;
end;
end;

procedure TForm7.FormShow(Sender: TObject);
const
clPaleRed = TColor($CCCCFF);
begin
MakeRounded(panel1);
if form4.ADOQuery1status.Value = 'Solicitado' then
begin
panel1.Color := clred;
panel1.Hint := 'Chamado Solicitado' ;
statusbar1.Panels[1].Text := 'Chamado Solicitado!';
LBSTATUS.Caption := 'Solicitado';
LBSTATUS.Font.Color := clred;
end
else
if form4.ADOQuery1status.Value = 'fechado' then
begin
  panel1.Color := clMoneyGreen;
  panel1.Hint := 'Chamado Conlcuído' ;
  statusbar1.Panels[1].Text := 'Chamado Conlcuído!';
LBSTATUS.Caption := 'Fechado';
LBSTATUS.Font.Color := clmoneygreen;
  end
else
if form4.ADOQuery1status.Value = 'aberto' then
begin
  panel1.Color := clPaleRed;
  panel1.Hint := 'Chamado Aberto e sendo analisado' ;
   statusbar1.Panels[1].Text := 'Chamado Aberto e sendo analisado!';
   LBSTATUS.Caption := 'Aberto';
LBSTATUS.Font.Color := clpalered;
end
else
if form4.ADOQuery1status.value = 'externo' then
begin
  panel1.Color := claqua;
  panel1.Hint := 'Chamado enviado para serviço externo' ;
  statusbar1.Panels[1].Text := 'Chamado enviado para serviço externo!';
  LBSTATUS.Caption := 'Externo';
LBSTATUS.Font.Color := claqua;
end
else
if form4.ADOQuery1status.Value = 'aguardando' then
begin
  panel1.Color := clyellow;
  panel1.Hint := 'Chamado em espera, verifique se há mensagens' ;
  statusbar1.Panels[1].Text := 'Chamado em espera, verifique se há mensagens!';
  LBSTATUS.Caption := 'Aguardando';
LBSTATUS.Font.Color := clyellow;
  end;
statusbar1.Panels[0].Text := 'Nº OS: ' + DBNum_Ordem.Text;

end;

procedure TForm7.Image1Click(Sender: TObject);
begin
form6.show;
end;

end.

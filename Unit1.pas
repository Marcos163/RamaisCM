unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, DB, ADODB, Grids, DBGrids, StdCtrls, Mask,
  DBCtrls, XPMan, Buttons, Vcl.Menus;

type
  TForm1 = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1Ramal: TWideStringField;
    ADOQuery1Setor: TWideStringField;
    ADOQuery1Descricao: TWideStringField;
    ADOQuery1Contato: TWideStringField;
    XPManifest1: TXPManifest;
    GroupBox2: TGroupBox;
    Button2: TButton;
    psqRamal: TEdit;
    psqContato: TEdit;
    Button3: TButton;
    psqSetor: TEdit;
    Button4: TButton;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    SpeedButton1: TSpeedButton;
    MainMenu1: TMainMenu;
    Chamados1: TMenuItem;
    AbrirChamados1: TMenuItem;
    ChamadosAbertos1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    rdRamais: TRadioButton;
    rdContato: TRadioButton;
    rdSetor: TRadioButton;
    edtsearch: TEdit;
    btnSearch: TSpeedButton;
    config: TSpeedButton;
    adSenha: TADOQuery;
    adSenhasenha: TStringField;
    AdAtivo: TADOQuery;
    AdAtivoSituacao: TStringField;
    DataSource2: TDataSource;
    timerAtivo: TTimer;
    adUsers: TADOQuery;
    adUsersCod_Acesso: TAutoIncField;
    adUsersPC_Acesso: TStringField;
    adUsersAtivo: TStringField;
    EDTnOME: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure configClick(Sender: TObject);
    procedure psqRamalKeyPress(Sender: TObject; var Key: Char);
    procedure psqContatoKeyPress(Sender: TObject; var Key: Char);
    procedure psqSetorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AbrirChamados1Click(Sender: TObject);
    procedure ChamadosAbertos1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Sobre1Click(Sender: TObject);
    procedure rdRamaisClick(Sender: TObject);
    procedure rdContatoClick(Sender: TObject);
    procedure rdSetorClick(Sender: TObject);
    procedure edtsearchKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure timerAtivoTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit5, Unit4, Unit6, frmAbout;

{$R *.dfm}

function GetComputerNameFunc : string;
var ipbuffer : string;
      nsize : dword;
begin
   nsize := 255;
   SetLength(ipbuffer,nsize);
   if GetComputerName(pchar(ipbuffer),nsize) then
      result := ipbuffer;
end;

Function GetNetUserName: string;
Var
  NetUserNameLength: DWord;
Begin
  NetUserNameLength:=50;
  SetLength(Result, NetUserNameLength);
  GetUserName(pChar(Result),NetUserNameLength);
  SetLength(Result, StrLen(pChar(Result)));
End;

procedure TForm1.AbrirChamados1Click(Sender: TObject);
begin
form5.show;
form4.ADOQuery1.Append;
form5.DBSetor.Text := getnetusername;
form5.DBStatus.Text := 'Solicitado';
form5.edtData.Text := DateToStr(Date);//FormatDateTime('dd/mm/yyyy',Date);
form5.DBData.Text := DateToStr(date);//FormatDateTime('yyyy-mm-dd', StrToDate(form5.edtData.text));
form5.DBHora.Text := TimetoStr(time);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.Active := false;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from Ramais where Ramal LIKE ''%' + psqRamal.Text+ '%'' ');
adoquery1.Open;
adoquery1.Active := true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.Active := false;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from Ramais where Contato LIKE ''%'+ psqcontato.Text+'%''' );
adoquery1.Open;
adoquery1.Active := true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if (psqSetor.text = 'desbloquear') and (config.Visible = false) then
begin
config.Visible := true;
end
else
begin
config.Visible := false;
end;

adoquery1.Close;
adoquery1.Active := false;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from Ramais where Setor LIKE ''%' + psqSetor.Text+ '%''');
adoquery1.Open;
adoquery1.Active := true;
end;

procedure TForm1.ChamadosAbertos1Click(Sender: TObject);
begin
form4.ADOQuery1.Close;
form4.adoQuery1.Active := false;
form4.adoquery1.sql.Clear;
form4.adoquery1.SQL.Add('select * from OS where Setor = ' + quotedstr(GetNetUserName));
form4.ADOQuery1.Open;
form4.ADOQuery1.Active := true;
form4.Timer1.Enabled := true;
form6.timer1.enabled := true;
form4.Show;
form4.D1.Date := now;

end;

procedure TForm1.configClick(Sender: TObject);
begin
if inputbox('Autenticação','Senha:','') = adsenhasenha.Value then
begin
form1.Hide;
form3.show;
end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (ADOQUERY1.Sort<>column.FieldName+' ASC') then
   begin
   ADOQUERY1.Sort:=column.FieldName+' ASC';
   ADOQUERY1.First;
  end
  else
  begin
	 ADOQUERY1.Sort:=column.fieldname+' DESC';
	 ADOQUERY1.First;
  end;
end;

procedure TForm1.edtsearchKeyPress(Sender: TObject; var Key: Char);
begin
if (Key in [ chr(39)]) then
Key:=#0;
if (Key in [chr(13)]) then
btnSearch.Click;
end;

procedure TForm1.psqRamalKeyPress(Sender: TObject; var Key: Char);
begin
if True then

if not (Key in ['0'..'9', chr(8), chr(13)]) then
Key:=#0;
if (Key in [chr(13)]) then
button2.Click;
end;

procedure TForm1.psqContatoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key in [ chr(39)]) then 
Key:=#0;
if (Key in [chr(13)]) then
button3.Click;
end;

procedure TForm1.psqSetorKeyPress(Sender: TObject; var Key: Char);
begin
if (Key in [ chr(39)]) then 
Key:=#0;
if (Key in [chr(13)]) then
button4.Click;
end;

procedure TForm1.rdContatoClick(Sender: TObject);
begin
edtsearch.NumbersOnly := false;
edtsearch.Clear;
edtsearch.SetFocus;
end;

procedure TForm1.rdRamaisClick(Sender: TObject);
begin
edtsearch.NumbersOnly := true;
edtsearch.Clear;
edtsearch.SetFocus;
end;

procedure TForm1.rdSetorClick(Sender: TObject);
begin
edtsearch.NumbersOnly := false;
edtsearch.Clear;
edtsearch.SetFocus;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
adusers.Active := false;
adusers.SQL.Clear;
adusers.SQL.Add('select * from Acesso where Cod_Acesso = '+form3.nAcesso.Caption);
adusers.Active := true;
adusers.Edit;
adusersAtivo.Value := 'I';
adusers.Post;
end;

procedure TForm1.FormShow(Sender: TObject);
var Cont : integer;
begin
edtsearch.SetFocus;
EDTNOME.Text := getcomputernamefunc;
adusers.Active := false;
adusers.SQL.Clear;
adusers.SQL.Add('select * from Acesso where PC_Acesso =' + quotedStr(edtnome.Text) );
adusers.Active := true;
cont := adusers.RecordCount;
if cont <=0 then
begin
adusers.Append;
adUsersPC_Acesso.Value := getcomputernamefunc;
AdUsersAtivo.Value := 'A';
adusers.Post;
form3.nAcesso.Caption := IntToStr(adusersCod_Acesso.Value);
end
else
begin
  form3.nAcesso.Caption := inttostr(adusersCod_Acesso.Value);
  adusers.Edit;
  adusersAtivo.Value := 'A';
  adusers.Post;
end;
end;

procedure TForm1.Sobre1Click(Sender: TObject);
begin
form9.show;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
messagedlg('               Ramais Centro Médico Sorocaba' + chr(13) + chr(13) + 'Desenvolvido por: Marcos Rogério' + chr(13) +
 'Setor: Tecnologia em Equipamentos e Sistemas' + chr(13) + 'Ramal: 0898', mtInformation, [mbOk],0);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
if rdramais.Checked = true then
begin

adoquery1.Close;
adoquery1.Active := false;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from Ramais where Ramal LIKE ''%' + edtsearch.Text+ '%'' ');
adoquery1.Open;
adoquery1.Active := true;
end ;
 if rdcontato.Checked = true then
     begin

      adoquery1.Close;
      adoquery1.Active := false;
      adoquery1.SQL.Clear;
      adoquery1.SQL.Add('select * from Ramais where Contato LIKE ''%'+ edtsearch.Text+'%''' );
      adoquery1.Open;
      adoquery1.Active := true;
     end ;
     if rdSetor.Checked = true then

     begin

      adoquery1.Close;
      adoquery1.Active := false;
      adoquery1.SQL.Clear;
      adoquery1.SQL.Add('select * from Ramais where Setor LIKE ''%' + edtsearch.Text+ '%''');
      adoquery1.Open;
      adoquery1.Active := true;
     end;
end;

procedure TForm1.timerAtivoTimer(Sender: TObject);
begin
adativo.Active := false;
adativo.Active := true;
if adativoSituacao.Value = 'f' then
begin
  form1.close;
end;
end;

end.

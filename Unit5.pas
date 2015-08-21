unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, IdBaseComponent, IdComponent, IdIPWatch,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage;

type
  TForm5 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBSetor: TDBEdit;
    Button2: TButton;
    DBStatus: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBData: TDBEdit;
    DBHora: TDBEdit;
    Label4: TLabel;
    DBSolicitante: TDBEdit;
    DBEquipamento: TDBEdit;
    GroupBox2: TGroupBox;
    RDImpressora: TRadioButton;
    RDComputador: TRadioButton;
    RDCopiadora: TRadioButton;
    RDMonitor: TRadioButton;
    RDTeclado: TRadioButton;
    RDMouse: TRadioButton;
    RDScanner: TRadioButton;
    RDSpeech: TRadioButton;
    RDNotebook: TRadioButton;
    RDNobreak: TRadioButton;
    RDEquipamentosMedicos: TRadioButton;
    RDServidor: TRadioButton;
    RDInternet: TRadioButton;
    RDRelogio: TRadioButton;
    RDEV: TRadioButton;
    RDSAC: TRadioButton;
    RDArya: TRadioButton;
    RDSuite: TRadioButton;
    RDRamais: TRadioButton;
    RDSites: TRadioButton;
    EdtGuiche: TEdit;
    LBGuiche: TLabel;
    Label5: TLabel;
    DBDescricao: TDBEdit;
    GroupBox3: TGroupBox;
    DBProblema: TDBMemo;
    Button1: TButton;
    RDSoftwares: TRadioButton;
    RDPET: TRadioButton;
    RDOutros: TRadioButton;
    RDAlteracao: TRadioButton;
    OpenDialog1: TOpenDialog;
    lbAnexo: TLabel;
    GroupBox4: TGroupBox;
    imgAnexo: TImage;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    edtData: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RDImpressoraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtGuicheChange(Sender: TObject);
    procedure RDComputadorClick(Sender: TObject);
    procedure RDCopiadoraClick(Sender: TObject);
    procedure RDMonitorClick(Sender: TObject);
    procedure RDTecladoClick(Sender: TObject);
    procedure RDMouseClick(Sender: TObject);
    procedure RDScannerClick(Sender: TObject);
    procedure RDSpeechClick(Sender: TObject);
    procedure RDNotebookClick(Sender: TObject);
    procedure RDNobreakClick(Sender: TObject);
    procedure RDEquipamentosMedicosClick(Sender: TObject);
    procedure RDServidorClick(Sender: TObject);
    procedure RDInternetClick(Sender: TObject);
    procedure RDRelogioClick(Sender: TObject);
    procedure RDEVClick(Sender: TObject);
    procedure RDSACClick(Sender: TObject);
    procedure RDAryaClick(Sender: TObject);
    procedure RDSuiteClick(Sender: TObject);
    procedure RDRamaisClick(Sender: TObject);
    procedure RDSitesClick(Sender: TObject);
    procedure RDSoftwaresClick(Sender: TObject);
    procedure RDPETClick(Sender: TObject);
    procedure RDOutrosClick(Sender: TObject);
    procedure RDAlteracaoClick(Sender: TObject);
    procedure imgAnexoClick(Sender: TObject);
  private
    { Private declarations }
    IP : String;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses Unit1, Unit4, Unit8;

procedure Unchecked;
begin
  form5.RDImpressora.Checked  := false;
    form5.RDComputador.Checked := false;
    form5.RDCopiadora.Checked := false;
    form5.RDMonitor.Checked := false;
    form5.RDTeclado.Checked := false;
    form5.RDMouse.Checked := false;
    form5.RDScanner.Checked := false;
    form5.RDSpeech.Checked := false;
    form5.RDNotebook.Checked := false;
    form5.RDNobreak.Checked := false;
    form5.RDEquipamentosMedicos.Checked := false;
    form5.RDServidor.Checked := false;
    form5.RDInternet.Checked := false;
    form5.RDRelogio.Checked := false;
    form5.RDEV.Checked := false;
    form5.RDSAC.Checked := false;
    form5.RDArya.Checked := false;
    form5.RDSuite.Checked := false;
    form5.RDRamais.Checked := false;
    form5.RDSites.Checked := false;
    form5.RDSoftwares.Checked := false;
    form5.RDOutros.Checked := false;
    form5.RDPET.Checked := false;
    form5.RDAlteracao.Checked := false;
    form5.EdtGuiche.Text := '';
end;

procedure RDsVisible;
begin
    form5.RDImpressora.visible := true;
    form5.RDComputador.visible := true;
    form5.RDCopiadora.visible := true;
    form5.RDMonitor.visible := true;
    form5.RDTeclado.visible := true;
    form5.RDMouse.visible := true;
    form5.RDScanner.visible := true;
    form5.RDSpeech.visible := true;
    form5.RDNotebook.visible := true;
    form5.RDNobreak.visible := true;
    form5.RDEquipamentosMedicos.visible := true;
    form5.RDServidor.visible := true;
    form5.RDInternet.visible := true;
    form5.RDRelogio.visible := true;
    form5.RDEV.visible := true;
    form5.RDSAC.visible := true;
    form5.RDArya.visible := true;
    form5.RDSuite.visible := true;
    form5.RDRamais.visible := true;
    form5.RDSites.visible := true;
    form5.DBProblema.Enabled := true;
    form5.RDSoftwares.Visible := true;
    form5.RDOutros.Visible := true;
    form5.RDPET.Visible := true;
    form5.RDAlteracao.Visible := true;
    form5.imgAnexo.Visible := true;
end;
procedure RDsInvisible;
begin
    form5.RDImpressora.visible := false;
    form5.RDComputador.visible := false;
    form5.RDCopiadora.visible := false;
    form5.RDMonitor.visible := false;
    form5.RDTeclado.visible := false;
    form5.RDMouse.visible := false;
    form5.RDScanner.visible := false;
    form5.RDSpeech.visible := false;
    form5.RDNotebook.visible := false;
    form5.RDNobreak.visible := false;
    form5.RDEquipamentosMedicos.visible := false;
    form5.RDServidor.visible := false;
    form5.RDInternet.visible := false;
    form5.RDRelogio.visible := false;
    form5.RDEV.visible := false;
    form5.RDSAC.visible := false;
    form5.RDArya.visible := false;
    form5.RDSuite.visible := false;
    form5.RDRamais.visible := false;
    form5.RDSites.visible := false;
    form5.DBProblema.Enabled := false;
    form5.RDSoftwares.Visible := false;
    form5.RDOutros.Visible := false;
    form5.RDPET.Visible := false;
    form5.RDAlteracao.Visible := false;
    form5.imgAnexo.Visible := false;
end;


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

procedure TForm5.Button1Click(Sender: TObject);
 var
IdMessage : TIdMessage;
IdSMTP : TIdSMTP;
begin
if (DBProblema.Text = '') or (DBSolicitante.Text = '') or (DBDescricao.Text = '') or (edtGuiche.Text = '') then
begin
 messagedlg('Verifique se todos os campos foram preenchidos corretamente!', mtInformation, [MBOk],0);
end
else
begin
 
//email
IdMessage := TIdMessage.Create(nil);

IdSMTP := TIdSMTP.Create(nil);
IdMessage.ContentType :=  'text/html'; // obrigatoriamente!
IdMessage.CharSet := 'ISO-8859-1';
IdMessage1.ContentTransferEncoding := '16bit';
IdMessage.From.Address := 'ouvidoria@centromedicosorocaba.com.br';//aqui vai o email que você quer que seja o remetente
IdMessage.Recipients.EMailAddresses := 'ouvidoria@centromedicosorocaba.com.br ; marcos@centromedicosorocaba.com.br ; lineu@centromedicosorocaba.com.br ; danilo@centromedicosorocaba.com.br ; wesllen@centromedicosorocaba.com.br ' ;// aqui vai o email do destinatário

idMessage.From.Name := 'Chamados Centro Médico Sorocaba';
IdMessage.Subject := dbdescricao.Text;// aqui informe o titulo
IdMessage.Body.Text :=( '<img src="http://cmedimage.ddns.net:8182/LOGO.png" height="48" width="200">' + '<br>' +'<b><i>Sistema de mensagem automática,</i></b>' + '<br>' +
'<b><i>você está recebendo esse e-mail com a notificação de um chamado, abaixo descrito:</i></b>' +
 '<br>'  + '<br>' + '<b>Setor: </b>' + DBSetor.Text + '<br>' + '<b>Data:</b> ' +
 DBData.Text + '<br>' + '<b>Hora:</b> ' + DBHora.Text + '<br>' + '<b>Solicitante:</b> ' +
 DBSolicitante.Text + '<br>' + '<b>Descrição do problema:</b> ' + DBDescricao.Text + '<br>' +
 '<b>Localidade:</b> ' + edtguiche.Text + '<br>' + '<b>Equipamento:</b> ' + DBequipamento.Text + '<br>' + '<br>' + '<br>' + '<b>Problema:</b> ' + dbproblema.Text +  '<br>' + '<br>' +
 '<b><i>A equipe de Tecnologia de Equipamentos e Sistemas agradece o empenho</b></i>' + '<br>'+ '<br>' + '<b><i>Ass:</b></i>' + '<br>'  + '<br>'
 + '<img src="http://cmedimage.ddns.net:8182/TES.jpg">' ) ;// aqui o conteudo do corpo do email



idsmtp1.Connect;
IdSMTP1.Authenticate;
IdSMTP1.Send(IdMessage);
IdSMTP1.Disconnect;

//bd

DBSetor.text := getnetusername;
form4.ADOQuery1.Append;
form5.Hide;
 end;



end;

procedure TForm5.Button2Click(Sender: TObject);
begin
form4.ADOQuery1.Cancel;
Unchecked;
form5.Hide;
end;

procedure TForm5.EdtGuicheChange(Sender: TObject);
begin
if EdtGuiche.Text <> '' then
begin
  RDsVisible;
  end
  else
  begin
  RDsInvisible;
end;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
RDsInvisible;
Unchecked;
end;

procedure TForm5.imgAnexoClick(Sender: TObject);
begin
if opendialog1.Execute then
  begin
  form4.ADOquery1Nome_Anexo.Value := opendialog1.FileName;
  form4.ADOquery1Nome_Anexo.Value := ExtractFileName(form4.ADOquery1Nome_Anexo.Value);
  form4.adoquery1anexo.LoadFromFile(OpenDialog1.FileName);
  lbanexo.caption := form4.ADOQuery1Nome_Anexo.Value;
  end;

end;

procedure TForm5.RDAlteracaoClick(Sender: TObject);
begin
DBEquipamento.Text := RDAlteracao.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
form8.show;
button1.Enabled := true;
end;

procedure TForm5.RDAryaClick(Sender: TObject);
begin
DBEquipamento.Text := RDArya.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDComputadorClick(Sender: TObject);
begin
DBEquipamento.Text := RDComputador.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;

end;

procedure TForm5.RDCopiadoraClick(Sender: TObject);
begin
 DBEquipamento.Text := RDCopiadora.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
 button1.Enabled := true;
end;

procedure TForm5.RDEquipamentosMedicosClick(Sender: TObject);
begin
DBEquipamento.Text := RDEquipamentosMedicos.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDEVClick(Sender: TObject);
begin
DBEquipamento.Text := RDEV.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDImpressoraClick(Sender: TObject);
begin

DBEquipamento.Text := RDImpressora.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDInternetClick(Sender: TObject);
begin
DBEquipamento.Text := RDInternet.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDMonitorClick(Sender: TObject);
begin
DBEquipamento.Text := RDMonitor.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDMouseClick(Sender: TObject);
begin
DBEquipamento.Text := RDMouse.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDNobreakClick(Sender: TObject);
begin
DBEquipamento.Text := RDNobreak.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDNotebookClick(Sender: TObject);
begin
DBEquipamento.Text := RDNotebook.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDOutrosClick(Sender: TObject);
begin
DBEquipamento.Text := RDOutros.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDPETClick(Sender: TObject);
begin
DBEquipamento.Text := RDPET.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDRamaisClick(Sender: TObject);
begin
DBEquipamento.Text := RDRamais.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDRelogioClick(Sender: TObject);
begin
DBEquipamento.Text := RDRelogio.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDSACClick(Sender: TObject);
begin
DBEquipamento.Text := RDSAC.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDScannerClick(Sender: TObject);
begin
DBEquipamento.Text := RDScanner.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDServidorClick(Sender: TObject);
begin
DBEquipamento.Text := RDServidor.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDSitesClick(Sender: TObject);
begin
DBEquipamento.Text := RDSites.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDSoftwaresClick(Sender: TObject);
begin
DBEquipamento.Text := RDSoftwares.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDSpeechClick(Sender: TObject);
begin
DBEquipamento.Text := RDSpeech.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDSuiteClick(Sender: TObject);
begin
DBEquipamento.Text := RDSuite.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

procedure TForm5.RDTecladoClick(Sender: TObject);
begin
DBEquipamento.Text := RDTeclado.Caption + ' |' + ' Guichê: ' + EdtGuiche.Text + ' | Nome PC: ' + GetComputerNameFunc;
button1.Enabled := true;
end;

end.

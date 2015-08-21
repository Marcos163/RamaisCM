unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frmSub, frmExclFicha,
  frmTirarFalta, frmAlterDate, frmExclExame;

type
  TForm8 = class(TForm)
    GroupBox1: TGroupBox;
    RDSub: TRadioButton;
    rdExcExames: TRadioButton;
    rdExcFichas: TRadioButton;
    rdAlterDate: TRadioButton;
    rdFalta: TRadioButton;
    btnOk: TButton;
    FRMSubstituicao1: TFRMSubstituicao;
    frmExcluirFicha1: TfrmExcluirFicha;
    frmFalta1: TfrmFalta;
    frmExcluirExame1: TfrmExcluirExame;
    frmAlterarData1: TfrmAlterarData;
    procedure btnOkClick(Sender: TObject);
    procedure RDSubClick(Sender: TObject);
    procedure rdExcFichasClick(Sender: TObject);
    procedure rdExcExamesClick(Sender: TObject);
    procedure rdAlterDateClick(Sender: TObject);
    procedure rdFaltaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

uses Unit5;

procedure Limpar;
begin
  form8.frmSubstituicao1.edtCod.Text := '';
  form8.frmSubstituicao1.edtExameDe.Text := '';
  form8.frmSubstituicao1.edtExamePara.Text := '';
  form8.frmSubstituicao1.edtNome.Text := '';
  form8.frmExcluirFicha1.edtNome.Text := '';
  form8.frmExcluirFicha1.edtCod.Text := '';
  form8.frmFalta1.edtNome.Text := '';
  form8.frmFalta1.edtCod.Text := '';
  form8.frmFalta1.edtExame.Text := '';
  form8.frmExcluirExame1.edtNome.Text := '';
  form8.frmExcluirExame1.edtCod.Text := '';
  form8.frmExcluirExame1.edtExame1.Text := '';
  form8.frmExcluirExame1.edtExame2.Text := '';
  form8.frmExcluirExame1.edtExame3.Text := '';
  form8.frmExcluirExame1.edtExame4.Text := '';
  form8.frmExcluirExame1.edtExame5.Text := '';
  form8.frmExcluirExame1.edtExame6.Text := '';
  form8.frmAlterarData1.edtNome.Text := '';
  form8.frmAlterarData1.edtCod.Text := '';
  form8.frmAlterarData1.edtOldDate.Text := '';
  form8.frmAlterarData1.edtNewDate.Text := '';
  form8.frmExcluirFicha1.edtmotivo.Text := '';
  form8.frmExcluirexame1.edtmotivo.Text := '';
  end;

procedure TForm8.btnOkClick(Sender: TObject);
begin
if rdSub.Checked = true then
begin
  if (frmSubstituicao1.edtCod.Text = '') or (frmSubstituicao1.edtExameDe.Text = '') or (frmSubstituicao1.edtExamePara.Text = '')
  or (frmSubstituicao1.edtNome.Text = '') then
  begin
   messagedlg('Todos os campos são necessário!', mtError, [mbOk], 0);
  end
  else
  begin
   form5.DBProblema.Lines.Add('-===== Substituição de Laudos =====-');
   form5.DBProblema.Lines.Add('Nome: ' + frmSubstituicao1.edtNome.Text);
   form5.DBProblema.Lines.Add('Cod: ' + frmSubstituicao1.edtCod.Text);
   form5.DBProblema.Lines.Add('Passar laudo do: ' + frmSubstituicao1.edtExameDe.Text + ' para: ' + frmSubstituicao1.edtExamePara.Text);
    close;
 Limpar;
  end;

end;
  if frmSubstituicao1.chkExcluir.Checked = true then
  begin
    form5.DBProblema.Lines.Add('Excluir Exame após tranferir laudo.');
  end;
if rdExcExames.Checked = true then
begin
  if (frmExcluirExame1.edtNome.Text = '') or (frmExcluirExame1.edtCod.Text = '') or (frmExcluirExame1.edtExame1.Text = '') or (frmExcluirExame1.edtmotivo.Text = '')  then
  begin
     messagedlg('Todos os campos são necessário!', mtError, [mbOk], 0);
  end
  else
  begin
     form5.DBProblema.Lines.Add('-===== Exclusão de Exames =====-');
     form5.DBProblema.Lines.Add('Nome: ' + frmExcluirExame1.edtNome.Text );
     form5.DBProblema.Lines.Add('Código: ' + frmExcluirExame1.edtCod.Text);
     form5.DBProblema.Lines.Add('Exame: ' + frmExcluirExame1.edtExame1.Text + ' ' + frmExcluirExame1.edtExame2.Text + ' ' +
     frmExcluirExame1.edtExame3.Text + ' ' + frmExcluirExame1.edtExame4.Text + ' ' + frmExcluirExame1.edtExame5.Text +
      ' ' + frmExcluirExame1.edtExame6.Text);
     form5.DBProblema.Lines.Add('Motivo: ' + frmExcluirExame1.edtmotivo.Text );
      close;
 Limpar;
  end;
end;
if rdexcfichas.Checked = true then
begin
  if (frmexcluirficha1.edtNome.Text = '') or (frmexcluirficha1.edtCod.Text = '') or (frmExcluirficha1.edtmotivo.Text = '') then
  begin
     messagedlg('Todos os campos são necessário!', mtError, [mbOk], 0);
  end
  else
  begin
   form5.DBProblema.Lines.Add('-===== Exclusão de Ficha =====-');
     form5.DBProblema.Lines.Add('Nome: ' + frmExcluirFicha1.edtNome.Text );
     form5.DBProblema.Lines.Add('Código: ' + frmExcluirFicha1.edtCod.Text);
     form5.DBProblema.Lines.Add('Motivo: ' + frmExcluirFicha1.edtmotivo.Text );
     close;
 Limpar;
  end;

end;
if rdalterdate.Checked = true then
begin
  if (frmAlterarData1.edtNome.Text = '') or (frmAlterarData1.edtCod.Text = '') or (frmAlterarData1.edtOldDate.Text = '  /  /  ') or
  (frmAlterarData1.edtNewDate.Text = '  /  /  ') then
  begin
   messagedlg('Todos os campos são necessário!', mtError, [mbOk], 0);

  end
  else
  begin
   form5.DBProblema.Lines.Add('-===== Alterar Data =====-');
     form5.DBProblema.Lines.Add('Nome: ' + frmAlterarData1.edtNome.Text );
     form5.DBProblema.Lines.Add('Código: ' + frmAlterarData1.edtCod.Text);
     form5.DBProblema.Lines.Add('Data Antiga: ' + frmAlterarData1.edtOldDate.Text );
     form5.DBProblema.Lines.Add('Nova Data: ' + frmAlterarData1.edtNewDate.Text);
     close;
 Limpar;
  end;
end;
 if rdfalta.Checked = true then
 begin
   if (frmFalta1.edtNome.Text = '') or (frmFalta1.edtCod.Text = '') or (frmFalta1.edtExame.Text = '') then
   begin
     messagedlg('Todos os campos são necessário!', mtError, [mbOk], 0);
   end
   else
   begin
      form5.DBProblema.Lines.Add('-===== Tirar da Falta =====-');
     form5.DBProblema.Lines.Add('Nome: ' + frmFalta1.edtNome.Text );
     form5.DBProblema.Lines.Add('Código: ' + frmFalta1.edtCod.Text);
     form5.DBProblema.Lines.Add('Exame: ' + frmFalta1.edtExame.Text);
     close;
 Limpar;
   end;

 end;

end;

procedure TForm8.rdExcExamesClick(Sender: TObject);
begin
frmExcluirExame1.visible := true;
frmFalta1.visible := false;
frmAlterarData1.Visible := false;
frmExcluirFicha1.Visible := false;
frmsubstituicao1.Visible := false;
end;

procedure TForm8.rdExcFichasClick(Sender: TObject);
begin
frmExcluirExame1.visible := false;
frmFalta1.visible := false;
frmAlterarData1.Visible := false;
frmExcluirFicha1.Visible := true;
frmsubstituicao1.Visible := false;
end;

procedure TForm8.rdAlterDateClick(Sender: TObject);
begin
frmExcluirExame1.visible := false;
frmFalta1.visible := false;
frmAlterarData1.Visible := true;
frmExcluirFicha1.Visible := false;
frmsubstituicao1.Visible := false;
end;

procedure TForm8.rdFaltaClick(Sender: TObject);
begin
frmExcluirExame1.visible := false;
frmFalta1.visible := true;
frmAlterarData1.Visible := false;
frmExcluirFicha1.Visible := false;
frmsubstituicao1.Visible := false;
end;

procedure TForm8.RDSubClick(Sender: TObject);
begin
frmExcluirExame1.visible := false;
frmFalta1.visible := false;
frmAlterarData1.Visible := false;
frmExcluirFicha1.Visible := false;
frmsubstituicao1.Visible := true;
end;

end.

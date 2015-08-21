unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls;

type
  TForm4 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    StAberto: TRadioButton;
    StSolicitado: TRadioButton;
    StAguardando: TRadioButton;
    StFechado: TRadioButton;
    StMntExterna: TRadioButton;
    Button2: TButton;
    Image1: TImage;
    Image2: TImage;
    DBSolicitante: TDBEdit;
    DBStatus: TDBEdit;
    Timer1: TTimer;
    LBMSG: TLabel;
    ADOQuery1STMsg: TWideStringField;
    ADOQuery1Num_Ordem: TAutoIncField;
    ADOQuery1Prioridade_Alta: TBooleanField;
    ADOQuery1Prioridade_Media: TBooleanField;
    ADOQuery1Prioridade_Baixa: TBooleanField;
    ADOQuery1Data: TWideStringField;
    ADOQuery1Hora_Solicitada: TWideStringField;
    ADOQuery1Setor: TWideStringField;
    ADOQuery1Solicitante: TWideStringField;
    ADOQuery1Responsável: TWideStringField;
    ADOQuery1Equipamento: TWideStringField;
    ADOQuery1Descrição: TWideStringField;
    ADOQuery1Patrimônio: TWideStringField;
    ADOQuery1Marca: TWideStringField;
    ADOQuery1Modelo: TWideStringField;
    ADOQuery1Garantia: TBooleanField;
    ADOQuery1Contador: TWideStringField;
    ADOQuery1Defeito: TWideMemoField;
    ADOQuery1Servico_Executado: TWideMemoField;
    ADOQuery1ASS_Executante: TBlobField;
    ADOQuery1Corretiva: TBooleanField;
    ADOQuery1Preventiva: TBooleanField;
    ADOQuery1Hora_Inicio: TWideStringField;
    ADOQuery1Hora_Termino: TWideStringField;
    ADOQuery1Atividade: TWideStringField;
    ADOQuery1Tecnico: TWideStringField;
    ADOQuery1Status: TWideStringField;
    ADOQuery1Hora_Abertura: TWideStringField;
    ADOQuery1Hora_Inicio2: TWideStringField;
    ADOQuery1Hora_Termino2: TWideStringField;
    ADOQuery1Atividade2: TWideStringField;
    ADOQuery1Tecnico2: TWideStringField;
    ADOQuery1Tempo_Total2: TWideStringField;
    ADOQuery1Horia_Inicio3: TWideStringField;
    ADOQuery1Hora_Termino3: TWideStringField;
    ADOQuery1Atividade3: TWideStringField;
    ADOQuery1Tecnico3: TWideStringField;
    ADOQuery1Tempo_Total3: TWideStringField;
    ADOQuery1Hora_Inicio4: TWideStringField;
    ADOQuery1Hora_Termino4: TWideStringField;
    ADOQuery1Atividade4: TWideStringField;
    ADOQuery1Tecnico4: TWideStringField;
    ADOQuery1Tempo_Total4: TWideStringField;
    ADOQuery1Data_Abertura: TWideStringField;
    ADOQuery1Mensagem: TWideMemoField;
    ADOQuery1Anexo: TBlobField;
    ADOQuery1Nome_Anexo: TWideStringField;
    GroupBox2: TGroupBox;
    D1: TDateTimePicker;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    CheckBox2: TCheckBox;
    Button1: TButton;
    ADOQuery1TempoTotal: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit6, Unit7;
Function GetNetUserName: string;
Var
  NetUserNameLength: DWord;
Begin
  NetUserNameLength:=50;
  SetLength(Result, NetUserNameLength);
  GetUserName(pChar(Result),NetUserNameLength);
  SetLength(Result, StrLen(pChar(Result)));
End;

procedure TForm4.Button1Click(Sender: TObject);
begin
if checkbox2.Checked = false then
  begin
    if Staberto.Checked then
      begin
        form4.ADOQuery1.Close;
        form4.adoQuery1.Active := false;
        form4.adoquery1.sql.Clear;
          if checkbox1.Checked = true then
            form4.adoquery1.SQL.Add('select * from OS where data = ' +quotedstr(DateToStr(d1.Date))   +
            ' AND Setor = ' + quotedstr(GetNetUserName) + ' AND status = ' + quotedStr('aberto'))
          else
            form4.adoquery1.SQL.Add('select * from OS where Setor = ' + quotedstr(GetNetUserName) + ' AND status = ' + quotedStr('aberto'));

        form4.ADOQuery1.Open;
        form4.ADOQuery1.Active := true;

      end
      else
        if Stfechado.Checked then
          begin
            form4.ADOQuery1.Close;
            form4.adoQuery1.Active := false;
            form4.adoquery1.sql.Clear;
            if checkbox1.Checked = true then
            form4.adoquery1.SQL.Add('select * from OS where data = ' +quotedstr(DateToStr(d1.Date))   +
            ' AND Setor = ' + quotedstr(GetNetUserName) + ' AND status = ' + quotedStr('fechado'))
          else
            form4.adoquery1.SQL.Add('select * from OS where Setor = ' + quotedstr(GetNetUserName) + ' AND status = ' + quotedStr('fechado'));
            form4.ADOQuery1.Open;
            form4.ADOQuery1.Active := true;

        end
      else
        if Stsolicitado.Checked then
          begin
            form4.ADOQuery1.Close;
            form4.adoQuery1.Active := false;
            form4.adoquery1.sql.Clear;
            if checkbox1.Checked = true then
            form4.adoquery1.SQL.Add('select * from OS where data = ' +quotedstr(DateToStr(d1.Date))   +
            ' AND Setor = ' + quotedstr(GetNetUserName) + ' AND status = ' + quotedStr('Solicitado'))
          else
            form4.adoquery1.SQL.Add('select * from OS where Setor = ' + quotedstr(GetNetUserName) + ' AND status = ' + quotedStr('Solicitado'));
            form4.ADOQuery1.Open;
            form4.ADOQuery1.Active := true;

      end
    else
      if StMntExterna.Checked then
        begin
          form4.ADOQuery1.Close;
          form4.adoQuery1.Active := false;
          form4.adoquery1.sql.Clear;
          if checkbox1.Checked = true then
            form4.adoquery1.SQL.Add('select * from OS where data = #' +quotedstr(DateToStr(d1.Date))   +
            '# AND Setor = ' + quotedstr(GetNetUserName) + ' AND status = ' + quotedStr('externo'))
          else
          form4.adoquery1.SQL.Add('select * from OS where Setor = ' + quotedstr(GetNetUserName) + ' AND status = ' + quotedStr('externo'));
          form4.ADOQuery1.Open;
          form4.ADOQuery1.Active := true;

      end
    else
      if StAguardando.Checked then
        begin
          form4.ADOQuery1.Close;
          form4.adoQuery1.Active := false;
          form4.adoquery1.sql.Clear;
          if checkbox1.Checked = true then
            form4.adoquery1.SQL.Add('select * from OS where data = ' +quotedstr(DateToStr(d1.Date))   +
            ' AND Setor = ' + quotedstr(GetNetUserName) + ' AND status = ' + quotedStr('aguardando'))
          else
          form4.adoquery1.SQL.Add('select * from OS where Setor = ' + quotedstr(GetNetUserName) + ' AND status = ' + quotedStr('aguardando'));
          form4.ADOQuery1.Open;
          form4.ADOQuery1.Active := true;

      end;
  end
    else
      begin
        form4.ADOQuery1.Close;
        form4.adoQuery1.Active := false;
        form4.adoquery1.sql.Clear;
        form4.adoquery1.SQL.Add('select * from OS where Num_Ordem = ' + edit1.Text);
        form4.ADOQuery1.Open;
        form4.ADOQuery1.Active := true;
end;

end;

procedure TForm4.Button2Click(Sender: TObject);
begin
form4.ADOQuery1.Close;
form4.adoQuery1.Active := false;
form4.adoquery1.sql.Clear;
form4.adoquery1.SQL.Add('select * from OS where Setor = ' + quotedstr(GetNetUserName) );
form4.ADOQuery1.Open;
form4.ADOQuery1.Active := true;
end;

procedure TForm4.CheckBox1Click(Sender: TObject);
begin
  if (checkbox1.Checked = true)  then
    begin
      d1.Enabled := true;
      checkbox2.Checked := false;
    end
    else
      begin
        d1.Enabled := false;
      end;
end;

procedure TForm4.CheckBox2Click(Sender: TObject);
begin
begin
if checkbox2.Checked = true then
begin
edit1.Enabled := true;
checkbox1.Checked := false;
end
else
begin
  edit1.Enabled := false;

end;
end;

end;

procedure TForm4.DBGrid1DblClick(Sender: TObject);
begin
if adoquery1.RecordCount > 0 then
begin
form7.show;
form7.Caption := 'Detalhes OS: '+ IntToStr(adoquery1Num_Ordem.Value);
if dbstatus.Text = 'usuario' then
begin
form7.Caption := 'Detalhes OS: '+ IntToStr(adoquery1Num_Ordem.Value) + ' - Você possui novas mensagens!';
end;
end;
end;


procedure TForm4.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);

const

clPaleGreen = TColor($CCFFCC);

clPaleRed = TColor($CCCCFF);

begin
 //deixa o dbgrid zebrado
if  (Column.FieldName = 'Data') or (Column.FieldName = 'Equipamento') or (Column.FieldName = 'Num_Ordem') or (Column.FieldName = 'Hora_Solicitada') or (Column.FieldName = 'Descrição') or (Column.FieldName = 'Setor') or (Column.FieldName = 'Solicitante') then

if not Odd (ADOQuery1.RecNo) then
begin
DBGrid1.Canvas.Brush.Color := clblue;
DBGrid1.canvas.Font.Color := clwhite;
DBGrid1.Canvas.FillRect(Rect);
DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State);
end
else
begin
 DBGrid1.Canvas.Brush.Color := clwhite;
DBGrid1.canvas.Font.Color := clblack;
DBGrid1.Canvas.FillRect(Rect);
DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State);
end;

if (gdSelected in State) then
begin
  DBGrid1.Canvas.Brush.Color := clsilver;
DBGrid1.canvas.Font.Color := clblack;
DBGrid1.Canvas.FillRect(Rect);
DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State);
end;

begin

If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha
If Column.Field.Dataset.FieldbyName('Status').AsString = 'aberto'

then

If (gdFocused in State) //Verifica se a célula está no foco.

then DBGrid1.canvas.brush.color := clBlack

else DBGrid1.canvas.brush.color := clpalered;

//Agora vamos colorir a célula utilizando o método Defaut:

DBGrid1.DefaultDrawColumnCell(rect,DataCol,Column,State)

end;
begin

If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha
If Column.Field.Dataset.FieldbyName('Status').AsString = 'Solicitado'

then

If (gdFocused in State) //Verifica se a célula está no foco.

then DBGrid1.canvas.brush.color := clBlack

else DBGrid1.canvas.brush.color := clRed;

//Agora vamos colorir a célula utilizando o método Defaut:

DBGrid1.DefaultDrawColumnCell(rect,DataCol,Column,State)

end;
begin

If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha
If Column.Field.Dataset.FieldbyName('Status').AsString = 'aguardando'

then

If (gdFocused in State) //Verifica se a célula está no foco.

then DBGrid1.canvas.brush.color := clBlack

else DBGrid1.canvas.brush.color := clYellow;

//Agora vamos colorir a célula utilizando o método Defaut:

DBGrid1.DefaultDrawColumnCell(rect,DataCol,Column,State)

end;
begin

If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha
If Column.Field.Dataset.FieldbyName('Status').AsString = 'externo'

then

If (gdFocused in State) //Verifica se a célula está no foco.

then DBGrid1.canvas.brush.color := clBlack

else DBGrid1.canvas.brush.color := claqua;

//Agora vamos colorir a célula utilizando o método Defaut:

DBGrid1.DefaultDrawColumnCell(rect,DataCol,Column,State)

end;

begin

If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha



If Column.Field.Dataset.FieldbyName('Status').AsString = 'fechado'

then

If (gdFocused in State) //Verifica se a célula está no foco.

then DBGrid1.canvas.brush.color := clBlack

else DBGrid1.canvas.brush.color := clpalegreen;

//Agora vamos colorir a célula utilizando o método Defaut:

DBGrid1.DefaultDrawColumnCell(rect,DataCol,Column,State)

end;


If adoquery1stmsg.value = 'usuario' then

Dbgrid1.Canvas.Font.Color:= clRed;

Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);

if adoquery1stmsg.value = 'TI' then

Dbgrid1.Canvas.Font.Color:= clGreen;

Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);




end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
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
procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  timer1.Enabled := false;
  form6.Timer1.Enabled := false;
end;

procedure TForm4.Image2Click(Sender: TObject);
begin
if adoquery1.RecordCount = 0 then
begin
    showmessage('Selecione o chamado que deseja enviar mensagem!');
end
else
begin
adoquery1.Refresh;
form6.show;
form6.EdtMsg.SetFocus;

end;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
//form4.ADOQuery1.Refresh;
if dbstatus.Text = 'usuario' then
begin
  LBMSG.Visible := true;
end
else
begin
 LBMSG.Visible := false;

end;

end;

end.

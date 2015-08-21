unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TForm6 = class(TForm)
    DBMemo1: TDBMemo;
    Button1: TButton;
    EdtMsg: TEdit;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure EdtMsgKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses Unit4;

procedure TForm6.Button1Click(Sender: TObject);
begin
form4.ADOQuery1.Edit;
DBMemo1.Lines.Add(TimeToStr(Time) + ' - ' + form4.DBsolicitante.text + ':  ' + edtmsg.Text);
form4.DBStatus.Text := 'TI';
form4.ADOQuery1.Post;
edtmsg.Text := '';
end;

procedure TForm6.EdtMsgKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
button1.Click;
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
begin
form4.ADOQuery1.Refresh;
end;

procedure TForm6.SpeedButton2Click(Sender: TObject);
begin
form4.ADOQuery1.Post;
end;

end.

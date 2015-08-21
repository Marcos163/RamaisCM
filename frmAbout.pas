unit frmAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.XPMan,
  Vcl.Imaging.jpeg;

type
  TForm9 = class(TForm)
    Timer1: TTimer;
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    LinkLabel1: TLinkLabel;
    Panel3: TPanel;
    Image2: TImage;
    LinkLabel2: TLinkLabel;
    Label1: TLabel;
    procedure FormClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
alphablendvalue := 255;
end;

procedure TForm9.FormClick(Sender: TObject);
begin
timer1.Enabled := true;
end;

procedure TForm9.Image1Click(Sender: TObject);
begin
form9.Click;
end;

procedure TForm9.Panel1Click(Sender: TObject);
begin
form9.Click;
end;

procedure TForm9.Timer1Timer(Sender: TObject);
begin
if alphablendvalue > 0 then
begin
  alphablendvalue := alphablendvalue - 1;

  end
  else
    begin
      close;
      alphablendvalue := 255;
      timer1.Enabled := false;
    end;
end;

end.

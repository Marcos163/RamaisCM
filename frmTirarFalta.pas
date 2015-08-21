unit frmTirarFalta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmFalta = class(TFrame)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TEdit;
    edtCod: TEdit;
    Label4: TLabel;
    edtExame: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

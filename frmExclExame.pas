unit frmExclExame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmExcluirExame = class(TFrame)
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edtNome: TEdit;
    edtCod: TEdit;
    edtExame1: TEdit;
    edtExame2: TEdit;
    edtExame3: TEdit;
    edtExame4: TEdit;
    edtExame5: TEdit;
    edtExame6: TEdit;
    Label5: TLabel;
    edtmotivo: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

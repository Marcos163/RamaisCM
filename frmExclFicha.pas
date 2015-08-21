unit frmExclFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmExcluirFicha = class(TFrame)
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    edtCod: TEdit;
    Label3: TLabel;
    edtmotivo: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

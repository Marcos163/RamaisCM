unit frmSub;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFRMSubstituicao = class(TFrame)
    edtCod: TEdit;
    lbCodAtend: TLabel;
    Label1: TLabel;
    edtExameDe: TEdit;
    lbPara: TLabel;
    edtExamePara: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    chkExcluir: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

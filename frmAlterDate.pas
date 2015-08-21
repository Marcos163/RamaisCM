unit frmAlterDate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls;

type
  TfrmAlterarData = class(TFrame)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TEdit;
    edtCod: TEdit;
    edtOldDate: TMaskEdit;
    Label4: TLabel;
    edtNewDate: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

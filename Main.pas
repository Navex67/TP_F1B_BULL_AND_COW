unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

const
  MOTMAX=10;
type
  TForm1 = class(TForm)
    EMot: TEdit;
    Label1: TLabel;
    EBulls: TEdit;
    ECows: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    BCheck: TButton;
    BRaz: TButton;
    BQuit: TButton;
    MDico: TMemo;
    ETry: TEdit;
    LEssai: TLabel;
    EFind: TEdit;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BRazClick(Sender: TObject);
    procedure BQuitClick(Sender: TObject);
    procedure BCheckClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  Entrermot:string;
  MotJuste:string;
  nbBull,nbCow,Essai:integer;


implementation

{$R *.dfm}



procedure Essais(MotJuste:string; var Essai:integer);
 // procedure pour selon le mot afficher le nombre d'essai dispo
begin
  case length(MotJuste) of
    3: Essai:=4;
    4: Essai:=7;
    5: Essai:=10;
    6: Essai:=16;
    7: Essai:=20;
  end;
end;

procedure VerifMot(var nbBull:integer; var nbCow:integer; var Entremot,Motjuste:string);
//procedure de test pour vérifier si la lettre est un bull ou un cow
var
i,j:integer;
TestLettre:boolean;
TestBull:boolean;

begin
  nbBull:=0;
  nbCow:=0;

  for I := 1 to length(Entrermot) do
    begin
      for J := 1 to length(Motjuste) do
          begin
            Testlettre:=false;
            testBull:=false;
            if (copy(Entrermot,I,1)=copy(Motjuste,J,1)) then
              begin
                Testlettre:=true;
              end;
            if (testlettre=true) and (I=J) then
            begin
              nbBull:=nbBull+1;
              testBull:=true
            end;
            if (testlettre=true) and (testBull=false) then
              nbCow:=nbCow+1;
          end;
    end;
end;

procedure TForm1.BCheckClick(Sender: TObject);
//procedure quand a chaque clique sur check verifie le contenue
begin
  Entrermot:=lowercase(EMot.Text);
  VerifMot(nbBull,nbCow,Entrermot,Motjuste);
  EBulls.Text:=inttostr(nbBull);
  ECows.Text:=inttostr(nbCow);

end;

procedure TForm1.BQuitClick(Sender: TObject);
begin
      close;
end;

procedure TForm1.BRazClick(Sender: TObject);
begin
      EMot.Text:='';
      EBulls.Text:='';
      ECows.Text:='';


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    MDico.Lines.LoadFromFile('Dico.txt');
    MotJuste:=MDico.Lines[random(MOTMAX+1)];
    EFind.Text:=Motjuste;
    Essais(MotJuste,Essai);
    ETry.Text:=inttostr(Essai);
end;

end.

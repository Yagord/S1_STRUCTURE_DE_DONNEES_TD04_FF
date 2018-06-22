program SD_TD04_EX_UNIT_VERSION4;

{$APPTYPE CONSOLE}

{$R *.res}

uses                           //File
  System.SysUtils,
  Unit_SD_TD04_EX_UNIT_VERSION4 in 'Unit_SD_TD04_EX_UNIT_VERSION4.pas';

Var
  p : TFile;
  cpt : Integer;
  nb : Integer;
  valeur : TData;
  res : Boolean;
  valeurContenue : TData;

begin

  valeurContenue.val := -1;

  init(p);

  writeln('Est-ce que la pile est vide?');

  if estVide(p)= True then
  begin
    writeln('Oui, la pile est vide.');
  end
  else
  begin
    writeln('Non, la pile n''est pas vide.');
  end;

  writeln('Combien de valeur souhaitez-vous ajouter à la pile?');
  readln(nb);

  for cpt := 1 to nb do
  begin
    writeln('Saisir la valeur :');
    readln(valeur.val);
    emfile(p, valeur);
  end;

  sommet(p, valeurContenue, res);
  if res = True then
  begin
    writeln('La valeur du sommet de cette pile est : ', valeurContenue.val);
  end
  else
  begin
    writeln('Il n''y a pas de sommet car la pile est vide.');
  end;

  dernier(p, valeurContenue, res);
  if res = True then
  begin
    writeln('La valeur du dernier de cette pile est : ', valeurContenue.val);
  end
  else
  begin
    writeln('Il n''y a pas de sommet car la pile est vide.');
  end;

  defile(p, valeurContenue, res);
  writeln('La valeur supprimée au sommet de la pile est : ', valeurContenue.val);
  if res = True then
  begin
    sommet(p, valeurContenue, res);
    writeln('La valeur du nouveau sommet de cette pile est : ', valeurContenue.val);
  end
  else
  begin
    writeln('On ne peut pas depiler une pile vide.');
  end;

  writeln(chr(10));

  writeln('Le contenue de la pile dans l''ordre :');
  afficheOrdre(p);

  writeln('Le contenue de la pile dans l''ordre inverse :');
  afficheOrdreInverse(p);

  readln;

end.


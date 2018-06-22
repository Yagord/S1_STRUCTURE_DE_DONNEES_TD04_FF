program SD_TD04_EX_UNIT;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit_SD_TD04_EX_UNIT in 'Unit_SD_TD04_EX_UNIT.pas';

Var
  liste : PPile;
  cpt : Integer;
  nb : Integer;
  valeur : Integer;
  res : Boolean;
  valeurContenue : Integer;

begin

  valeurContenue := -1;

  init(liste);

  writeln('Est-ce que la pile est vide?');

  if estVide(liste)= True then
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
    readln(valeur);
    empile(liste, valeur);
  end;

  sommet(liste, res, valeurContenue);
  if res = True then
  begin
    writeln('La valeur du sommet de cette pile est : ', valeurContenue);
  end
  else
  begin
    writeln('Il n''y a pas de sommet car la pile est vide.');
  end;

  depile(liste, res, valeurContenue);
  writeln('La valeur supprimée au sommet de la pile est : ', valeurContenue);
  if res = True then
  begin
    sommet(liste, res, valeurContenue);
    writeln('La valeur du nouveau sommet de cette pile est : ', valeurContenue);
  end
  else
  begin
    writeln('On ne peut pas depiler une pile vide.');
  end;

  writeln(chr(10));

  writeln('Le contenue de la pile :');
  affiche(liste);




  readln;

end.

unit Unit_SD_TD04_EX_UNIT;

interface

Type
  PPile = ^Pile;

  Pile = record
    valeur : Integer;
    suivant : PPile;
  end;

  Procedure init (var liste : PPile);

  Function estVide (liste : PPile) : Boolean;

  Procedure empile (var liste : PPile; valeur : Integer);

  Procedure depile (var liste : PPile; var res : Boolean; var valeur : Integer);

  Procedure sommet (liste : PPile; var res : Boolean; var valeur : Integer);

  Procedure affiche (liste : PPile);

    procedure vider(var liste: PPile);

implementation

  Procedure init (var liste : PPile);

  Var
    p : PPile;

  begin
    p := liste;
    liste:= NIL;
  end;

  Function estVide (liste : PPile) : Boolean;

  Var
    p : PPile;
    res : Boolean;

  begin
    p := liste;
    if  p = NIL then
    begin
      res := True;
    end
    else
    begin
      res := False;
    end;

    Result := res;

  end;

  Procedure empile (var liste : PPile; valeur : Integer);

  Var
    p : PPile;

  begin
    new(p);
    p^.valeur := valeur;
    p^.suivant := liste;
    liste := p;
  end;

  Procedure depile (var liste : PPile; var res : Boolean; var valeur : Integer);

  Var
    p : PPile;
    r : PPile;

  begin

    if estVide(liste) = True then
    begin
      res := False;
      valeur := -1;
    end

    else
    begin
      p := liste;

      res := True;
      valeur := p^.valeur;

      r := p^.suivant;
      dispose(p);
      p := r;
    end;

  end;


  Procedure sommet (liste : PPile; var res : Boolean; var valeur : Integer);

  Var
    p : PPile;

  begin

    if estVide(liste) = True then
    begin
      res := False;
      valeur := -1;
    end

    else
    begin
      p := liste;

      res := True;
      valeur := p^.valeur;
    end;

  end;


  Procedure affiche (liste : PPile);

  Var
    p : PPile;

  begin

    if estVide(liste) = True then
    begin
      writeln('La pile est vide.');
    end

    else
    begin
      p := liste;

      while p <> NIl do
      begin
        writeln(p^.valeur);
        p := p^.suivant;
      end;

    end;

  end;


  Procedure vider(var liste: PPile);
  Var
    p, r: PPile;
  begin
    p := liste;
    while (p <> NIL) do
    begin
      r := p^.suivant;
      dispose(p);
      p := r;
    end;
    liste := NIL;
  end;




end.

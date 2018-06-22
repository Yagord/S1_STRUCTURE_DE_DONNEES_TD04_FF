unit Unit_SD_TD04_EX_UNIT_VERSION2;


interface

Type
  Pile = ^ElementPile;

  ElementPile = record
    valeur : Integer;
    suivant : Pile;
  end;

  Procedure init (var liste : Pile);

  Function estVide (liste : Pile) : Boolean;

  Function estVideSimple (liste : Pile) : Boolean;

  Procedure empile (var liste : Pile; valeur : Integer);

  Procedure depile (var liste : Pile; var res : Boolean; var valeur : Integer);

  Procedure sommet (liste : Pile; var res : Boolean; var valeur : Integer);

  Procedure affiche (liste : Pile);

    procedure vider(var liste: Pile);

implementation

  Procedure init (var liste : Pile);

  begin
    liste:= NIL;
  end;

  Function estVide (liste : Pile) : Boolean;

  Var
    p : Pile;
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

  Function estVideSimple (liste : Pile) : Boolean;

  begin
    Result := ((liste = NIL));
  end;

  Procedure empile (var liste : Pile; valeur : Integer);

  Var
    p : Pile;

  begin
    new(p);
    p^.valeur := valeur;
    p^.suivant := liste;
    liste := p;
  end;

  Procedure depile (var liste : Pile; var res : Boolean; var valeur : Integer);

  Var
    p : Pile;
    r : Pile;

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


  Procedure sommet (liste : Pile; var res : Boolean; var valeur : Integer);

  Var
    p : Pile;

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


  Procedure affiche (liste : Pile);

  Var
    p : Pile;

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


  Procedure vider (var liste: Pile);
  Var
    p, r: Pile;
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

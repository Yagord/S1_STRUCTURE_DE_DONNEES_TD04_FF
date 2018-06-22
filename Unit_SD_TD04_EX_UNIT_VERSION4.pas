unit Unit_SD_TD04_EX_UNIT_VERSION4;

interface

  type

    TData = record
      val : Integer;
    end;

    PItem = ^TItem;

    TItem = record
      data : TData;
      pPrec : PItem;
      pSuiv : PItem;
    end;

    TFile = record
      pSommet : PItem;
      pCour : PItem;
      pFin : PItem;
      nb : Integer;
    end;

    procedure init(var p : TFile);

    function estVide(p : TFile) : Boolean;

    procedure afficheOrdre(p : TFile);

    procedure afficheOrdreInverse(p : TFile);

    procedure emfile(var p : TFile; e : TData);

    procedure sommet(p : TFile; var e : TData; var b : Boolean);

    procedure dernier(p : TFile; var e : TData; var b : Boolean);

    procedure defile(var p : TFile; var e : TData; var b : Boolean);

implementation

  procedure init(var p : TFile);
  begin
    p.nb := 0;
    p.pSommet := NIL;
    p.pCour := NIL;
    p.pFin := NIL;
  end;

  function estVide(p : TFile) : Boolean;
  begin
    estVide := (p.pSommet = NIL);
  end;

  procedure affData(e : TData);
  begin
    writeln(e.val);
  end;

  procedure afficheOrdre(p : TFile);
  begin
    p.pCour := p.pSommet;
    while (p.pCour <> NIL) do
    begin
      affData((p.pCour^).data);
      p.pCour := (p.pCour^).pSuiv;
    end;
  end;

  procedure afficheOrdreInverse(p : TFile);
  begin
    p.pCour := p.pFin;
    while (p.pCour <> NIL) do
    begin
      affData((p.pCour^).data);
      p.pCour := (p.pCour^).pPrec;
    end;
  end;

  procedure emfile(var p : TFile; e : TData);
  var
    pTemp : PItem;
  begin
    new(pTemp);
    pTemp^.data := e;
    pTemp^.pPrec := p.pFin;
    pTemp^.pSuiv := NIL;
    p.nb := p.nb + 1;
    p.pCour := pTemp;
    if estVide(p) then
    begin
       pTemp^.pPrec := NIL;
       p.pSommet := pTemp;
    end
    else
    begin
       p.pFin^.pSuiv := pTemp;
    end;
    p.pFin := pTemp;
  end;

  procedure sommet(p : TFile; var e : TData; var b : Boolean);
  begin
    if (estVide(p)) then
    begin
      b := False;
    end
    else
    begin
      b := True;
      e := (p.pSommet^).data;
    end;
  end;

  procedure dernier(p : TFile; var e : TData; var b : Boolean);
  begin
    if (estVide(p)) then
    begin
      b := False;
    end
    else
    begin
      b := True;
      e := (p.pFin^).data;
    end;
  end;

  procedure defile(var p : TFile; var e : TData; var b : Boolean);
  var
    pTemp : PItem;
  begin
    if (estVide(p)) then
    begin
      b := False;
    end
    else
    begin
      b := True;
      e := (p.pSommet^).data;
      pTemp := p.pSommet;
      p.nb := p.nb - 1;
      p.pSommet := (pTemp^).pSuiv;
      p.pSommet^.pPrec := NIL;
      dispose(pTemp);
    end;
  end;

end.


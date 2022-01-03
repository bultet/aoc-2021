program AOC_2021_03;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, math;

var
   F : text;
   i, length, line : integer;
   gR, eR : extended;
   gRate, eRate : tarray<byte>;
   compteur : array[0..1] of tarray<integer>;
   t : string;

begin
  try
    // Day 3 : Binary Diagnostic
    writeln('Day 3 : Binary Diagnostic');

    // Ouvre le fichier input
    AssignFile(F,'..\..\03\input.txt');
    Reset(F);

    // Initialise les variables
    i := 0;
    gR := 0;
    eR := 0;
    length := 0;
    line := 0;

    // Défini la taille d'une ligne
    Readln(F, t);
    length := t.Length;
    Reset(F);
    SetLength(compteur[0], length);
    SetLength(compteur[1], length);
    SetLength(gRate, length);
    SetLength(eRate, length);

    // Initialise les compteurs
    for i:=1 to length do
      begin
        compteur[0,i] := 0;
        compteur[1,i] := 0;
      end;

    // Boucle sur toutes les lignes du fichier
    repeat
      Readln(F, t);
      for i:=1 to length do
      Begin
        if t[i] = '0' then inc(compteur[0,i-1]);
        if t[i] = '1' then inc(compteur[1,i-1]);

      End;
      inc(line);
      writeln(line);
    until eof(F);

    writeln('Details: ');

    // Calcul du Gamma rate
    for i:=0 to length-1 do
      Begin
        if compteur[0,i] > compteur[1,i] then gRate[i] := 0
        else gRate[i] := 1;
        write(gRate[i]);
        gR := gR + gRate[i]*power(2,length-i-1);
      End;
    writeln('Gamma Rate = ', gR);
    writeln;

    // Calcul du Epsilon rate
    for i:=0 to length-1 do
      Begin
        if gRate[i] = 1 then eRate[i] := 0
        else eRate[i] := 1;
        write(eRate[i]);
        eR := eR + eRate[i]*power(2,length-i-1);
      End;
    writeln('Epsilon Rate = ', eR);
    writeln;

    // Résultat
    writeln;
    writeln('Power = ', gR * eR);

    // Fin
    write('Pressez ENTRER');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

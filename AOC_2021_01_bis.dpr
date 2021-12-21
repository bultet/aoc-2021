program AOC_2021_01_bis;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
   F : text;
   increment, i, val_prec, val_prec_prec : integer;
   somme, somme_prec : integer;
   val : string;

begin
  try
    // Day 1 : sonar sweep
    writeln('Day 1 : sonar sweep');

    // Ouvre le fichier input
    AssignFile(F,'..\..\01\input.txt');
    Reset(F);

    // Initialise les variables
    increment := 0;
    i := 0;
    val_prec := 0;


    // Boucle sur toutes les lignes du fichier
    Readln(F, val);
    val_prec_prec := val.ToInteger;
    Readln(F, val);
    val_prec := val.ToInteger;
    Readln(F, val);
    i := val.ToInteger;
    somme_prec := i + val_prec + val_prec_prec;

    repeat
      val_prec_prec := val_prec;
      val_prec := i;
      Readln(F, val);
      i := val.ToInteger;
      somme := i + val_prec + val_prec_prec;
      if somme>somme_prec then inc(increment);
      somme_prec := somme;

    until eof(F);

    // Résultat
    writeln('Nb increment : ', increment);

    // Fin
    write('Pressez ENTRER');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

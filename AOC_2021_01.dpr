program AOC_2021_01;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
   F : text;
   increment, i, val_prec : integer;
   val : string;

begin
  try
    // Day 1 : sonar sweep
    // Github configured
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
    val_prec := val.ToInteger;

    repeat
      Readln(F, val);
      i := val.ToInteger;
      if i>val_prec then inc(increment);

    until eof(F);

    writeln('Nb increment : ', increment);


    write('Pressez ENTRER');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

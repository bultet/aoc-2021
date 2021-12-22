program AOC_2021_02_bis;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
   F : text;
   distance, profondeur, objectif : integer;
   val : tarray<string>;
   t : string;

begin
  try
    // Day 2 : dive
    writeln('Day 2 : dive, part 2');

    // Ouvre le fichier input
    AssignFile(F,'..\..\02\input.txt');
    Reset(F);

    // Initialise les variables
    distance := 0;
    profondeur := 0;
    objectif := 0;

    // Boucle sur toutes les lignes du fichier

    repeat
      Readln(F, t);
      val := t.trim.split([' ']);
      if val[0].ToLower = 'forward' then
      begin
         inc(distance, val[1].ToInteger);
         inc(profondeur, objectif*val[1].ToInteger);
      end
      else if val[0].ToLower = 'down' then
         inc(objectif, val[1].ToInteger)
      else if val[0].ToLower = 'up' then
         dec(objectif, val[1].ToInteger);
    until eof(F);

    // Résultat
    writeln('Valeur : ', distance * profondeur);

    // Fin
    write('Pressez ENTRER');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

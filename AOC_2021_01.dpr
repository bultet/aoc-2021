program AOC_2021_01;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

begin
  try
    // Day 1 : sonar sweep
    // Github configured

    writeln('Le programme fonctionne');
    Writeln('...mais ne fait toujours rien :-)');
    write('Pressez ENTRER');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

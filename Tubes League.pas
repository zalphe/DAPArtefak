program tubes;
uses crt;

label up;

type liga = record
 tim, scorer : string;
 count, point, scgoal, draw, lose, win, gm, gk : byte
end;

var
 l : array[1..100] of liga;
 arr : array[1..100] of string;
 i, j, n, o : integer;
 a, b, x, y, check, check1, check2, check3, temp : byte;
 p, s1, s2, team : string;
 class : file of liga;
 t : boolean;


procedure loading;
begin
 clrscr;
 textcolor(yellow);

 gotoxy(30,10);
 writeln('NOW LOADING ...');

 s1 := '                   ';

 gotoxy(28,11);
 textbackground(white);
 for i := 1 to length(s1) do
  begin
   delay(300);
   write(s1[i]);
  end;
 textbackground(black); write; delay(2000);
end;

procedure intro;
begin
 clrscr;
 textcolor(yellow);
 textbackground(black);
 s1 := 'TUBES 4      ';
 s2 := 'A PROGRAM BY ...........  ';
 gotoxy(30,10);
 for i := 1 to length(s1) do
  begin
   delay(300);
   write(s1[i]);
  end;
 writeln;

 gotoxy(25,11);
 for i := 1 to length(s2) do
  begin
   delay(300);
   write(s2[i]);
  end;

 clrscr;
 gotoxy(25,10);
 s1 := 'GILANG YANDEZA          111120255 ';
 s2 := 'IFWAN NUL MAULANA       111120253 ';

 for i := 1 to length(s1) do
  begin
   delay(100);
   write(s1[i]);
  end;

 delay(1000);
 clrscr;

 gotoxy(25,11);
 for i := 1 to length(s2) do
  begin
   delay(100);
   write(s2[i]);
  end;

 delay(1000);
 clrscr;

 s1 := 'RENANDY RIFQI           111120254 ';
 s2 := 'M. IKBAL TAWAKKAL       111120256 ';

 gotoxy(25,11);
 for i := 1 to length(s1) do
  begin
   delay(100);
   write(s1[i]);
  end;

 delay(1000);
 clrscr;

 s2 := 'M. RAFKI                111120252';
 gotoxy(25,11);
 for i := 1 to length(s2) do
  begin
   delay(100);
   write(s2[i]);
  end;

 delay(500);
 clrscr;

 s2 := 'VIRTUAL LEAGUE';
 gotoxy(25,11);
 for i := 1 to length(s2) do
  begin
   delay(100);
   write(s2[i]);
  end;

 delay(500);
 clrscr;
 textcolor(green);
 gotoxy(25,11);
 for i := 1 to length(s2) do
  begin
   delay(100);
   write(s2[i]);
  end;

 delay(500);
 clrscr;
 textcolor(red);
 gotoxy(25,11);
 for i := 1 to length(s2) do
  begin
   delay(100);
   write(s2[i]);
  end;

 delay(500);
 clrscr;
 textcolor(yellow);
 gotoxy(25,11);
 for i := 1 to length(s2) do
  begin
   delay(100);
   write(s2[i]);
  end;
 delay(2000);
end;

procedure header;
begin
 gotoxy(21,9); writeln('============================');
 gotoxy(21,14); writeln('============================');
end;

procedure menu;
begin
 clrscr;
 gotoxy(33,8); writeln('MENU');
 header;
 writeln;
 gotoxy(25,10); writeln('1. INPUT A TEAM');
 gotoxy(25,11); writeln('2. INPUT MATCH RESULTS');
 gotoxy(25,12); writeln('3. SHOW CLASSEMENT');
 gotoxy(25,13); writeln('4. SHOW TOP SCORER');

 gotoxy(25,15); write('INPUT OPTIONS : '); readln(o);
 writeln;
end;

procedure inputTeam;
begin
 header;

 for i := 1 to 3 do
  begin
   clrscr;
   gotoxy(30,8);writeln('INPUT TEAM');
   header;
   gotoxy(25,10); write('Team-', i, ' : '); readln(l[i].tim);
  end;
 seek(class, filesize(class));
 write(class, l[i]);
end;

procedure matchResults;
begin
 clrscr;

 for i := 1 to 2 do
  begin
   for j := i + 1 to 3 do
    begin
     clrscr;
     gotoxy(35,8); writeln('GAME WEEK ', (l[i].count + 1));
     gotoxy(21,9); writeln('=====================================');
     gotoxy(21,12); writeln('=====================================');
     gotoxy(25,10); write('HOME');
     gotoxy(33,10); write('SCORE VS SCORE');
     gotoxy(51,10); write('AWAY');
     gotoxy(25,11); write(l[i].tim);
     gotoxy(51,11); write(l[j].tim);
     gotoxy(33,11); read(a);
     gotoxy(43,11); readln(b);

     if (a > 0) then
      begin
       clrscr;
       gotoxy(32,8); writeln('SCORER IN GAME');
       gotoxy(1,9); writeln('================================================================================');
       gotoxy(1,20); writeln('===============================================================================');
       gotoxy(1,10); writeln(l[i].tim, ' SCORER : ');
       for x := (check1+1) to (a+check1) do
        begin
         readln(arr[x]);
        // lar[x] := l[i].tim;
        end;
      end;

     check1 := (check1 + a);
     writeln;

    if (b > 0) then
      begin
       clrscr;
       gotoxy(32,8); writeln('SCORER IN GAME');
       gotoxy(1,9); writeln('================================================================================');
       gotoxy(1,20); writeln('===============================================================================');
       gotoxy(1,10); writeln(l[j].tim, ' SCORER : ');
       for x := (check1+1) to (b+check1) do
        begin
         readln(arr[x]);
         //lar[x] := l[j].tim;
        end;
      end;

     check1 := (check1 + b);
     writeln;

    if a > b then
     begin
      l[i].count := l[i].count + 1;
      l[i].win := l[i].win + 1;
      l[i].point := l[i].point + 3;
      l[i].gm := l[i].gm + a;
      l[i].gk := l[i].gk + b;

      l[j].count := l[j].count + 1;
      l[j].lose := l[i].lose + 1;
      l[j].gm := l[j].gm + b;
      l[j].gk := l[j].gk + a;
     end
     else
      if a = b then
       begin
        l[i].count := l[i].count + 1;
        l[i].draw := l[i].draw + 1;
        l[i].point := l[i].point + 1;
        l[i].gm := l[i].gm + a;
        l[i].gk := l[i].gk + b;

        l[j].count := l[j].count + 1;
        l[j].draw := l[j].draw + 1;
        l[j].point := l[j].point + 1;
        l[j].gm := l[j].gm + b;
        l[j].gk := l[j].gk + a;
       end
       else
        begin
         l[i].count := l[i].count + 1;
         l[i].lose := l[i].lose + 1;
         l[i].gm := l[i].gm + a;
         l[i].gk := l[i].gk + b;

         l[j].count := l[j].count + 1;
         l[j].win := l[j].win + 1;
         l[j].point := l[j].point + 3;
         l[j].gm := l[j].gm + b;
         l[j].gk := l[j].gk + a;
        end;
    end;
  end;

  for i := check1 downto 2 do
   begin
    for j := 2 to i do
     begin
      if (arr[j-1] > arr[j]) then
       begin
        team := arr[j-1];
        arr[j-1] := arr[j];
        arr[j] := team;
       end;
     end;
   end;

 inc(check2);
 inc(check3);
 l[1].scorer := arr[1];

 for i := 1 to check1 do
  begin
   if (arr[i] <> arr[i+1]) then
    begin
     inc(check2);
     inc(check3);
     l[check2].scorer := arr[i+1];
    end
    else
      l[check3].scgoal := l[check3].scgoal + 1;
  end;
end;


procedure showClassement;
begin
 clrscr;

   for i := 3 downto 2 do
   begin
    for j := 2 to i do
     begin
      if (l[j-1].point > l[j].point) then
       begin
        temp := l[j-1].point;
        l[j-1].point := l[j].point;
        l[j].point := temp;

        temp := l[j-1].count;
        l[j-1].count := l[j].count;
        l[j].count := temp;

        temp := l[j-1].win;
        l[j-1].win := l[j].win;
        l[j].win := temp;

        temp := l[j-1].draw;
        l[j-1].draw := l[j].draw;
        l[j].draw := temp;

        temp := l[j-1].lose;
        l[j-1].lose := l[j].lose;
        l[j].lose := temp;

        temp := l[j-1].gm;
        l[j-1].gm := l[j].gm;
        l[j].gm := temp;

        temp := l[j-1].gk;
        l[j-1].gk := l[j].gk;
        l[j].gk := temp;

        team := l[j-1].tim;
        l[j-1].tim := l[j].tim;
        l[j].tim := team;
       end;
      end;
     end;

     j := 0;
     gotoxy(10,1); writeln ('------------------------------------------------------------');
     gotoxy(10,2); writeln ('|                                                          |');
     gotoxy(10,3); writeln ('|                        LEAGUE TABLE                      |');
     gotoxy(10,4); writeln ('|                                                          |');
     gotoxy(10,5); writeln ('------------------------------------------------------------');
     gotoxy(10,6); writeln ('| Team Name  |  Play  |  W  |  D  |  L  | GM | GK |  Point |');
     gotoxy(10,7); writeln ('------------------------------------------------------------');

     for i := 3 downto 1 do
      begin
       inc(j);
       gotoxy(9,7+j); write(' | ');

       gotoxy(12,7+j); write(l[i].tim);
       gotoxy(22,7+j); write(' | ');

       gotoxy(28,7+j); write(l[i].count);
       gotoxy(31,7+j); write(' | ');

       gotoxy(35,7+j); write (l[i].win);
       gotoxy(38,7+j); write ('|');

       gotoxy(41,7+j); write (l[i].draw);
       gotoxy(44,7+j); write ('|');

       gotoxy(47,7+j); write (l[i].lose);
       gotoxy(50,7+j); write ('|');

       gotoxy(52,7+j); write (l[i].gm);
       gotoxy(55,7+j); write ('|');

       gotoxy(57,7+j); write (l[i].gk);
       gotoxy(60,7+j); write ('|');

       gotoxy(65,7+j); write (l[i].point);
       gotoxy(69,7+j); writeln ('|');
    end;
  readln;
end;

procedure topScorer;
begin
 clrscr;
 gotoxy(25,8); writeln('SHOW TOP SCORER');
 delay(1000);
 clrscr;
 writeln;

 for i := (check2-1) downto 2 do
  begin
   for j := 2 to i do
    begin
     if l[j-1].scgoal > l[j].scgoal then
      begin
       temp := l[j-1].scgoal;
       l[j-1].scgoal := l[j].scgoal;
       l[j].scgoal := temp;

       team := l[j-1].scorer;
       l[j-1].scorer := l[j].scorer;
       l[j].scorer := team;


      end;
    end;
 end;

 textcolor(green);
 write(l[check2-1].scorer, ' : ');


 writeln((l[check2-1].scgoal) + 1, ' Goal');
 textcolor(yellow);

 for i := (check2-2) downto 1 do
  begin

 writeln(l[i].scorer, ' : ', l[i].scgoal + 1, ' Goal');
  end;

 readln;
end;

procedure rest;
begin
 clrscr;
 s1 := 'WINTER BREAK ';
 s2 := '                                        ';

 gotoxy(25,8);
 write(s1);


 writeln;
 for i := 1 to length(s2) do
  begin
   delay(500);
   textbackground(white);
   write(s2[i]);
   textbackground(black);
  end;

 delay(1000);

 t := false
end;

begin
 clrscr;
 t := true;
loading;
 intro;


 assign(class, 'class.dat');
 {$I-}
 reset(class);
 {$I+}
 if IOresult<>0 then rewrite(class);


 up :
 Menu;
 Case o of
  1 : begin
       clrscr;
       inputTeam;
       goto up;
      end;

  2 : begin
       clrscr;
       matchResults;
       goto up;
      end;

  3 : begin
       clrscr;
       showClassement;
       if t = true then
         goto up
       else writeln('THE WINNER IS ', l[3].tim);
       readln;
       goto up;
      end;

  4 : begin
       topScorer;
       if t = true then
        begin
         rest;
         goto up;
        end
       else
        begin
         writeln('THE TOP SCORER IS ', l[check2-1].scorer);
         goto up;
         writeln('END SEASON');
         writeln('DO YOU WANT TO RETRY ? ');
         readln;
         goto up;
        end;
      end;
 else
  begin
   clrscr;
   gotoxy(25,8);
   write('THANKS ..............');
  end;
 end;
end.


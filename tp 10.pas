program Perpustakaan;
uses crt;
type dataBuku = record
  judul    : string;
  penulis  : string;
  penerbit : string;
  tahun    : integer;
end;
//coba
var
  TempArsipBuku, ArsipBuku : file of dataBuku;
  buku        : dataBuku;
  i, counter  : integer;
  xxx         : string;
  selesai     : boolean;
  pil         : char;

procedure TAMBAH;
begin
  clrscr;
  seek(arsipBuku, filesize(arsipBuku));
    
  writeln('--- 113124331 Tambah Buku ---');
  write  ('Judul            : '); readln(buku.judul);
  write  ('Penulis          : '); readln(buku.penulis);
  write  ('Penerbit         : '); readln(buku.penerbit);
  write  ('Tahun Penerbitan : '); readln(buku.tahun);
  write  (arsipBuku, buku);

  writeln('Tambah Buku Berhasil!');
  readln;
end;

procedure LIHAT;
begin
  clrscr;
  writeln('--- 113124331 Lihat Data Buku ---');
  reset(arsipBuku);
  for i:=1 to filesize(arsipBuku) do
    begin
      read(arsipBuku, buku);
      writeln('Judul            : ', buku.judul);
      writeln('Penulis          : ', buku.penulis);
      writeln('Penerbit         : ', buku.penerbit);
      writeln('Tahun Penerbitan : ', buku.tahun);
      writeln;
    end;
  writeln('Jumlah buku : ', filesize(arsipbuku));
  readln;
end;

procedure EDIT;
begin
  clrscr;
  writeln('--- 113124331 Edit Data Buku ---');
  {LIHAT;}
  reset(arsipBuku);
  for i:=1 to filesize(arsipBuku) do
    begin
      read(arsipBuku, buku);
      writeln('Judul            : ', buku.judul);
      writeln('Penulis          : ', buku.penulis);
      writeln('Penerbit         : ', buku.penerbit);
      writeln('Tahun Penerbitan : ', buku.tahun);
      writeln;
    end;
  writeln('Jumlah buku : ', filesize(arsipbuku));
  
  write('Judul buku yang akan diedit : '); readln(xxx);
  assign(TempArsipBuku, 'temp.dat');
  rewrite(TempArsipBuku);
  reset(arsipBuku);

  counter:=0;
  while not eof(arsipBuku) do
    begin
      read(ArsipBuku, buku);
      if buku.judul = xxx then
        inc(counter);
    end;

  if counter = 0 then
    writeln('Data buku tidak ditemukan!')
  else
    begin
      reset(arsipBuku);
      while not eof(arsipBuku) do
        begin
          read(ArsipBuku, buku);
            if (buku.judul <> xxx) then
              write(TempArsipBuku, buku)
            else
              begin
                write('Judul            : '); readln(buku.judul);
                write('Penulis          : '); readln(buku.penulis);
                write('Penerbit         : '); readln(buku.penerbit);
                write('Tahun Penerbitan : '); readln(buku.tahun);
                writeln;
                write(TempArsipBuku, buku);
              end;
        end;
      reset(TemparsipBuku);
      rewrite(arsipBuku);
      while not eof(TemparsipBuku) do
        begin
          read(TemparsipBuku, buku);
          write(ArsipBuku, buku);
        end;
      rename(ArsipBuku, 'buku.dat');
      writeln('Data buku berhasil diedit!');
    end;
    readln;
    close(TemparsipBuku);
end;

procedure HAPUS;
begin
  clrscr;
  writeln('--- 113124331 Hapus Data Buku ---');
  {LIHAT;}
  reset(arsipBuku);
  for i:=1 to filesize(arsipBuku) do
    begin
      read(arsipBuku, buku);
      writeln('Judul            : ', buku.judul);
      writeln('Penulis          : ', buku.penulis);
      writeln('Penerbit         : ', buku.penerbit);
      writeln('Tahun Penerbitan : ', buku.tahun);
      writeln;
    end;
  writeln('Jumlah buku : ', filesize(arsipbuku));

  write('Judul buku yang akan dihapus : '); readln(xxx);
  assign(TempArsipBuku, 'temp.dat');
  rewrite(TempArsipBuku);
  reset(arsipBuku);

  counter:=0;
  while not eof(arsipBuku) do
    begin
      read(ArsipBuku, buku);
      if buku.judul = xxx then
        inc(counter);
    end;

  if counter = 0 then
    writeln('Data buku tidak ditemukan!')
  else
    begin
      reset(ArsipBuku);
      while not eof(arsipBuku) do
        begin
          read(ArsipBuku, buku);
          if (buku.judul <> xxx) then
              write(TempArsipBuku, buku);
        end;

      reset(TempArsipBuku);
      rewrite(arsipBuku);
      while not eof(TemparsipBuku) do
        begin
          read(TempArsipBuku, buku);
          write(ArsipBuku, buku);
        end;
      rename(ArsipBuku, 'buku.dat');
      writeln('Data buku berhasil dihapus!');
    end;
    readln;
    close(TempArsipBuku);
end;


procedure KELUAR;
begin
  close(arsipBuku);
  selesai:=TRUE;
end;

procedure SALAH;
begin
  clrscr;
  writeln('Masukkan pilihan dengan benar!');
  readln;
end;

procedure MENU;
begin
  clrscr;
  writeln('==================================');
  writeln('  113124331 Program Perpustakaan  ');
  writeln('==================================');
  writeln('1. Tambah Buku');
  writeln('2. Lihat Data Buku');
  writeln('3. Edit Data buku');
  writeln('4. Hapus Data Buku');
  writeln('5. Keluar');
  write  ('Masukkan pilihan : '); readln(pil);

   case pil of
     '1' : TAMBAH;
     '2' : LIHAT;
     '3' : EDIT;
     '4' : HAPUS;
     '5' : KELUAR;
     else SALAH;
   end;
end;

// - - - PROGRAM UTAMA :D - - -
begin
  assign(arsipBuku, 'buku.dat');  
  {$I-}
  reset(arsipBuku);
  {$I+}
  if (IOResult = 2) then
    rewrite(arsipBuku);
  repeat
    MENU;
  until selesai = true;
end.


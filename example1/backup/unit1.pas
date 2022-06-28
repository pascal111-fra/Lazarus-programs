unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox1: TGroupBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  your_name: string;
  attrib_count: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

  attrib_count:=0;
  your_name:='';

  while (your_name='') do
  begin
      your_name:=inputbox('الإسم', 'ما اسمكـ؟','');
      if (your_name='') then
      showmessage('يلزمكـَ إدخالُ إسم');
  end;


end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin

  if (checkbox1.Checked) then
  inc(attrib_count)
  else
  dec(attrib_count);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  if (attrib_count<3) then
  showmessage(your_name+'! أنت شخصٌ مازال يتعلّمُ من الحياه');
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
  if (checkbox2.Checked) then
  inc(attrib_count)
  else
  dec(attrib_count);
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
  if (checkbox3.Checked) then
  inc(attrib_count)
  else
  dec(attrib_count);
end;

procedure TForm1.CheckBox4Change(Sender: TObject);
begin
  if (checkbox4.Checked) then
  inc(attrib_count)
  else
  dec(attrib_count);
end;

procedure TForm1.CheckBox5Change(Sender: TObject);
begin
  if (checkbox5.Checked) then
  inc(attrib_count)
  else
  dec(attrib_count);
end;

end.


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
    procedure CheckBoxesChange(Sender: TObject);
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

procedure TForm1.CheckBoxesChange(Sender: TObject);
begin

  if sender is TCheckbox then
   begin
     if TCheckbox(sender).Checked then
       inc(attrib_count)
    else
      dec(attrib_count);
   end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  if (attrib_count<3) then
  showmessage(your_name+'! أنت شخصٌ مازال يتعلّمُ من الحياه')
  else
  begin
  if (attrib_count=3) then
  showmessage(your_name+'! أنت شخصٌ جيّد')
  else
  begin
  if (attrib_count>3) then
  showmessage(your_name+'! أنت شخصٌ رائع');
  end;
  end;
end;


end.


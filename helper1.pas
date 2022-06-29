unit Helper1;

{$mode ObjFPC}{$H+}

// Created and developed by
// Mishary (Ahmed Crow)
// https://www.facebook.com/ahmed.crow.988/

interface

uses
  Classes, SysUtils, LCLIntf, Buttons, Forms,
  StdCtrls, Controls;



procedure MessageBox2(title_string, msg_string:string; other_form:tform);

implementation



procedure MessageBox2(title_string, msg_string:string; other_form:tform);
var
  frmDialog : TForm;
  lblMsg : TLabel;
  btnClose: TBitBtn;
begin

  // Original code is in:
  // https://forum.lazarus.freepascal.org/index.php?topic=34704.0

  frmDialog:=TForm.Create(Nil);
  lblMsg := TLabel.Create(Nil);
  btnClose := TBitBtn.Create(Nil);


  with frmDialog do
  begin

    lblMsg.AutoSize:=True;
    lblMsg.Align:=alTop;
    lblMsg.Alignment:=taRightJustify;
    lblMsg.Caption:=msg_string;
    lblMsg.Parent:=frmDialog;

    btnClose.Parent:=frmDialog;
    btnClose.Kind:=bkOK;
    btnClose.Align:=alBottom;
    btnClose.Caption:='حسناً';

    Width:=300;
    Height:=100;
    BorderStyle:=bsDialog;
    caption:=title_string;
    top:=other_form.Top+(other_form.Width div 3);
    left:=other_form.Left+(other_form.height div 2);
    ShowModal;
  end;
end;

end.


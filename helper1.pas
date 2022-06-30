unit Helper1;

{$mode ObjFPC}{$H+}

// Created and developed by
// Mishary (Ahmed Crow)
// https://www.facebook.com/ahmed.crow.988/

interface

uses
  Classes, SysUtils, LCLIntf, Buttons, Forms,
  StdCtrls, Controls, ExtCtrls, Dialogs, LCLType;



procedure MessageBox2(title_string, msg_string:string; other_form:tform);


implementation



procedure MessageBox2(title_string, msg_string:string; other_form:tform);
var
  frmDialog : TForm;
  lblMsg : TLabel;
  btnClose: TBitBtn;
  panel: TPanel;
  img: TImage;
begin

  // Original code is in:
  // https://forum.lazarus.freepascal.org/index.php?topic=34704.0
  // this reprogrammed version is in:
  // https://forum.lazarus.freepascal.org/index.php/topic,59765.0.html
  // many thanks for @wp

  frmDialog:=TForm.CreateNew(nil);
  try
    with frmDialog do
    begin
      BiDiMode := bdRightToLeft;  //Application.MainForm.BiDiMode;

      panel := TPanel.Create(frmDialog);
      panel.Align := alClient;
      panel.caption := '';
      panel.BevelOuter := bvNone;
      panel.Parent := frmDialog;
      panel.AutoSize := true;
      panel.Constraints.MinWidth := 300;

      img := TImage.Create(frmDialog);
      if BiDiMode = bdRightToLeft then
      begin
        img.Align := alRight;
        img.BorderSpacing.Right := 12;  // Distance of image to right side of form
      end else
      begin
        img.Align := alLeft;
        img.BorderSpacing.Left := 12;   // Distance of image to left side of form
      end;
      img.BorderSpacing.Top := 12;      // Distance of image to top side of form
      img.AutoSize := true;
      img.Parent := panel;
      img.Picture.Assign(GetDialogIcon(idDialogInfo));
      // Other options to be used by GetDialogIcon are
      //  idDialogWarning, idDialogError, idDialogConfirm, idDialogShield

      lblMsg := TLabel.Create(frmDialog);
      lblMsg.AutoSize:=True;
      lblMsg.Align := alClient;
      if BiDiMode = bdRightToLeft then
      begin
        lblMsg.BorderSpacing.Right := 12;  // Distance of label to image
        lblMsg.BorderSpacing.Left := 12;   // Distance of label to left side of form
      end else
      begin
        lblMsg.BorderSpacing.Left := 12;   // Distance of label to image
        lblMsg.BorderSpacing.Right := 12;  // Distance of label to right side of form
      end;
      lblMsg.BorderSpacing.Top := 12;
      lblMsg.Caption:=msg_string;
      lblMsg.Wordwrap := true;
      lblMsg.Parent:=panel;

      panel := TPanel.Create(frmDialog);
      panel.Align := alBottom;
      panel.AutoSize := true;
      panel.BevelOuter := bvNone;
      panel.Caption := '';
      panel.Parent := frmDialog;

      btnClose := TBitBtn.Create(frmDialog);
      btnClose.Parent := panel;
      btnClose.Kind:=bkOK;
      btnClose.Anchors := [akLeft, akTop];
      btnClose.AnchorSideLeft.Control := panel;
      btnClose.AnchorSideLeft.Side := asrCenter;
      btnClose.AutoSize := true;
      btnClose.BorderSpacing.Top := 12;     // Distance of button to image or label, whichever is nearer
      btnClose.BorderSpacing.Bottom := 6;   // Distance of button to bottom side of form
      btnClose.Caption:='حسناً';

      AutoSize := True;
      BorderStyle:=bsDialog;
      caption:=title_string;
      if other_form <> nil then
      begin
        top:=other_form.Top+(other_form.height div 2);
        left:=other_form.Left+(other_form.Width div 2);
      end else
        Position := poMainFormCenter;
      ShowModal;
    end;
  finally
    frmDialog.Free;
  end;
end;

end.


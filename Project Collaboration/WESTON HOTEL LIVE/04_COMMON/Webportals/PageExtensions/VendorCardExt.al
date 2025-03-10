pageextension 52178867 "VendorCardExt" extends "Vendor Card"
{
    layout
    {
        addlast(General)
        {
            field(Password; Rec.Password)
            {
                ApplicationArea = all;
                Caption = 'Password';
            }
            field("Changed Password"; Rec."Changed Password")
            {
                ApplicationArea = all;
                Caption = 'Changed Password';
            }
        }
    }
}
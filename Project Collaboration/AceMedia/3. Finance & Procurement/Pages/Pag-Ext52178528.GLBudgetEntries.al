pageextension 52178528 "G/L Budget Entries" extends "G/L Budget Entries"
{
    layout
    {

     addafter("G/L Account No."){
            field("Transaction Type";Rec."Transaction Type"){
                ApplicationArea = All;
                ShowMandatory = true;

                // trigger OnValidate()
                // begin
                //     Revision := False;

                //     if Rec."Transaction Type" = Rec."Transaction Type" :: Revision then
                //     begin
                //         Revision := True;
                //     end;
                // end;
            }
            field("Revision Account";Rec."Revision Account"){
                ApplicationArea = All;
                ShowMandatory = True;
                // Visible = Revision;
            }
        }
    }
    
    var
    Revision: Boolean;

}



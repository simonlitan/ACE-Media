pageextension 52179303 "General Ledger Setup" extends "General Ledger Setup"
{
    layout
    {
        addafter("Allow Posting To")
        {

            field("Service Nos"; Rec."Service Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Service Nos field.';
            }
            field("LSO Nos."; Rec."LSO Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LSO Nos. field.';
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
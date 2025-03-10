page 52179050 "User Password"
{
    Caption = 'User Password';
    PageType = Card;
    DeleteAllowed = false;
    InsertAllowed = false;
    DelayedInsert = false;
    SourceTable = "HRM-Employee C";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Company E-Mail field.';
                }
                field("Changed Password"; Rec."Changed Password")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Changed Password field.';
                }
                field("Portal Password"; Rec."Portal Password")
                {
                    ApplicationArea = All;
                    //ExtendedDatatype = Masked;
                    ToolTip = 'Specifies the value of the Portal Password field.';

                }
            }
        }
    }

}

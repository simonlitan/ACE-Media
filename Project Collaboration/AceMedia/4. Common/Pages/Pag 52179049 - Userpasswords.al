page 52179049 "User passwords"
{
    Caption = 'User passwords';
    CardPageId = "User Password";
    PageType = List;
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    DelayedInsert = false;
    SourceTable = "HRM-Employee C";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
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

            }
        }
    }
}

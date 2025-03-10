page 52179080 "Employee Rec"
{
    Caption = 'Employee Rec';
    PageType = List;
    SourceTable = "HRM-Employee C";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field(FullName; Rec.FullName)
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }

            }
        }
    }
}

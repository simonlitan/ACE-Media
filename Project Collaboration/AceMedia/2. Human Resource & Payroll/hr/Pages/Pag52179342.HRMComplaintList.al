page 52179342 "HRM-Complaint List"
{
    CardPageId = "HRM-Complaint Card";
    InsertAllowed = false;
    DeleteAllowed = false;
    Caption = 'HRM-Complaint List';
    PageType = List;
    SourceTable = "HRM-Complaint Mgt Header";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Type of Complaint"; Rec."Type of Complaint")
                {
                    ApplicationArea = All;
                }
                field("Complainant No"; Rec."Complainant No")
                {
                    ApplicationArea = All;
                }
                field("Complainant Name"; Rec."Complainant Name")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }


                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

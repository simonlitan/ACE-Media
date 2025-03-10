page 52179189 "HRM-Shortlisting List"
{
    CardPageID = "HRM-Shortlisting Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HRM-Employee Requisitions";
    SourceTableView = WHERE(Shortlisted = CONST(false), Closed = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = all;
                }
                field("Job Description"; Rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = all;
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = all;
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ApplicationArea = all;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = all;
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = all;
                }
            }
        }

    }

    actions
    {
    }
}


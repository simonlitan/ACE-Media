page 52179013 "Pending Tasks"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "User Tasks";
    CardPageId = "To-Do Card";
    SourceTableView = WHERE(Status = FILTER(Pending));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                /*  field(No; Rec.No)
                 {
                     Caption = 'No.';
                     ApplicationArea = All;
                     Editable = false;                    
                 } */

                field(Code; Rec.Code)
                {
                    ApplicationArea = all;

                }
                field("Assign To"; Rec."Assign To")
                {
                    ApplicationArea = all;
                    Caption = 'Assigned To';
                    Enabled = true;
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = all;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = all;
                }
                field("Due Time"; Rec."Due Time")
                {
                    ApplicationArea = all;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;

                }
                field(Feedback; Rec.Feedback)
                {
                    ApplicationArea = all;

                }

                field("Task Details"; Rec."Task Details")
                {
                    ApplicationArea = all;

                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = all;
                }
                field("Task Name"; Rec."Task Name")
                {
                    ApplicationArea = all;
                }
                field("Link to appointment"; Rec."Linkt to appointment")
                {
                    ApplicationArea = all;
                    //  Editable = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}
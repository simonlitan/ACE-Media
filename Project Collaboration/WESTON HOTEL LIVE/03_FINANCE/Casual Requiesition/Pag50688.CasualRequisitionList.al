page 52178536 "Casual Requisition List"
{
    CardPageID = "Casual Requisition Card";
    PageType = List;
    SourceTable = "Casual Requisition";
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = All;
                }
                field("Cost Center"; Rec."Cost Center")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field(Narration; Rec.Narration)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    area (Creation)
    {
        action(CasualReport)
        {
            ApplicationArea = all;
            RunObject = report "Casual Requisition Report";
        }
    }
    }
    

    trigger OnOpenPage()
    begin
        Rec.SETFILTER(Rec."User ID", USERID);
    end;
}


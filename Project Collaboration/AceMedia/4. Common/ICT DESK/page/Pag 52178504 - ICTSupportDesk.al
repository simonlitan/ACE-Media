page 52178987 "ICT Support Desk"
{
    PageType = List;
    SourceTable = "ICT Support Desk";
    CardPageId = "ICT Support Desk Card";
    // SourceTableView = where("Issue Status" = const(New));
    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                /*  field("No."; Rec."No.")
                 { 
                     ApplicationArea = All;
                 } */
                field("Requesting User"; Rec."Requesting User")
                {
                    ApplicationArea = All;
                }
                field("Issue Area"; Rec."Issue Area")
                {
                    ApplicationArea = All;
                }
                field("Issue Description"; Rec."Issue Description")
                {
                    ApplicationArea = All;
                }

                field("Issue Status"; Rec."Issue Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Assignining Adminstrator"; Rec."Assignining Adminstrator")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        Rec.SetRange(Rec."Requesting User", UserId);
    end;

    var
        User: Record "User Setup";
}

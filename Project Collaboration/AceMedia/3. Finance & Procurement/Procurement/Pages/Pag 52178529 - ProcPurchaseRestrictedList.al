page 52178638 "Proc-Purchase Restricted List"
{
    CardPageID = "PROC-Purchase Restrict Header";
    Editable = false;
    PageType = List;
    SourceTable = "PROC-Purchase Quote Header";
    SourceTableView = where(DocApprovalType = const(Purchase), "Procurement methods" = const("Restricted Tendering"));
    layout
    {
        area(content)
        {
            repeater(___)
            {

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Expected Opening Date"; Rec."Expected Opening Date")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Expected Closing Date"; Rec."Expected Closing Date")
                {
                    ApplicationArea = All;
                }
                field("Posting Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }

                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

}
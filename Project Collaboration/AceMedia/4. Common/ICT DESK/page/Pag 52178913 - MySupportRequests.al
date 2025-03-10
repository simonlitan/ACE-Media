page 52178969 "My Support Requests"
{
    PageType = List;
    SourceTable = "ICT Support Desk";
    CardPageId = "ICT Support Desk Card";
    InsertAllowed = true;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
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
                /* field("No."; Rec."No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                    Editable = false;

                } */
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
    trigger OnModifyRecord(): Boolean
    begin
        SetPageControl();
    end;

    trigger OnOpenPage()
    begin
        SetPageControl();
    end;

    trigger OnClosePage()
    begin
        SetPageControl();
    end;

    trigger OnInit()
    begin
        SetPageControl();
    end;

    procedure SetPageControl()
    begin
        Rec.SetRange("Requesting User", UserId);
    end;
}
page 52179004 "CA-Feedback Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CA-Feedback";

    layout
    {
        area(Content)
        {
            Group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = All;

                }
                field("Region Name"; Rec."Region Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;

                }
                field(Department; Rec.Department)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Upload File")
            {
                ApplicationArea = All;
                Image = Attachments;

                trigger OnAction()
                begin

                end;
            }
            action("Send for Approval")
            {
                Caption = 'Send for Approval';
                Image = Approval;
                Promoted = true;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //check the status of the requisition
                    //SendForApproval();
                end;
            }
        }
    }

    var
        myInt: Integer;
}
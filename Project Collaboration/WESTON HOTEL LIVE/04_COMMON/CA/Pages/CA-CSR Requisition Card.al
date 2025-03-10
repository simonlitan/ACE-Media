page 52178893 "CA-CSR Req. Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CA-CSR Requisition";

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
                field("Required Date"; Rec."Required Date")
                {
                    ApplicationArea = All;

                }
                field("User Id"; Rec."User Id")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Reason; Rec.Reason)
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

    actions
    {
        area(Processing)
        {
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
            action("Post")
            {
                ApplicationArea = All;
                Caption = '&Post';
                Image = PostDocument;

                trigger OnAction()
                begin
                    IF xRec.Status = Rec.Status::Approved THEN begin
                        Rec."Status" := Rec.Status::Released;
                        Rec.Modify();
                        MESSAGE('CSR requisition Successfully posted');
                    end else
                        MESSAGE('This requisition has not been approved');
                end;
            }
        }
    }

    var
        myInt: Integer;
}
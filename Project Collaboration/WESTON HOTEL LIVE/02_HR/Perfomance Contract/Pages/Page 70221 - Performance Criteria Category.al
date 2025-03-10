page 70221 "Performance Criteria Category"
{
    Caption = 'Income And Expend  Frm 1A& 1B';
    PageType = Card;
    SourceTable = "Performance Contract Target";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Performance Code"; Rec."Performance Code")
                {
                    ApplicationArea = All;
                }
                field("Quarter Starting"; Rec."Quarter Starting")
                {
                    ApplicationArea = All;
                }
                field("Quarter Ending"; Rec."Quarter Ending")
                {
                    ApplicationArea = All;
                }
                field(Directorates; Rec.Directorates)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Departments; Rec.Departments)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
            part("Performance Contract List"; "Performance Contract List")
            {
                SubPageLink = "Activity Code" = FIELD("Performance Code");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action(Attachments)
                {
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Document Attachments";
                    RunPageLink = "Document No" = FIELD("Performance Code");
                    ApplicationArea = All;
                }
            }
            action("Send Approval Request")
            {
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;
                Visible = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.TESTFIELD(Status, Rec.Status::New);

                    IF CONFIRM('Send this Performance Contract for Approval?', TRUE) = FALSE THEN EXIT;
                    //IF ApprovalsMgmt.OnCancelPurchReqForApproval(Rec) THEN
                    //   ApprovalsMgmt.CheckActDisApprovalsWorkflowEnabled(Rec);
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Jobs,"Employee Req",Employees,Promotion,Confirmation,"Employee Transfer","Asset Transfer","Transport Req",Overtime,"Training App","Leave App";
                begin

                    //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID)
                end;
            }
            action("Cancel Approval Request")
            {
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    IF CONFIRM('Cancel Approval Request for this Performance?', TRUE) = FALSE THEN EXIT;
                    //ApprovalsMgmt.OnSendPurchReqForApproval(Rec);
                end;
            }
        }
    }

    var
    // ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
}


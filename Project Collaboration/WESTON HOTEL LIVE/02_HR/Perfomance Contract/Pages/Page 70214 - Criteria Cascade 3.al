page 70214 "Criteria Cascade 3"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Performance Criteria Cascade 3";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Performance Criteria Code"; Rec."Performance Criteria Code")
                {
                    ApplicationArea = All;
                }
                field("Performance Criteria Description"; Rec."Performance Criter Description")
                {
                    ApplicationArea = All;
                }
                field("Contract Period"; Rec."Contract Period")
                {
                    ApplicationArea = All;
                }
                field(Directorates; Rec.Directorates)
                {
                    ApplicationArea = All;
                }
                field(Departments; Rec.Departments)
                {
                    ApplicationArea = All;
                }
            }
            part("Performance Cascade List 3"; "Performance Cascade List 3")
            {
                SubPageLink = "Activity Code" = FIELD("Performance Criteria Code");
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
                    RunPageLink = "Document No" = FIELD("Performance Criteria Code");
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
                    //IF CONFIRM('Send this Project for Approval?',TRUE)=FALSE THEN EXIT;
                    //IF ApprovalsMgmt.CheckApprovalsWorkflowEnabled(Rec) THEN
                    //  ApprovalsMgmt.OnSendProjectForApproval(Rec);
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
                    //IF CONFIRM('Cancel Approval Request for this Project?',TRUE)=FALSE THEN EXIT;
                    //ApprovalsMgmt.OnCancelProjectForApproval(Rec);
                end;
            }
            action(Print)
            {
                Image = Account;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETFILTER("Performance Criteria Code", Rec."Performance Criteria Code");
                    REPORT.RUN(Report::"Performance Contract Report3", TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
        }
    }

    var
    // ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
}


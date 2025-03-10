page 52178623 "Advance PettyCash List"
{
    PageType = List;
    SourceTable = "Advance PettyCash Header";
    CardPageId = "Advance PettyCash Header Crd";
    SourceTableView = where(Status = filter(<> posted));


    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(payee; Rec.payee)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the payee field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field("Payment Amount"; Rec."Payment Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Amount field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cheque No. field.';
                }
                field("Payment Release Date"; Rec."Payment Release Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Release Date field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Advance Report")
            {
                Caption = 'Print';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = process;
                Image = Print;

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    REPORT.RUN(report::"Petty Cash Advance", TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
            action("Request Approval")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    if Approvalmgt.IsAdvPettyCashEnabled(Rec) = true then begin
                        Approvalmgt.OnSendAdvPettyCashforApproval(Rec);
                    end ELSE
                        ERROR('Check Your workflow')

                end;
            }
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("No.");
            }
            action("Cancel Approval")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    if Approvalmgt.IsAdvPettyCashEnabled(Rec) = true then begin
                        Approvalmgt.OnCancelAdvPettyCashforApproval(Rec);
                    end ELSE
                        ERROR('Check Your workflow')
                end;
            }
            action(EDMS)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                RunObject = Page "Document Attachment Details";
                RunPageLink = "No." = field("No.");
            }
            action("Post Advance")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = PostApplication;

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Approved then
                        Rec.PostAdvance()
                    else
                        Error('The surrender is not fully Approved')
                end;

            }
        }
    }

    var
        Approvalmgt: Codeunit "Init Code";
        ApprovalEntries: Page "Fin-Approval Entries";
}
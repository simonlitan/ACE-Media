page 52178522 "Petty Cash Surrender List"
{
    PageType = List;
    SourceTable = "PettyCash Surrender Header";
    CardPageId = "Petty Cash Surrender Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Surrender Date field.';
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
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Advance No."; Rec."Advance No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance No. field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Description field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
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
            action("Surrender Report")
            {
                Caption = 'Print';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = process;
                Image = PrintAcknowledgement;

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    REPORT.RUN(report::"Petty Cash Surrender", TRUE, TRUE, Rec);
                    Rec.RESET;
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

            action("Post Surrender")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = PostApplication;

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Approved then
                        Rec.PostAdvanceSurrender()
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
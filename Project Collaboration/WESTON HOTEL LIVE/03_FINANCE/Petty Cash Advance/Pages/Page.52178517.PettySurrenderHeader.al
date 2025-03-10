page 52178517 "Petty Cash Surrender Card"
{
    PageType = Card;
    SourceTable = "PettyCash Surrender Header";

    layout
    {
        area(Content)
        {
            group(General)
            {

                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Surrender Date field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Advance No."; Rec."Advance No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance No. field.';
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the On Behalf Of field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Description field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Advance Issue Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance Issue Date field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = group1;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part("Lines"; "PettyCash Surrender Lines")
            {
                Editable = group1;
                ApplicationArea = All;
                SubPageLink = "Surrender No." = field("No."), "Surrender Date" = field("Surrender Date");
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
            action("Request Approval")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    surrenderheader.Reset();
                    surrenderheader.SetRange("No.", rec."No.");
                    if surrenderheader.Find('-') then begin
                        surrenderlines.Reset();
                        surrenderlines.SetRange("Surrender No.", surrenderheader."No.");
                        if surrenderlines.Find('-') then begin
                            surrenderlines.TestField("Actual Spent");
                            if surrenderlines."Actual Spent" <= 0 then Error('Actual Spent cannot be less than 0');
                        end;
                    end;
                    if Approvalmgt.IsSurrPettyCashEnabled(Rec) = true then begin
                        Approvalmgt.OnSendSurrPettyCashforApproval(Rec);
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
                    if Approvalmgt.IsSurrPettyCashEnabled(Rec) = true then begin
                        Approvalmgt.OnCancelSurrPettyCashforApproval(Rec);
                    end ELSE
                        ERROR('Check Your workflow')
                end;
            }
            action(EDMS)
            {
                ApplicationArea = All;
                Image = Attach;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    DMS.Reset;
                    DMS.SetRange("Document Type", DMS."Document Type"::"PC SURR");
                    if DMS.Find('-') then begin
                        Hyperlink(DMS."url path" + Rec."No.");
                    end else
                        Message('No Link ' + format(DMS."Document Type"::"PC SURR"));
                end;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                Visible = false;
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
                        Error('The surrender status has to be Approved')
                end;

            }
        }
    }

    var
        Approvalmgt: Codeunit "Init Code";
        ApprovalEntries: Page "Fin-Approval Entries";
        surrenderlines: record "PettyCash Surrender Details";
        surrenderheader: Record "PettyCash Surrender Header";
        DMS: Record EDMS;
        group2: Boolean;
        group1: Boolean;
        group3: Boolean;
        group4: Boolean;
        group5: Boolean;

    trigger OnOpenPage()
    begin
        editableControl();
    end;

    procedure editableControl()
    begin
        group1 := true;
        group2 := true;
        group3 := true;
        group4 := true;

        if Rec.Status <> Rec.status::Pending then
            group1 := false;
    end;
}
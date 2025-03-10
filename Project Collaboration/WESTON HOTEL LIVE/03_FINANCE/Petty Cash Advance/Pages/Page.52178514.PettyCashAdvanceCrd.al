page 52178520 "Advance PettyCash Header Crd"
{
    PageType = Card;
    SourceTable = "Advance PettyCash Header";

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
                field("Date"; Rec."Date")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }

                field(Cashier; Rec.Cashier)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field("Payment Amount"; Rec."Payment Amount")
                {

                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Amount field.';
                }

                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    // Editable = group1;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    //  Editable = group1;
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
                    //Editable = group1;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field(payee; Rec.payee)
                {
                    // Editable = group1;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the payee field.';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;

                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                    MultiLine = true;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    //Editable = group1;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    Editable = group4;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    Editable = group4;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }

                field("Cheque No."; Rec."Cheque No.")
                {
                    Editable = group4;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cheque No. field.';
                }
                field("Payment Release Date"; Rec."Payment Release Date")
                {
                    Editable = group4;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Release Date field.';
                }



            }
            part("Lines"; "Petty Cash Advance Lines")
            {
                //Editable = group1;
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");

            }
        }
        area(FactBoxes)
        {
            //     part("Attached Documents"; "Document Attachment Factbox")
            //     {
            //         ApplicationArea = all;
            //         SubPageLink = "Table ID" = CONST(52178508),
            //                       "No." = FIELD("No.");
            //     }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Attachments)
            {
                ApplicationArea = All;
                Promoted = true;
                //   PromotedCategory = Category8;
                Image = Attachments;
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;


            }
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
                        Rec.CommitBudget();
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
                    //  if Approvalmgt.IsAdvPettyCashEnabled(Rec) = true then begin
                    Rec.CancelCommitment();
                    Approvalmgt.OnCancelAdvPettyCashforApproval(Rec);
                    // end //ELSE
                    // ERROR('Check Your workflow')
                end;
            }
            // action(EDMS)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     Image = Attach;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
            //     Visible = Fieldvisible;

            //     /* RunObject = Page "Document Attachment Details";
            //     RunPageLink = "No." = field("No."); */
            //     trigger OnAction()
            //     begin
            //         if rec.Status = rec.Status::Pending then begin
            //             docattach.Reset();
            //             docattach.SetRange("No.", rec."No.");
            //             if docattach.Find('-') then
            //                 Page.Run(page::"Document Attachment Details");
            //         end else
            //             Error('The petty cash is already sent for approval or has been approved');

            //     end;

            // }

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
                        Error('The surrender status has to be Approved')
                end;

            }
        }
    }
    var
        Approvalmgt: Codeunit "Init Code";
        ApprovalEntries: Page "Fin-Approval Entries";

        Fieldvisible: Boolean;
        dms: record EDMS;
        group2: Boolean;
        group1: Boolean;
        group3: Boolean;
        group4: Boolean;
        group5: Boolean;
        docdetails: page "Document Attachment Details";
        docattach: record "Document Attachment";


    trigger OnOpenPage()
    begin
        editableControl();
        if rec.Status <> rec.Status::pending then Fieldvisible := false else Fieldvisible := true;
    end;

    procedure editableControl()
    begin
        group1 := true;
        group2 := true;
        group3 := true;
        group4 := true;

        if Rec.Status <> Rec.status::Pending then
            group1 := false;

        if Rec.Status = Rec.Status::Posted then
            group4 := false;
    end;

}
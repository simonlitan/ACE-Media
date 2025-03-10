page 52178659 "FIN-Payment Header"
{
    Caption = 'Payment Voucher';
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Approvals,Posting,Attachments,Archive Document';
    RefreshOnActivate = true;
    SourceTable = "FIN-Payments Header";
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    Editable = true;
                    Importance = Promoted;
                    ApplicationArea = All;
                }

                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = GlobalDimension1CodeEditable;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = ShortcutDimension2CodeEditable;
                    ApplicationArea = All;

                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

                }

                field("Vendor No."; Rec."Vendor No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }

                field(Payee; Rec.Payee)
                {
                    Caption = 'Payment to';
                    Importance = Promoted;
                    ApplicationArea = All;
                }

                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ApplicationArea = All;
                }


                field(Cashier; Rec.Cashier)
                {
                    Caption = 'Prepared By';
                    Editable = false;
                    ApplicationArea = All;
                    //ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    Caption = 'Total Net Amount';
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Advance Amount"; Rec."Advanced Amount")
                {
                    ToolTip = 'This is the amount used to settle the advanced payment made before';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                   
                }
                field("Budgeted Acc"; Rec."Budgeted Acc")
                {
                    ApplicationArea = all;
                }

                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Invoice No"; Rec."Invoice No")
                {
                    //NotBlank = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice No field.';
                }
                field("Order No"; Rec."Order No")
                {
                    // NotBlank = true;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order No field.';
                }
                field("PIN  No"; Rec."PIN  No")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PIN  NO field.';
                }

                field("Payment Release Date"; Rec."Payment Release Date")
                {
                    Editable = "Payment Release DateEditable";
                    ApplicationArea = All;

                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    Editable = PaymodeEditable;
                    ApplicationArea = All;
                    /*  trigger OnValidate()
                     begin
                         Rec.TESTFIELD(Status, Rec.Status::Approved);
                     end; */


                }
                field("Cheque Type"; Rec."Cheque Type")
                {
                    ApplicationArea = All;
                    Editable = PaymodeEditable;

                    trigger OnValidate()
                    begin
                        // if rec.Status = rec.status::Pending then
                        //     Error('Document Has to be fully approved');
                        IF Rec."Cheque Type" = Rec."Cheque Type"::"Computer Check" THEN
                            "Cheque No.Editable" := FALSE
                        ELSE
                            "Cheque No.Editable" := TRUE;
                    end;
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    Editable = PaymodeEditable;
                    //Enabled = PaymodeEditable;
                    ApplicationArea = All;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = All;
                    Editable = PaymodeEditable;
                    /* trigger OnValidate()
                    begin
                        if rec.Status = rec.status::Pending then
                            Error('Document Has to be fully approved');
                    end; */
                }



            }
            group("Payment Narration")
            {
                field("Payment Narration "; Rec."Payment Narration")
                {
                    ShowCaption = false;
                    Editable = "Payment NarrationEditable";
                    Importance = Promoted;
                    ShowMandatory = true;

                    MultiLine = true;
                    ApplicationArea = All;
                }
            }
            part(PVLines; "Pv Budget Test Lines")
            {
                //  Editable = group1;
                ApplicationArea = All;
                SubPageLink = No = FIELD("No.");
            }
        }
    }

    actions
    {

        area(processing)
        {

            action("Attachments")
            {
                ApplicationArea = all;

                Image = Attach;
                Promoted = true;
                PromotedCategory = category6;
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                begin

                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
                /* trigger OnAction()
                begin
                    DMS.Reset;
                    DMS.SetRange("Document Type", DMS."Document Type"::"Payment Voucher");
                    if DMS.Find('-') then begin
                        Hyperlink(DMS."url path" + Rec."No.");
                    end else
                        Message('No Link ' + format(DMS."Document Type"::"Payment Voucher"));
                end; */

            }
            action(postPvs)
            {
                Caption = 'Post Payment';
                Image = Post;
                Promoted = true;
                PromotedCategory = category5;

                ApplicationArea = All;

                trigger OnAction()
                begin

                    // CurrPage.SAVERECORD;
                    CheckPVRequiredItems(Rec);
                    PostPaymentVoucher(Rec);
                    Rec.ExpenseBudget();
                    //  rec.ExpenseProcBudget();
                end;
            }


            action(sendApproval)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = category4;
                ApplicationArea = All;
                trigger OnAction()
                var
                    PVLines: Record "FIN-Payment Line";
                    ApprovalMgnt: Codeunit "Init Code";
                    PvBudget: Codeunit "Budget Balance";
                begin
                    CurrPage.Update(true);
                    UpdatePage;
                    if rec."Payment Narration" = '' then error('Payment narration cannot be empty');
                    rec.CalcFields("Total Net Amount");
                    if rec."Total Net Amount" = 0 then
                        Error('Amount to be Approved cannot be 0!');
                    If ApprovalMgnt.IsPVSEnabled(Rec) = true then begin
                        PvBudget.setPvBudgetBalance(Rec);
                        rec.CommitBudget();
                        ApprovalMgnt.OnSendPVSforApproval(Rec);
                        PVLines.SetBudgetAllocation(Rec);

                        Commit();
                        // PvBudget.setPvBudgetBalance(Rec);
                        // PvBudget.SetBudgetAllocation(rec);

                    end;


                end;
            }
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = category4;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("No.");
            }
            action(cancellsApproval)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = category4;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Init Code";

                begin
                    CurrPage.Update(true);
                    UpdatePage;
                    IF CONFIRM('This will also reverse Busget Commitment, Continue?', FALSE) = FALSE THEN ERROR('Cancelled by user!');

                    if Rec.Status = Rec.Status::"Pending Approval" then begin
                        ApprovalMgt.OnCancelPVSForApproval(Rec);
                        rec.ReverseBudget();
                        //rec.CancelCommitment();
                    end;
                end;
            }
            action("Generate Budget Bal")
            {

                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category7;
                Visible = false;
                trigger OnAction()
                var
                    PvBudget: Codeunit "Budget Balance";
                begin
                    //  PvBudget.SetBudgetPVBalance(Rec);
                end;
            }
            action("Archive Document")
            {
                ApplicationArea = All;

                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category7;
                Visible = true;

                trigger OnAction()
                var
                    Text000: Label 'Are you sure you want to Archive this Document?';
                    Text001: Label 'You have selected not to Archive this Document';
                begin

                    IF CONFIRM('This will Archive, Continue?', FALSE) = FALSE THEN ERROR('Archive by user!');
                    IF CONFIRM(Text000, TRUE) THEN BEGIN
                        if Rec.Status = rec.status::Pending then
                            Doc_Type := Doc_Type::"Payment Voucher";
                        Rec.Status := Rec.Status::Archive;
                        Rec.MODIFY;
                    END ELSE
                        ERROR(Text001);
                end;
            }
            separator(____________)
            {

            }
            action(CheckBudget)
            {
                Caption = 'Check Budgetary Availability';
                Image = Balance;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ApplicationArea = All;
                trigger OnAction()
                var
                    BCSetup: Record "FIN-Budgetary Control Setup";
                begin
                    BCSetup.GET;
                    IF NOT BCSetup.Mandatory THEN
                        EXIT;
                    //Ensure only Pending Documents are commited
                    Rec.TESTFIELD(Status, Rec.Status::"Pending Approval");

                    IF NOT AllFieldsEntered THEN
                        ERROR('Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT] Have not been Entered please RECHECK your entries');
                    //First Check whether other lines are already committed.
                    Commitments.RESET;
                    Commitments.SETRANGE(Commitments."Document Type", Commitments."Document Type"::"Payment Voucher");
                    Commitments.SETRANGE(Commitments."Document No.", Rec."No.");
                    IF Commitments.FIND('-') THEN BEGIN
                        IF CONFIRM('Lines in this Document appear to be committed do you want to re-commit?', FALSE) = FALSE THEN BEGIN EXIT END;
                        Commitments.RESET;
                        Commitments.SETRANGE(Commitments."Document Type", Commitments."Document Type"::"Payment Voucher");
                        Commitments.SETRANGE(Commitments."Document No.", Rec."No.");
                        Commitments.DELETEALL;
                    END;

                    CheckBudgetAvail.CheckPayments(Rec);
                end;
            }
            action(CancelBudget)
            {
                Caption = 'Cancel Budget Commitment';
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //Ensure only Pending Documents are commited
                    Rec.TESTFIELD(Status, Rec.Status::Pending);

                    IF CONFIRM('Do you Wish to Cancel the Commitment entries for this document', FALSE) = FALSE THEN BEGIN EXIT END;

                    Commitments.RESET;
                    Commitments.SETRANGE(Commitments."Document Type", Commitments."Document Type"::"Payment Voucher");
                    Commitments.SETRANGE(Commitments."Document No.", Rec."No.");
                    Commitments.DELETEALL;

                    PayLine.RESET;
                    PayLine.SETRANGE(PayLine.No, Rec."No.");
                    IF PayLine.FIND('-') THEN BEGIN
                        REPEAT
                            PayLine.Committed := FALSE;
                            PayLine.MODIFY;
                        UNTIL PayLine.NEXT = 0;
                    END;
                end;
            }
            separator(_______________)
            {

            }
            action(Print)
            {
                Caption = 'Print/Preview';
                Image = ConfirmAndPrint;
                Promoted = true;
                PromotedCategory = Report;

                Visible = true;
                ApplicationArea = All;
                trigger OnAction()
                begin

                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    REPORT.RUN(Report::"PV Report", TRUE, TRUE, Rec);
                    //  Report.Run(Report::"Payment Voucher layout", true, true, rec);


                    CurrPage.UPDATE;
                    CurrPage.SAVERECORD;

                end;
            }
            separator(__________________)
            {

            }
            action(CanelDoc)
            {
                Caption = 'Cancel Document';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = category5;

                ApplicationArea = All;

                trigger OnAction()
                var
                    Text000: Label 'Are you sure you want to cancel this Document?';
                    Text001: Label 'You have selected not to Cancel the Document';
                begin
                    Rec.ReverseBudget();
                    Rec.TESTFIELD(Status, Rec.Status::Approved);
                    IF CONFIRM(Text000, TRUE) THEN BEGIN
                        //Post Reversal Entries for Commitments
                        Doc_Type := Doc_Type::"Payment Voucher";
                        CheckBudgetAvail.ReverseEntries(Doc_Type, Rec."No.");
                        Rec.Status := Rec.Status::Cancelled;
                        Rec.MODIFY;
                    END ELSE
                        ERROR(Text001);
                end;
            }

            group("Cheque Printing")
            {
                Caption = 'Cheque Printing';
                action("P&review Check")
                {
                    Caption = 'P&review Check';
                    RunObject = Page "Check Preview";
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin

                        ImprestHeader.RESET;
                        ImprestHeader.SETFILTER("No.", Rec."Apply to Document No");
                        REPORT.RUN(39005666, TRUE, TRUE, ImprestHeader);
                        //RESET;
                    end;
                }
                action("Generate Check")
                {
                    Caption = 'Generate Check';
                    Image = PrintCheck;
                    ApplicationArea = All;
                    Visible = false;

                    trigger OnAction()
                    begin


                        //CheckPVRequiredItems(Rec);
                        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                        GenJnlLine.RESET;
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);
                        // IF GenJnlLine.FIND('+') THEN
                        //     GenJnlLine.DELETEALL;
                        //GenJnlLine.RESET;

                        PopulateCheckJournal(Payments);
                        GenSetup.GET;
                        GenSetup."Casuals  Register Nos" := Rec."Paying Bank Account";
                        GenSetup.MODIFY;


                        // UPDATE CHEQUE NO
                        IF BankAcc.GET(Rec."Paying Bank Account") THEN BEGIN
                            Rec."Cheque No." := INCSTR(BankAcc."Last Check No.");
                            Rec."Cheque Printed" := TRUE;
                            Rec."Payment Release Date" := TODAY;
                            //MODIFY;
                        END;
                        //REPORT.RUN(1401,TRUE,TRUE);
                    end;
                }
                action("Print Cheque")
                {
                    Caption = 'Print Cheque';
                    ApplicationArea = All;
                    Visible = false;
                    trigger OnAction()
                    begin
                        GenJnlLine.RESET;
                        GenJnlLine.SETRANGE("Journal Template Name", JTemplate);
                        GenJnlLine.SETRANGE("Journal Batch Name", JBatch);
                        //IF GenJnlLine.FIND('-') THEN
                        REPORT.RUN(Report::Check, TRUE, TRUE, GenJnlLine);
                    end;
                }
                action("Void Check")
                {
                    Caption = 'Void Check';
                    Image = VoidCheck;
                    ApplicationArea = All;
                    Visible = false;
                    trigger OnAction()
                    begin
                        GenJnlLine.RESET;
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);
                        IF GenJnlLine.FIND('+') THEN BEGIN
                            GenJnlLine.TESTFIELD(GenJnlLine."Bank Payment Type", GenJnlLine."Bank Payment Type"::"Computer Check");
                            GenJnlLine.TESTFIELD("Check Printed", TRUE);
                            IF CONFIRM(Text000, FALSE, Rec."Cheque No.") THEN
                                CheckManagement.VoidCheck(GenJnlLine);
                            Rec."Cheque No." := '';
                            Rec."Cheque Printed" := FALSE;
                            Rec.MODIFY;
                        END;
                    end;
                }
            }

            action("Generate EFT")
            {
                Caption = 'Generate EFT';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = category5;
                trigger OnAction()
                begin
                    IF Rec.Status <> Rec.Status::Approved THEN ERROR('PV must be approved');
                    Rec.TESTFIELD("Cheque No.");

                    //Post PV Entries
                    //TESTFIELD("Expense Code");
                    //CurrPage.SAVERECORD;
                    CheckPVRequiredItems(Rec);
                    PostPaymentVoucher(Rec);

                    EFTHeader.RESET;
                    EFTHeader.SETRANGE(EFTHeader."No.", Rec."Cheque No.");
                    IF EFTHeader.FIND('-') THEN BEGIN
                        PayLine.RESET;
                        PayLine.SETRANGE(PayLine.No, Rec."No.");
                        IF PayLine.FIND('-') THEN BEGIN
                            EFTline.INIT;
                            EFTline."Doc No" := EFTHeader."No.";
                            EFTline.Date := EFTHeader.Date;
                            EFTline."Bank Code" := PayLine."Bank Code";
                            EFTline."Bank Branch No" := PayLine."Branch Code";
                            EFTline."Bank A/C Name" := PayLine."Account Name";
                            EFTline.Payee := Rec.Payee;
                            EFTline."Bank A/C No" := PayLine."Bank Account No";
                            EFTline.Amount := PayLine."Net Amount";
                            EFTline."PV Number" := PayLine.No;
                            EFTline.Description := Rec."Payment Narration";
                            EFTline.INSERT;

                        END;
                    END;
                    EFTHeader.Posted := TRUE;
                    EFTHeader."Posted by" := USERID;
                    EFTHeader.MODIFY;

                    CurrPage.SAVERECORD;
                    CheckPVRequiredItems(Rec);
                    PostPaymentVoucher(Rec);
                    //  rec.ExpenseBudget;
                end;
            }

        }
    }

    trigger OnAfterGetRecord()
    begin
        //OnAfterGetCurrRecord;
    end;

    trigger OnInit()
    begin
        PVLinesEditable := TRUE;
        DateEditable := TRUE;
        PayeeEditable := TRUE;
        ShortcutDimension2CodeEditable := TRUE;
        "Payment NarrationEditable" := TRUE;
        GlobalDimension1CodeEditable := TRUE;
        "Currency CodeEditable" := FALSE;
        "Invoice Currency CodeEditable" := TRUE;
        "Cheque TypeEditable" := false;
        "Payment Release DateEditable" := false;
        "Cheque No.Editable" := false;
        PaymodeEditable := false;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec."Payment Type" := Rec."Payment Type"::Normal;

        rcpt.RESET;
        rcpt.SETRANGE(rcpt.Posted, FALSE);
        rcpt.SETRANGE(rcpt.Cashier, USERID);
        IF rcpt.COUNT > 0 THEN BEGIN
            IF CONFIRM('There are still some unposted payments. Continue?', FALSE) = FALSE THEN BEGIN
                ERROR('There are still some unposted payments. Please utilise them first');
            END;
        END;
    end;


    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
        //Add dimensions if set by default here
        /* "Global Dimension 1 Code":=UserMgt.GetSetDimensions(USERID,1);
         VALIDATE("Global Dimension 1 Code");
         "Shortcut Dimension 2 Code":=UserMgt.GetSetDimensions(USERID,2);
         VALIDATE("Shortcut Dimension 2 Code");
         "Shortcut Dimension 3 Code":=UserMgt.GetSetDimensions(USERID,3);
         VALIDATE("Shortcut Dimension 3 Code");
         "Shortcut Dimension 4 Code":=UserMgt.GetSetDimensions(USERID,4);
         VALIDATE("Shortcut Dimension 4 Code");
         "Responsibility Center":='MAIN';*/
        //OnAfterGetCurrRecord;

    end;

    trigger OnOpenPage()
    begin
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
            Rec.FILTERGROUP(2);
            Rec.SETRANGE("Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FILTERGROUP(0);

            editableControl();
        END;


        UpdateControls();
    end;


    var
        Text001: Label 'This Document no %1 has printed Cheque No %2 which will have to be voided first before reposting.';
        Text000: Label 'Do you want to Void Check No %1';
        Text002: Label 'You have selected post and generate a computer cheque ensure that your cheque printer is ready do you want to continue?';
        GLEntry: Record "G/L Entry";
        rcpt: Record "FIN-Payments Header";
        PayLine: Record "FIN-Payment Line";
        //PVUsers: Record "61711";
        strFilter: Text[250];
        IntC: Integer;
        IntCount: Integer;
        Payments3: Record "FIN-Payments Header";
        Payments: Record "FIN-Payments Header";
        RecPayTypes: Record "FIN-Receipts and Payment Types";
        TarriffCodes: Record "FIN-Tariff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "FIN-Cash Office User Template";
        LineNo: Integer;
        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";
        Temp: Record "FIN-Cash Office User Template";
        JTemplate: Code[10];
        JBatch: Code[10];
        //PCheck: Codeunit "50110";
        Post: Boolean;
        strText: Text[100];
        PVHead: Record "FIN-Payments Header";
        BankAcc: Record "Bank Account";
        CheckBudgetAvail: Codeunit "Budgetary Control";
        Commitments: Record "FIN-Committment";
        UserMgt: Codeunit "User Setup Management";
        JournlPosted: Codeunit "Journal Post Successful";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition;
        DocPrint: Codeunit "Document-Print";
        CheckLedger: Record "Check Ledger Entry";
        CheckManagement: Codeunit CheckManagement;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";

        "Cheque No.Editable": Boolean;

        "Payment Release DateEditable": Boolean;

        "Cheque TypeEditable": Boolean;

        "Invoice Currency CodeEditable": Boolean;

        "Currency CodeEditable": Boolean;

        GlobalDimension1CodeEditable: Boolean;

        "Payment NarrationEditable": Boolean;

        ShortcutDimension2CodeEditable: Boolean;

        PayeeEditable: Boolean;

        ShortcutDimension3CodeEditable: Boolean;

        ShortcutDimension4CodeEditable: Boolean;

        DateEditable: Boolean;

        PVLinesEditable: Boolean;
        DMS: Record EDMS;
        PayingBankAccountEditable: Boolean;
        ImprestHeader: Record "FIN-Imprest Header";
        PaymodeEditable: Boolean;
        PurchInvHeader: Record "Purch. Inv. Header";
        Fielddate: Text[250];
        //ApprovalEntries: Page "658";
        VarVariant: Variant;
        //CustomApprovals: Codeunit "60277";
        GenSetup: Record "General Ledger Setup";
        checkAmount: Decimal;
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        FINPaymentLine: Record "FIN-Payment Line";
        EFTHeader: Record "EFT Batch Header";
        EFTline: Record "EFT batch Lines";
        group2: Boolean;
        group1: Boolean;
        group3: Boolean;
        group4: Boolean;
        group5: Boolean;

    procedure UpdatePage()
    begin
        rec.Reset();
        rec.SetRange("No.", rec."No.");
        if rec.Find('-') then begin
            if rec.payee <> '' then begin
                Fielddate := rec.Payee;
                Rec.Payee := Fielddate + '';
                rec.Modify();
            end;
        end;
    end;
    //[Scope('Internal')]
    procedure PostPaymentVoucher(rec: Record "FIN-Payments Header")
    begin


        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
        GenJnlLine.RESET;
        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);
        IF GenJnlLine.FIND('+') THEN BEGIN
            LineNo := GenJnlLine."Line No." + 1000;
        END
        ELSE BEGIN
            LineNo := 1000;
        END;
        GenJnlLine.DELETEALL;
        GenJnlLine.RESET;

        Payments.RESET;
        Payments.SETRANGE(Payments."No.", Rec."No.");
        IF Payments.FIND('-') THEN BEGIN
            PayLine.RESET;
            PayLine.SETRANGE(PayLine.No, Payments."No.");
            IF PayLine.FIND('-') THEN BEGIN
                REPEAT
                    PostHeader(Payments);
                UNTIL PayLine.NEXT = 0;
            END;

            Post := FALSE;
            Post := JournlPosted.PostedSuccessfully();
            GLEntry.RESET;
            GLEntry.SETRANGE("Document No.", Rec."No.");
            IF GLEntry.FIND('-') THEN
                Post := TRUE ELSE
                Post := FALSE;
            IF Post = TRUE THEN BEGIN
                Rec.Posted := TRUE;
                Rec.Status := Payments.Status::Posted;
                Rec."Posted By" := USERID;
                Rec."Date Posted" := TODAY;
                Rec."Time Posted" := TIME;
                Rec.MODIFY;

                //Post Reversal Entries for Commitments
                Doc_Type := Doc_Type::"Payment Voucher";
                CheckBudgetAvail.ReverseEntries(Doc_Type, Rec."No.");
            END;
        END;
        //ExpenseBudget;
        // rec.ExpenseBudget();

    end;

    //[Scope('Internal')]
    procedure PostHeader(var Payment: Record "FIN-Payments Header")
    begin

        IF (Payments."Pay Mode" = Payments."Pay Mode"::Cheque) AND (Rec."Cheque Type" = Rec."Cheque Type"::" ") THEN
            ERROR('Cheque type has to be specified');

        IF Payments."Pay Mode" = Payments."Pay Mode"::Cheque THEN BEGIN
            IF (Payments."Cheque No." = '') AND (Rec."Cheque Type" = Rec."Cheque Type"::"Manual Check") THEN BEGIN
                ERROR('Please ensure that the cheque number is inserted');
            END;
        END;

        IF Payments."Pay Mode" = Payments."Pay Mode"::EFT THEN BEGIN
            IF Payments."Cheque No." = '' THEN BEGIN
                ERROR('Please ensure that the EFT number is inserted');
            END;
        END;

        IF Payments."Pay Mode" = Payments."Pay Mode"::"Letter of Credit" THEN BEGIN
            IF Payments."Cheque No." = '' THEN BEGIN
                ERROR('Please ensure that the Letter of Credit ref no. is entered.');
            END;
        END;
        GenJnlLine.RESET;
        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);

        IF GenJnlLine.FIND('+') THEN BEGIN
            LineNo := GenJnlLine."Line No." + 1000;
        END
        ELSE BEGIN
            LineNo := 1000;
        END;


        LineNo := LineNo + 1000;
        GenJnlLine.INIT;
        GenJnlLine."Journal Template Name" := JTemplate;
        GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Posting Date" := Payment."Payment Release Date";
        /*IF CustomerPayLinesExist THEN
         GenJnlLine."Document Type":=GenJnlLine."Document Type"::" "
        ELSE
          GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment; */
        GenJnlLine."Document No." := Payments."No.";
        GenJnlLine."External Document No." := Payments."Cheque No.";

        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
        GenJnlLine."Account No." := Payments."Paying Bank Account";
        GenJnlLine.VALIDATE(GenJnlLine."Account No.");

        GenJnlLine."Currency Code" := Payments."Currency Code";
        GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
        //CurrFactor
        GenJnlLine."Currency Factor" := Payments."Currency Factor";
        GenJnlLine.VALIDATE("Currency Factor");

        Payments.CALCFIELDS(Payments."Total Net Amount", Payments."Total VAT Amount");
        GenJnlLine.Amount := -(Payments."Total Net Amount");
        GenJnlLine.VALIDATE(GenJnlLine.Amount);
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
        GenJnlLine."Bal. Account No." := '';

        GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
        GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
        GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");

        GenJnlLine.Description := COPYSTR('Pay To:' + Payments.Payee, 1, 50);
        GenJnlLine.VALIDATE(GenJnlLine.Description);

        IF Rec."Pay Mode" <> Rec."Pay Mode"::Cheque THEN BEGIN
            GenJnlLine."Bank Payment Type" := GenJnlLine."Bank Payment Type"::" "
        END ELSE BEGIN
            IF Rec."Cheque Type" = Rec."Cheque Type"::"Computer Check" THEN
                GenJnlLine."Bank Payment Type" := GenJnlLine."Bank Payment Type"::"Computer Check"
            ELSE
                GenJnlLine."Bank Payment Type" := GenJnlLine."Bank Payment Type"::" "

        END;
        IF GenJnlLine.Amount <> 0 THEN
            GenJnlLine.INSERT;

        //Post Other Payment Journal Entries

        PostPV(Payments);

    end;

    //[Scope('Internal')]
    procedure GetAppliedEntries(var LineNo: Integer) InvText: Text[100]
    var
        Appl: Record "FIN-CshMgt Application";
    begin

        InvText := '';
        Appl.RESET;
        Appl.SETRANGE(Appl."Document Type", Appl."Document Type"::PV);
        Appl.SETRANGE(Appl."Document No.", Rec."No.");
        Appl.SETRANGE(Appl."Line No.", LineNo);
        IF Appl.FINDFIRST THEN BEGIN
            REPEAT
                InvText := COPYSTR(InvText + ',' + Appl."Appl. Doc. No", 1, 50);
            UNTIL Appl.NEXT = 0;
        END;
    end;


    procedure LinesCommitmentStatus() Exists: Boolean
    var
        BCSetup: Record "FIN-Budgetary Control Setup";
    begin
        IF BCSetup.GET() THEN BEGIN
            IF NOT BCSetup.Mandatory THEN BEGIN
                Exists := FALSE;
                EXIT;
            END;
        END ELSE BEGIN
            Exists := FALSE;
            EXIT;
        END;
        Exists := FALSE;
        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, Rec."No.");
        PayLine.SETRANGE(PayLine.Committed, FALSE);
        PayLine.SETRANGE(PayLine."Budgetary Control A/C", TRUE);
        IF PayLine.FIND('-') THEN
            Exists := TRUE;
    end;

    ////[Scope('Internal')]
    procedure CheckPVRequiredItems(rec: Record "FIN-Payments Header")
    begin
        IF Rec.Posted THEN BEGIN
            ERROR('The Document has already been posted');
        END;

        Rec.TESTFIELD(Status, Rec.Status::Approved);
        Rec.TESTFIELD("Paying Bank Account");
        Rec.TESTFIELD("Pay Mode");
        Rec.TESTFIELD("Payment Release Date");
        //Confirm whether Bank Has the Cash
        /*IF "Pay Mode"="Pay Mode"::Cash THEN
         CheckBudgetAvail.CheckFundsAvailability(Rec);*/

        //Confirm Payment Release Date is today);
        /*IF "Pay Mode"="Pay Mode"::Cash THEN
          TESTFIELD("Payment Release Date",WORKDATE);*/

        /*Check if the user has selected all the relevant fields*/
        Temp.GET(USERID);

        JTemplate := Temp."Payment Journal Template";
        JBatch := Temp."Payment Journal Batch";

        IF JTemplate = '' THEN BEGIN
            ERROR('Ensure the PV Template is set up in Cash Office Setup');
        END;
        IF JBatch = '' THEN BEGIN
            ERROR('Ensure the PV Batch is set up in the Cash Office Setup')
        END;
        IF (Rec."Pay Mode" = Rec."Pay Mode"::Cheque) AND (Rec."Cheque No." = '') THEN
            ERROR('Kindly specify the Cheque No');
        IF (Rec."Pay Mode" = Rec."Pay Mode"::Cheque) AND (Rec."Cheque Type" = Rec."Cheque Type"::"Computer Check") THEN BEGIN
            IF NOT CONFIRM(Text002, FALSE) THEN
                ERROR('You have selected to Abort PV Posting');
        END;
        //Check whether there is any printed cheques and lines not posted
        CheckLedger.RESET;
        CheckLedger.SETRANGE(CheckLedger."Document No.", Rec."No.");
        CheckLedger.SETRANGE(CheckLedger."Entry Status", CheckLedger."Entry Status"::Printed);
        IF CheckLedger.FIND('-') THEN BEGIN
            //Ask whether to void the printed cheque
            GenJnlLine.RESET;
            GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.FINDFIRST;
            IF CONFIRM(Text000, FALSE, CheckLedger."Check No.") THEN
                CheckManagement.VoidCheck(GenJnlLine)
            ELSE
                ERROR(Text001, Rec."No.", CheckLedger."Check No.");
        END;
        // rec.ExpenseBudget;

    end;

    ////[Scope('Internal')]
    procedure PostPV(var Payment: Record "FIN-Payments Header")
    var
        StaffClaim: Record "FIN-Staff Claims Header";
        PayReqHeader: Record "FIN-Payments Header";
        FINReceiptsandPaymentTypes: Record "FIN-Receipts and Payment Types";
        FINTariffCodes: Record "FIN-Tariff Codes";
    begin
        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, Payments."No.");
        IF PayLine.FIND('-') THEN BEGIN

            REPEAT
                strText := GetAppliedEntries(PayLine."Line No.");
                Payment.TESTFIELD(Payment.Payee);
                PayLine.TESTFIELD(PayLine.Amount);
                // PayLine.TESTFIELD(PayLine."Global Dimension 1 Code");

                //BANK
                IF PayLine."Pay Mode" = PayLine."Pay Mode"::Cash THEN BEGIN
                    CashierLinks.RESET;
                    CashierLinks.SETRANGE(CashierLinks.UserID, USERID);
                END;

                //CHEQUE
                LineNo := LineNo + 1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := Payment."Payment Release Date";
                GenJnlLine."Document No." := PayLine.No;
                /*IF PayLine."Account Type"=PayLine."Account Type"::Customer THEN
                GenJnlLine."Document Type":=GenJnlLine."Document Type"::" "
                ELSE
                  GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;*/
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."External Document No." := Payments."Cheque No.";
                GenJnlLine.Description := COPYSTR(PayLine."Transaction Name" + ':' + Payment.Payee, 1, 50);
                GenJnlLine."Currency Code" := Payments."Currency Code";
                GenJnlLine.VALIDATE("Currency Code");
                GenJnlLine."Currency Factor" := Payments."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");
                IF PayLine."VAT Code" = '' THEN BEGIN
                    GenJnlLine.Amount := PayLine."Net Amount";
                    GenJnlLine."VAT Amount" := PayLine."VAT Withheld Amount"; //Litan
                END
                ELSE BEGIN
                    GenJnlLine.Amount := PayLine."Net Amount";
                    GenJnlLine."VAT Amount" := PayLine."VAT Withheld Amount"; // Litan 1
                END;
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."VAT Prod. Posting Group" := PayLine."VAT Prod. Posting Group";
                GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                // GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                // GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := PayLine."Applies-to Doc. No.";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                // GenJnlLine."Applies-to ID" := PayLine."Applies-to ID";
                GenJnlLine."Applies-to ID" := '';

                IF PayLine."Account Type" = PayLine."Account Type"::"Fixed Asset" THEN BEGIN
                    GenJnlLine."FA Posting Date" := Payment."Payment Release Date";
                    GenJnlLine."FA Posting Type" := GenJnlLine."FA Posting Type"::"Acquisition Cost"
                END;


                IF GenJnlLine.Amount <> 0 THEN GenJnlLine.INSERT;
                /*
                //Post VAT to GL[VAT GL]
                TarriffCodes.RESET;
                TarriffCodes.SETRANGE(TarriffCodes.Code,PayLine."VAT Code");
                IF TarriffCodes.FIND('-') THEN BEGIN
                TarriffCodes.TESTFIELD(TarriffCodes."Account No.");
                LineNo:=LineNo+1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name":=JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name":=JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code":='PAYMENTJNL';
                GenJnlLine."Line No.":=LineNo;
                GenJnlLine."Posting Date":=Payment."Payment Release Date";
                //GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                GenJnlLine."Document No.":=PayLine.No;
                GenJnlLine."External Document No.":=Payments."Cheque No.";
                GenJnlLine."Account Type":=TarriffCodes."Account Type";//GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No.":=TarriffCodes."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."Currency Code":=Payments."Currency Code";
                GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                //CurrFactor
                GenJnlLine."Currency Factor":=Payments."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");

                GenJnlLine."Gen. Posting Type":=GenJnlLine."Gen. Posting Type"::" ";
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                GenJnlLine."Gen. Bus. Posting Group":='';
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                GenJnlLine."Gen. Prod. Posting Group":='';
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                GenJnlLine."VAT Bus. Posting Group":='';
                GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                GenJnlLine."VAT Prod. Posting Group":='';
                GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                GenJnlLine.Amount:=-PayLine."VAT Amount";
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                GenJnlLine."Bal. Account No.":='';
                GenJnlLine.Description:=COPYSTR('VAT:' + FORMAT(PayLine."Account Type") + '::' + FORMAT(PayLine."Account Name"),1,50);
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                Ge nJnlLine."Shortcut Dimension 1 Code":=PayLine."Global Dimension 1 Code";
                GenJnlLine."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine.ValidateShortcutDimCode(3,PayLine."Shortcut Dimension 3 Code");
                GenJnlLine.ValidateShortcutDimCode(4,PayLine."Shortcut Dimension 4 Code");

                IF GenJnlLine.Amount<>0 THEN GenJnlLine.INSERT;
                END;
                 */

                //Post VAT Withheld
                TarriffCodes.RESET;
                TarriffCodes.SETRANGE(TarriffCodes.Code, PayLine."VAT Withheld Code");
                IF TarriffCodes.FIND('-') THEN BEGIN
                    // TarriffCodes.TESTFIELD(TarriffCodes."G/L Account");
                    TarriffCodes.TESTFIELD(TarriffCodes."Account No.");
                    LineNo := LineNo + 1000;
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Source Code" := 'PAYMENTJNL';
                    GenJnlLine."Line No." := LineNo;
                    GenJnlLine."Posting Date" := Payment."Payment Release Date";
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                    GenJnlLine."Document No." := PayLine.No;
                    GenJnlLine."External Document No." := Payments."Cheque No.";
                    GenJnlLine."Account Type" := TarriffCodes."Account Type";//GenJnlLine."Account Type"::"G/L Account";
                                                                             // GenJnlLine."Account No." := TarriffCodes."G/L Account";
                    GenJnlLine."Account No." := TarriffCodes."Account No.";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Currency Code" := Payments."Currency Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    //CurrFactor
                    GenJnlLine."Currency Factor" := Payments."Currency Factor";
                    GenJnlLine.VALIDATE("Currency Factor");

                    GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                    GenJnlLine."Gen. Bus. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                    GenJnlLine."Gen. Prod. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                    GenJnlLine."VAT Bus. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                    GenJnlLine."VAT Prod. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                    GenJnlLine.Amount := -PayLine."VAT Withheld Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No." := '';   //Litan
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine.Description := COPYSTR('VAT Withheld:' + FORMAT(PayLine."Account Name") + '::' + strText, 1, 50);
                    GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                    //GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                    //GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    // GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                    // GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");

                    IF GenJnlLine.Amount <> 0 THEN
                        GenJnlLine.INSERT;
                END;

                //POST W/TAX to Respective W/TAX GL Account.........................................LITAN
                TarriffCodes.RESET;
                TarriffCodes.SETRANGE(TarriffCodes.Code, PayLine."Withholding Tax Code");
                IF TarriffCodes.FIND('-') THEN BEGIN
                    // TarriffCodes.TESTFIELD(TarriffCodes."G/L Account");
                    TarriffCodes.TESTFIELD(TarriffCodes."Account No.");
                    LineNo := LineNo + 1000;
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Source Code" := 'PAYMENTJNL';
                    GenJnlLine."Line No." := LineNo;
                    GenJnlLine."Posting Date" := Payment."Payment Release Date";
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                    GenJnlLine."Document No." := PayLine.No;
                    GenJnlLine."External Document No." := Payments."Cheque No.";
                    GenJnlLine."Account Type" := TarriffCodes."Account Type";//GenJnlLine."Account Type"::"G/L Account";
                    //GenJnlLine."Account No." := TarriffCodes."G/L Account";
                    GenJnlLine."Account No." := TarriffCodes."Account No.";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Currency Code" := Payments."Currency Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    //CurrFactor
                    GenJnlLine."Currency Factor" := Payments."Currency Factor";
                    GenJnlLine.VALIDATE("Currency Factor");

                    GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                    GenJnlLine."Gen. Bus. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                    GenJnlLine."Gen. Prod. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                    GenJnlLine."VAT Bus. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                    GenJnlLine."VAT Prod. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                    GenJnlLine.Amount := -PayLine."Withholding Tax Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No." := '';
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine.Description := COPYSTR('W/Tax:' + FORMAT(PayLine."Account Name") + '::' + strText, 1, 50);
                    GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                    // GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                    // GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    // GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                    // GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");

                    IF GenJnlLine.Amount <> 0 THEN
                        GenJnlLine.INSERT;
                END;

                //////////////////////////////////////////////////////////////////////////////////////
                //POST Retension to the Retension Account
                //Get Retension Code Here
                IF PayLine."Retention  Amount" <> 0 THEN BEGIN
                    FINReceiptsandPaymentTypes.RESET;
                    FINReceiptsandPaymentTypes.SETRANGE(Code, PayLine.Type);
                    IF FINReceiptsandPaymentTypes.FIND('-') THEN
                        FINReceiptsandPaymentTypes.TESTFIELD("Retention Code")
                    ELSE
                        ERROR('Retensions/Code Not Specified');
                    // get the retension Acount Here
                    TarriffCodes.RESET;
                    TarriffCodes.SETRANGE(Code, FINReceiptsandPaymentTypes."Retention Code");
                    IF TarriffCodes.FIND('-') THEN
                        TarriffCodes.TESTFIELD("G/L Account")
                    ELSE
                        ERROR('Retension Code Not Defined');
                    TarriffCodes.RESET;
                    TarriffCodes.SETRANGE(TarriffCodes.Code, PayLine."Withholding Tax Code");
                    IF TarriffCodes.FIND('-') THEN BEGIN
                        TarriffCodes.TESTFIELD(TarriffCodes."Account No.");
                        LineNo := LineNo + 1000;
                        GenJnlLine.INIT;
                        GenJnlLine."Journal Template Name" := JTemplate;
                        GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                        GenJnlLine."Journal Batch Name" := JBatch;
                        GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                        GenJnlLine."Source Code" := 'PAYMENTJNL';
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Posting Date" := Payment."Payment Release Date";
                        GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                        GenJnlLine."Document No." := PayLine.No;
                        GenJnlLine."External Document No." := Payments."Cheque No.";
                        GenJnlLine."Account Type" := TarriffCodes."Account Type";//GenJnlLine."Account Type"::"G/L Account";
                        GenJnlLine."Account No." := TarriffCodes."Account No.";
                        GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                        GenJnlLine."Currency Code" := Payments."Currency Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                        //CurrFactor
                        GenJnlLine."Currency Factor" := Payments."Currency Factor";
                        GenJnlLine.VALIDATE("Currency Factor");

                        GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                        GenJnlLine."Gen. Bus. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                        GenJnlLine."Gen. Prod. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                        GenJnlLine."VAT Bus. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                        GenJnlLine."VAT Prod. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                        GenJnlLine.Amount := -PayLine."Retention  Amount";
                        GenJnlLine.VALIDATE(GenJnlLine.Amount);
                        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                        GenJnlLine."Bal. Account No." := '';
                        GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                        GenJnlLine.Description := COPYSTR('Retension ' + FORMAT(PayLine."Account Name") + '::' + strText, 1, 50);
                        GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                        // GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                        // GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        // GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                        // GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");

                        IF GenJnlLine.Amount <> 0 THEN
                            GenJnlLine.INSERT;
                        //Post Retension Balancing Account
                        LineNo := LineNo + 1000;
                        GenJnlLine.INIT;
                        GenJnlLine."Journal Template Name" := JTemplate;
                        GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                        GenJnlLine."Journal Batch Name" := JBatch;
                        GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                        GenJnlLine."Source Code" := 'PAYMENTJNL';
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Posting Date" := Payment."Payment Release Date";
                        GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                        GenJnlLine."Document No." := PayLine.No;
                        GenJnlLine."External Document No." := Payments."Cheque No.";
                        GenJnlLine."Account Type" := PayLine."Account Type";
                        GenJnlLine."Account No." := PayLine."Account No.";
                        GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                        GenJnlLine."Currency Code" := Payments."Currency Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                        //CurrFactor
                        GenJnlLine."Currency Factor" := Payments."Currency Factor";
                        GenJnlLine.VALIDATE("Currency Factor");

                        GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                        GenJnlLine."Gen. Bus. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                        GenJnlLine."Gen. Prod. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                        GenJnlLine."VAT Bus. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                        GenJnlLine."VAT Prod. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                        GenJnlLine.Amount := PayLine."Retention  Amount";
                        GenJnlLine.VALIDATE(GenJnlLine.Amount);
                        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                        GenJnlLine."Bal. Account No." := '';
                        GenJnlLine.Description := COPYSTR('Retension Balancing-' + Payments.Payee, 1, 50);
                        GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                        GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        // GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                        // GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                        // GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                        // GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");
                        GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                        GenJnlLine."Applies-to Doc. No." := PayLine."Apply to";
                        GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                        // GenJnlLine."Applies-to ID" := PayLine."Apply to ID";
                        GenJnlLine."Applies-to ID" := '';
                        IF GenJnlLine.Amount <> 0 THEN
                            GenJnlLine.INSERT;

                    END;
                END;
                //////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////
                //POST PAYE to the PAYE Account
                //Get PAYE Code Here
                IF PayLine."PAYE Amount" <> 0 THEN BEGIN
                    FINReceiptsandPaymentTypes.RESET;
                    FINReceiptsandPaymentTypes.SETRANGE(Code, PayLine.Type);
                    IF FINReceiptsandPaymentTypes.FIND('-') THEN
                        FINReceiptsandPaymentTypes.TESTFIELD("PAYE Tax Code")
                    ELSE
                        ERROR('PAYE Code Not Specified');
                    // get the PAYE Acount Here
                    TarriffCodes.RESET;
                    TarriffCodes.SETRANGE(Code, FINReceiptsandPaymentTypes."PAYE Tax Code");
                    IF TarriffCodes.FIND('-') THEN
                        TarriffCodes.TESTFIELD("G/L Account")
                    ELSE
                        ERROR('PAYE Code Not Defined');
                    IF TarriffCodes.FIND('-') THEN BEGIN
                        TarriffCodes.TESTFIELD(TarriffCodes."Account No.");
                        LineNo := LineNo + 1000;
                        GenJnlLine.INIT;
                        GenJnlLine."Journal Template Name" := JTemplate;
                        GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                        GenJnlLine."Journal Batch Name" := JBatch;
                        GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                        GenJnlLine."Source Code" := 'PAYMENTJNL';
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Posting Date" := Payment."Payment Release Date";
                        GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                        GenJnlLine."Document No." := PayLine.No;
                        GenJnlLine."External Document No." := Payments."Cheque No.";
                        GenJnlLine."Account Type" := TarriffCodes."Account Type";//GenJnlLine."Account Type"::"G/L Account";
                        GenJnlLine."Account No." := TarriffCodes."Account No.";
                        GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                        GenJnlLine."Currency Code" := Payments."Currency Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                        //CurrFactor
                        GenJnlLine."Currency Factor" := Payments."Currency Factor";
                        GenJnlLine.VALIDATE("Currency Factor");

                        GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                        GenJnlLine."Gen. Bus. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                        GenJnlLine."Gen. Prod. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                        GenJnlLine."VAT Bus. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                        GenJnlLine."VAT Prod. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                        GenJnlLine.Amount := -PayLine."PAYE Amount";
                        GenJnlLine.VALIDATE(GenJnlLine.Amount);
                        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                        GenJnlLine."Bal. Account No." := '';
                        GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                        GenJnlLine.Description := COPYSTR('PAYE ' + FORMAT(PayLine."Account Name") + '::' + strText, 1, 50);
                        GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                        // GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                        // GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        // GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                        // GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");

                        IF GenJnlLine.Amount <> 0 THEN
                            GenJnlLine.INSERT;
                        //Post PAYE Balancing Account
                        LineNo := LineNo + 1000;
                        GenJnlLine.INIT;
                        GenJnlLine."Journal Template Name" := JTemplate;
                        GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                        GenJnlLine."Journal Batch Name" := JBatch;
                        GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                        GenJnlLine."Source Code" := 'PAYMENTJNL';
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Posting Date" := Payment."Payment Release Date";
                        GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                        GenJnlLine."Document No." := PayLine.No;
                        GenJnlLine."External Document No." := Payments."Cheque No.";
                        GenJnlLine."Account Type" := PayLine."Account Type";
                        GenJnlLine."Account No." := PayLine."Account No.";
                        GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                        GenJnlLine."Currency Code" := Payments."Currency Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                        //CurrFactor
                        GenJnlLine."Currency Factor" := Payments."Currency Factor";
                        GenJnlLine.VALIDATE("Currency Factor");

                        GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                        GenJnlLine."Gen. Bus. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                        GenJnlLine."Gen. Prod. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                        GenJnlLine."VAT Bus. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                        GenJnlLine."VAT Prod. Posting Group" := '';
                        GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                        GenJnlLine.Amount := PayLine."PAYE Amount";
                        GenJnlLine.VALIDATE(GenJnlLine.Amount);
                        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                        GenJnlLine."Bal. Account No." := '';
                        GenJnlLine.Description := COPYSTR('PAYE Balancing-' + Payments.Payee, 1, 50);
                        GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                        GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        // GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                        // GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                        // GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                        // GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");
                        GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                        GenJnlLine."Applies-to Doc. No." := PayLine."Apply to";
                        GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                        // GenJnlLine."Applies-to ID" := PayLine."Apply to ID";
                        GenJnlLine."Applies-to ID" := '';
                        IF GenJnlLine.Amount <> 0 THEN
                            GenJnlLine.INSERT;

                    END;
                END;
                //////////////////////////////////////////////////////////////////////////////////////




                // // // // //    //POST P.A.Y.E to Respective P.A.Y.E GL Account
                // // // // //    TarriffCodes.RESET;
                // // // // //    TarriffCodes.SETRANGE(TarriffCodes.Code,PayLine."PAYE Code");
                // // // // //    IF TarriffCodes.FIND('-') THEN BEGIN
                // // // // //    TarriffCodes.TESTFIELD(TarriffCodes."Account No.");
                // // // // //    LineNo:=LineNo+1000;
                // // // // //    GenJnlLine.INIT;
                // // // // //    GenJnlLine."Journal Template Name":=JTemplate;
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                // // // // //    GenJnlLine."Journal Batch Name":=JBatch;
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                // // // // //    GenJnlLine."Source Code":='PAYMENTJNL';
                // // // // //    GenJnlLine."Line No.":=LineNo;
                // // // // //    GenJnlLine."Posting Date":=Payment."Payment Release Date";
                // // // // //    GenJnlLine."Document Type":=GenJnlLine."Document Type"::" ";
                // // // // //    GenJnlLine."Document No.":=PayLine.No;
                // // // // //    GenJnlLine."External Document No.":=Payments."Cheque No.";
                // // // // //    GenJnlLine."Account Type":=TarriffCodes."Account Type";//GenJnlLine."Account Type"::"G/L Account";
                // // // // //    GenJnlLine."Account No.":=TarriffCodes."Account No.";
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                // // // // //    GenJnlLine."Currency Code":=Payments."Currency Code";
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                // // // // //    //CurrFactor
                // // // // //    GenJnlLine."Currency Factor":=Payments."Currency Factor";
                // // // // //    GenJnlLine.VALIDATE("Currency Factor");
                // // // // //
                // // // // //    GenJnlLine."Gen. Posting Type":=GenJnlLine."Gen. Posting Type"::" ";
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                // // // // //    GenJnlLine."Gen. Bus. Posting Group":='';
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                // // // // //    GenJnlLine."Gen. Prod. Posting Group":='';
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                // // // // //    GenJnlLine."VAT Bus. Posting Group":='';
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                // // // // //    GenJnlLine."VAT Prod. Posting Group":='';
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                // // // // //    GenJnlLine.Amount:=-PayLine."PAYE Amount";
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                // // // // //    GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                // // // // //    GenJnlLine."Bal. Account No.":='';
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                // // // // //    GenJnlLine.Description:=COPYSTR('P.A.Y.E:' + FORMAT(PayLine."Account Name") +'::' + strText,1,50);
                // // // // //    GenJnlLine."Shortcut Dimension 1 Code":=PayLine."Global Dimension 1 Code";
                // // // // //    GenJnlLine."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                // // // // //    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                // // // // //    GenJnlLine.ValidateShortcutDimCode(3,PayLine."Shortcut Dimension 3 Code");
                // // // // //    GenJnlLine.ValidateShortcutDimCode(4,PayLine."Shortcut Dimension 4 Code");
                // // // // //
                // // // // //    IF GenJnlLine.Amount<>0 THEN
                // // // // //    GenJnlLine.INSERT;
                // // // // //    END;

                /*
                //Post VAT Balancing Entry Goes to Vendor
                LineNo:=LineNo+1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name":=JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name":=JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code":='PAYMENTJNL';
                GenJnlLine."Line No.":=LineNo;
                GenJnlLine."Posting Date":=Payment."Payment Release Date";
                //GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                GenJnlLine."Document No.":=PayLine.No;
                GenJnlLine."External Document No.":=Payments."Cheque No.";
                GenJnlLine."Account Type":=PayLine."Account Type";
                GenJnlLine."Account No.":=PayLine."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."Currency Code":=Payments."Currency Code";
                GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                //CurrFactor
                GenJnlLine."Currency Factor":=Payments."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");

                IF PayLine."VAT Code"='' THEN
                  BEGIN
                    GenJnlLine.Amount:=0;
                  END
                ELSE
                  BEGIN
                    GenJnlLine.Amount:=PayLine."VAT Amount";
                  END;
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
                GenJnlLine."Bal. Account No.":='';
                GenJnlLine.Description:=COPYSTR('VAT:' + FORMAT(PayLine."Account Type") + '::' + FORMAT(PayLine."Account Name"),1,50) ;
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code":=PayLine."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine.ValidateShortcutDimCode(3,PayLine."Shortcut Dimension 3 Code");
                GenJnlLine.ValidateShortcutDimCode(4,PayLine."Shortcut Dimension 4 Code");
                GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No.":=PayLine."Apply to";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID":=PayLine."Apply to ID";
                IF GenJnlLine.Amount<>0 THEN
                GenJnlLine.INSERT;
                 */
                //Post VAt WithHeld Balancing Entry Goes to Vendor...................Litan Modify
                LineNo := LineNo + 1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := Payment."Payment Release Date";
                GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                GenJnlLine."Document No." := PayLine.No;
                GenJnlLine."External Document No." := Payments."Cheque No.";
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."Currency Code" := Payments."Currency Code";
                GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                //CurrFactor
                GenJnlLine."Currency Factor" := Payments."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");

                GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                GenJnlLine."Gen. Bus. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                GenJnlLine."Gen. Prod. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                GenJnlLine."VAT Bus. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                GenJnlLine."VAT Prod. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                GenJnlLine.Amount := PayLine."VAT Withheld Amount";
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := COPYSTR(Payments.Payee, 1, 50);
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                // GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                // GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                // GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                // GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := PayLine."Apply to";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                // GenJnlLine."Applies-to ID" := PayLine."Apply to ID";
                GenJnlLine."Applies-to ID" := '';
                IF GenJnlLine.Amount <> 0 THEN
                    GenJnlLine.INSERT;


                //Post W/TAX Balancing Entry Goes to Vendor.................................Litan
                LineNo := LineNo + 1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := Payment."Payment Release Date";
                GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                GenJnlLine."Document No." := PayLine.No;
                GenJnlLine."External Document No." := Payments."Cheque No.";
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."Currency Code" := Payments."Currency Code";
                GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                //CurrFactor
                GenJnlLine."Currency Factor" := Payments."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");

                GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                GenJnlLine."Gen. Bus. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                GenJnlLine."Gen. Prod. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                GenJnlLine."VAT Bus. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                GenJnlLine."VAT Prod. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                GenJnlLine.Amount := PayLine."Withholding Tax Amount";
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := COPYSTR('W/Tax Balancing-' + Payments.Payee, 1, 50);
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                // GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                // GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                // GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                // GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := PayLine."Apply to";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := '';
                IF GenJnlLine.Amount <> 0 THEN
                    GenJnlLine.INSERT;


                //Post advance payment
                LineNo := LineNo + 1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Posting Date" := Payment."Payment Release Date";

                GenJnlLine."Document No." := Payments."No.";
                GenJnlLine."Account Type" := PayLine."Advance Type";
                GenJnlLine."Account No." := PayLine."Advance No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                //Message(Format(-(PayLine."Advance Amount")));
                GenJnlLine.Amount := -(PayLine."Advance Amount");
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");

                GenJnlLine.Description := COPYSTR('Repay advance to: ' + Payments.Payee, 1, 50);
                GenJnlLine.VALIDATE(GenJnlLine.Description);

                IF GenJnlLine.Amount <> 0 THEN
                    GenJnlLine.INSERT;

                //Balancing the advance Payment
                LineNo := LineNo + 1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Posting Date" := Payment."Payment Release Date";

                GenJnlLine."Document No." := Payments."No.";
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                // Message(Format(-(PayLine."Advance Amount")));
                GenJnlLine.Amount := (PayLine."Advance Amount");
                GenJnlLine.VALIDATE(GenJnlLine.Amount);

                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
                GenJnlLine.Description := COPYSTR('Repay advance to: ' + Payments.Payee, 1, 50);
                GenJnlLine.VALIDATE(GenJnlLine.Description);

                IF GenJnlLine.Amount <> 0 THEN
                    GenJnlLine.INSERT;

            //End Advance payment


            UNTIL PayLine.NEXT = 0;

            COMMIT;
            //Post the Journal Lines
            GenJnlLine.RESET;
            GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);
            //Adjust Gen Jnl Exchange Rate Rounding Balances
            AdjustGenJnl.RUN(GenJnlLine);
            //End Adjust Gen Jnl Exchange Rate Rounding Balances


            //Before posting if paymode is cheque print the cheque
            IF (Rec."Pay Mode" = Rec."Pay Mode"::Cheque) AND (Rec."Cheque Type" = Rec."Cheque Type"::"Computer Check") THEN BEGIN
                DocPrint.PrintCheck(GenJnlLine);
                CODEUNIT.RUN(CODEUNIT::"Adjust Gen. Journal Balance", GenJnlLine);
                //Confirm Cheque printed //Not necessary.
            END;

            CODEUNIT.RUN(CODEUNIT::"Modified Gen. Jnl.-Post", GenJnlLine);
            Post := FALSE;
            Post := JournlPosted.PostedSuccessfully();
            IF Post THEN BEGIN
                IF PayLine.FINDFIRST THEN BEGIN
                    REPEAT
                        PayLine."Date Posted" := TODAY;
                        PayLine."Time Posted" := TIME;
                        PayLine."Posted By" := USERID;
                        PayLine.Status := PayLine.Status::Posted;
                        PayLine.MODIFY;
                    UNTIL PayLine.NEXT = 0;
                END;
            END;

        END;

    end;

    //[Scope('OnPrem')]
    procedure UpdateControls()
    begin
        IF Rec.Status <> Rec.Status::Approved THEN BEGIN
            "Payment Release DateEditable" := FALSE;
            PayingBankAccountEditable := FALSE;
            //CurrForm."Paying Bank Account".EDITABLE:=FALSE;
            //"Pay Mode".EDITABLE:=FALSE;
            //CurrForm."Currency Code".EDITABLE:=FALSE;
            "Currency CodeEditable" := FALSE;
            "Cheque No.Editable" := FALSE;
            "Cheque TypeEditable" := FALSE;
            PaymodeEditable := FALSE;
            "Invoice Currency CodeEditable" := TRUE;
        END ELSE BEGIN
            "Payment Release DateEditable" := TRUE;
            PaymodeEditable := TRUE;
            PayingBankAccountEditable := TRUE;
            //CurrForm."Paying Bank Account".EDITABLE:=TRUE;
            //CurrForm."Pay Mode".EDITABLE:=TRUE;
            IF Rec."Pay Mode" = Rec."Pay Mode"::Cheque THEN
                "Cheque TypeEditable" := TRUE;
            //CurrForm."Currency Code".EDITABLE:=FALSE;
            IF Rec."Cheque Type" <> Rec."Cheque Type"::"Computer Check" THEN
                "Cheque No.Editable" := TRUE;
            "Invoice Currency CodeEditable" := FALSE;


        END;


        IF Rec.Status = Rec.Status::Pending THEN BEGIN
            "Currency CodeEditable" := FALSE;
            GlobalDimension1CodeEditable := TRUE;
            "Payment NarrationEditable" := TRUE;
            ShortcutDimension2CodeEditable := TRUE;
            PayeeEditable := TRUE;
            ShortcutDimension3CodeEditable := TRUE;
            ShortcutDimension4CodeEditable := TRUE;
            DateEditable := TRUE;
            PVLinesEditable := TRUE;


        END ELSE BEGIN
            "Currency CodeEditable" := FALSE;
            GlobalDimension1CodeEditable := FALSE;
            "Payment NarrationEditable" := FALSE;
            ShortcutDimension2CodeEditable := FALSE;
            PayeeEditable := FALSE;
            ShortcutDimension3CodeEditable := FALSE;
            ShortcutDimension4CodeEditable := FALSE;
            DateEditable := FALSE;
            PVLinesEditable := FALSE;



        END
    end;

    //[Scope('Internal')]
    procedure LinesExists(): Boolean
    var
        PayLines: Record "FIN-Payment Line";
    begin
        HasLines := FALSE;
        PayLines.RESET;
        PayLines.SETRANGE(PayLines.No, Rec."No.");
        IF PayLines.FIND('-') THEN BEGIN
            HasLines := TRUE;
            EXIT(HasLines);
        END;
    end;

    //[Scope('Internal')]
    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "FIN-Payment Line";
    begin
        AllKeyFieldsEntered := TRUE;
        PayLines.RESET;
        PayLines.SETRANGE(PayLines.No, Rec."No.");
        IF PayLines.FIND('-') THEN BEGIN
            REPEAT
                IF (PayLines."Account No." = '') OR (PayLines.Amount <= 0) THEN
                    AllKeyFieldsEntered := FALSE;
            UNTIL PayLines.NEXT = 0;
            EXIT(AllKeyFieldsEntered);
        END;
    end;

    //[Scope('Internal')]
    procedure CustomerPayLinesExist(): Boolean
    var
        PayLine: Record "FIN-Payment Line";
    begin
        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, Rec."No.");
        PayLine.SETRANGE(PayLine."Account Type", PayLine."Account Type"::Customer);
        EXIT(PayLine.FINDFIRST);
    end;

    //[Scope('Internal')]
    procedure PopulateCheckJournal(var Payment: Record "FIN-Payments Header")
    begin
        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, Rec."No.");
        IF PayLine.FIND('-') THEN BEGIN

            REPEAT
                //  strText:=GetAppliedEntries(PayLine."Line No.");
                //Payment.TESTFIELD(Payment.Payee);
                PayLine.TESTFIELD(PayLine.Amount);
                // PayLine.TESTFIELD(PayLine."Global Dimension 1 Code");

                //BANK
                IF PayLine."Pay Mode" <> PayLine."Pay Mode"::Cheque THEN;

                //CHEQUE
                LineNo := LineNo + 1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := Rec."Payment Release Date";
                GenJnlLine."Document No." := PayLine.No;
                IF PayLine."Account Type" = PayLine."Account Type"::Customer THEN
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::" "
                ELSE
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."External Document No." := Rec."Cheque No.";

                GenJnlLine."Currency Code" := Rec."Currency Code";
                GenJnlLine.VALIDATE("Currency Code");
                GenJnlLine."Currency Factor" := Rec."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");
                IF PayLine."VAT Code" = '' THEN BEGIN
                    GenJnlLine.Amount := PayLine."Net Amount";
                END
                ELSE BEGIN
                    GenJnlLine.Amount := PayLine."Net Amount";
                END;
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."VAT Prod. Posting Group" := PayLine."VAT Prod. Posting Group";
                GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                GenJnlLine."Bal. Account No." := Rec."Paying Bank Account";
                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"Bank Account";
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Bank Payment Type" := GenJnlLine."Bank Payment Type"::"Computer Check";
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := PayLine."Applies-to Doc. No.";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := '';
                GenJnlLine.Description := Rec.Payee;
                ///GenJnlLine."Received By":=Payee;
                IF GenJnlLine.Amount <> 0 THEN GenJnlLine.INSERT;


            UNTIL PayLine.NEXT = 0;

        END;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        UpdateControls();
    end;




    trigger OnModifyRecord(): Boolean
    begin
        Rec.Validate("Vendor No.");
        Rec.Validate("Vendor Name");
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

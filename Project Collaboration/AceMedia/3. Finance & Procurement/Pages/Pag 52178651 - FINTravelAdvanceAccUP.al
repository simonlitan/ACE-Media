page 52178651 "FIN-Travel Advance Acc. UP"
{
    Caption = 'Imprest Accounting';
    DeleteAllowed = false;
    InsertAllowed = true;
    DelayedInsert = true;

    PageType = Card;
    SourceTable = "FIN-Imprest Surr. Header";
    //SourceTableView = WHERE(Posted = filter(false));
    PromotedActionCategories = 'New,Process,Report,Approvals,Posting,Attachments, Archive Document';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    ApplicationArea = All;
                    // Editable = Fieldseidtable;
                    Editable = true;

                }
                field("Account No."; Rec."Account No.")
                {
                    Editable = true;
                    ApplicationArea = All;


                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = All;
                    Editable = Fieldseidtable;
                    //TableRelation = "FIN-Imprest Header"."No." where(Status = filter(Posted), "Requested By" = field("User ID"), "Surrender Status" = filter(<> Full));
                    TableRelation = "FIN-Imprest Header"."No." where(Status = filter(Posted), "Account No." = field("Account No."), "Surrender Status" = filter(<> Full));

                    trigger OnValidate()
                    begin

                        /*Copy the details from the payments header tableto the imprest surrender table to enable the user work on the same document*/
                        /*Retrieve the header details using the get statement*/
                        PayHeader.RESET;
                        PayHeader.get(rec."Imprest Issue Doc. No");

                        /*Copy the details to the user interface*/
                        Rec."Paying Bank Account" := PayHeader."Paying Bank Account";
                        Rec.Payee := PayHeader.Payee;
                        REC."Received From" := PayHeader.Payee;
                        PayHeader.CALCFIELDS(PayHeader."Total Net Amount");
                        Rec.Amount := PayHeader."Total Net Amount";
                        Rec."Amount Surrendered LCY" := PayHeader."Total Net Amount LCY";
                        //Currencies
                        Rec."Currency Factor" := PayHeader."Currency Factor";
                        Rec."Currency Code" := PayHeader."Currency Code";

                        // Rec."Date Posted" := PayHeader."Date Posted";
                        Rec."Global Dimension 1 Code" := PayHeader."Global Dimension 1 Code";
                        Rec.VALIDATE("Global Dimension 1 Code");
                        Rec."Shortcut Dimension 2 Code" := PayHeader."Shortcut Dimension 2 Code";
                        // rec."Shortcut Dimension 2 Code" := 'NAKS';
                        Rec.VALIDATE("Shortcut Dimension 2 Code");
                        Rec."Shortcut Dimension 3 Code" := PayHeader."Shortcut Dimension 3 Code";
                        Rec.Dim3 := PayHeader.Dim3;
                        Rec."Shortcut Dimension 4 Code" := PayHeader."Shortcut Dimension 4 Code";
                        Rec.Dim4 := PayHeader.Dim4;
                        Rec."Shortcut Dimension 5" := PayHeader."Shortcut Dimension 5";
                        // Rec."Imprest Issue Date" := PayHeader.Date;
                        Rec."Imprest Issue Date" := PayHeader."Payment Release Date";
                        rec.Remarks := PayHeader.Purpose;
                        rec."Budget Balance" := PayHeader."Budget Balance";


                        /*Copy the detail lines from the imprest details table in the database*/
                        PayLine.RESET;
                        PayLine.SETRANGE(PayLine.No, Rec."Imprest Issue Doc. No");
                        IF PayLine.FIND('-') THEN /*Copy the lines to the line table in the database*/
                              BEGIN
                            REPEAT
                                ImpSurrLine.INIT;
                                ImpSurrLine."Surrender Doc No." := Rec.No;
                                ImpSurrLine."Account No:" := PayLine."Account No.";
                                ImpSurrLine."Account No:" := PayLine."Account No.";
                                ImpSurrLine."Budget Name" := PayLine."Budget Name";
                                ImpSurrLine."Imprest Type" := PayLine."Advance Type";
                                ImpSurrLine."Line No." := PayLine."Line No." + 1;
                                ImpSurrLine.VALIDATE(ImpSurrLine."Account No:");
                                GLAccount.Reset();
                                GLAccount.SetRange("No.", ImpSurrLine."Account No:");
                                if GLAccount.Find('-') then
                                    ImpSurrLine."Account Name" := GLAccount.Name;

                                ImpSurrLine.Amount := PayLine.Amount;

                                ImpSurrLine."Due Date" := PayLine."Due Date";
                                ImpSurrLine."Imprest Holder" := PayLine."Imprest Holder";
                                ImpSurrLine."Actual Spent" := PayLine."Actual Spent";
                                ImpSurrLine."Apply to" := PayLine."Apply to";
                                ImpSurrLine."Apply to ID" := PayLine."Apply to ID";
                                ImpSurrLine."Surrender Date" := PayLine."Surrender Date";
                                ImpSurrLine.Surrendered := PayLine.Surrendered;
                                ImpSurrLine."Cash Receipt No" := PayLine."M.R. No";
                                ImpSurrLine."Date Issued" := PayLine."Date Issued";
                                ImpSurrLine."Type of Surrender" := PayLine."Type of Surrender";
                                ImpSurrLine."Dept. Vch. No." := PayLine."Dept. Vch. No.";
                                ImpSurrLine."Currency Factor" := PayLine."Currency Factor";
                                ImpSurrLine."Currency Code" := PayLine."Currency Code";
                                ImpSurrLine."Imprest Req Amt LCY" := PayLine."Amount LCY";
                                ImpSurrLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                                ImpSurrLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
                                ImpSurrLine."Shortcut Dimension 3 Code" := PayLine."Shortcut Dimension 3 Code";
                                ImpSurrLine."Shortcut Dimension 4 Code" := PayLine."Shortcut Dimension 4 Code";
                                ImpSurrLine.INSERT;
                            UNTIL PayLine.NEXT = 0;
                        END;


                        PaymentsH.RESET;
                        PaymentsH.SETRANGE(PaymentsH."Imprest No.", Rec."Imprest Issue Doc. No");
                        IF PaymentsH.FIND('-') THEN BEGIN
                            Rec."PV No" := PaymentsH."No.";
                        END;

                    end;
                }
               
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Imprest Issue Date"; Rec."Imprest Issue Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Imprest Posted Date';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {

                    Editable = true;
                    ApplicationArea = All;


                    trigger OnValidate()
                    begin
                        DimName1 := GetDimensionName(Rec."Global Dimension 1 Code", 1);
                    end;
                }

                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {

                    Editable = true;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        DimName2 := GetDimensionName(Rec."Shortcut Dimension 2 Code", 2);
                    end;
                }
                field(Remarks; Rec.Remarks)
                {
                    Editable = true;
                    ApplicationArea = all;
                    Caption = 'Purpose';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    Visible = false;

                    Editable = true;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        DimName2 := GetDimensionName(Rec."Shortcut Dimension 3 Code", 3);
                    end;
                }



                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = All;

                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    ApplicationArea = All;
                    Editable = Fieldseidtable;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    Editable = true;
                }


            }
            part(ImprestLines; "FIN-Imprest Surr. Details UP")
            {
                ApplicationArea = all;
                Editable = ImprestLinesEditable;
                SubPageLink = "Surrender Doc No." = FIELD(No);
            }
            label(_________)
            {
                CaptionClass = Text19053222;
                Style = Standard;
                StyleExpr = TRUE;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {


            separator(________________)
            {

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
                    ApprovalMgnt: Codeunit "Init Code";
                    BudgBal: Codeunit "Budget Balance";
                begin
                    IF Rec.Status <> Rec.Status::Pending THEN
                        ERROR('The document is not open.');
                    Docattach.Reset();
                    Docattach.SetRange("No.", Rec.No);
                    if Docattach.Count < 1 then error('No attachments done');
                    if rec.CalcFields("Actual Spent") then
                        if rec."Actual Spent" <= 0 then Error('Actual Spent has not been specified');
                    if rec."Actual Spent" > rec.Amount then Error('Actual Spent cannot be greater than the amount given');
                    if (rec."Actual Spent" + rec."Cash Surrender Amt") > rec.Amount then Error('Amount been accounted is more than given amount');
                    if ApprovalMgnt.IsImprestAccEnabled(Rec) = true then
                        ApprovalMgnt.OnSendImprestAccforApproval(Rec);
                    BudgBal.SetSurrBudgetBalance(rec);

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
                RunPageLink = "Document No." = field("No");
            }
            action(cancellsApproval)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = category4;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Init Code";

                begin

                    if ApprovalMgt.IsImprestAccEnabled(Rec) = true then
                        ApprovalMgt.OnCancelImprestAccforApproval(Rec);
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
                            Doc_Type := Doc_Type::Surrender;
                        Rec.Status := Rec.Status::Archive;
                        Rec.MODIFY;
                    END ELSE
                        ERROR(Text001);
                end;
            }

            action(Post)
            {
                ApplicationArea = All;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = category5;


                trigger OnAction()
                var
                    Txt0001: Label 'Actual Spent and the Cash Receipt Amount should be equal to the amount Issued';
                begin
                    rec.ExpenseBudget;
                    Rec.TESTFIELD(Status, Rec.Status::Approved);
                    IF Rec.Posted THEN
                        ERROR('The transaction has already been posted.');

                    //HOW ABOUT WHERE ONE RETURNS ALL THE AMOUNT??
                    //THERE SHOULD BE NO GENJNL ENTRIES BUT REVERSE THE COMMITTMENTS

                    // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                    IF GenledSetup.GET THEN BEGIN
                        GenJnlLine.RESET;
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", GenledSetup."Surrender Template");
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", GenledSetup."Surrender  Batch");
                        GenJnlLine.DELETEALL;
                    END;

                    IF DefaultBatch.GET(GenledSetup."Surrender Template", GenledSetup."Surrender  Batch") THEN BEGIN
                        DefaultBatch.DELETE;
                    END;

                    DefaultBatch.RESET;
                    DefaultBatch."Journal Template Name" := GenledSetup."Surrender Template";
                    DefaultBatch.Name := GenledSetup."Surrender  Batch";
                    DefaultBatch.INSERT;
                    LineNo := 0;

                    ImprestDetails.RESET;
                    ImprestDetails.SETRANGE(ImprestDetails."Surrender Doc No.", Rec.No);
                    IF ImprestDetails.FIND('-') THEN BEGIN
                        REPEAT
                            //Post Surrender Journal
                            //Compare the amount issued =amount on cash reciecied.
                            //Created new field for zero spent
                            //

                            //ImprestDetails.TESTFIELD("Actual Spent");
                            //ImprestDetails.TESTFIELD("Actual Spent");
                            /* IF (ImprestDetails."Cash Receipt Amount" + ImprestDetails."Actual Spent") <> ImprestDetails.Amount THEN
                                ERROR(Txt0001); */

                            Rec.TESTFIELD("Global Dimension 1 Code");

                            LineNo := LineNo + 1000;
                            GenJnlLine.INIT;
                            GenJnlLine."Journal Template Name" := GenledSetup."Surrender Template";
                            GenJnlLine."Journal Batch Name" := GenledSetup."Surrender  Batch";
                            GenJnlLine."Line No." := LineNo;
                            GenJnlLine."Source Code" := 'PAYMENTJNL';
                            GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
                            GenJnlLine."Account No." := ImprestDetails."Account No:";
                            GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                            //Set these fields to blanks
                            GenJnlLine."Posting Date" := Rec."Surrender Date";
                            GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
                            GenJnlLine.Validate("Document Type");
                            GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                            GenJnlLine.VALIDATE("Gen. Posting Type");
                            GenJnlLine."Gen. Bus. Posting Group" := '';
                            GenJnlLine.VALIDATE("Gen. Bus. Posting Group");
                            GenJnlLine."Gen. Prod. Posting Group" := '';
                            GenJnlLine.VALIDATE("Gen. Prod. Posting Group");
                            GenJnlLine."VAT Bus. Posting Group" := '';
                            GenJnlLine.VALIDATE("VAT Bus. Posting Group");
                            GenJnlLine."VAT Prod. Posting Group" := '';
                            GenJnlLine.VALIDATE("VAT Prod. Posting Group");
                            GenJnlLine."Document No." := Rec.No;
                            GenJnlLine.Amount := ImprestDetails."Actual Spent";
                            GenJnlLine."Shortcut Dimension 5" := rec."Shortcut Dimension 5";
                            GenJnlLine.VALIDATE(GenJnlLine.Amount);
                            GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::Customer;
                            GenJnlLine."Bal. Account No." := Rec."Account No.";
                            GenJnlLine.Description := Rec."Account No." + ':' + rec."Imprest Issue Doc. No";
                           // GenJnlLine.Narration := 'Imprest: ' + Rec."Account No." + ':' + Rec.Remarks + ':' + rec."Imprest Issue Doc. No";
                            GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                            GenJnlLine."Currency Code" := Rec."Currency Code";
                            GenJnlLine.VALIDATE("Currency Code");
                            //Take care of Currency Factor
                            GenJnlLine."Currency Factor" := Rec."Currency Factor";
                            GenJnlLine.VALIDATE("Currency Factor");

                            GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                            GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                            //   GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                            // GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                            //GenJnlLine.ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
                            //GenJnlLine.ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");

                            //Application of Surrender entries
                            IF GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::Customer THEN BEGIN
                                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                                GenJnlLine."Applies-to Doc. No." := Rec."Imprest Issue Doc. No";
                                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                                GenJnlLine."Applies-to ID" := Rec."Apply to ID";
                            END;
                            IF GenJnlLine.Amount <> 0 THEN
                                GenJnlLine.INSERT;
                        UNTIL ImprestDetails.NEXT = 0;
                        //Post Entries
                        GenJnlLine.RESET;
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", GenledSetup."Surrender Template");
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", GenledSetup."Surrender  Batch");
                        //Adjust Gen Jnl Exchange Rate Rounding Balances
                        AdjustGenJnl.RUN(GenJnlLine);
                        //End Adjust Gen Jnl Exchange Rate Rounding Balances

                        //GenerateReceipt();
                        // Message('Available');
                        CODEUNIT.RUN(CODEUNIT::"Modified Gen. Jnl.-Post", GenJnlLine);
                        //  Rec.ExpenseBudget;
                    END;

                    //IF JournalPostSuccessful.PostedSuccessfully THEN BEGIN
                    Rec.Posted := TRUE;
                    Rec.Status := Rec.Status::Posted;
                    Rec."Date Posted" := TODAY;
                    Rec."Time Posted" := TIME;
                    Rec."Posted By" := USERID;
                    Rec.MODIFY;
                    //Tag the Source Imprest Requisition as Surrendered
                    ImprestReq.RESET;
                    ImprestReq.SETRANGE(ImprestReq."No.", Rec."Imprest Issue Doc. No");
                    IF ImprestReq.FIND('-') THEN BEGIN
                        ImprestReq."Surrender Status" := ImprestReq."Surrender Status"::Full;
                        ImprestReq.MODIFY;
                        // if ImprestReq.Count > 0 then begin
                        //     Error('Imprest already selected');
                        //end;
                    END;
                    PayHeader.Reset();
                    PayHeader.SetRange(PayHeader."No.", rec."Imprest Issue Doc. No");
                    if PayHeader.Find('-') then begin
                        PayHeader."Surrender No" := rec.No;
                        PayHeader."Surrendered amount" := rec.Amount;
                        PayHeader."Surrender date" := rec."Date Posted";
                    end;

                    //End Tag
                    //Post Committment Reversals
                    Doc_Type := Doc_Type::Imprest;
                    BudgetControl.ReverseEntries(Doc_Type, Rec."Imprest Issue Doc. No");
                    //END;

                end;
            }
            action(Print)
            {
                ApplicationArea = All;
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = report;

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETFILTER(No, Rec.No);
                    REPORT.RUN(Report::"Imprest Surrender", TRUE, TRUE, Rec);

                end;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = category6;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                trigger OnAction()

                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
        }
    }

    trigger OnInit()
    begin
        if rec.Status <> rec.Status::Pending then
            Fieldseidtable := false
        else
            Fieldseidtable := true;
        ImprestLinesEditable := TRUE;
        "Responsibility CenterEditable" := TRUE;
        "Imprest Issue Doc. NoEditable" := TRUE;
        "Account No.Editable" := TRUE;
        "Surrender DateEditable" := TRUE;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        if rec.Status <> rec.Status::Pending then
            Fieldseidtable := false

        else
            Fieldseidtable := true;
        Rec."User ID" := USERID;
        Rcpt.RESET;
        Rcpt.SETRANGE(Rcpt.Posted, FALSE);
        Rcpt.SETRANGE(Rcpt.Cashier, USERID);
        IF Rcpt.COUNT > 0 THEN BEGIN
            IF CONFIRM('There are still some unposted imprest Surrenders. Continue?', FALSE) = FALSE THEN BEGIN
                ERROR('There are still some unposted imprest Surrenders. Please utilise them first');
            END;
        END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if rec.Status <> rec.Status::Pending then
            Fieldseidtable := false
        else
            Fieldseidtable := true;
        Rec."Account Type" := Rec."Account Type"::Customer;

        Rec.Cashier := USERID;
        Rec.VALIDATE(Cashier);
        IF Rec.No = '' THEN BEGIN
            GenLedgerSetup.Reset();
            GenLedgerSetup.GET;
            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Imprest Surrender No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Imprest Surrender No", xRec."No. Series", 0D, Rec.No, Rec."No. Series");
        END;
        // usersetup.Reset();
        // usersetup.SetRange("User ID", rec.Cashier);
        // if usersetup.Find('-') then begin
        //     Rec."Account No." := usersetup."Employee No.";//Litan Usersetup employee removal
        Hremployeec.Reset();
        Hremployeec.SetRange("No.", rec."Account No.");
        if Hremployeec.Find('-') then begin
            Rec."Account Name" := Hremployeec."First Name" + ' ' + Hremployeec."Middle Name" + ' ' + Hremployeec."Last Name";
            rec."Received From" := Hremployeec."First Name" + ' ' + Hremployeec."Middle Name" + ' ' + Hremployeec."Last Name";


        end;
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
    end;

    trigger OnAfterGetRecord()
    begin
        if rec.Status <> rec.Status::Pending then
            Fieldseidtable := false
        else
            Fieldseidtable := true;

    end;



    var
        Fieldeditable: Boolean;
        Rcpt: Record "FIN-Imprest Surr. Header";
        usersetup: record "User Setup";
        Fieldseidtable: boolean;
        Hremployeec: record "HRM-Employee C";
        GenLedgerSetup: Record "Cash Office Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        //ApprovalEntries: Page "658";
        //RecPayTypes: Record "61129";
        //TarriffCodes: Record "61716";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        //CashierLinks: Record "61712";
        LineNo: Integer;
        NextEntryNo: Integer;
        PayHeader: Record "FIN-Imprest Header";
        CommitNo: Integer;
        ImprestDetails: Record "FIN-Imprest Surrender Details";
        EntryNo: Integer;
        PaymentsH: Record "FIN-Payments Header";
        GLAccount: Record "G/L Account";
        IsImprest: Boolean;
        //ImprestRequestDet: Record "61719";
        GenledSetup: Record "Cash Office Setup";
        ImprestAmt: Decimal;
        DimName1: Text[80];
        DimName2: Text[80];
        //CashPaymentLine: Record "61718";
        //PaymentLine: Record "61705";
        //CurrSurrDocNo: Code[20];
        //JournalPostSuccessful: Codeunit "50113";
        //Commitments: Record "61722";
        BCSetup: Record "FIN-Budgetary Control Setup";
        BudgetControl: Codeunit "Budgetary Control";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher",Surrender;
        Docattach: record "Document Attachment";
        ImprestReq: Record "FIN-Imprest Header";
        UserMgt: Codeunit "User Setup Management";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        ImpSurrLine: Record "FIN-Imprest Surrender Details";
        AccountName: Text[100];
        Text000: Label 'You have not specified the Actual Amount Spent. This document will only reverse the committment and you will have to receipt the total amount returned.';
        Text001: Label 'Document Not Posted';
        AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";
        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";
        ReceiptHeader: Record "FIN-Receipts Header";
        //ImprestSurrHeader: Record "61504";
        RecLine: Record "FIN-Receipt Line q";
        PayLine: Record "FIN-Imprest Lines";
        LastNo: Code[20];
        GenSetUp: Record "FIN-Cash Office Setup";
        "No. Series Line": Record "No. Series Line";
        BankRec: Record "Bank Account";

        "Surrender DateEditable": Boolean;

        "Account No.Editable": Boolean;

        "Imprest Issue Doc. NoEditable": Boolean;

        "Responsibility CenterEditable": Boolean;

        ImprestLinesEditable: Boolean;
        Text19053222: Label 'Enter Advance Accounting Details below';
        //FINBudgetEntries: Record "77078";
        FINImprestSurrLines: Record "FIN-Imprest Surrender Details";

    //[Scope('Internal')]
    procedure GetDimensionName(var "Code": Code[20]; DimNo: Integer) Name: Text[60]
    var
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
    begin
        /*Get the global dimension 1 and 2 from the database*/
        Name := '';

        GLSetup.RESET;
        GLSetup.GET();

        DimVal.RESET;
        DimVal.SETRANGE(DimVal.Code, Code);

        IF DimNo = 1 THEN BEGIN
            DimVal.SETRANGE(DimVal."Dimension Code", GLSetup."Global Dimension 1 Code");
        END
        ELSE
            IF DimNo = 2 THEN BEGIN
                DimVal.SETRANGE(DimVal."Dimension Code", GLSetup."Global Dimension 2 Code");
            END;
        IF DimVal.FIND('-') THEN BEGIN
            Name := DimVal.Name;
        END;

    end;

    //[Scope('Internal')]
    procedure UpdateControl()
    begin
        IF Rec.Status <> Rec.Status::Pending THEN BEGIN
            "Surrender DateEditable" := FALSE;
            "Account No.Editable" := FALSE;
            "Imprest Issue Doc. NoEditable" := FALSE;
            "Responsibility CenterEditable" := FALSE;
            ImprestLinesEditable := FALSE;
        END ELSE BEGIN
            "Surrender DateEditable" := TRUE;
            "Account No.Editable" := TRUE;
            "Imprest Issue Doc. NoEditable" := TRUE;
            "Responsibility CenterEditable" := TRUE;
            ImprestLinesEditable := TRUE;

        END;
    end;

    //[Scope('Internal')]
    procedure GetCustName(No: Code[20]) Name: Text[100]
    var
        Cust: Record Customer;
    begin
        Name := '';
        IF Cust.GET(No) THEN
            Name := Cust.Name;
        EXIT(Name);
    end;

    //[Scope('Internal')]
    procedure UpdateforNoActualSpent()
    begin
        Rec.Posted := TRUE;
        Rec.Status := Rec.Status::Posted;
        Rec."Date Posted" := TODAY;
        Rec."Time Posted" := TIME;
        Rec."Posted By" := USERID;
        Rec.MODIFY;
        //Tag the Source Imprest Requisition as Surrendered
        ImprestReq.RESET;
        ImprestReq.SETRANGE(ImprestReq."No.", Rec."Imprest Issue Doc. No");
        IF ImprestReq.FIND('-') THEN BEGIN
            ImprestReq."Surrender Status" := ImprestReq."Surrender Status"::Full;
            ImprestReq.MODIFY;
        END;
        //End Tag
        //Post Committment Reversals
        Doc_Type := Doc_Type::Imprest;
        BudgetControl.ReverseEntries(Doc_Type, Rec."Imprest Issue Doc. No");
    end;

    //[Scope('Internal')]
    procedure CompareAllAmounts()
    begin
    end;


    //[Scope('Internal')]
    procedure GenerateReceipt()
    begin
        IF ImprestDetails."Cash Receipt Amount" <> 0 THEN
            Rec.TESTFIELD("Received From");

        IF BankRec.GET(ImprestDetails."Bank/Petty Cash") THEN
            BankRec.TESTFIELD(BankRec."Receipt No. Series");

        LastNo := '';
        GenSetUp.GET;
        "No. Series Line".SETRANGE("No. Series Line"."Series Code", GenSetUp."Receipts No");
        IF "No. Series Line".FIND('-') THEN BEGIN
            LastNo := BankRec."Receipt No. Series" + '-' + INCSTR("No. Series Line"."Last No. Used");
            "No. Series Line"."Last No. Used" := INCSTR("No. Series Line"."Last No. Used");
            "No. Series Line".MODIFY;
        END;


        IF ImprestDetails."Cash Surrender Amt" <> 0 THEN BEGIN

            ReceiptHeader.INIT;
            ReceiptHeader."No." := LastNo;
            ReceiptHeader.Date := Rec."Surrender Date";
            // ReceiptHeader."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
            // ReceiptHeader."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
            // ReceiptHeader.VALIDATE("Global Dimension 1 Code");
            // ReceiptHeader.VALIDATE("Shortcut Dimension 2 Code");
            ReceiptHeader.Cashier := USERID;
            ReceiptHeader."Date Posted" := TODAY;
            ReceiptHeader."Time Posted" := TIME;
            ReceiptHeader.Posted := TRUE;
            ReceiptHeader."Received From" := Rec."Received From";
            ReceiptHeader."Amount Recieved" := ImprestDetails."Cash Receipt Amount";
            // ReceiptHeader."Responsibility Center" := 'CUC';
            ReceiptHeader."Bank Code" := ImprestDetails."Bank/Petty Cash";
            ReceiptHeader."Surrender No" := Rec.No;

            IF ImprestDetails."Cash Surrender Amt" <> 0 THEN
                ReceiptHeader.INSERT;

            RecLine.INIT;
            RecLine.No := LastNo;
            RecLine.Type := 'SURRENDER';
            RecLine."Account No." := Rec."Account No.";
            RecLine."Account Name" := 'Imprest Cash Surrender';
            RecLine.Amount := ImprestDetails."Cash Receipt Amount";
            RecLine.VALIDATE(RecLine.Amount);
            RecLine."Cheque/Deposit Slip No" := ImprestDetails."Cheque/Deposit Slip No";
            RecLine."Cheque/Deposit Slip Date" := ImprestDetails."Cheque/Deposit Slip Date";
            RecLine."Cheque/Deposit Slip Type" := ImprestDetails."Cheque/Deposit Slip Type";
            RecLine."Cheque/Deposit Slip Bank" := ImprestDetails."Bank/Petty Cash";
            RecLine."Pay Mode" := ImprestDetails."Cash Pay Mode";

            IF ImprestDetails."Cash Surrender Amt" <> 0 THEN
                RecLine.INSERT;
        END;
    end;



}

page 52178645 "FIN-Travel Advance Req. UP"
{
    Caption = 'Imprest Request';

    //Editable = true;
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Cancel Document,Post,Archive Document';
    SourceTable = "FIN-Imprest Header";


    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    Editable = true;
                    //Editable = DateEditable;
                    ApplicationArea = All;
                }

                field("Requested By"; Rec."Requested By")
                {
                    Editable = false;

                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {

                    Editable = GlobalDimension1CodeEditable;
                    ApplicationArea = All;
                }

                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    editable = ShortcutDimension2CodeEditable;
                    // Editable = false;
                    ApplicationArea = All;
                    //ApplicationArea = All;
                }




                field(Region; Rec.Region)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Region field.';
                    Editable = false;
                    Visible = false;
                }

                field(Purpose; Rec.Purpose)
                {
                    // Editable = Purposeditable;
                    Editable = true;
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                    begin
                      rec.Purpose := UpperCase(rec.Purpose)
                    end;
                }
                field("Start Date"; Rec."Start Date")
                {

                }
                field("Duration Period"; Rec."Duration Period")
                {
                    Caption = 'No. of Days';

                }
                field("Ending Date"; Rec."Ending Date")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                
             
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = ResponsibilityCenterEditable;
                }



            }
            group("Payee Details")
            {

                field("Account No."; Rec."Account No.")
                {
                    Editable = AccountNoEditable;
                    Caption = 'Personal No.';
                    ApplicationArea = All;
                }
                field(Payee; Rec.Payee)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = all;
                    Editable = true;

                }


            }

            group("Bank Details")
            {
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    Editable = "Paying Bank AccountEditable";
                    ApplicationArea = All;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    Editable = "Pay ModeEditable";
                    ApplicationArea = All;
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    Caption = 'Cheque/EFT No.';
                    Editable = "Cheque No.Editable";

                    ApplicationArea = All;
                }
                field("Payment Release Date"; Rec."Payment Release Date")
                {
                    Caption = 'Payment Release Date';
                    Editable = "Payment Release DateEditable";
                    ApplicationArea = All;
                }

            }
            part(PVLines; "FIN-Imprest Details UP")
            {
                SubPageLink = No = FIELD("No.");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {

            action("File Attachment")
            {
                ApplicationArea = Suite;

                Image = Attach;
                Promoted = true;
                PromotedCategory = category5;
                trigger OnAction()

                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
                /*   trigger OnAction()
                  begin
                      DMS.Reset;
                      DMS.SetRange("Document Type", DMS."Document Type"::Imprest);
                      if DMS.Find('-') then begin
                          Hyperlink(DMS."url path" + Rec."No.");
                      end else
                          Message('No Link ' + format(DMS."Document Type"::Imprest));
                  end; */

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
                    BudgBalance: Codeunit "Budget Balance";
                begin

                    if ApprovalMgnt.IsImprestEnabled(Rec) = true then begin
                        ApprovalMgnt.OnSendImprestforApproval(Rec);
                        //get budget Balance
                        //Commit();
                        BudgBalance.SetBudgetBalance(Rec);

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
                    IF CONFIRM('This will also reverse Busget Commitment, Continue?', FALSE) = FALSE THEN ERROR('Cancelled by user!');

                    if Rec.Status = Rec.Status::"Pending Approval" then begin
                        rec.ReverseBudget();
                        ApprovalMgt.OnCancelImprestForApproval(Rec);

                    end else
                        Error('Status has to be pending');
                end;
            }


            action("Print/Preview")
            {
                ApplicationArea = All;
                Caption = 'Print/Preview';
                Image = PrintAttachment;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    // IF Rec.Status <> Rec.Status::Approved THEN
                    //     ERROR('You can only print after the document is released for approval');
                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    REPORT.RUN(Report::"Imprest Request2", TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
            separator(_________________)
            {
            }
            action("Cancel Document")
            {
                ApplicationArea = All;
                Caption = 'Cancel Document';
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = category6;
                Visible = true;

                trigger OnAction()
                var
                    Text000: Label 'Are you sure you want to Cancel this Document?';
                    Text001: Label 'You have selected not to Cancel this Document';
                begin
                    //TESTFIELD(Status,Status::Approved);
                    IF CONFIRM('This will also reverse Busget Commitment, Continue?', FALSE) = FALSE THEN ERROR('Cancelled by user!');
                    REc.ReverseBudget();
                    IF CONFIRM(Text000, TRUE) THEN BEGIN
                        //Post Committment Reversals
                        Doc_Type := Doc_Type::Imprest;
                        BudgetControl.ReverseEntries(Doc_Type, Rec."No.");
                        Rec.Status := Rec.Status::Pending;
                        Rec.MODIFY;
                    END ELSE
                        ERROR(Text001);
                end;
            }
            action("Archive Document")
            {
                ApplicationArea = All;

                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category8;
                Visible = true;

                trigger OnAction()
                var
                    Text000: Label 'Are you sure you want to Archive this Document?';
                    Text001: Label 'You have selected not to Archive this Document';
                begin

                    IF CONFIRM('This will Archive, Continue?', FALSE) = FALSE THEN ERROR('Archive by user!');
                    IF CONFIRM(Text000, TRUE) THEN BEGIN
                        if Rec.Status = rec.status::Pending then
                            Doc_Type := Doc_Type::Imprest;
                        Rec.Status := Rec.Status::Archive;
                        Rec.MODIFY;
                    END ELSE
                        ERROR(Text001);
                end;
            }

            action("Post Imprest")
            {
                ApplicationArea = All;
                Caption = 'Post Imprest';
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = category7;
                Visible = Postvisible;

                trigger OnAction()
                begin
                    IF Rec.Status <> Rec.Status::Approved THEN ERROR('Not Approved');
                    if Rec."Total Net Amount" > 0 then begin
                        // IF CONFIRM('Post Document?', TRUE) = FALSE THEN EXIT;
                        // ExpenseBudget();
                        PostImprest();
                    end
                    else
                        Error('Amount field must have a value in the lines');
                end;
            }
            // }
            group("Cheque Printing")
            {
                Caption = 'Cheque Printing';
                action("P&review Check")
                {
                    ApplicationArea = All;
                    Caption = 'P&review Check';
                    RunObject = Page "Check Preview";
                    Visible = false;
                }
                action("Generate Check")
                {
                    ApplicationArea = All;
                    Caption = 'Generate Check';
                    Image = PrintCheck;

                    trigger OnAction()
                    begin


                        //CheckPVRequiredItems(Rec);
                        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                        GenJnlLine.RESET;
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
                        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);
                        IF GenJnlLine.FIND('+') THEN
                            GenJnlLine.DELETEALL;
                        GenJnlLine.RESET;

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
                    ApplicationArea = All;
                    Caption = 'Print Cheque';

                    trigger OnAction()
                    begin
                        GenJnlLine.RESET;
                        GenJnlLine.SETRANGE("Journal Template Name", JTemplate);
                        GenJnlLine.SETRANGE("Journal Batch Name", JBatch);
                        IF GenJnlLine.FIND('-') THEN
                            REPORT.RUN(Report::Check, TRUE, TRUE, GenJnlLine);
                    end;
                }
                action("Void Check")
                {
                    ApplicationArea = All;
                    Caption = 'Void Check';
                    Image = VoidCheck;

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
            group("EFT Generation")
            {
                Caption = 'EFT Generation';
                action("Generate EFT")
                {
                    ApplicationArea = All;
                    Caption = 'Generate EFT';

                    trigger OnAction()
                    begin
                        IF Rec.Status <> Rec.Status::Approved THEN ERROR('Imprest must be approved');
                        Rec.TESTFIELD("Cheque No.");

                        EFTHeader.RESET;
                        EFTHeader.SETRANGE(EFTHeader."No.", Rec."Cheque No.");
                        IF EFTHeader.FIND('-') THEN BEGIN
                            PayLine.RESET;
                            PayLine.SETRANGE(PayLine.No, Rec."No.");
                            IF PayLine.FIND('-') THEN BEGIN
                                EFTline.INIT;
                                EFTline."Doc No" := EFTHeader."No.";
                                EFTline.Date := EFTHeader.Date;
                                EFTline."Bank Code" := PayLine."EFT Bank Code";
                                EFTline."Bank Branch No" := PayLine."EFT Bank Code";
                                EFTline."Bank A/C Name" := PayLine."EFT Account Name";
                                //EFTline."Bank A/C Name":=Payee;
                                EFTline.Payee := PayLine."Account Name";
                                EFTline."Bank A/C No" := PayLine."EFT Bank Account No";
                                EFTline.Amount := PayLine.Amount;
                                EFTline."PV Number" := PayLine.No;
                                EFTline.Description := Rec.Payee;
                                EFTline.INSERT;

                            END;
                        END;
                        EFTHeader.Posted := TRUE;
                        EFTHeader."Posted by" := USERID;
                        EFTHeader.MODIFY;

                        IF Rec.Status <> Rec.Status::Approved THEN ERROR('Not Approved');
                        IF CONFIRM('Post Document?', TRUE) = FALSE THEN EXIT;

                        PostImprest();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //OnAfterGetCurrRecord;
        if rec.Status = rec.Status::Approved then Postvisible := true else Postvisible := false;
    end;

    trigger OnInit()
    begin
        DateEditable := TRUE;
        ShortcutDimension2CodeEditable := TRUE;
        GlobalDimension1CodeEditable := TRUE;
    end;
    trigger OnModifyRecord(): Boolean
    var
        myInt: Integer;
    begin
        rec."Account Type" := rec."Account Type"::Customer;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Userse.Reset();
        Userse.setrange("User ID", UserId);
        Userse.setrange("Unlimited Imprest Requests", false);
        If Userse.find('-') then begin
            Rcpt.RESET;
            Rcpt.SETRANGE(Rcpt."Requested By", USERID);
            Rcpt.SetRange("Surrender Status", Rcpt."Surrender Status"::" ");
            Rcpt.Setfilter(Status, '%1 | %2 | %3 | %4', Rcpt.Status::Pending, Rcpt.Status::"Pending Approval", Rcpt.Status::Approved, Rcpt.Status::Posted);
            // Rcpt.Setfilter(Status, '<>%1', Rcpt.Status::Cancelled);
            If Rcpt.Find('-') then Begin
                if Rcpt.Count > 5 THEN Begin
                    ERROR('The selected staff has some pending imprests');
                End
                Else Begin
                    Rec."Payment Type" := Rec."Payment Type"::Imprest;
                    Rec."Account Type" := Rec."Account Type"::Customer;
                    Rcpt.SETRANGE(Rcpt.Posted, FALSE);
                    Rcpt.SETRANGE(Rcpt.Cashier, USERID);
                    // Rcpt.SetFilter(Status, '<>%1', Rec.Status::Cancelled);
                    IF Rcpt.COUNT > 2 THEN BEGIN
                        IF CONFIRM('There are still some unposted imprests. Continue?', FALSE) = FALSE THEN BEGIN
                            ERROR('There are still some unposted imprests. Please utilise them first');
                        END;
                    END;
                End;
            End;

        end
        Else begin
            Userse.Reset();
            Userse.setrange("User ID", UserId);
            Userse.setrange("Unlimited Imprest Requests", True);
            If Userse.find('-') then begin
                Rcpt.RESET;
                Rcpt.SETRANGE(Rcpt."Requested By", USERID);
                Rcpt.SetRange("Surrender Status", Rcpt."Surrender Status"::" ");
                //Rcpt.Setfilter(Status, '<>%1', Rcpt.Status::Cancelled);
                If Rcpt.Find('-') then Begin
                    Rec."Payment Type" := Rec."Payment Type"::Imprest;
                    Rec."Account Type" := Rec."Account Type"::Customer;
                    Rcpt.SETRANGE(Rcpt.Posted, FALSE);
                    Rcpt.SETRANGE(Rcpt.Cashier, USERID);
                    IF Rcpt.COUNT > 2 THEN BEGIN
                        IF CONFIRM('There are still some unposted imprests. Continue?', FALSE) = FALSE THEN BEGIN
                            ERROR('There are still some unposted imprests. Please utilise them first');
                        END;
                    End;
                End;

            end
        end;
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
         VALIDATE("Shortcut Dimension 4 Code");*/
        //OnAfterGetCurrRecord;

        //"Budget Name":=Setup."Current Budget";
        //         trigger OnInsertRecord(BelowxRec: Boolean): Boolean
        // begin

    end;

    trigger OnOpenPage()
    begin
          rec."Account Type" := rec."Account Type"::Customer;

        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
            Rec.FILTERGROUP(2);
            Rec.SETRANGE("Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FILTERGROUP(0);
        END;
        UpdateControls;
        if rec.Status <> rec.Status::Pending then
            fieldeditable := false else
            fieldeditable := true;


    end;

    var
        ImprestHeader: Record "FIN-Imprest Header";
        fieldeditable: Boolean;
        Postvisible: Boolean;
        Rcpt: Record "FIN-Imprest Header";
        //ApprovalEntries: Page "658";
        PayLine: Record "FIN-Imprest Lines";

        Payments: Record "FIN-Imprest Header";

        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        Temp: Record "FIN-Cash Office User Template";
        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";
        JTemplate: Code[10];
        JBatch: Code[10];
        //PCheck: Codeunit "50110";
        Post: Boolean;

        PVHead: Record "FIN-Payments Header";
        BankAcc: Record "Bank Account";
        UserMgt: Codeunit "User Setup Management";
        JournlPosted: Codeunit "Journal Post Successful";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash;
        BudgetControl: Codeunit "Budgetary Control";
        GLEntry: Record "G/L Entry";
        LastEntry: Integer;
        VBank: Record "Customer Bank Account";
        BankPayment: Record "FIN-Bank Payments";

        "Payment Release DateEditable": Boolean;

        "Paying Bank AccountEditable": Boolean;

        "Pay ModeEditable": Boolean;

        "Cheque No.Editable": Boolean;

        GlobalDimension1CodeEditable: Boolean;

        ShortcutDimension2CodeEditable: Boolean;

        ShortcutDimension3CodeEditable: Boolean;

        ShortcutDimension4CodeEditable: Boolean;
        Purposeditable: Boolean;
        AccountNoEditable: Boolean;
        ResponsibilityCenterEditable: Boolean;


        DateEditable: Boolean;

        "Currency CodeEditable": Boolean;
        Setup: Record "FIN-Cash Office Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        FINImprestLines: Record "FIN-Imprest Lines";
        BCSetup: Record "FIN-Budgetary Control Setup";
        CheckLedger: Record "Check Ledger Entry";
        CheckManagement: Codeunit CheckManagement;
        GenSetup: Record "General Ledger Setup";
        Text000: Label 'Are you sure you want to Cancel this Document?';
        EFTHeader: Record "EFT Batch Header";
        EFTline: Record "EFT batch Lines";
        Cust: Record Customer;
        Userse: Record "User Setup";

    local procedure LookupOKOnPush()
    begin
        PayLine."Account No." := ImprestHeader."Account No.";
    end;

    //[Scope('Internal')]
    procedure LinesCommitmentStatus() Exists: Boolean
    var
        BCsetup: Record "FIN-Budgetary Control Setup";
    begin
        IF BCsetup.GET() THEN BEGIN
            IF NOT BCsetup.Mandatory THEN BEGIN
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

    //[Scope('Internal')]
    procedure PostImprest()
    begin
        rec.TESTFIELD("Payment Release Date");
        rec.TESTFIELD("Paying Bank Account");
        Rec.TESTFIELD("Account No.");
        Rec.TESTFIELD("Account Type", Rec."Account Type"::Customer);
        IF Rec.Posted = TRUE THEN ERROR('The Document is already Posted!');
        /*Check if the user has selcted all the relevant fields*/
        Temp.GET(USERID);
        JTemplate := Temp."Imprest Template";
        JBatch := Temp."Imprest  Batch";

        IF JTemplate = '' THEN ERROR('Please ensure that the Imprest Template is setup in the cash management setup!!');
        IF JBatch = '' THEN ERROR('Please ensure that the Imprest Batch is setup in the cash management setup!!');

        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, Rec."No.");
        IF PayLine.FIND('-') THEN BEGIN
        END ELSE BEGIN
            //ERROR('There are no lines created for this document!');
        END;


        IF Temp.GET(USERID) THEN BEGIN
            GenJnlLine.RESET;
            GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine."Shortcut Dimension 5" := rec."Shortcut Dimension 5";
            GenJnlLine.DELETEALL;
        END;

        LineNo := LineNo + 1000;
        GenJnlLine.INIT;
        GenJnlLine."Journal Template Name" := JTemplate;
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Posting Date" := Rec."Payment Release Date";
        GenJnlLine."Document Type" := GenJnlLine."Document Type"::Invoice;
        GenJnlLine."Document No." := Rec."No.";
        GenJnlLine."External Document No." := Rec."Cheque No.";
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::Customer;
        GenJnlLine."Account No." := Rec."Account No.";
        GenJnlLine.VALIDATE(GenJnlLine."Account No.");
        GenJnlLine.Description := rec.Purpose;
        GenJnlLine.Narration := 'Imprest: ' + Rec."Account No." + ':' + Rec.Purpose;
        Rec.CALCFIELDS("Total Net Amount");
        GenJnlLine.Amount := Rec."Total Net Amount";
        GenJnlLine.VALIDATE(GenJnlLine.Amount);
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"Bank Account";
        GenJnlLine."Bal. Account No." := Rec."Paying Bank Account";
        GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
        //Added for Currency Codes
        GenJnlLine."Currency Code" := Rec."Currency Code";
        GenJnlLine.VALIDATE("Currency Code");
        GenJnlLine."Currency Factor" := Rec."Currency Factor";
        GenJnlLine.VALIDATE("Currency Factor");
        /*
        GenJnlLine."Currency Factor":=Payments."Currency Factor";
        GenJnlLine.VALIDATE("Currency Factor");
        */
        GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
        GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");

        IF GenJnlLine.Amount <> 0 THEN
            GenJnlLine.INSERT;

        IF GLEntry.FINDLAST THEN LastEntry := GLEntry."Entry No.";

        GenJnlLine.RESET;
        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);
        CODEUNIT.RUN(CODEUNIT::"Modified Gen. Jnl.-Post", GenJnlLine);
        Rec.Posted := TRUE;
        Rec."Date Posted" := Rec.Date;
        Rec."Time Posted" := TIME;
        Rec."Posted By" := USERID;
        Rec.Status := Rec.Status::Posted;
        Rec.MODIFY;

        //EFT
        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, Rec."No.");
        IF PayLine.FIND('-') THEN BEGIN
            REPEAT
            /* IF "Pay Mode"="Pay Mode"::EFT THEN BEGIN
             IF PayLine."Account No."<>'' THEN BEGIN
             BankPayment.SETRANGE(BankPayment."Doc No","No.");
             IF BankPayment.FIND('-') THEN BankPayment.DELETE;

             PayLine.TESTFIELD(PayLine."EFT Bank Account No");
            // PayLine.TESTFIELD(PayLine."EFT Branch No.");
             PayLine.TESTFIELD(PayLine."EFT Bank Code");
             PayLine.TESTFIELD(PayLine."EFT Account Name");

             BankPayment.INIT;
             BankPayment."Doc No":=Rec."No.";
             BankPayment.Payee:=PayLine."Account No.";
             BankPayment.Amount:="Total Payment Amount"-("Total Witholding Tax Amount"+"Total VAT Amount");
             BankPayment."Bank A/C No":=PayLine."EFT Bank Account No";
           //  BankPayment."Bank Branch No":=PayLine."EFT Branch No.";
           //  BankPayment."Bank Code":=PayLine."EFT Bank Code";
             BankPayment."Bank A/C Name":=PayLine."EFT Account Name";
            // END;
             BankPayment.Date:=TODAY;
             BankPayment.INSERT;
             END;
             END; */
            UNTIL PayLine.NEXT = 0;
        END;
        Post := FALSE;
        Post := JournlPosted.PostedSuccessfully();

        //IF Post THEN BEGIN
        //END;

    end;

    //[Scope('Internal')]
    procedure CheckImprestRequiredItems()
    begin

        Rec.TESTFIELD("Payment Release Date");
        Rec.TESTFIELD("Paying Bank Account");
        Rec.TESTFIELD("Account No.");
        Rec.TESTFIELD("Account Type", Rec."Account Type"::Customer);

        IF Rec.Posted THEN BEGIN
            ERROR('The Document has already been posted');
        END;

        Rec.TESTFIELD(Status, Rec.Status::Approved);

        /*Check if the user has selected all the relevant fields*/

        Temp.GET(USERID);
        JTemplate := Temp."Imprest Template";
        JBatch := Temp."Imprest  Batch";

        IF JTemplate = '' THEN BEGIN
            ERROR('Ensure the Imprest Template is set up in Cash Office Setup');
        END;

        IF JBatch = '' THEN BEGIN
            ERROR('Ensure the Imprest Batch is set up in the Cash Office Setup')
        END;

        IF NOT LinesExists THEN
            ERROR('There are no Lines created for this Document');

    end;

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        IF Rec.Status <> Rec.Status::Approved THEN BEGIN
            "Payment Release DateEditable" := FALSE;
            "Paying Bank AccountEditable" := FALSE;
            "Pay ModeEditable" := FALSE;
            //CurrForm."Currency Code".EDITABLE:=FALSE;
            "Cheque No.Editable" := FALSE;
            // CurrForm."Serial No".EDITABLE:=FALSE;
            // CurrPage.UpdateControls();
        END ELSE BEGIN
            "Payment Release DateEditable" := TRUE;
            "Paying Bank AccountEditable" := TRUE;
            "Pay ModeEditable" := TRUE;
            "Cheque No.Editable" := TRUE;

            //CurrForm."Currency Code".EDITABLE:=TRUE;
            //CurrPage.UpdateControls();
        END;

        IF Rec.Status = Rec.Status::Pending THEN BEGIN
            GlobalDimension1CodeEditable := TRUE;
            ShortcutDimension2CodeEditable := TRUE;
            //CurrForm.Payee.EDITABLE:=TRUE;
            ShortcutDimension3CodeEditable := TRUE;
            ShortcutDimension4CodeEditable := TRUE;
            DateEditable := TRUE;
            Purposeditable := true;
            ResponsibilityCenterEditable := true;
            AccountNoEditable := true;
            //CurrForm."Account No.".EDITABLE:=TRUE;
            "Currency CodeEditable" := TRUE;
            //  CurrForm."Serial No".EDITABLE:=TRUE;
            //CurrForm."Paying Bank Account".EDITABLE:=FALSE;
            //CurrPage.UpdateControls();
        END ELSE BEGIN
            GlobalDimension1CodeEditable := FALSE;
            ShortcutDimension2CodeEditable := TRUE;
            //CurrForm.Payee.EDITABLE:=FALSE;
            ShortcutDimension3CodeEditable := FALSE;
            ShortcutDimension4CodeEditable := FALSE;
            DateEditable := FALSE;
            //  CurrForm."Serial No".EDITABLE:=FALSE;
            //CurrForm."Account No.".EDITABLE:=FALSE;
            "Currency CodeEditable" := FALSE;
            //CurrForm."Paying Bank Account".EDITABLE:=TRUE;
            //CurrPage.UpdateControls();
            Purposeditable := false;
            ResponsibilityCenterEditable := false;
            AccountNoEditable := false;
        END
    end;

    procedure LinesExists(): Boolean
    var
        PayLines: Record "FIN-Imprest Lines";
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
        PayLines: Record "FIN-Imprest Lines";
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

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        UpdateControls();
    end;


    procedure PopulateCheckJournal(var Payment: Record "FIN-Imprest Header")
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
                // IF PayLine."Pay Mode"<>PayLine."Pay Mode"::Cheque THEN;

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
                //IF PayLine."Advance Type"=PayLine."Advance Type":: THEN
                //GenJnlLine."Document Type":=GenJnlLine."Document Type"::" "
                //ELSE
                GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
                GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."External Document No." := Rec."Cheque No.";

                GenJnlLine."Currency Code" := Rec."Currency Code";
                GenJnlLine.VALIDATE("Currency Code");
                GenJnlLine."Currency Factor" := Rec."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");
                //IF PayLine."VAT Code"='' THEN
                // BEGIN
                //  GenJnlLine.Amount:=PayLine."Net Amount" ;
                //END
                //ELSE
                // BEGIN
                GenJnlLine.Amount := PayLine.Amount;
                // END;
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                //GenJnlLine."VAT Prod. Posting Group":=PayLine."VAT Prod. Posting Group";
                //GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
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
                //GenJnlLine."Applies-to Doc. No.":=PayLine."Applies-to Doc. No.";
                //GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                //GenJnlLine."Applies-to ID":=PayLine."Applies-to ID";
                GenJnlLine.Narration := Rec.Payee;
                ///GenJnlLine."Received By":=Payee;
                IF GenJnlLine.Amount <> 0 THEN GenJnlLine.INSERT;


            UNTIL PayLine.NEXT = 0;

        END;
    end;
}
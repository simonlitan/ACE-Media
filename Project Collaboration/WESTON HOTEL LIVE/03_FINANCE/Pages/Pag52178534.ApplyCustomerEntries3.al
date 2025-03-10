page 52178534 "Apply Customer Entries3"
{
    Caption = 'Apply Customer Entries';
    DataCaptionFields = "Customer No.";
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = Worksheet;
    SourceTable = "Cust. Ledger Entry";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Posting Date"; ApplyingCustLedgEntry."Posting Date")
                {
                    Caption = 'Posting Date';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Document Type"; ApplyingCustLedgEntry."Document Type")
                {
                    ApplicationArea = All;

                }
                field("Document No."; ApplyingCustLedgEntry."Document No.")
                {
                    Caption = 'Document No.';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer No."; ApplyingCustLedgEntry."Customer No.")
                {
                    Caption = 'Customer No.';
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Description; ApplyingCustLedgEntry.Description)
                {
                    Caption = 'Description';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Currency Code"; ApplyingCustLedgEntry."Currency Code")
                {
                    Caption = 'Currency Code';
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Amount; ApplyingCustLedgEntry.Amount)
                {
                    Caption = 'Amount';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Remaining Amount"; ApplyingCustLedgEntry."Remaining Amount")
                {
                    Caption = 'Remaining Amount';
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            repeater(New)
            {
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    Visible = "Applies-to IDVisible";
                    ApplicationArea = All;
                }
                field("Posting Date2"; Rec."Posting Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Document Type2"; Rec."Document Type")
                {
                    Editable = false;
                    StyleExpr = StyleTxt;
                    ApplicationArea = All;
                }
                field("Document No.2"; Rec."Document No.")
                {
                    Editable = false;
                    StyleExpr = StyleTxt;
                    ApplicationArea = All;
                }
                field("Customer No.2"; Rec."Customer No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Description2; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Currency Code2"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Original Amount"; Rec."Original Amount")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Amount2; Rec.Amount)
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Remaining Amount4"; Rec."Remaining Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Appln. Remaining Amount"; CalcApplnRemainingAmount(Rec."Remaining Amount"))
                {
                    AutoFormatExpression = ApplnCurrencyCode;
                    AutoFormatType = 1;
                    Caption = 'Appln. Remaining Amount';
                    ApplicationArea = All;
                }
                field("Amount to Apply"; Rec."Amount to Apply")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit", Rec);

                        IF (xRec."Amount to Apply" = 0) OR (Rec."Amount to Apply" = 0) AND
                           (ApplnType = ApplnType::"Applies-to ID")
                        THEN
                            SetCustApplId;
                        Rec.GET(Rec."Entry No.");
                        AmounttoApplyOnAfterValidate;
                    end;
                }
                field("Amount to Apply 2"; CalcApplnAmounttoApply(Rec."Amount to Apply"))
                {
                    AutoFormatExpression = ApplnCurrencyCode;
                    AutoFormatType = 1;
                    Caption = 'Appln. Amount to Apply';
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    StyleExpr = StyleTxt;
                    ApplicationArea = All;
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        RecalcApplnAmount;
                    end;
                }
                field("Pmt. Disc. Tolerance Date"; Rec."Pmt. Disc. Tolerance Date")
                {
                    ApplicationArea = All;
                }
                field("Original Pmt. Disc. Possible"; Rec."Original Pmt. Disc. Possible")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Remaining Pmt. Disc. Possible"; Rec."Remaining Pmt. Disc. Possible")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        RecalcApplnAmount;
                    end;
                }
                field("Remaining Pmt. Disc. Possible1"; CalcApplnRemainingAmount(Rec."Remaining Pmt. Disc. Possible"))
                {
                    AutoFormatExpression = ApplnCurrencyCode;
                    AutoFormatType = 1;
                    Caption = 'Appln. Pmt. Disc. Possible';
                    ApplicationArea = All;
                }
                field("Max. Payment Tolerance"; Rec."Max. Payment Tolerance")
                {
                    ApplicationArea = All;
                }
                field(Open; Rec.Open)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Positive; Rec.Positive)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
            }
            group(generals)
            {
                fixed(Control1903222401)
                {
                    group("Appln. Currency")
                    {
                        Caption = 'Appln. Currency';
                        field(ApplnCurrencyCode; ApplnCurrencyCode)
                        {
                            Editable = false;
                            TableRelation = Currency;
                            ApplicationArea = All;
                        }
                    }
                    group("Amount to Apply2")
                    {
                        Caption = 'Amount to Apply';
                        field(AmountToApply; AppliedAmount)
                        {
                            AutoFormatExpression = ApplnCurrencyCode;
                            AutoFormatType = 1;
                            Caption = 'Amount to Apply';
                            Editable = false;
                            ApplicationArea = All;
                        }
                    }
                    group("Pmt. Disc. Amount")
                    {
                        Caption = 'Pmt. Disc. Amount';
                        field("-PmtDiscAmount"; -PmtDiscAmount)
                        {
                            AutoFormatExpression = ApplnCurrencyCode;
                            AutoFormatType = 1;
                            Caption = 'Pmt. Disc. Amount';
                            Editable = false;
                            ApplicationArea = All;
                        }
                    }
                    group(Rounding)
                    {
                        Caption = 'Rounding';
                        field(ApplnRounding; ApplnRounding)
                        {
                            AutoFormatExpression = ApplnCurrencyCode;
                            AutoFormatType = 1;
                            Caption = 'Rounding';
                            Editable = false;
                            ApplicationArea = All;
                        }
                    }
                    group("Applied Amount")
                    {
                        Caption = 'Applied Amount';
                        field(AppliedAmount; AppliedAmount + (-PmtDiscAmount) + ApplnRounding)
                        {
                            AutoFormatExpression = ApplnCurrencyCode;
                            AutoFormatType = 1;
                            Caption = 'Applied Amount';
                            Editable = false;
                            ApplicationArea = All;
                        }
                    }
                    group("Available Amount")
                    {
                        Caption = 'Available Amount';
                        field(ApplyingAmount; ApplyingAmount)
                        {
                            AutoFormatExpression = ApplnCurrencyCode;
                            AutoFormatType = 1;
                            Caption = 'Available Amount';
                            Editable = false;
                            ApplicationArea = All;
                        }
                    }
                    group(Balance)
                    {
                        Caption = 'Balance';
                        field(ControlBalance; AppliedAmount + (-PmtDiscAmount) + ApplyingAmount + ApplnRounding)
                        {
                            AutoFormatExpression = ApplnCurrencyCode;
                            AutoFormatType = 1;
                            Caption = 'Balance';
                            Editable = false;
                            ApplicationArea = All;
                        }
                    }
                }
            }
        }

    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                Image = Entry;
                action("Reminder/Fin. Charge Entries")
                {
                    Caption = 'Reminder/Fin. Charge Entries';
                    Image = Reminder;
                    RunObject = Page "Reminder/Fin. Charge Entries";
                    RunPageLink = "Customer Entry No." = field("Entry No.");
                    RunPageView = SORTING("Customer Entry No.");
                    ApplicationArea = All;
                }
                action("Applied E&ntries")
                {
                    Caption = 'Applied E&ntries';
                    Image = Approve;
                    RunObject = Page "Applied Customer Entries";
                    ApplicationArea = All;
                    // RunPageOnRec = true;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                    end;
                }
                action("Detailed &Ledger Entries")
                {
                    Caption = 'Detailed &Ledger Entries';
                    Image = View;
                    RunObject = Page "Detailed Cust. Ledg. Entries";
                    RunPageLink = "Cust. Ledger Entry No." = FIELD("Entry No.");
                    RunPageView = SORTING("Cust. Ledger Entry No.", "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                    ApplicationArea = All;
                }
            }
            group("&Application")
            {
                Caption = '&Application';
                Image = Apply;
                action("Set Applies-to ID")
                {
                    Caption = 'Set Applies-to ID';
                    Image = SelectLineToApply;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F11';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        IF (CalcType = CalcType::GenJnlLine) AND (ApplnType = ApplnType::"Applies-to Doc. No.") THEN
                            ERROR(CannotSetAppliesToIDErr);

                        SetCustApplId;
                    end;
                }
                action("Post Application")
                {
                    Caption = 'Post Application';
                    Ellipsis = true;
                    Image = PostApplication;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F9';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        PostDirectApplication;
                    end;
                }
                separator("-")
                {
                    Caption = '-';
                }
                action("Show Only Selected Entries to Be Applied")
                {
                    Caption = 'Show Only Selected Entries to Be Applied';
                    Image = ShowSelected;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        ShowAppliedEntries := NOT ShowAppliedEntries;
                        IF ShowAppliedEntries THEN BEGIN
                            IF CalcType = CalcType::GenJnlLine THEN
                                Rec.SETRANGE("Applies-to ID", GenJnlLine."Applies-to ID")
                            ELSE BEGIN
                                CustEntryApplID := USERID;
                                IF CustEntryApplID = '' THEN
                                    CustEntryApplID := '***';
                                Rec.SETRANGE("Applies-to ID", CustEntryApplID);
                            END;
                        END ELSE
                            Rec.SETRANGE("Applies-to ID");
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Navigate.SetDoc(Rec."Posting Date", Rec."Document No.");
                    Navigate.RUN;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        IF ApplnType = ApplnType::"Applies-to Doc. No." THEN
            CalcApplnAmount;
    end;

    trigger OnAfterGetRecord()
    begin
        StyleTxt := Rec.SetStyle;
    end;

    trigger OnInit()
    begin
        "Applies-to IDVisible" := TRUE;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit", Rec);
        IF Rec."Applies-to ID" <> xRec."Applies-to ID" THEN
            CalcApplnAmount;
        EXIT(FALSE);
    end;

    trigger OnOpenPage()
    begin
       

        IF CalcType = CalcType::Direct THEN BEGIN
            Cust.GET(Rec."Customer No.");
            ApplnCurrencyCode := Cust."Currency Code";
            FindApplyingEntry;
            
        END;

        "Applies-to IDVisible" := ApplnType <> ApplnType::"Applies-to Doc. No.";

        GLSetup.GET;

        IF ApplnType = ApplnType::"Applies-to Doc. No." THEN
            CalcApplnAmount;
        PostingDone := FALSE;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        IF CloseAction = ACTION::LookupOK THEN
            LookupOKOnPush;
        IF ApplnType = ApplnType::"Applies-to Doc. No." THEN BEGIN
            IF OK AND (ApplyingCustLedgEntry."Posting Date" < Rec."Posting Date") THEN BEGIN
                OK := FALSE;
                ERROR(
                  EarlierPostingDateErr, ApplyingCustLedgEntry."Document Type", ApplyingCustLedgEntry."Document No.",
                  Rec."Document Type", Rec."Document No.");
            END;
            IF OK THEN BEGIN
                IF Rec."Amount to Apply" = 0 THEN
                    Rec."Amount to Apply" := Rec."Remaining Amount";
                CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit", Rec);
            END;
        END;
        IF (CalcType = CalcType::Direct) AND NOT OK AND NOT PostingDone THEN BEGIN
            Rec := ApplyingCustLedgEntry;
            Rec."Applying Entry" := FALSE;
            Rec."Applies-to ID" := '';
            Rec."Amount to Apply" := 0;
            CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit", Rec);
        END;
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        SalesHeader: Record "Sales Header";
        ServHeader: Record "Service Header";
        Cust: Record Customer;
        GLSetup: Record "General Ledger Setup";
        SalesSetup: Record "Sales & Receivables Setup";
        TotalSalesLine: Record "Sales Line";
        TotalSalesLineLCY: Record "Sales Line";
        TotalServLine: Record "Service Line";
        TotalServLineLCY: Record "Service Line";
        CustEntrySetApplID: Codeunit "Cust. Entry-SetAppl.ID3";
        GenJnlApply: Codeunit "Gen. Jnl.-Apply";
        SalesPost: Codeunit "Sales-Post";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        Navigate: Page Navigate;

        StyleTxt: Text;
        CustEntryApplID: Code[50];
        AppliesToID: Code[50];
        ValidExchRate: Boolean;
        MustSelectEntryErr: Label 'You must select an applying entry before you can post the application.';
        PostingInWrongContextErr: Label 'You must post the application from the window where you entered the applying entry.';
        CannotSetAppliesToIDErr: Label 'You cannot set Applies-to ID while selecting Applies-to Doc. No.';
        ShowAppliedEntries: Boolean;
        OK: Boolean;
        EarlierPostingDateErr: Label 'You cannot apply and post an entry to an entry with an earlier posting date.\\Instead, post the document of type %1 with the number %2 and then apply it to the document of type %3 with the number %4.', Comment = '%1 - document type, %2 - document number,%3 - document type,%4 - document number';
        [InDataSet]
        AppliesToIDVisible: Boolean;
        ApplicationPostedMsg: Label 'The application was successfully posted.';
        ApplicationDateErr: Label 'The %1 entered must not be before the %1 on the %2.';
        ApplicationProcessCanceledErr: Label 'Post application process has been canceled.';
        HasDocumentAttachment: Boolean;
        CustNameVisible: Boolean;

        //check this
        VATAmount: Decimal;

        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        TempApplyingCustLedgEntry: Record "Cust. Ledger Entry" temporary;
        AppliedCustLedgEntry: Record "Cust. Ledger Entry";
        GenJnlLine2: Record "Gen. Journal Line";
        CustLedgEntry: Record "Cust. Ledger Entry";
        ApplnDate: Date;
        ApplnRoundingPrecision: Decimal;
        ApplnRounding: Decimal;
        ApplnType: Enum "Customer Apply-to Type";
        AmountRoundingPrecision: Decimal;

        VATAmountText: Text[30];
        AppliedAmount: Decimal;
        ApplyingAmount: Decimal;
        PmtDiscAmount: Decimal;
        ApplnCurrencyCode: Code[10];
        DifferentCurrenciesInAppln: Boolean;
        PostingDone: Boolean;
        ProfitLCY: Decimal;
        ProfitPct: Decimal;
        CalcType: Enum "Customer Apply Calculation Type";
        ApplyingCustLedgEntry: Record 21 temporary;
        GenJnlLineApply: Boolean;
        ReceiptLine: Record "FIN-Receipt Line q";
        ReceiptHeader: Record "FIN-Receipts Header";
        "Applies-to IDVisible": Boolean;
        Text002: label 'You must select an applying entry before you can post the application.';
        Text003: label 'You must post the application from the window where you entered the applying entry.';
        Text012: label 'The application was successfully posted.';
        Text013: label 'The %1 entered must not be before the %1 on the %2.';
        Text019: label 'Post application process has been canceled.';

    procedure SetGenJnlLine(NewGenJnlLine: Record "Gen. Journal Line"; ApplnTypeSelect: Integer)
    begin
        GenJnlLine := NewGenJnlLine;

        IF GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer THEN
            ApplyingAmount := GenJnlLine.Amount;
        IF GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::Customer THEN
            ApplyingAmount := -GenJnlLine.Amount;
        ApplnDate := GenJnlLine."Posting Date";
        ApplnCurrencyCode := GenJnlLine."Currency Code";
        CalcType := CalcType::GenJnlLine;

        CASE ApplnTypeSelect OF
            GenJnlLine.FIELDNO("Applies-to Doc. No."):
                ApplnType := ApplnType::"Applies-to Doc. No.";
            GenJnlLine.FIELDNO("Applies-to ID"):
                ApplnType := ApplnType::"Applies-to ID";
        END;

        SetApplyingCustLedgEntry;
    end;


    procedure SetSales(NewSalesHeader: Record "Sales Header"; var NewCustLedgEntry: Record "Cust. Ledger Entry"; ApplnTypeSelect: Integer)
    var
        TotalAdjCostLCY: Decimal;
    begin
        SalesHeader := NewSalesHeader;
        Rec.COPYFILTERS(NewCustLedgEntry);

        SalesPost.SumSalesLines(
          SalesHeader, 0, TotalSalesLine, TotalSalesLineLCY,
          VATAmount, VATAmountText, ProfitLCY, ProfitPct, TotalAdjCostLCY);

        CASE SalesHeader."Document Type" OF
            SalesHeader."Document Type"::"Return Order",
          SalesHeader."Document Type"::"Credit Memo":
                ApplyingAmount := -TotalSalesLine."Amount Including VAT"
            ELSE
                ApplyingAmount := TotalSalesLine."Amount Including VAT";
        END;

        ApplnDate := SalesHeader."Posting Date";
        ApplnCurrencyCode := SalesHeader."Currency Code";
        CalcType := CalcType::SalesHeader;

        CASE ApplnTypeSelect OF
            SalesHeader.FIELDNO("Applies-to Doc. No."):
                ApplnType := ApplnType::"Applies-to Doc. No.";
            SalesHeader.FIELDNO("Applies-to ID"):
                ApplnType := ApplnType::"Applies-to ID";
        END;

        SetApplyingCustLedgEntry;
    end;


    procedure SetService(NewServHeader: Record "Service Header"; var NewCustLedgEntry: Record "Cust. Ledger Entry"; ApplnTypeSelect: Integer)
    var
        ServAmountsMgt: Codeunit "Serv-Amounts Mgt.";
        TotalAdjCostLCY: Decimal;
    begin
        ServHeader := NewServHeader;
        rec.COPYFILTERS(NewCustLedgEntry);

        ServAmountsMgt.SumServiceLines(
          ServHeader, 0, TotalServLine, TotalServLineLCY,
          VATAmount, VATAmountText, ProfitLCY, ProfitPct, TotalAdjCostLCY);

        CASE ServHeader."Document Type" OF
            ServHeader."Document Type"::"Credit Memo":
                ApplyingAmount := -TotalServLine."Amount Including VAT"
            ELSE
                ApplyingAmount := TotalServLine."Amount Including VAT";
        END;

        ApplnDate := ServHeader."Posting Date";
        ApplnCurrencyCode := ServHeader."Currency Code";
        CalcType := CalcType::ServHeader;

        CASE ApplnTypeSelect OF
            ServHeader.FIELDNO("Applies-to Doc. No."):
                ApplnType := ApplnType::"Applies-to Doc. No.";
            ServHeader.FIELDNO("Applies-to ID"):
                ApplnType := ApplnType::"Applies-to ID";
        END;

        SetApplyingCustLedgEntry;
    end;


    procedure SetCustLedgEntry(NewCustLedgEntry: Record "Cust. Ledger Entry")
    begin
        Rec := NewCustLedgEntry;
    end;


    procedure SetApplyingCustLedgEntry()
    var
        "CustEntry-Edit": Codeunit "Cust. Entry-Edit";
    begin
        CASE CalcType OF
            CalcType::SalesHeader:
                BEGIN
                    ApplyingCustLedgEntry."Entry No." := 1;
                    ApplyingCustLedgEntry."Posting Date" := SalesHeader."Posting Date";
                    IF SalesHeader."Document Type" = SalesHeader."Document Type"::"Return Order" THEN
                        ApplyingCustLedgEntry."Document Type" := SalesHeader."Document Type"::"Credit Memo"
                    ELSE
                        ApplyingCustLedgEntry."Document Type" := SalesHeader."Document Type";
                    ApplyingCustLedgEntry."Document No." := SalesHeader."No.";
                    ApplyingCustLedgEntry."Customer No." := SalesHeader."Bill-to Customer No.";
                    ApplyingCustLedgEntry.Description := SalesHeader."Posting Description";
                    ApplyingCustLedgEntry."Currency Code" := SalesHeader."Currency Code";
                    IF ApplyingCustLedgEntry."Document Type" = ApplyingCustLedgEntry."Document Type"::"Credit Memo" THEN BEGIN
                        ApplyingCustLedgEntry.Amount := -TotalSalesLine."Amount Including VAT";
                        ApplyingCustLedgEntry."Remaining Amount" := -TotalSalesLine."Amount Including VAT";
                    END ELSE BEGIN
                        ApplyingCustLedgEntry.Amount := TotalSalesLine."Amount Including VAT";
                        ApplyingCustLedgEntry."Remaining Amount" := TotalSalesLine."Amount Including VAT";
                    END;
                    CalcApplnAmount;
                END;
            CalcType::ServHeader:
                BEGIN
                    ApplyingCustLedgEntry."Entry No." := 1;
                    ApplyingCustLedgEntry."Posting Date" := ServHeader."Posting Date";
                    ApplyingCustLedgEntry."Document Type" := ServHeader."Document Type";
                    ApplyingCustLedgEntry."Document No." := ServHeader."No.";
                    ApplyingCustLedgEntry."Customer No." := ServHeader."Bill-to Customer No.";
                    ApplyingCustLedgEntry.Description := ServHeader."Posting Description";
                    ApplyingCustLedgEntry."Currency Code" := ServHeader."Currency Code";
                    IF ApplyingCustLedgEntry."Document Type" = ApplyingCustLedgEntry."Document Type"::"Credit Memo" THEN BEGIN
                        ApplyingCustLedgEntry.Amount := -TotalServLine."Amount Including VAT";
                        ApplyingCustLedgEntry."Remaining Amount" := -TotalServLine."Amount Including VAT";
                    END ELSE BEGIN
                        ApplyingCustLedgEntry.Amount := TotalServLine."Amount Including VAT";
                        ApplyingCustLedgEntry."Remaining Amount" := TotalServLine."Amount Including VAT";
                    END;
                    CalcApplnAmount;
                END;
            CalcType::Direct:
                BEGIN
                    IF Rec."Applying Entry" THEN BEGIN
                        IF ApplyingCustLedgEntry."Entry No." <> 0 THEN
                            CustLedgEntry := ApplyingCustLedgEntry;
                        "CustEntry-Edit".RUN(Rec);
                        IF Rec."Applies-to ID" = '' THEN
                            SetCustApplId;
                        Rec.CALCFIELDS(Amount);
                        ApplyingCustLedgEntry := Rec;
                        IF CustLedgEntry."Entry No." <> 0 THEN BEGIN
                            Rec := CustLedgEntry;
                            Rec."Applying Entry" := FALSE;
                            SetCustApplId;
                        END;
                        Rec.SETFILTER("Entry No.", '<> %1', ApplyingCustLedgEntry."Entry No.");
                        ApplyingAmount := ApplyingCustLedgEntry."Remaining Amount";
                        ApplnDate := ApplyingCustLedgEntry."Posting Date";
                        ApplnCurrencyCode := ApplyingCustLedgEntry."Currency Code";
                    END;
                    CalcApplnAmount;
                END;
            CalcType::GenJnlLine:
                BEGIN
                    ApplyingCustLedgEntry."Entry No." := 1;
                    ApplyingCustLedgEntry."Posting Date" := GenJnlLine."Posting Date";
                    ApplyingCustLedgEntry."Document Type" := GenJnlLine."Document Type";
                    ApplyingCustLedgEntry."Document No." := GenJnlLine."Document No.";
                    ApplyingCustLedgEntry."Customer No." := GenJnlLine."Account No.";
                    ApplyingCustLedgEntry.Description := GenJnlLine.Description;
                    ApplyingCustLedgEntry."Currency Code" := GenJnlLine."Currency Code";
                    ApplyingCustLedgEntry.Amount := GenJnlLine.Amount;
                    ApplyingCustLedgEntry."Remaining Amount" := GenJnlLine.Amount;
                    CalcApplnAmount;
                END;
        END;
    end;


    procedure SetCustApplId()
    begin
        IF (CalcType = CalcType::GenJnlLine) AND (ApplyingCustLedgEntry."Posting Date" < Rec."Posting Date") THEN
            ERROR(
              EarlierPostingDateErr, ApplyingCustLedgEntry."Document Type", ApplyingCustLedgEntry."Document No.",
              Rec."Document Type", Rec."Document No.");

        IF ApplyingCustLedgEntry."Entry No." <> 0 THEN
            GenJnlApply.CheckAgainstApplnCurrency(
              ApplnCurrencyCode, Rec."Currency Code", GenJnlLine."Account Type"::Customer, TRUE);

        CustLedgEntry.COPY(Rec);
        CurrPage.SETSELECTIONFILTER(CustLedgEntry);
        //simba
        IF GenJnlLineApply THEN
            CustEntrySetApplID.SetApplId(
              CustLedgEntry, ApplyingCustLedgEntry, AppliedAmount, PmtDiscAmount, GenJnlLine."Applies-to ID")
        ELSE
            IF CalcType = CalcType::SalesHeader THEN
                CustEntrySetApplID.SetApplId(
                  CustLedgEntry, ApplyingCustLedgEntry, AppliedAmount, PmtDiscAmount, SalesHeader."Applies-to ID")
            ELSE
                IF CalcType = CalcType::Receipt THEN //Added for Receipts
                    CustEntrySetApplID.SetApplId(
                      CustLedgEntry, ApplyingCustLedgEntry, AppliedAmount, PmtDiscAmount, ReceiptLine."Applies-to ID")
                ELSE //Added for Receipts
                    CustEntrySetApplID.SetApplId(
                    CustLedgEntry, ApplyingCustLedgEntry, AppliedAmount, PmtDiscAmount, ServHeader."Applies-to ID");


        CalcApplnAmount;
    end;

    local procedure GetAppliesToID() AppliesToID: Code[50]
    begin
        CASE CalcType OF
            CalcType::GenJnlLine:
                AppliesToID := GenJnlLine."Applies-to ID";
            CalcType::SalesHeader:
                AppliesToID := SalesHeader."Applies-to ID";
            CalcType::ServHeader:
                AppliesToID := ServHeader."Applies-to ID";
        END;
    end;


    procedure CalcApplnAmount()
    var
        ExchAccGLJnlLine: Codeunit "Exchange Acc. G/L Journal Line";
    begin
        AppliedAmount := 0;
        PmtDiscAmount := 0;
        DifferentCurrenciesInAppln := FALSE;

        CASE CalcType OF
            CalcType::Direct:
                BEGIN
                    FindAmountRounding;
                    CustEntryApplID := USERID;
                    IF CustEntryApplID = '' THEN
                        CustEntryApplID := '***';

                    CustLedgEntry := ApplyingCustLedgEntry;

                    AppliedCustLedgEntry.SETCURRENTKEY("Customer No.", Open, Positive);
                    AppliedCustLedgEntry.SETRANGE("Customer No.", Rec."Customer No.");
                    AppliedCustLedgEntry.SETRANGE(Open, TRUE);
                    AppliedCustLedgEntry.SETRANGE("Applies-to ID", CustEntryApplID);

                    IF ApplyingCustLedgEntry."Entry No." <> 0 THEN BEGIN
                        CustLedgEntry.CALCFIELDS("Remaining Amount");
                        AppliedCustLedgEntry.SETFILTER("Entry No.", '<>%1', ApplyingCustLedgEntry."Entry No.");
                    END;

                    HandlChosenEntries(0,
                      CustLedgEntry."Remaining Amount",
                      CustLedgEntry."Currency Code",
                      CustLedgEntry."Posting Date");
                END;
            CalcType::GenJnlLine:
                BEGIN
                    FindAmountRounding;
                    IF GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::Customer THEN
                        ExchAccGLJnlLine.RUN(GenJnlLine);

                    CASE ApplnType OF
                        ApplnType::"Applies-to Doc. No.":
                            BEGIN
                                AppliedCustLedgEntry := Rec;
                                AppliedCustLedgEntry.CALCFIELDS("Remaining Amount");
                                IF AppliedCustLedgEntry."Currency Code" <> ApplnCurrencyCode THEN BEGIN
                                    AppliedCustLedgEntry."Remaining Amount" :=
                                      CurrExchRate.ExchangeAmtFCYToFCY(
                                        ApplnDate, AppliedCustLedgEntry."Currency Code", ApplnCurrencyCode, AppliedCustLedgEntry."Remaining Amount");
                                    AppliedCustLedgEntry."Remaining Pmt. Disc. Possible" :=
                                      CurrExchRate.ExchangeAmtFCYToFCY(
                                        ApplnDate, AppliedCustLedgEntry."Currency Code", ApplnCurrencyCode, AppliedCustLedgEntry."Remaining Pmt. Disc. Possible");
                                    AppliedCustLedgEntry."Amount to Apply" :=
                                      CurrExchRate.ExchangeAmtFCYToFCY(
                                        ApplnDate, AppliedCustLedgEntry."Currency Code", ApplnCurrencyCode, AppliedCustLedgEntry."Amount to Apply");
                                END;

                                IF AppliedCustLedgEntry."Amount to Apply" <> 0 THEN
                                    AppliedAmount := ROUND(AppliedCustLedgEntry."Amount to Apply", AmountRoundingPrecision)
                                ELSE
                                    AppliedAmount := ROUND(AppliedCustLedgEntry."Remaining Amount", AmountRoundingPrecision);

                                IF PaymentToleranceMgt.CheckCalcPmtDiscGenJnlCust(
                                     GenJnlLine, AppliedCustLedgEntry, 0, FALSE) AND
                                   ((ABS(GenJnlLine.Amount) + ApplnRoundingPrecision >=
                                     ABS(AppliedAmount - AppliedCustLedgEntry."Remaining Pmt. Disc. Possible")) OR
                                    (GenJnlLine.Amount = 0))
                                THEN
                                    PmtDiscAmount := AppliedCustLedgEntry."Remaining Pmt. Disc. Possible";

                                IF NOT DifferentCurrenciesInAppln THEN
                                    DifferentCurrenciesInAppln := ApplnCurrencyCode <> AppliedCustLedgEntry."Currency Code";
                                CheckRounding;
                            END;
                        ApplnType::"Applies-to ID":
                            BEGIN
                                GenJnlLine2 := GenJnlLine;
                                AppliedCustLedgEntry.SETCURRENTKEY("Customer No.", Open, Positive);
                                AppliedCustLedgEntry.SETRANGE("Customer No.", GenJnlLine."Account No.");
                                AppliedCustLedgEntry.SETRANGE(Open, TRUE);
                                AppliedCustLedgEntry.SETRANGE("Applies-to ID", GenJnlLine."Applies-to ID");

                                HandlChosenEntries(1,
                                  GenJnlLine2.Amount,
                                  GenJnlLine2."Currency Code",
                                  GenJnlLine2."Posting Date");
                            END;
                    END;
                END;
            CalcType::SalesHeader, CalcType::ServHeader:
                BEGIN
                    FindAmountRounding;

                    CASE ApplnType OF
                        ApplnType::"Applies-to Doc. No.":
                            BEGIN
                                AppliedCustLedgEntry := Rec;
                                AppliedCustLedgEntry.CALCFIELDS("Remaining Amount");

                                IF AppliedCustLedgEntry."Currency Code" <> ApplnCurrencyCode THEN
                                    AppliedCustLedgEntry."Remaining Amount" :=
                                      CurrExchRate.ExchangeAmtFCYToFCY(
                                        ApplnDate, AppliedCustLedgEntry."Currency Code", ApplnCurrencyCode, AppliedCustLedgEntry."Remaining Amount");

                                AppliedAmount := ROUND(AppliedCustLedgEntry."Remaining Amount", AmountRoundingPrecision);

                                IF NOT DifferentCurrenciesInAppln THEN
                                    DifferentCurrenciesInAppln := ApplnCurrencyCode <> AppliedCustLedgEntry."Currency Code";
                                CheckRounding;
                            END;
                        ApplnType::"Applies-to ID":
                            BEGIN
                                AppliedCustLedgEntry.SETCURRENTKEY("Customer No.", Open, Positive);
                                IF CalcType = CalcType::SalesHeader THEN
                                    AppliedCustLedgEntry.SETRANGE("Customer No.", SalesHeader."Bill-to Customer No.")
                                ELSE
                                    AppliedCustLedgEntry.SETRANGE("Customer No.", ServHeader."Bill-to Customer No.");
                                AppliedCustLedgEntry.SETRANGE(Open, TRUE);
                                AppliedCustLedgEntry.SETRANGE("Applies-to ID", GetAppliesToID);

                                HandlChosenEntries(2,
                                  ApplyingAmount,
                                  ApplnCurrencyCode,
                                  ApplnDate);
                            END;
                    END;
                END;

            //Receipts
            CalcType::Receipt:
                BEGIN
                    FindAmountRounding;

                    CASE ApplnType OF
                        ApplnType::"Applies-to Doc. No.":
                            BEGIN
                                AppliedCustLedgEntry := Rec;
                                AppliedCustLedgEntry.CALCFIELDS("Remaining Amount");

                                IF AppliedCustLedgEntry."Currency Code" <> ApplnCurrencyCode THEN
                                    AppliedCustLedgEntry."Remaining Amount" :=
                                      CurrExchRate.ExchangeAmtFCYToFCY(
                                        ApplnDate, AppliedCustLedgEntry."Currency Code", ApplnCurrencyCode, AppliedCustLedgEntry."Remaining Amount");

                                AppliedAmount := ROUND(AppliedCustLedgEntry."Remaining Amount", AmountRoundingPrecision);

                                IF NOT DifferentCurrenciesInAppln THEN
                                    DifferentCurrenciesInAppln := ApplnCurrencyCode <> AppliedCustLedgEntry."Currency Code";
                                CheckRounding;
                            END;

                        ApplnType::"Applies-to ID":
                            BEGIN
                                AppliedCustLedgEntry.SETCURRENTKEY("Customer No.", Open, Positive);
                                AppliedCustLedgEntry.SETRANGE("Customer No.", ReceiptLine."Account No.");

                                AppliedCustLedgEntry.SETRANGE(Open, TRUE);
                                AppliedCustLedgEntry.SETRANGE("Applies-to ID", ReceiptLine."Applies-to ID");

                                HandlChosenEntries(2,
                                  GenJnlLine.Amount,
                                  GenJnlLine."Currency Code",
                                  GenJnlLine."Posting Date");

                            END;
                    END;
                END;

        END;
    end;


    procedure CalcApplnRemainingAmount(Amount: Decimal): Decimal
    var
        ApplnRemainingAmount: Decimal;
    begin
        ValidExchRate := TRUE;
        IF ApplnCurrencyCode = Rec."Currency Code" THEN
            EXIT(Amount);

        IF ApplnDate = 0D THEN
            ApplnDate := Rec."Posting Date";
        ApplnRemainingAmount :=
          CurrExchRate.ApplnExchangeAmtFCYToFCY(
            ApplnDate, Rec."Currency Code", ApplnCurrencyCode, Amount, ValidExchRate);
        EXIT(ApplnRemainingAmount);
    end;


    procedure CalcApplnAmounttoApply(AmounttoApply: Decimal): Decimal
    var
        ApplnAmounttoApply: Decimal;
    begin
        ValidExchRate := TRUE;

        IF ApplnCurrencyCode = Rec."Currency Code" THEN
            EXIT(AmounttoApply);

        IF ApplnDate = 0D THEN
            ApplnDate := Rec."Posting Date";
        ApplnAmounttoApply :=
          CurrExchRate.ApplnExchangeAmtFCYToFCY(
            ApplnDate, Rec."Currency Code", ApplnCurrencyCode, AmounttoApply, ValidExchRate);
        EXIT(ApplnAmounttoApply);
    end;


    procedure FindAmountRounding()
    begin
        IF ApplnCurrencyCode = '' THEN BEGIN
            Currency.INIT;
            Currency.Code := '';
            Currency.InitRoundingPrecision;
        END ELSE
            IF ApplnCurrencyCode <> Currency.Code THEN
                Currency.GET(ApplnCurrencyCode);

        AmountRoundingPrecision := Currency."Amount Rounding Precision";
    end;


    procedure CheckRounding()
    begin
        ApplnRounding := 0;

        CASE CalcType OF
            CalcType::SalesHeader, CalcType::ServHeader:
                EXIT;
            CalcType::GenJnlLine:
                IF (GenJnlLine."Document Type" <> GenJnlLine."Document Type"::Payment) AND
                   (GenJnlLine."Document Type" <> GenJnlLine."Document Type"::Refund)
                THEN
                    EXIT;
        END;

        IF ApplnCurrencyCode = '' THEN
            ApplnRoundingPrecision := GLSetup."Appln. Rounding Precision"
        ELSE BEGIN
            IF ApplnCurrencyCode <> Rec."Currency Code" THEN
                Currency.GET(ApplnCurrencyCode);
            ApplnRoundingPrecision := Currency."Appln. Rounding Precision";
        END;

        IF (ABS((AppliedAmount - PmtDiscAmount) + ApplyingAmount) <= ApplnRoundingPrecision) AND DifferentCurrenciesInAppln THEN
            ApplnRounding := -((AppliedAmount - PmtDiscAmount) + ApplyingAmount);
    end;


    procedure GetCustLedgEntry(var CustLedgEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgEntry := Rec;
    end;


    procedure FindApplyingEntry()
    begin
        IF CalcType = CalcType::Direct THEN BEGIN
            CustEntryApplID := USERID;
            IF CustEntryApplID = '' THEN
                CustEntryApplID := '***';

            CustLedgEntry.SETCURRENTKEY("Customer No.", "Applies-to ID", Open);
            CustLedgEntry.SETRANGE("Customer No.", Rec."Customer No.");
            CustLedgEntry.SETRANGE("Applies-to ID", CustEntryApplID);
            CustLedgEntry.SETRANGE(Open, TRUE);
            CustLedgEntry.SETRANGE("Applying Entry", TRUE);
            IF CustLedgEntry.FINDFIRST THEN BEGIN
                CustLedgEntry.CALCFIELDS(Amount, "Remaining Amount");
                ApplyingCustLedgEntry := CustLedgEntry;
                Rec.SETFILTER("Entry No.", '<>%1', CustLedgEntry."Entry No.");
                ApplyingAmount := CustLedgEntry."Remaining Amount";
                ApplnDate := CustLedgEntry."Posting Date";
                ApplnCurrencyCode := CustLedgEntry."Currency Code";
            END;
            CalcApplnAmount;
        END;
    end;


    procedure HandlChosenEntries(Type: Option Direct,GenJnlLine,SalesHeader; CurrentAmount: Decimal; CurrencyCode: Code[10]; "Posting Date": Date)
    var
        AppliedCustLedgEntryTemp: Record "Cust. Ledger Entry" temporary;
        PossiblePmtDisc: Decimal;
        OldPmtDisc: Decimal;
        CorrectionAmount: Decimal;
        CanUseDisc: Boolean;
        FromZeroGenJnl: Boolean;
    begin
        IF AppliedCustLedgEntry.FINDSET(FALSE, FALSE) THEN BEGIN
            REPEAT
                AppliedCustLedgEntryTemp := AppliedCustLedgEntry;
                AppliedCustLedgEntryTemp.INSERT;
            UNTIL AppliedCustLedgEntry.NEXT = 0;
        END ELSE
            EXIT;

        FromZeroGenJnl := (CurrentAmount = 0) AND (Type = Type::GenJnlLine);

        REPEAT
            IF NOT FromZeroGenJnl THEN
                AppliedCustLedgEntryTemp.SETRANGE(Positive, CurrentAmount < 0);
            IF AppliedCustLedgEntryTemp.FINDFIRST THEN BEGIN
                ExchangeAmountsOnLedgerEntry(Type, CurrencyCode, AppliedCustLedgEntryTemp, "Posting Date");

                CASE Type OF
                    Type::Direct:
                        CanUseDisc := PaymentToleranceMgt.CheckCalcPmtDiscCust(CustLedgEntry, AppliedCustLedgEntryTemp, 0, FALSE, FALSE);
                    Type::GenJnlLine:
                        CanUseDisc := PaymentToleranceMgt.CheckCalcPmtDiscGenJnlCust(GenJnlLine2, AppliedCustLedgEntryTemp, 0, FALSE)
                    ELSE
                        CanUseDisc := FALSE;
                END;

                IF CanUseDisc AND
                   (ABS(AppliedCustLedgEntryTemp."Amount to Apply") >= ABS(AppliedCustLedgEntryTemp."Remaining Amount" -
                      AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible"))
                THEN BEGIN
                    IF (ABS(CurrentAmount) > ABS(AppliedCustLedgEntryTemp."Remaining Amount" -
                          AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible"))
                    THEN BEGIN
                        PmtDiscAmount := PmtDiscAmount + AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                        CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" -
                          AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                    END ELSE
                        IF (ABS(CurrentAmount) = ABS(AppliedCustLedgEntryTemp."Remaining Amount" -
                              AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible"))
                        THEN BEGIN
                            PmtDiscAmount := PmtDiscAmount + AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible" + PossiblePmtDisc;
                            CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" -
                              AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible" - PossiblePmtDisc;
                            PossiblePmtDisc := 0;
                            AppliedAmount := AppliedAmount + CorrectionAmount;
                        END ELSE
                            IF FromZeroGenJnl THEN BEGIN
                                PmtDiscAmount := PmtDiscAmount + AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                                CurrentAmount := CurrentAmount +
                                  AppliedCustLedgEntryTemp."Remaining Amount" - AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                            END ELSE BEGIN
                                IF (CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" >= 0) <> (CurrentAmount >= 0) THEN BEGIN
                                    PmtDiscAmount := PmtDiscAmount + PossiblePmtDisc;
                                    AppliedAmount := AppliedAmount + CorrectionAmount;
                                END;
                                CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" -
                                  AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                                PossiblePmtDisc := AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
                            END;
                END ELSE BEGIN
                    IF ((CurrentAmount - PossiblePmtDisc + AppliedCustLedgEntryTemp."Amount to Apply") * CurrentAmount) <= 0 THEN BEGIN
                        PmtDiscAmount := PmtDiscAmount + PossiblePmtDisc;
                        CurrentAmount := CurrentAmount - PossiblePmtDisc;
                        PossiblePmtDisc := 0;
                        AppliedAmount := AppliedAmount + CorrectionAmount;
                    END;
                    CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Amount to Apply";
                END;
            END ELSE BEGIN
                AppliedCustLedgEntryTemp.SETRANGE(Positive);
                AppliedCustLedgEntryTemp.FINDFIRST;
                ExchangeAmountsOnLedgerEntry(Type, CurrencyCode, AppliedCustLedgEntryTemp, "Posting Date");
            END;

            IF OldPmtDisc <> PmtDiscAmount THEN
                AppliedAmount := AppliedAmount + AppliedCustLedgEntryTemp."Remaining Amount"
            ELSE
                AppliedAmount := AppliedAmount + AppliedCustLedgEntryTemp."Amount to Apply";
            OldPmtDisc := PmtDiscAmount;

            IF PossiblePmtDisc <> 0 THEN
                CorrectionAmount := AppliedCustLedgEntryTemp."Remaining Amount" - AppliedCustLedgEntryTemp."Amount to Apply"
            ELSE
                CorrectionAmount := 0;

            IF NOT DifferentCurrenciesInAppln THEN
                DifferentCurrenciesInAppln := ApplnCurrencyCode <> AppliedCustLedgEntryTemp."Currency Code";

            AppliedCustLedgEntryTemp.DELETE;
            AppliedCustLedgEntryTemp.SETRANGE(Positive);

        UNTIL NOT AppliedCustLedgEntryTemp.FINDFIRST;
        CheckRounding;
    end;

    local procedure AmounttoApplyOnAfterValidate()
    begin
        IF ApplnType <> ApplnType::"Applies-to Doc. No." THEN BEGIN
            CalcApplnAmount;
            CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure RecalcApplnAmount()
    begin
        CurrPage.UPDATE(TRUE);
        CalcApplnAmount;
    end;

    local procedure LookupOKOnPush()
    begin
        OK := TRUE;
    end;

    local procedure PostDirectApplication()
    var
        CustEntryApplyPostedEntries: Codeunit "CustEntry-Apply Posted Entries";
        PostApplication: Page "Post Application";
        ApplicationDate: Date;
        NewApplicationDate: Date;
        NewDocumentNo: Code[20];
    begin
        IF CalcType = CalcType::Direct THEN BEGIN
            IF ApplyingCustLedgEntry."Entry No." <> 0 THEN BEGIN
                Rec := ApplyingCustLedgEntry;
                ApplicationDate := CustEntryApplyPostedEntries.GetApplicationDate(Rec);
                PostApplication.SetValues(Rec."Document No.", ApplicationDate);
                IF ACTION::OK = PostApplication.RUNMODAL THEN BEGIN
                    PostApplication.GetValues(NewDocumentNo, NewApplicationDate);
                    IF NewApplicationDate < ApplicationDate THEN
                        ERROR(Text013, Rec.FIELDCAPTION("Posting Date"), Rec.TABLECAPTION);
                END ELSE
                    ERROR(Text019);

                CustEntryApplyPostedEntries.Apply(Rec, NewDocumentNo, NewApplicationDate);

                MESSAGE(Text012);
                PostingDone := TRUE;
                CurrPage.CLOSE;
            END ELSE
                ERROR(Text002);
        END ELSE
            ERROR(Text003);
    end;

    local procedure ExchangeAmountsOnLedgerEntry(Type: Option Direct,GenJnlLine,SalesHeader; CurrencyCode: Code[10]; var CalcCustLedgEntry: Record "Cust. Ledger Entry"; PostingDate: Date)
    var
        CalculateCurrency: Boolean;
    begin
        CalcCustLedgEntry.CALCFIELDS("Remaining Amount");

        IF Type = Type::Direct THEN
            CalculateCurrency := ApplyingCustLedgEntry."Entry No." <> 0
        ELSE
            CalculateCurrency := TRUE;

        IF (CurrencyCode <> CalcCustLedgEntry."Currency Code") AND CalculateCurrency THEN BEGIN
            CalcCustLedgEntry."Remaining Amount" :=
              CurrExchRate.ExchangeAmount(
                CalcCustLedgEntry."Remaining Amount",
                CalcCustLedgEntry."Currency Code",
                CurrencyCode, PostingDate);
            CalcCustLedgEntry."Remaining Pmt. Disc. Possible" :=
              CurrExchRate.ExchangeAmount(
                CalcCustLedgEntry."Remaining Pmt. Disc. Possible",
                CalcCustLedgEntry."Currency Code",
                CurrencyCode, PostingDate);
            CalcCustLedgEntry."Amount to Apply" :=
              CurrExchRate.ExchangeAmount(
                CalcCustLedgEntry."Amount to Apply",
                CalcCustLedgEntry."Currency Code",
                CurrencyCode, PostingDate);
        END;
    end;


    procedure SetReceipts(NewReceiptLine: Record "FIN-Receipt Line q"; var NewCustLedgEntry: Record "Cust. Ledger Entry"; ApplnTypeSelect: Integer)
    var
        TotalAdjCostLCY: Decimal;
    begin
        ReceiptLine := NewReceiptLine;
        Rec.COPYFILTERS(NewCustLedgEntry);
        ApplyingAmount := -ReceiptLine.Amount;

        ReceiptHeader.RESET;
        ReceiptHeader.SETRANGE(ReceiptHeader."No.", NewReceiptLine.No);
        IF ReceiptHeader.FIND('-') THEN BEGIN
            ApplnDate := ReceiptHeader.Date;
            ApplnCurrencyCode := ReceiptHeader."Currency Code";
            CalcType := CalcType::Receipt;
        END;
        CASE ApplnTypeSelect OF
            ReceiptLine.FIELDNO("Applies-to Doc. No."):
                ApplnType := ApplnType::"Applies-to Doc. No.";
            ReceiptLine.FIELDNO("Applies-to ID"):
                ApplnType := ApplnType::"Applies-to ID";
        END;



        SetApplyingCustLedgEntry;
    end;
}


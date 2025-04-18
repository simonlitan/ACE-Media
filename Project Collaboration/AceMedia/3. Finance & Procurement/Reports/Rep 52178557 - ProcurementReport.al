report 52178557 "Procurement Report"
{
    Caption = 'Procurement Order Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/ProcurementOrderReport.rdl';
    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(Buy_from_Vendor_No_; PurchaseHeader."Buy-from Vendor No.")
            {

            }
            column(AssignedUserID_PurchaseHeader; "Assigned User ID")
            {
            }
            column(Department_PurchaseHeader; Department)
            {
            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            column(POType_PurchaseHeader; "PO Status")
            {
            }
            column(No_; PurchaseHeader."No.")
            {

            }
            column(DepartmentName_PurchaseHeader; "Departments Name")
            {
            }
            column(DivisionName_PurchaseHeader; "Division Name")
            {
            }



            column(ShortcutDimension2Code_PurchaseHeader; "Shortcut Dimension 2 Code")
            {
            }

            column(Shortcutdimension4_PurchaseHeader; "Shortcut dimension 4")
            {
            }
            column(LPONo_PurchaseHeader; "LPO No.")
            {
            }
            column(QuotationNo_PurchaseHeader; "Quotation No.")
            {
            }
            column(QuoteNo_PurchaseHeader; "Quote No.")
            {
            }
            column(AmountIncludingVAT_PurchaseHeader; "Amount Including VAT")
            {
            }
            column(Pay_to_Vendor_No_; PurchaseHeader."Pay-to Vendor No.")
            {

            }
            column(Pay_to_Name; PurchaseHeader."Pay-to Name")
            {

            }
            column(Pay_to_Address; PurchaseHeader."Pay-to Address")
            {

            }
            column(Pay_to_City; PurchaseHeader."Pay-to City")
            {

            }
            column(Pay_to_Contact; PurchaseHeader."Pay-to Contact")
            {

            }
            column(Pay_to_Contact_No_; PurchaseHeader."Pay-to Contact No.")
            {

            }
            column(Your_Reference; PurchaseHeader."Your Reference")
            {

            }
            column(Quote_No_; "Quote No.")
            {

            }
            column(Ship_to_Address; PurchaseHeader."Ship-to Address")
            {

            }
            column(Ship_to_Code; PurchaseHeader."Ship-to Code")
            {

            }
            column(Order_Date; PurchaseHeader."Order Date")
            {

            }
            column(Posting_Date; PurchaseHeader."Posting Date")
            {

            }
            column(Expected_Receipt_Date; PurchaseHeader."Expected Receipt Date")
            {

            }
            column(Posting_Description; PurchaseHeader."Posting Description")
            {

            }
            column(Due_Date; PurchaseHeader."Due Date")
            {

            }
            column(PRN_No; PurchaseHeader."PRN No")
            {

            }
            column(Net_Amount; PurchaseHeader.Amount)
            {

            }
            column(RFQ_No_; PurchaseHeader."RFQ No.")
            {

            }
            column(Documet_Date; Format(PurchaseHeader."Document Date"))
            {
            }
            column(LPOText; LPOText)
            {

            }
            column(CompLogo; CompInf.Picture)
            {
            }
            column(CompName; CompInf.Name)
            {
            }
            column(address; CompInf.Address)
            {

            }
            column(Address2; CompInf."Address 2")
            {

            }
            column(mail; CompInf."E-Mail")
            {

            }
            column(Url; CompInf."Home Page")
            {

            }
            column(CompFax; compinfo."Fax No.")
            {

            }
            column(Comppostalcode; compinfo."Post Code")
            {

            }
            column(Compphone; compinfo."Phone No.")
            {

            }
            column(compphone2; compinfo."Phone No. 2")
            {

            }
            column(CompanyInfowebpage; CompanyInfo."Home Page")
            {

            }

            column(TIME_PRINTED_____FORMAT_TIME__Control1102755003; 'TIME PRINTED:' + FORMAT(TIME))
            {
                AutoFormatType = 1;
            }
            column(DATE_PRINTED_____FORMAT_TODAY_0_4__Control1102755004; 'DATE PRINTED:' + FORMAT(TODAY, 0, 4))
            {
                AutoFormatType = 1;
            }

            column(UserId_PurchaseHeader; "Assigned User ID 2")
            {
            }
            column(ProjectName; ProjectName)
            {

            }
            column(SenderTitle; SenderTitle)
            {

            }
            dataitem(Vendor; Vendor)
            {
                dataitemlink = "No." = field("Buy-from Vendor No.");

                column(EMail_Vendor; "E-Mail")
                {
                }
                column(PhoneNo_Vendor; "Phone No.")
                {

                }
                column(Address_Vendor; Address)
                {
                }
                column(Name_Vendor; Name)
                {
                }
                column(MainBankName_Vendor; "Main Bank Name")
                {
                }

                column(PINNo_Vendor; "VAT Registration No.")
                {
                }
                column(BankAccountNo_Vendor; "Bank Account No")
                {
                }
                column(BranchBankName_Vendor; "Branch Bank Name")
                {
                }
            }

            dataitem(PurchaseLine; "Purchase Line")
            {

                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                column(UnitofMeasure_PurchaseLine; "Unit of Measure")
                {
                }

                column(Document_No_; "Document No.")
                {

                }
                column(No; "No.")
                {

                }
                column(Quantity; PurchaseLine.Quantity)
                {

                }
                column(Description; PurchaseLine.Description)
                {

                }
                // column(Unit_Cost; PurchaseLine."Unit Cost")
                // {

                // }
                // column(Amount; PurchaseLine.Amount)
                // {

                // }
                // column(Amount_Including_VAT; "Amount Including VAT")
                // {

                // }
                // column(VATAMOUNT; "Outstanding Amt. Ex. VAT (LCY)")
                // {

                // }
                
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Unit_Cost; "Unit Cost") { }
                column(Line_Amount; "Line Amount") { }
                column(Amount1; Amount) { }
                column(Amount_Including_VAT; "Amount Including VAT") { }
                


                dataitem("FIN-Budget Entries"; "FIN-Budget Entries")
                {
                    DataItemLink = "Document description" = field(Description);
                    dataitem("FIN-Budget Entries Summary"; "FIN-Budget Entries Summary")
                    {
                        DataItemLink = "G/l Account No." = field("G/l Account No.");

                        column(Allocation_FINBudgetEntriesSummary; Allocation)
                        {
                        }
                        column(Balance_FINBudgetEntriesSummary; Balance)
                        {
                        }
                        column(BudgetName_FINBudgetEntriesSummary; "Budget Name")
                        {
                        }
                    }
                }
            }


            dataitem(DataItem1171; "Approval Entry")
            {
                DataItemLink = "Document No." = FIELD("No.");
                //DataItemTableView = SORTING("Table ID", "Document Type", "Document No.", "Sequence No.") ORDER(Ascending) WHERE("Approved The Document" = FILTER(true));
                column(Approval_Entry__Approver_ID_; "Approver ID")
                {
                }

                column(ApproveDateTime; "Last Date-Time Modified")
                {
                }

                dataitem("User Setup"; "User Setup")
                {
                    DataItemLink = "User Id" = field("Approver ID");

                    column(ApprovalTitle_UserSetup; "Approval Title")
                    {
                    }
                    column(UserSignature_UserSetup; "User Signature")
                    {
                    }
                    trigger OnPreDataItem()
                    begin

                        CalcFields("User Signature");
                    end;

                    trigger OnAfterGetRecord()
                    begin
                        CalcFields("User Signature");
                    end;
                }


            }
            dataitem("UserSetup1"; "User Setup")
            {
                DataItemLink = "User Id" = field("Assigned User ID 2");
                column(UserSignature_UserSetup1; "User Signature")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    UserSetup1.CalcFields("User Signature");
                end;

                trigger OnPreDataItem()
                begin
                    UserSetup1.CalcFields("User Signature");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                UserSetup1.CalcFields("User Signature");
                CompInf.GET;
                CompInf.CALCFIELDS(CompInf.Picture);
                InitTextVariable;
                FormatNoText(NumberText, Amount, CurrencyCodeText);
                Dimensionvalue.Reset();
                Dimensionvalue.SetRange(code, PurchaseHeader."Shortcut Dimension 2 Code");
                if Dimensionvalue.Find('-') then
                    ProjectName := Dimensionvalue.Name;
                //CheckReport.InitTextVariable();
                // CheckReport.FormatNoText(NumberText, Amount, '');

                IF NoOfCopies = 0 THEN
                    LPOText := 'ORIGINAL'
                ELSE
                    IF NoOfCopies = 1 THEN
                        LPOText := 'DUPLICATE'
                    ELSE
                        IF NoOfCopies = 2 THEN
                            LPOText := 'TRIPLICATE'
                        ELSE
                            IF NoOfCopies = 3 THEN
                                LPOText := 'QUADRUPLICATE'
                            ELSE
                                IF NoOfCopies > 3 THEN
                                    LPOText := 'QUINTRIPLICATE';

                UserSetup.Reset();
                UserSetup.SetRange("User ID", PurchaseHeader."Assigned User ID 2");
                if UserSetup.Find('-') then
                    SenderTitle := UserSetup."Approval Title";

                UserSetup.Reset();
                UserSetup.SetRange("User ID", PurchaseHeader."Assigned User ID");
                if UserSetup.Find('-') then
                    SenderTitle := UserSetup."Approval Title";


            end;

            trigger OnPostDataItem()
            begin
                // PurchCountPrinted.RUN(pHeader);
                If CurrReport.Preview = false then begin

                    // IF NOT CurrReport.PREVIEW THEN
                    NoOfCopies := NoOfCopies + 1;

                    PurchCountPrinted.RUN(pheader);
                    Modify();
                end;
            end;


            trigger OnPreDataItem()
            begin
                UserSetup1.CalcFields("User Signature");
                NoOfLoops := ABS(NoOfCopies) + 1;
                CopyText := '';
                // SETRANGE(Number, 1, NoOfLoops);
                OutputNo := 0;
            end;

        }


    }
    requestpage
    {

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(NoOfCopies; NoOfCopies)
                    {
                        Caption = 'No of Copies';
                        ApplicationArea = all;
                    }

                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }
    var


        UserSetup: record "User Setup";
        SenderTitle: text[200];
        item: record item;
        vend: Record Vendor;
        NoOfCopies1: Integer;

        LPOText: text[100];
        pheader: Record "Purchase Header";
        Dimensionvalue: Record "Dimension Value";
        NoOfLoops: Integer;
        NoOfCopies: integer;
        PurchCountPrinted: Codeunit "Purch.Header-Printed";
        CopyText: text[50];
        OutputNo: integer;
        CompInf: Record "Company Information";
        ProjectName: text[200];
        CheckReport: Report Check;
        NumberText: array[2] of Text[1024];
        StrCopyText: Text[30];
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        DimVal: Record "Dimension Value";
        DimValName: Text[100];
        TTotal: Decimal;
        STotal: Decimal;
        InvoiceCurrCode: Code[10];
        CurrCode: Code[10];
        GLSetup: Record "General Ledger Setup";
        DOCNAME: Text[30];
        CompInfo: Record "Company Information";
        VATCaptionLbl: Label 'VAT';
        PAYMENT_DETAILSCaptionLbl: Label 'PAYMENT DETAILS';
        AMOUNTCaptionLbl: Label 'AMOUNT';
        NET_AMOUNTCaptionLbl: Label 'NET AMOUNT';
        W_TAXCaptionLbl: Label 'W/TAX';
        Document_No___CaptionLbl: Label 'Document No. :';
        Currency_CaptionLbl: Label 'Currency:';
        Payment_To_CaptionLbl: Label 'Payment To:';
        Document_Date_CaptionLbl: Label 'Document Date:';
        Cheque_No__CaptionLbl: Label 'Cheque No.:';
        R_CENTERCaptionLbl: Label 'R.CENTER';
        PROJECTCaptionLbl: Label 'PROJECT';
        TotalCaptionLbl: Label 'Total';
        Printed_By_CaptionLbl: Label 'Printed By:';
        Amount_in_wordsCaptionLbl: Label 'Amount in words';
        EmptyStringCaptionLbl: Label '================================================================================================================================================================================================';
        RecipientCaptionLbl: Label 'Recipient';
        Signature_CaptionLbl: Label 'Signature:';
        Date_CaptionLbl: Label 'Date:';
        Name_CaptionLbl: Label 'Name:';
        EmptyStringCaption_Control1102755013Lbl: Label '================================================================================================================================================================================================';
        Amount_in_wordsCaption_Control1102755021Lbl: Label 'Amount in words';
        Printed_By_Caption_Control1102755026Lbl: Label 'Printed By:';
        TotalCaption_Control1102755033Lbl: Label 'Total';
        name: Label 'THE KENYATTA INTERNATIONAL CONFERENCE CENTRE';
        "name+": Label '(CORPORATION)';
        addr: Label 'Private Bag, Tel.+020 2046895 / 0722814900';
        email: Label 'MASENO,Kenya.Email info@kicc.co.ke,Website:www.kicc.co.ke';
        PIN: Label 'PIN:';
        VAT: Label 'VAT:';
        no: Label 'L.P.O/L.S.O';
        ret: Label 'Retention';
        appliedinv: Label 'Applied Invoice(s) Details';
        confir: Label 'I confirm accuracy and authenticity of the payment and that this expenditure has been entered in the votebook and is sufficiently covered.';
        next1: Label 'has been entered in the votebook and is sufficiently covered.';
        dat: Label 'DATE:.';
        PREPARE: Label 'PREPARE .';
        checked: Label 'CHECKED .';
        appr: Label 'APPROVED .';
        confirma: Label 'CONFIRMED .';
        internals: Label 'Internal Audit Manage';
        paymentapp: Label 'Payment Approved:';
        md: Label 'Managing Director:';
        Authorized: Label 'Authorized.';
        emptystr: Label '========================================================================================================================================';
        id: Label 'ID No:';
        accntnt: Label 'Accountant:';
        fincont: Label 'Financial Controller:';
        payTypes: Record "FIN-Receipts and Payment Types";
        vends: Record Vendor;

        NumberTextOne: Text;
        NumberTextTwo: Text;
        Number: Integer;
        DimValues: Record "Dimension Value";
        CompName: Text[100];
        TypeOfDoc: Text[100];
        BankName: Text[100];
        Banks: Record "Bank Account";
        CompanyInfo: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        CurrencyCodeText: Code[10];
        Users: Record User;
        UserName: Text[130];
        Desc: Text[70];
        GLEntry: Record "G/L Entry";
        Text000: Label 'Preview is not allowed.';
        TXT002: Label '%1, %2 %3';
        Text001: Label 'Last Check No. must be filled in.';
        Text002: Label 'Filters on %1 and %2 are not allowed.';
        Text003: Label 'XXXXXXXXXXXXXXXX';
        Text004: Label 'must be entered.';
        Text005: Label 'The Bank Account and the General Journal Line must have the same currency.';
        Text006: Label 'Salesperson';
        Text007: Label 'Purchaser';
        Text008: Label 'Both Bank Accounts must have the same currency.';
        Text009: Label 'Our Contact';
        Text010: Label 'XXXXXXXXXX';
        Text011: Label 'XXXX';
        Text012: Label 'XX.XXXXXXXXXX.XXXX';
        Text013: Label '%1 already exists.';
        Text014: Label 'Check for %1 %2';
        Text015: Label 'Payment';
        Text016: Label 'In the Check report, One Check per Vendor and Document No.\';
        Text017: Label 'must not be activated when Applies-to ID is specified in the journal lines.';
        Text018: Label 'XXX';
        Text019: Label 'Total';
        Text020: Label 'The total amount of check %1 is %2. The amount must be positive.';
        Text021: Label 'VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID';
        Text022: Label 'NON-NEGOTIABLE';
        Text023: Label 'Test print';
        Text024: Label 'XXXX.XX';
        Text025: Label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        Text026: Label 'ZERO';
        Text027: Label 'HUNDRED';
        Text028: Label 'AND';
        Text029: Label '%1 results in a written number that is too long.';
        Text030: Label ' is already applied to %1 %2 for customer %3.';
        Text031: Label ' is already applied to %1 %2 for vendor %3.';
        Text032: Label 'ONE';
        Text033: Label 'TWO';
        Text034: Label 'THREE';
        Text035: Label 'FOUR';
        Text036: Label 'FIVE';
        Text037: Label 'SIX';
        Text038: Label 'SEVEN';
        Text039: Label 'EIGHT';
        Text040: Label 'NINE';
        Text041: Label 'TEN';
        Text042: Label 'ELEVEN';
        Text043: Label 'TWELVE';
        Text044: Label 'THIRTEEN';
        Text045: Label 'FOURTEEN';
        Text046: Label 'FIFTEEN';
        Text047: Label 'SIXTEEN';
        Text048: Label 'SEVENTEEN';
        Text049: Label 'EIGHTEEN';
        Text050: Label 'NINETEEN';
        Text051: Label 'TWENTY';
        Text052: Label 'THIRTY';
        Text053: Label 'FORTY';
        Text054: Label 'FIFTY';
        Text055: Label 'SIXTY';
        Text056: Label 'SEVENTY';
        Text057: Label 'EIGHTY';
        Text058: Label 'NINETY';
        Text059: Label 'THOUSAND';
        Text060: Label 'MILLION';
        Text061: Label 'BILLION';
        Text062: Label 'G/L Account,Customer,Vendor,Bank Account';
        Text063: Label 'Net Amount %1';
        Text064: Label '%1 must not be %2 for %3 %4.';

    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '****';

        if No < 1 then
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026)
        else begin
            for Exponent := 4 downto 1 do begin
                PrintExponent := false;
                Ones := No div Power(1000, Exponent - 1);
                Hundreds := Ones div 100;
                Tens := (Ones mod 100) div 10;
                Ones := Ones mod 10;
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                end;
                if Tens >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    if Ones > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                end else
                    if (Tens * 10 + Ones) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                if PrintExponent and (Exponent > 1) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
            end;
        end;

        if CurrencyCode = '' then begin
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' KENYA SHILLINGS');
            if No <> 0 then begin
                AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);
                //Translate KOBO to words
                if (No * 100) > 0 then begin
                    No := No * 100;
                    for Exponent := 4 downto 1 do begin
                        PrintExponent := false;
                        Ones := No div Power(1000, Exponent - 1);
                        Hundreds := Ones div 100;
                        Tens := (Ones mod 100) div 10;
                        Ones := Ones mod 10;
                        if Hundreds > 0 then begin
                            AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                            AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                        end;
                        if Tens >= 2 then begin
                            AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                            if Ones > 0 then
                                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                        end else
                            if (Tens * 10 + Ones) > 0 then
                                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                        if PrintExponent and (Exponent > 1) then
                            AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                        No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
                    end;
                end;
                //
                //AddToNoText(NoText,NoTextIndex,PrintExponent,FORMAT(No * 100) + ' KOBO');
                AddToNoText(NoText, NoTextIndex, PrintExponent, ' CENTS');
            end;
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ONLY****');
        end;
        if CurrencyCode <> '' then begin
            AddToNoText(NoText, NoTextIndex, PrintExponent, CurrencyCode);
            if No <> 0 then begin
                AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);
                AddToNoText(NoText, NoTextIndex, PrintExponent, Format(No * 100) + ' CENTS');
            end;
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ONLY');
        end;
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
    begin
        PrintExponent := true;

        while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
            NoTextIndex := NoTextIndex + 1;
            if NoTextIndex > ArrayLen(NoText) then
                Error(Text029, AddText);
        end;

        NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;

    procedure InitTextVariable()
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text060;
        ExponentText[4] := Text061;
    end;
}
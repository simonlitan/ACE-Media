report 52178522 "Vendor Statement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/VendorBal.rdlc';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Detailed Vendor Ledg. Entry"; 380)
        {
            RequestFilterFields = "Vendor No Filter", "Date Filter";
            column(DocNo; "Detailed Vendor Ledg. Entry"."Document No.")
            {
            }
            column(Debit; -"Detailed Vendor Ledg. Entry"."Debit Amount (LCY)")
            {
            }
            column(Credit; "Detailed Vendor Ledg. Entry"."Credit Amount (LCY)")
            {
            }
            column(Bal; Bal)
            {
            }
            column(Pic; CompInfo.Picture)
            {
            }
            column(Name; Name)
            {
            }
            column(Addr; Addr)
            {
            }
            column(Email; Email)
            {
            }
            column(City; City)
            {
            }
            column(Web; Web)
            {
            }
            column(userid; USERID)
            {
            }
            column(date; TODAY)
            {
            }
            column(TBal; TBal)
            {
            }
            column(PDate; "Detailed Vendor Ledg. Entry"."Posting Date")
            {
            }
            column(VendName; VendName)
            {
            }
            column(No; GETFILTER("Detailed Vendor Ledg. Entry"."Vendor No Filter"))
            {
            }
            column(DateInter; GETFILTER("Detailed Vendor Ledg. Entry"."Date Filter"))
            {
            }
            column(NoVend; "Detailed Vendor Ledg. Entry"."Vendor No.")
            {
            }
            column(Desc; Desc)
            {
            }
            column(invnoext; invnoext)
            {
            }

            trigger OnAfterGetRecord()
            begin
                VendEntry.RESET;
                VendEntry.SETRANGE(VendEntry."Entry No.", "Detailed Vendor Ledg. Entry"."Vendor Ledger Entry No.");
                VendEntry.SETRANGE(VendEntry."Vendor No.", "Detailed Vendor Ledg. Entry"."Vendor No.");
                IF VendEntry.FIND('-') THEN
                    invnoext := VendEntry."External Document No.";



                IF Vend.GET("Detailed Vendor Ledg. Entry"."Vendor No.") THEN
                    VendName := Vend.Name;
                IF VendEntry.GET("Detailed Vendor Ledg. Entry"."Vendor Ledger Entry No.") THEN
                    Desc := VendEntry.Description;

                Bal := "Detailed Vendor Ledg. Entry"."Credit Amount" + (-"Detailed Vendor Ledg. Entry"."Debit Amount") + Bal;
                IF CompInfo.GET THEN
                    CompInfo.CALCFIELDS(CompInfo.Picture);
                Name := CompInfo.Name;
                Addr := CompInfo.Address;
                City := CompInfo.City;
                Email := CompInfo."E-Mail";
                Web := CompInfo."Home Page";

                DetVend.RESET;
                DetVend.SETRANGE(DetVend."Vendor No.", "Detailed Vendor Ledg. Entry"."Vendor No.");
                //DetVend.SETRANGE(DetVend."Entry No.","Detailed Vendor Ledg. Entry"."Entry No.");
                IF DetVend.FIND('-') THEN BEGIN
                    REPEAT
                        TCredit := TCredit + DetVend."Credit Amount (LCY)";
                        TDebit := TDebit + DetVend."Debit Amount (LCY)";
                    UNTIL DetVend.NEXT = 0;
                END;
                // MESSAGE(FORMAT(TCredit));
                IF "Detailed Vendor Ledg. Entry"."Document Type" = "Detailed Vendor Ledg. Entry"."Document Type"::Payment THEN
                    SETRANGE("Detailed Vendor Ledg. Entry"."Entry Type", "Detailed Vendor Ledg. Entry"."Entry Type"::"Initial Entry");
                //MESSAGE(FORMAT(TDebit));
                TBal := TCredit - TDebit;
            end;

            trigger OnPreDataItem()
            begin
                CLEAR(Bal);
                CLEAR(TCredit);
                CLEAR(TDebit);

                IF GETFILTER("Detailed Vendor Ledg. Entry"."Vendor No Filter") <> '' THEN
                    "Detailed Vendor Ledg. Entry".SETFILTER("Detailed Vendor Ledg. Entry"."Vendor No.", (GETFILTER("Detailed Vendor Ledg. Entry"."Vendor No Filter")));
                IF GETFILTER("Detailed Vendor Ledg. Entry"."Date Filter") <> '' THEN
                    "Detailed Vendor Ledg. Entry".SETFILTER("Detailed Vendor Ledg. Entry"."Posting Date", (GETFILTER("Detailed Vendor Ledg. Entry"."Date Filter")));
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Bal: Decimal;
        CompInfo: Record 79;
        Name: Text[50];
        Addr: Text[50];
        Email: Text[50];
        City: Text[50];
        Web: Text[50];
        DetVend: Record 380;
        TDebit: Decimal;
        TCredit: Decimal;
        TBal: Decimal;
        Vend: Record 23;
        VendName: Text[100];
        VendEntry: Record 25;
        Desc: Text[200];
        invnoext: Code[50];
}


table 52178501 "FIN-Cash Sale Header"
{
    /* DrillDownPageID = 68292;
    LookupPageID = 68292; */

    fields
    {
        field(1; "Doc No"; Code[20])
        {

            trigger OnValidate()
            begin
                /*
                IF "Receipt No" <> xRec."Receipt No" THEN BEGIN
                  GenLedgerSetup.GET;
                  NoSeriesMgt.TestManual(GenLedgerSetup."Cash Sale");
                  "No. Series" := '';
                 END;
                 */

            end;
        }
        field(2; "Customer No"; Code[30])
        {
            TableRelation = Customer."No.";
        }
        field(3; "Customer Name"; Code[100])
        {
        }
        field(4; Contacts; Code[20])
        {
        }
        field(5; Address; Code[20])
        {
        }
        field(6; Town; Code[30])
        {
        }
        field(7; "Posting Group"; Code[20])
        {
        }
        field(8; "Bus Posting Group"; Code[20])
        {
        }
        field(9; "Pro Posting Group"; Code[20])
        {
        }
        field(10; "Vat Bus Posting Group"; Code[20])
        {
        }
        field(11; "Vat Pro Posting Group"; Code[20])
        {
        }
        field(12; "Vat Posting Group"; Code[20])
        {
        }
        field(13; Balance; Decimal)
        {
        }
        field(14; "System Customer"; Boolean)
        {
            InitValue = false;
        }
        field(15; "Cashier Bank"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(16; "Received By"; Code[20])
        {
        }
        field(17; Date; Date)
        {
        }
        field(18; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(19; Department; Code[30])
        {
            TableRelation = "Dimension Value".Code WHERE(Code = CONST('DEPARTMENT'));
        }
        field(20; Posted; Boolean)
        {
            InitValue = false;
        }
        field(21; "Posted By"; Code[20])
        {
        }
        field(22; "Posted Date"; Date)
        {
        }
        field(23; "Posted Time"; Time)
        {
        }
        field(24; "Report Status"; Option)
        {
            OptionMembers = " ","Copy Of Receipt";
        }
        field(25; "Sale Type"; Option)
        {
            OptionCaption = 'Cash Receipt,Official Receipt,Rent Receipt';
            OptionMembers = "Cash Receipt","Official Receipt","Rent Receipt";
        }
        field(26; "Cheque No"; Code[20])
        {
        }
        field(27; Remarks; Text[100])
        {
        }
        field(28; "Cheque Date"; Date)
        {
        }
        field(29; "Cheque Type"; Code[30])
        {
            TableRelation = "FIN-Cheque Types";
        }
        field(30; "Paying Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No." WHERE("Bank Acc. Posting Group" = CONST('CASH'));
        }
        field(31; "Paying Bank Balance"; Decimal)
        {
        }
        field(32; Amount; Decimal)
        {
            CalcFormula = Sum("FIN-Cash Sale Line"."Total Amount" WHERE(No = FIELD("Doc No")));
            FieldClass = FlowField;
        }
        field(33; "Receiving Bank A/C"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(34; "Received Amount"; Decimal)
        {
        }
        field(35; "Campus Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(36; "Receipt No"; Code[6])
        {
            Numeric = true;
        }
        field(37; Cancelled; Boolean)
        {
        }
        field(38; "Cancelled By"; Code[20])
        {
        }
        field(39; "Cancelled Date"; Date)
        {
        }
        field(40; Banked; Boolean)
        {
        }
        field(41; "Banked Date"; Date)
        {
        }
        field(42; "Banked By"; Code[20])
        {
        }
        field(43; "Banked Amount"; Decimal)
        {
        }
        field(44; "Banking Slip No"; Code[20])
        {
        }
        field(45; "Amount Payable"; Decimal)
        {
            CalcFormula = Lookup(Customer.Balance WHERE("No." = FIELD("Customer No")));
            FieldClass = FlowField;
        }
        field(46; "Department Name"; Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE(Code = FIELD(Department),
                                                               "Global Dimension No." = CONST(2)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Doc No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*
        IF "Receipt No" = '' THEN BEGIN
           GenLedgerSetup.GET;
           GenLedgerSetup.TESTFIELD(GenLedgerSetup."Cash Sale");
           NoSeriesMgt.InitSeries(GenLedgerSetup."Cash Sale",xRec."No. Series",0D,"Receipt No","No. Series");
           MESSAGE("Receipt No");
         END;
         */
        GenLedgerSetup.GET;
        "No. Series Line".SETRANGE("No. Series Line"."Series Code", GenLedgerSetup."Cash Sale");
        IF "No. Series Line".FIND('-') THEN BEGIN
            "Last No" := "No. Series Line"."Last No. Used";
            "No. Series Line"."Last No. Used" := INCSTR("No. Series Line"."Last No. Used");
            "No. Series Line".MODIFY;
        END;
        "Doc No" := "Last No";

    end;

    var
        GenLedgerSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        "No. Series Line": Record "No. Series Line";
        "Last No": Code[20];
}


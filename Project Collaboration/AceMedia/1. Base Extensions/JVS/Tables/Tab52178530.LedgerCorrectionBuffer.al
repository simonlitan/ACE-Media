table 52178483 "Ledger Correction Buffer1"
{
    DrillDownPageId = "Ledger Correction Buffer1";
    LookupPageId = "Ledger Correction Buffer1";
    fields
    {
        field(1; "Document No."; Code[30])
        {

        }
        field(2; "Posting Date"; Date)
        {

        }
        field(3; "Correct Date"; Date)
        {

        }

        field(5; "Posted"; Boolean)
        {

        }
        field(6; "Posted By"; Code[30])
        {

        }
        field(7; "Date Modification Posted"; date)
        {

        }
    }

    keys
    {
        key(key1; "Document No.", "Posting Date")
        {

        }
    }

    trigger OnDelete()
    begin
        if Rec.Posted then Error('Already Posted');
        ;
    end;

    trigger OnModify()
    begin
        if Rec.Posted then Error('Already Posted');
        ;
    end;

    trigger OnRename()
    begin
        if Rec.Posted then Error('Already Posted');
    end;

    procedure ModifyPostedDoc()
    var

        bnkledger: Record "Bank Account Ledger Entry";
        accLedger: Record "G/L Entry";
        custLedger: Record "Cust. Ledger Entry";
        dcustledger: Record "Detailed Cust. Ledg. Entry";
        dcvcustledg: Record "Detailed CV Ledg. Entry Buffer";
        vendLedger: Record "Vendor Ledger Entry";
        dvledger: Record "Detailed Vendor Ledg. Entry";
        LCorrection: Record "Ledger Correction Buffer1";

    begin
        if Confirm('Post the listed corrections on date ?', true) = false then Error('cancelled');
        LCorrection.Reset();
        LCorrection.SetRange(Posted, false);
        LCorrection.SetFilter("Correct Date", '<>%1', 0D);
        LCorrection.SetFilter("Posting Date", '<>%1', 0D);
        if LCorrection.Find('-') then begin
            repeat
                dcustledger.Reset();
                dcustledger.SetRange("Document No.", LCorrection."Document No.");
                dcustledger.SetRange("Posting Date", LCorrection."Posting Date");
                if dcustledger.Find('-') then begin
                    repeat
                        dcustledger."Posting Date" := LCorrection."Correct Date";
                        dcustledger.Modify();
                    until dcustledger.Next() = 0;
                end;

                dvledger.Reset();
                dvledger.SetRange("Document No.", LCorrection."Document No.");
                dvledger.SetRange("Posting Date", LCorrection."Posting Date");
                if dvledger.Find('-') then begin
                    repeat
                        dvledger."Posting Date" := LCorrection."Correct Date";
                        dvledger.Modify();
                    until dvledger.Next() = 0;
                end;

                custLedger.Reset();
                custLedger.SetRange("Document No.", LCorrection."Document No.");
                custLedger.SetRange("Posting Date", LCorrection."Posting Date");
                if custLedger.Find('-') then begin
                    repeat
                        custLedger."Posting Date" := LCorrection."Correct Date";
                        custLedger."Document Date" := LCorrection."Correct Date";
                        custLedger.Modify();
                    until custLedger.Next() = 0;
                end;

                vendLedger.Reset();
                vendLedger.SetRange("Document No.", LCorrection."Document No.");
                vendLedger.SetRange("Posting Date", LCorrection."Posting Date");
                if vendLedger.Find('-') then begin
                    repeat
                        vendLedger."Document Date" := LCorrection."Correct Date";
                        vendLedger."Posting Date" := LCorrection."Correct Date";
                        vendLedger.Modify();
                    until vendLedger.Next() = 0;
                end;

                bnkledger.Reset();
                bnkledger.SetRange("Document No.", LCorrection."Document No.");
                bnkledger.SetRange("Posting Date", LCorrection."Posting Date");
                if bnkledger.Find('-') then begin
                    repeat
                        bnkledger."Document Date" := LCorrection."Correct Date";
                        bnkledger."Posting Date" := LCorrection."Correct Date";
                        bnkledger.Modify();
                    until bnkledger.Next() = 0;
                end;

                accLedger.Reset();
                accLedger.SetRange("Document No.", LCorrection."Document No.");
                accLedger.SetRange("Posting Date", LCorrection."Posting Date");
                if accLedger.Find('-') then begin
                    repeat
                        accLedger."Document Date" := LCorrection."Correct Date";
                        accLedger."Posting Date" := LCorrection."Correct Date";
                        accLedger.Modify();
                    until accLedger.Next() = 0;
                end;

                LCorrection.Posted := true;
                LCorrection."Posted By" := UserId;
                LCorrection."Date Modification Posted" := Today;
                LCorrection.Modify();

            until LCorrection.Next() = 0;
            Message('Complete');

        end;
    end;
}
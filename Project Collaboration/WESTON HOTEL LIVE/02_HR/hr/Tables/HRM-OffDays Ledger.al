table 50054 "HRM-OffDays Ledger"
{
    DrillDownPageID = "HRM-OffDays Ledger View";
    LookupPageID = "HRM-OffDays Ledger View";

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(8; "Entry No."; Integer)
        {
        }

        field(9; "Document No"; Code[30])
        {
        }
        field(10; "Off-Day"; Code[20])
        {
            TableRelation = "HRM-Leave Types".Code;
        }

        field(11; "Transaction Date"; Date)
        {
        }
        field(12; "Transaction Type"; Option)
        {
            OptionCaption = ' ,Allocation,Application,Positive Adjustment,Negative Adjustment';
            OptionMembers = " ",Allocation,Application,"Positive Adjustment","Negative Adjustment";
        }
        field(13; "No. of Days"; Decimal)
        {

        }
        field(2; "Remaining days"; Decimal)
        {
            TableRelation = "HRM-Leave Requisition"."Leave Balance";

        }
        field(14; "Transaction Description"; Text[250])
        {
        }
        field(15; "Off-Days Period"; Integer)
        {
        }
        field(16; "Entry Type"; Option)
        {
            OptionCaption = 'Application,Allocation,Positive,Negative,Reimbursement';
            OptionMembers = Application,Allocation,Positive,Negative,Reimbursement;
        }
        field(17; "Created By"; Code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(18; "Reversed By"; Code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Document No")
        {
        }
        key(Key2; "Employee No", "Off-Day")
        {
            SumIndexFields = "No. of Days";
        }

    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
    end;

    procedure ReverseLeaveEntry()
    begin
        if Rec."Entry Type" = Rec."Entry Type"::Allocation then Error('The selected entry has already been involved in a reversal.\Please select another entry to reverse...');
        if Confirm('This will reverse the selected Ledger entry, continue?', false) = false then exit;
        oofDayLedger.Reset;
        if oofDayLedger.Find('+') then
            lastNo := oofDayLedger."Entry No." + 10
        else
            lastNo := 10;

        Rec."Entry Type" := Rec."Entry Type"::Allocation;
        Rec."Reversed By" := UserId;
        Rec.Modify;

        oofDayLedger.Init;
        oofDayLedger."Entry No." := lastNo;
        oofDayLedger."Employee No" := Rec."Employee No";
        oofDayLedger."Document No" := Rec."Document No";
        emp.Reset();
        emp.SetRange("No.", rec."Employee No");
        if emp.find('-') then
            repeat
            begin
                //  emp."Reimbursed OffDays" := ((emp."Reimbursed Leave Days") * (-1));
                // emp."Allocated Leave Days" := ((emp."Allocated Leave Days") * (-1));
            end;
            until emp.Next() = 0;
        oofDayLedger."Transaction Date" := Rec."Transaction Date";
        oofDayLedger."Transaction Type" := Rec."Transaction Type";
        oofDayLedger."No. of Days" := ((Rec."No. of Days") * (-1));
        oofDayLedger."Transaction Description" := Rec."Transaction Description";
        oofDayLedger."Entry Type" := oofDayLedger."Entry Type"::Allocation;
        oofDayLedger."Reversed By" := UserId;
        oofDayLedger.Insert;
    end;

    var
        oofDayLedger: Record "HRM-OffDays Ledger";
        lastNo: Integer;
        emp: Record "HRM-Employee C";
}


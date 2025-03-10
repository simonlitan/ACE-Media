table 50051 "PendingOffs DoubleShifts Ldger"
{
    DrillDownPageID = "PendingOffs DoubleShift View";
    LookupPageID = "PendingOffs DoubleShift View";

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
        field(10; "Request Type"; Option)
        {
            OptionMembers = ,"Pending Off","Double Shift","Leave of Absence";
            OptionCaption = ' ,Pending Off, Double Shift, Leave of Absence';
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
        field(14; "Transaction Description"; Text[250])
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
        key(Key2; "Employee No", "Request Type")
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
        leaveLedger.Reset;
        if leaveLedger.Find('+') then
            lastNo := leaveLedger."Entry No." + 10
        else
            lastNo := 10;

        Rec."Entry Type" := Rec."Entry Type"::Allocation;
        Rec."Reversed By" := UserId;
        Rec.Modify;

        leaveLedger.Init;
        leaveLedger."Entry No." := lastNo;
        leaveLedger."Employee No" := Rec."Employee No";
        leaveLedger."Document No" := Rec."Document No";
        emp.Reset();
        emp.SetRange("No.", rec."Employee No");
        if emp.find('-') then
            repeat
            begin
                emp."Reimbursed Leave Days" := ((emp."Reimbursed Leave Days") * (-1));
                emp."Allocated Leave Days" := ((emp."Allocated Leave Days") * (-1));
            end;
            until emp.Next() = 0;
        //leaveLedger."Request Type" := Rec."Request Type";
        leaveLedger."Transaction Date" := Rec."Transaction Date";
        leaveLedger."Transaction Type" := Rec."Transaction Type";
        leaveLedger."No. of Days" := ((Rec."No. of Days") * (-1));
        leaveLedger."Transaction Description" := Rec."Transaction Description";
        leaveLedger."Entry Type" := leaveLedger."Entry Type"::Allocation;
        leaveLedger."Reversed By" := UserId;
        leaveLedger.Insert;
    end;

    var
        leaveLedger: Record "HRM-Leave Ledger";
        lastNo: Integer;
        emp: Record "HRM-Employee C";
}


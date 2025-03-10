table 52179238 "HRM-Leave Periods"
{
    Caption = 'HRM-Leave Periods';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Year; Code[50])
        {
            Caption = 'Year';
            DataClassification = ToBeClassified;
        }
        field(2; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
        field(3; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }
        field(4; Closed; Boolean)
        {
            editable = false;
            Caption = 'Closed';
            DataClassification = ToBeClassified;
        }
        field(5; "Created By"; Code[50])
        {
            editable = false;
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(6; "Date Created"; date)
        {
            editable = false;
        }
        field(7; "Closed By"; code[50])
        {
            editable = false;
        }
        field(8; "Date Closed"; date)
        {
            editable = false;
        }
        field(9; Current; Boolean)
        {

        }

    }
    keys
    {
        key(PK; Year)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Date Created" := Today;
        Leaveperiod.Reset();
        Leaveperiod.SetRange(Current, true);
        Leaveperiod.SetRange(Closed, false);
        if Leaveperiod.Count > 1 then Error('You cannot open 2 leave periods!');
    end;

    procedure CloseLeavePeriod()
    begin
        Leaveperiod.Reset();
        Leaveperiod.SetRange(Current, true);
        Leaveperiod.SetRange(Leaveperiod.Closed, false);
        if Leaveperiod.Find('-') then begin
            Empc.Reset();
            Empc.SetRange(Status, Empc.Status::Active);
            Empc.SetRange("Days Generated", true);
            if Empc.Find('-') then begin
                repeat
                    Empc."Days Generated" := false;
                    Empc.Modify();
                until Empc.Next() = 0;
            end;
            Leaveperiod.Current := false;
            Leaveperiod.Closed := true;
            Leaveperiod."Closed By" := UserId;
            Leaveperiod."Date Closed" := Today;
            Leaveperiod.Modify();
            Message('Process Complete');

        end;
    end;

    var
        Leavetypes: Record "HRM-Leave Types";
        Leaveperiod: Record "HRM-Leave Periods";
        Empc: Record "HRM-Employee C";
}

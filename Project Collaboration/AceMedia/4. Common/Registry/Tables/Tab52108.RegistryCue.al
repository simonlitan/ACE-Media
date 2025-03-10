table 52178956 "Registry Cue"
{
    Caption = 'Registry Cue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "Inbound Mails"; Integer)
        {
            Caption = 'Inbound Mails';
            FieldClass = FlowField;
            CalcFormula = count("Departmental File");

        }
        field(3; "Outbound Mails"; Integer)
        {
            Caption = 'Outbound Mails';
            FieldClass = FlowField;
            CalcFormula = count("Outbound Mail");
        }
        field(4; "Mails Brought Up"; Integer)
        {
            Caption = 'Mails Brought Up';
            FieldClass = FlowField;
            CalcFormula = count("Departmental File" where(Status = filter(BroughtUp)));
        }
        field(5; "Personal Mails"; Integer)
        {
            Caption = 'Personal Mails';
            FieldClass = FlowField;
            CalcFormula = count("Departmental File" where(Type = filter(Personal)));
        }
        field(6; "Official Mails"; Integer)
        {
            Caption = 'Departmental Mails';
            CalcFormula = count("Departmental File" where(Type = filter(Official)));
            FieldClass = FlowField;
        }
        field(7; "Collected Mails"; Integer)
        {
            Caption = 'Mails Brought Up';
            FieldClass = FlowField;
            CalcFormula = count("Departmental File" where(Status = filter(Collected)));
        }
        field(8; "My Assined Mail"; Integer)
        {
            Caption = 'My Assigned Mails';
            FieldClass = FlowField;
            CalcFormula = Count("Departmental File" where(Status = filter(Assigned)));
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}

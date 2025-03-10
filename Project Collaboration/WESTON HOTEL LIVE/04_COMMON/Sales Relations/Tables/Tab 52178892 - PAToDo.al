table 52178892 "PA ToDo"
{
    Caption = 'Sales WorkPlan';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "ToDo ID"; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "ToDO Name"; Text[200])
        {
            Caption = 'Objectives';
            DataClassification = ToBeClassified;
        }
        field(3; Schedule; DateTime)
        {
            Caption = 'Schedule';
            DataClassification = ToBeClassified;
        }
        field(4; Deadline; DateTime)
        {
            Caption = 'Deadline';
            DataClassification = ToBeClassified;

        }
        field(5; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Pending,Closed;
        }
        field(6; "Created Time"; Datetime)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "ToDo ID")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        setup: Record "Loyalty Setups";
        Series: Codeunit NoSeriesManagement;
    begin
        if "ToDo ID" = '' then begin
            setup.Get();
            "ToDo ID" := Series.GetNextNo(setup."Loyalty Customers", 0D, true)
        end;

    end;
}


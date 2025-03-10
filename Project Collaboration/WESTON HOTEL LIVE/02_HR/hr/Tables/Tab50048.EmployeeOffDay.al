table 50057 "Employee Off Day"
{
    Caption = 'Employee Off Day';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C";
            trigger OnValidate()
            var
                Emp: Record "HRM-Employee C";
            begin
                if Emp.Get("No.") then Name := emp.FullName()
            end;
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(3; "Off Day"; Enum "Days Of the Week")
        {
            Caption = 'Off Day';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}

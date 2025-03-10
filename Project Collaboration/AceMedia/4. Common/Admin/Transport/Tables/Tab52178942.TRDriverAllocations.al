table 52178942 "TR Driver Allocations"
{
    Caption = 'TR Driver Allocations';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Registration No"; Code[50])
        {
            Caption = 'Registration No';
        }
        field(2; "Entry No"; Integer)
        {
            Caption = 'Entry No';
        }
        field(3; "Driver No"; Code[50])
        {
            Caption = 'Driver No';
            TableRelation = "TR Drivers"."Driver No" where(Active = filter(true));
        }
        field(4; "Driver Name"; Text[250])
        {
            Caption = 'Driver Name';
            FieldClass = FlowField;
            CalcFormula = lookup("TR Drivers"."Drivers Name" where("Driver No" = field("Driver No")));
            Editable = false;
        }
        field(5; From; Date)
        {
            Caption = 'From';
        }
        field(6; "To"; Date)
        {
            Caption = 'To';
        }
        field(7; Current; Boolean)
        {
            Caption = 'Current';
        }
    }
    keys
    {
        key(PK; "Registration No", "Entry No")
        {
            Clustered = true;
        }
    }

}

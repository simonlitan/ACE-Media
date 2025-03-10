table 52178932 "TR Accidents"
{
    Caption = 'TR Accidents';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Ticket No"; Code[50])
        {
            Caption = 'Ticket No';
        }
        field(2; "Date of Incident"; Date)
        {
            Caption = 'Date of Incident';
        }
        field(3; Location; Code[100])
        {
            Caption = 'Location';
        }
        field(4; Casualties; Text[250])
        {
            Caption = 'Casualties';
        }
        field(5; "General Description"; Text[2048])
        {
            Caption = 'General Description';
        }
        field(6; "Action Taken"; Text[2048])
        {
            Caption = 'Action Taken';
        }
        field(7; "Driver No"; Code[50])
        {
            Caption = 'Driver No';
            TableRelation = "TR Drivers"."Driver No" where(Active = const(true));
        }
        field(8; "Driver Name"; Text[250])

        {
            Caption = 'Driver Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("TR Drivers"."Drivers Name" where("Driver No" = field("Driver No")));
        }
        field(9; "Entry No"; Integer)
        {

            Caption = 'Entry No';
        }
        field(10; "Registration No"; Code[100])
        {
            TableRelation = "TR Vehicles"."Registration No";


        }
    }
    keys
    {
        key(PK; "Ticket No", "Registration No", "Entry No")
        {
            Clustered = true;
        }
    }
}

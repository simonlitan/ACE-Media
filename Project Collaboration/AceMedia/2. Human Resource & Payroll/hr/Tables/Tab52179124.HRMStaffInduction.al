table 52179124 "HRM-Staff  Induction"
{

    fields
    {
        field(1; "Induction Code"; Code[30])
        {
        }
        field(2; "Employee Code"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                if Hr.Get("Employee Code") then
                    "Employee name" := Hr."First Name" + ' ' + Hr."Middle Name" + ' ' + Hr."Last Name";
                Email := Hr."Company E-Mail";
            end;
        }
        field(3; "Employee name"; Text[60])
        {
        }
        field(4; From; Date)
        {
        }
        field(5; Todate; Date)
        {
        }
        field(6; Duration; Option)
        {
            OptionCaption = ' ,Days,Week,Months,Years';
            OptionMembers = " ",Days,Week,Months,Years;
        }
        field(7; "Days Attended"; Decimal)
        {
        }
        field(8; Depatment; Code[10])
        {
        }
        field(9; "Induction Status"; Option)
        {
            OptionMembers = "Not done",Done;
        }
        field(10; "Officer Incharge"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(11; Email; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Induction Code", "Employee Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Hr: Record "HRM-Employee C";
}


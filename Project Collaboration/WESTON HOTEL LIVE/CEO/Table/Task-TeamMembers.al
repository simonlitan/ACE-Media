table 52178910 "Task-Team Members"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Team Code"; Code[100])
        {
        }
        field(3; "PF Number"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            var
                objEmp: Record "HRM-Employee C";
            begin
                //Get the employee name
                "Full Name" := '';
                objEmp.Reset;
                objEmp.SetRange(objEmp."No.", Rec."PF Number");
                if objEmp.Find('-') then
                    "Full Name" := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
            end;
        }
        field(4; "Full Name"; Code[150])
        {
        }
        field(5; "Responsibility"; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "No.", "Team Code")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
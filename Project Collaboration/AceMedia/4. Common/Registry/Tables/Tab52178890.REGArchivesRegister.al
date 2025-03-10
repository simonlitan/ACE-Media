table 52178890 "REG-Archives Register"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;

        }
        field(10; "Version"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Period"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "File Index"; Text[30])
        {
            TableRelation = "File Indexes"."File Name";
            DataClassification = ToBeClassified;
        }
        field(3; "Total Folios"; Integer)
        {
            CalcFormula = Count("Departmental File" WHERE(Department = field("File Index")));
            FieldClass = FlowField;
        }
        field(19; "Total Docs"; Integer)
        {
            CalcFormula = Count("Departmental File" WHERE(Department = field("File Index")));
            FieldClass = FlowField;
        }
        field(4; "Closed Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Closed By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Closed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Archived; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Archived By"; Code[50])
        {
            //TableRelation = Users."User Name";
            TableRelation = "HRM-Employee C"."No.";
            trigger OnValidate()
            var
                HRMEmployeeD: Record "HRM-Employee C";
            begin
                HRMEmployeeD.Reset;
                HRMEmployeeD.SetRange("No.", "Archived By");
                IF HRMEmployeeD.Find('-') then
                    "Staff Name" := HRMEmployeeD."First Name" + ' ' + HRMEmployeeD."Middle Name" + ' ' + HRMEmployeeD."Last Name";
                //DataClassification = ToBeClassified;
            end;
        }
        field(22; "Staff Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Archived Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Marked for Destruction"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Marked Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Marked By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Destroyed Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Destroyed By"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Comments"; Text[1020])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Ref No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(20; Region; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COST CENTER'));
            trigger OnValidate()
            var
                Dimval: Record "Dimension Value";
            begin
                Dimval.Reset();
                Dimval.SetRange(Code, "Region");
                if Dimval.Find('-') then
                    "Region Name" := Dimval.Name;
            end;
        }

        field(21; "Region Name"; Text[50])
        {
            // CalcFormula = Lookup("Dimension Value".Name WHERE(Code = Const("COST CENTER")));
            // FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No.", Region)
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
table 52179150 "HRM-Employee Qualifications"
{
    Caption = 'Employee Qualification';
    DataCaptionFields = "Employee No.";
    DrillDownPageID = "Qualified Employees";
    LookupPageID = "Employee Qualifications";

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            NotBlank = true;
            TableRelation = "HRM-Employee C"."No.";
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(3; "From Date"; Date)
        {
            Caption = 'From Date';
        }
        field(4; "To Date"; Date)
        {
            Caption = 'To Date';
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Internal,External,Previous Position';
            OptionMembers = " ",Internal,External,"Previous Position";
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; "Institution/Company"; Text[30])
        {
            Caption = 'Institution/Company';
        }
        field(8; Cost; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost';
        }
        field(9; "Course Grade"; Text[30])
        {
            Caption = 'Course Grade';
        }
        field(10; "Employee Status"; Option)
        {
            Caption = 'Employee Status';
            Editable = false;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
        field(11; Comment; Boolean)
        {
            CalcFormula = Exist("Human Resource Comment Line" WHERE("Table Name" = CONST("Employee Qualification"),
                                                                     "No." = FIELD("Employee No."),
                                                                     "Table Line No." = FIELD("Line No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(13; "Qualification Type"; Code[20])
        {
            NotBlank = false;
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = FILTER("Qualification Type"));
        }
        field(14; "Qualification Code"; Code[30])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = "HRM-Qualifications".Code WHERE("Qualification Type" = FIELD("Qualification Type"));

            trigger OnValidate()
            begin
                /*.SETFILTER(Requirments."Qualification Type","Qualification Type");
                Requirments.SETFILTER(Requirments.Code,"Qualification Code");
                IF Requirments.FIND('-') THEN
                 Qualification := Requirments.Description; */


                if HRQualifications.Get("Qualification Type", "Qualification Code") then
                    "Qualification Description" := HRQualifications.Description;

            end;
        }
        field(15; "Qualification Description"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Comment then
            Error(Text000);
    end;

    trigger OnInsert()
    begin
        Employee.Get("Employee No.");
        "Employee Status" := Employee.Status;
    end;

    var
        Text000: Label 'You cannot delete employee qualification information if there are comments associated with it.';
        HRLookupValues: Record "HRM-Lookup Values";
        Employee: Record "HRM-Employee C";
        HRQualifications: Record "HRM-Qualifications";
}


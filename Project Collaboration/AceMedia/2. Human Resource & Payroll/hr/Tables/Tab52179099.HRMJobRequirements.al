table 52179099 "HRM-Job Requirements"

{


    fields
    {
        field(1; "Job Id"; Code[50])
        {
            NotBlank = true;
            TableRelation = "HRM-Jobs"."Job ID";
        }
        field(2; "Qualification Type"; Code[20])
        {
            NotBlank = false;
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = FILTER("Qualification Type"));
        }
        field(3; "Qualification Code"; Code[30])
        {
            Editable = true;
            NotBlank = true;
            /*  TableRelation = "HRM-Qualifications".Code WHERE("Qualification Type" = FIELD("Qualification Type"));

             trigger OnValidate()
             begin
                 /*.SETFILTER(Requirments."Qualification Type","Qualification Type");
                 Requirments.SETFILTER(Requirments.Code,"Qualification Code");
                 IF Requirments.FIND('-') THEN
                  Qualification := Requirments.Description; 


                 if HRQualifications.Get("Qualification Type", "Qualification Code") then
                     "Qualification Description" := HRQualifications.Description;

             end; */
        }
        field(4; Priority; Option)
        {
            OptionMembers = " ",High,Medium,Low;
        }
        field(5; "Score ID"; decimal)
        {
        }
        field(6; "Need code"; Code[10])
        {
        }
        field(7; "Stage Code"; Code[10])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST(Scores));
        }
        field(8; Mandatory; Boolean)
        {
        }
        field(9; "Desired Score"; Decimal)
        {
        }
        field(10; "Total (Stage)Desired Score"; Decimal)
        {
        }
        field(11; "Qualification Description"; Text[500])
        {
            Caption = 'Requirement Description';
        }
        field(12; "Grade Attained"; Code[20])
        {
            Caption = 'Desired Grade';
        }
        field(13; "Qualification Category"; Code[30])
        {
            /*  TableRelation = "HRM-Lookup Values".Code WHERE(Type = FILTER("Qualification category"));

             trigger OnValidate()
             begin
                 if HRQualifications.Get("Qualification Type", "Qualification Code") then
                     "Qualification Description" := HRQualifications.Description;
             end; */
        }
        field(14; "Scored Grade"; Code[50])
        {

        }
        field(15; "Desired Grade"; Code[50])
        {
        }

    }

    keys
    {
        key(Key1; "Job Id", "Qualification Category")
        {

        }
    }

    fieldgroups
    {
    }

    var
        HRQualifications: Record "HRM-Qualifications";
}


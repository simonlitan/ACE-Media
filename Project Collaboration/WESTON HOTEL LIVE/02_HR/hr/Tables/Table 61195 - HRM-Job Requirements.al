table 61195 "HRM-Job Requirements"

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
        field(6; Priority; Option)
        {
            OptionMembers = " ",High,Medium,Low;
        }
        field(8; "Score ID"; Decimal)
        {
        }
        field(9; "Need code"; Code[10])
        {
        }
        field(10; "Stage Code"; Code[10])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST(Scores));
        }
        field(11; Mandatory; Boolean)
        {
        }
        field(12; "Desired Score"; Decimal)
        {
        }
        field(13; "Total (Stage)Desired Score"; Decimal)
        {
        }
        field(14; "Qualification Description"; Text[500])
        {
        }
        field(15; "Grade Attained"; Code[20])
        {
        }
        field(16; "Qualification Category"; Code[30])
        {
            /*  TableRelation = "HRM-Lookup Values".Code WHERE(Type = FILTER("Qualification category"));

             trigger OnValidate()
             begin
                 if HRQualifications.Get("Qualification Type", "Qualification Code") then
                     "Qualification Description" := HRQualifications.Description;
             end; */
        }
    }

    keys
    {
        key(Key1; "Job Id", "Qualification Category")
        {
            SumIndexFields = "Score ID";
        }
    }

    fieldgroups
    {
    }

    var
        HRQualifications: Record "HRM-Qualifications";
}


table 52179106 "HRM-ShortList Requirements"
{

    fields
    {
        field(1; "Job Id"; Code[50])
        {
            NotBlank = true;
            TableRelation = "HRM-Jobs"."Job ID";
        }
        field(2; "ShortList Type"; Code[20])
        {
            NotBlank = false;
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = FILTER("ShortListing Criteria"));
        }
        field(3; "ShortList Code"; Code[30])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = "HRM-ShortListQualifications".Code WHERE("ShortList Type" = FIELD("ShortList Type"));

            trigger OnValidate()
            begin
                /*.SETFILTER(Requirments."Qualification Type","Qualification Type");
                Requirments.SETFILTER(Requirments.Code,"Qualification Code");
                IF Requirments.FIND('-') THEN
                 Qualification := Requirments.Description; */


                if HRShortQualifications.Get("ShortList Type", "ShortList Code") then
                    "Qualification Description" := HRShortQualifications.Description;

            end;
        }
        field(4; Priority; Option)
        {
            OptionMembers = " ",High,Medium,Low;
        }
        field(5; "Score ID"; Decimal)
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
        field(11; "Qualification Description"; Text[100])
        {
        }
        field(12; "Grade Attained"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Job Id", "ShortList Type", "ShortList Code")
        {
            SumIndexFields = "Score ID";
        }
    }

    fieldgroups
    {
    }

    var
        HRShortQualifications: Record "HRM-ShortListQualifications";
}


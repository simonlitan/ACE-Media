/// <summary>
/// Table Pay Change Advice (ID 50000).
/// </summary>
table 50000 "Pay Change Advice"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Authority Number"; code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(2; "No. Series"; Code[20])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(3; "P/F No"; code[20])
        {
            TableRelation = "HRM-Employee C"."No." where(Status = filter(active));
            trigger OnValidate()
            begin
                HREMP.Reset();
                HREMP.SetRange("No.", "P/F No");
                if HREMP.FindFirst() then
                    Surname := HREMP."Last Name";
                "Other names" := HREMP."First Name" + ' ' + HREMP."Middle Name";
                Department := HREMP."Department Name";
                "Present Grade" := HREMP."Grade Level";


            end;
        }
        field(4; Surname; text[30])
        {

        }
        field(5; "Other names"; text[70])
        {

        }
        field(6; Department; text[70])
        {

        }
        field(7; "Present Grade"; code[20])
        {
            TableRelation = "HRM-Salary Grades"."Salary Grade";
        }
        field(8; "New Grade"; code[30])
        {
            TableRelation = "HRM-Salary Grades"."Salary Grade";
        }
        field(9; "Terms of new grade"; Text[250])
        {

        }
        field(10; "Incremental date"; date)
        {

        }
        field(11; "Effective Date for action"; date)
        {

        }
    }

    keys
    {
        key(Key1; "Authority Number")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        HumanResSetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREMP: Record "HRM-Employee C";

    trigger OnInsert()
    begin
        if "Authority Number" = '' then begin
            HumanResSetup.Get();
            HumanResSetup.TestField("Authority Number");
            NoSeriesMgt.InitSeries(HumanResSetup."Authority Number", xRec."No. Series", 0D, "Authority Number", "No. Series");
        end;

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
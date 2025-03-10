table 50032 "Performance Criteria"
{
    DrillDownPageID = "Performance Criteria Cascade L";
    LookupPageID = "Performance Criteria Cascade L";

    fields
    {
        field(1; "Performance Criteria Code"; Code[40])
        {
            Editable = true;
        }
        field(2; "Performance Criter Description"; Text[100])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(5001; Directorates; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Diredctorates';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                //MODIFY;
            end;
        }
        field(5002; Departments; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Departments';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
                //MODIFY;
            end;
        }
        field(50008; "No. Series"; Code[10])
        {
        }
        field(50009; "Contract Period"; Code[20])
        {
        }
        field(50010; "User ID"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Performance Criteria Code", "Contract Period", Departments)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Performance Criteria Code" = '' THEN BEGIN
            Prjctstup.GET;
            Prjctstup.TESTFIELD(Prjctstup."Performance Criteria Code");
            NoSeriesMgt.InitSeries(Prjctstup."Performance Criteria Code", xRec."No. Series", 0D, "Performance Criteria Code", "No. Series");

        END;

        IF "Contract Period" = '' THEN BEGIN
            Prjctstup.GET;
            Prjctstup.TESTFIELD(Prjctstup."Contract Period");
            NoSeriesMgt.InitSeries(Prjctstup."Contract Period", xRec."No. Series", 0D, "Contract Period", "No. Series");

            "User ID" := USERID;
        END;
    end;

    var
        Prjctstup: Record "Project Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
}


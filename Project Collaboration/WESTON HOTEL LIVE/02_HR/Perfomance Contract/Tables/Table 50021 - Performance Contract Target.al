table 50021 "Performance Contract Target"
{
    DrillDownPageID = "Performance Criteria list";
    LookupPageID = "Performance Criteria list";

    fields
    {
        field(1; "Performance Code"; Code[40])
        {
        }
        field(2; "Performance Description"; Text[100])
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
        field(5003; "No:"; Code[20])
        {
        }
        field(50004; "No series"; Code[30])
        {
        }
        field(50005; Status; Option)
        {
            Editable = true;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(50006; "Quarter Starting"; Date)
        {
        }
        field(50007; "Quarter Ending"; Date)
        {
        }
        field(50008; "No. Series"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Performance Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Performance Code" = '' THEN BEGIN
            Prjctstup.GET;
            Prjctstup.TESTFIELD(Prjctstup."Income/Expenditure");
            NoSeriesMgt.InitSeries(Prjctstup."Income/Expenditure", xRec."No. Series", 0D, "Performance Code", "No. Series");
        END;
    end;

    var
        Prjctstup: Record "Project Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
}


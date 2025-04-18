table 50010 "Performance Criteria Cascade 1"
{
    DrillDownPageID = "Performance Criterial Line Cas";
    LookupPageID = "Performance Criterial Line Cas";

    fields
    {
        field(1; "Performance Criteria Code"; Code[40])
        {
            Editable = false;
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
            TableRelation = "Performance Criteria"."Contract Period";

            trigger OnValidate()
            begin
                //CLEAR(lastno);
                IF NOT CONFIRM('If you change the No. the current lines will be deleted. Do you want to continue?', FALSE) THEN
                    ERROR('You have selected to abort the process');

                PerfCriteriaLineCasc.RESET;
                PerfCriteriaLineCasc.SETRANGE(PerfCriteriaLineCasc."Activity Code", "Performance Criteria Code");
                PerfCriteriaLineCasc.DELETEALL;

                PerfCriteriaLine.RESET;
                PerfCriteriaLine.SETRANGE(PerfCriteriaLine."Contract Period", "Contract Period");
                IF PerfCriteriaLine.FIND('-') THEN BEGIN
                    REPEAT
                        PerfCriteriaLineCasc.INIT;
                        PerfCriteriaLineCasc."Activity Code" := "Performance Criteria Code";
                        PerfCriteriaLineCasc."Contract Period" := "Contract Period";

                        PerfCriteriaLineCasc."Line No" := PerfCriteriaLine."Line No";
                        PerfCriteriaLineCasc.No := PerfCriteriaLine."Activity Code";
                        PerfCriteriaLineCasc."Contract Period" := PerfCriteriaLine."Contract Period";
                        PerfCriteriaLineCasc.Comment := PerfCriteriaLine.Comment;
                        PerfCriteriaLineCasc."Target (Contract Period)" := PerfCriteriaLine."Target (Contract Period)";
                        PerfCriteriaLineCasc."Performance Criteria Category" := PerfCriteriaLine."Performance Criteria Category";
                        PerfCriteriaLineCasc."Performance Criteria Step Code" := PerfCriteriaLine."Performance Criteria Step Code";
                        PerfCriteriaLineCasc."Performance Criteria Descripti" := PerfCriteriaLine."Performance Criteria Descripti";
                        PerfCriteriaLineCasc."Performance Step Description" := PerfCriteriaLine."Performance Step Description";
                        PerfCriteriaLineCasc.Directorates := PerfCriteriaLine.Directorates;
                        PerfCriteriaLineCasc.Departments := PerfCriteriaLine.Departments;
                        PerfCriteriaLineCasc."Status Last Contract Period" := PerfCriteriaLine."Status Last Contract Period";
                        PerfCriteriaLineCasc.units := PerfCriteriaLine.units;
                        PerfCriteriaLineCasc.Weights := PerfCriteriaLine.Weights;
                        PerfCriteriaLineCasc.INSERT;
                    UNTIL PerfCriteriaLine.NEXT = 0;
                END;
            end;
        }
        field(50010; "User ID"; Code[50])
        {
        }
        field(50011; "Assigned User IDcod"; Code[50])
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
            Prjctstup.TESTFIELD(Prjctstup."Performance Code Cascade");
            NoSeriesMgt.InitSeries(Prjctstup."Performance Code Cascade", xRec."No. Series", 0D, "Performance Criteria Code", "No. Series");
        END;

        "User ID" := USERID;
    end;

    var
        Prjctstup: Record "Project Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
        PerfCriteriaLineCasc: Record "Performan Criteria Line Casc 1";
        PerfCriteriaLine: Record "Performance Criteria Line";
        LineNo: Decimal;
        lastno: Integer;
        PerfCriteriaLineCasc1: Record "Performan Criteria Line Casc 1";
}


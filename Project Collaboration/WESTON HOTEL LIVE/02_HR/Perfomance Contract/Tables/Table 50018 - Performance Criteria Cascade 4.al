table 50018 "Performance Criteria Cascade 4"
{
    DrillDownPageID = "Criterial Line Cascade 4";
    LookupPageID = "Criterial Line Cascade 4";

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
            TableRelation = "Performance Criteria Cascade 3"."Performance Criteria Code";

            trigger OnValidate()
            begin
                IF NOT CONFIRM('If you change the No. the current lines will be deleted. Do you want to continue?', FALSE) THEN
                    ERROR('You have selected to abort the process');

                PerfCriteriaLineCasc.RESET;
                PerfCriteriaLineCasc.SETRANGE(PerfCriteriaLineCasc."Activity Code", "Performance Criteria Code");
                PerfCriteriaLineCasc.DELETEALL;

                PerfCriteriaLine.RESET;
                PerfCriteriaLine.SETRANGE(PerfCriteriaLine."Activity Code", "Contract Period");
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
        field(50012; "PCC4 Status"; Option)
        {
            OptionMembers = Open,"Pending Approval",Cancelled,Approved;
        }
    }

    keys
    {
        key(Key1; "Performance Criteria Code", Directorates)
        {
        }
        key(Key2; Directorates, "Contract Period", "Performance Criter Description")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Directorates; Directorates)
        {
        }
        fieldgroup(ContratPeriod; "Contract Period")
        {
        }
        fieldgroup(PerformanceCriterDescription; "Performance Criter Description")
        {
        }
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
        PerfCriteriaLineCasc: Record "Perfmnc Criteria Line Cascade4";
        PerfCriteriaLine: Record "Perfmnc Criteria Line Cascade3";
        LineNo: Decimal;
        lastno: Integer;
        PerfCriteriaLineCasc1: Record "Perfmnc Criteria Line Cascade4";
}


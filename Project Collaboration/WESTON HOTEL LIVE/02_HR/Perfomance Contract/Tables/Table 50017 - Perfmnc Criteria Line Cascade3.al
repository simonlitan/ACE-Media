table 50017 "Perfmnc Criteria Line Cascade3"
{

    fields
    {
        field(1; "Activity Code"; Code[40])
        {
            Caption = 'Activity Code';
        }
        field(2; "Targets Description"; Text[250])
        {
        }
        field(13; "Workplan Code"; Code[20])
        {
        }
        field(18; "General Note"; Text[250])
        {
        }
        field(19; "Performance Criteria Category"; Code[20])
        {
            TableRelation = "Performance Criteria Code".Code;

            trigger OnValidate()
            begin
                Performance.RESET;
                Performance.SETRANGE(Performance.Code, "Performance Criteria Category");
                IF Performance.FIND('-') THEN BEGIN
                    "Performance Criteria Descripti" := Performance.Description;
                END
            end;
        }
        field(20; "Performance Criteria Descripti"; Text[250])
        {
        }
        field(21; "Performance Step Description"; Text[250])
        {
        }
        field(25; Comment; Text[100])
        {
            Editable = true;
        }
        field(50001; Directorates; Code[20])
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
        field(50002; Departments; Code[20])
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
        field(50003; Quantity; Decimal)
        {
        }
        field(50004; units; Code[30])
        {
            TableRelation = Units.Code;
        }
        field(50005; "Performance Criteria Step Code"; Code[50])
        {
            TableRelation = "Performance Criteria Step Code".Steps WHERE(Code = FIELD("Performance Criteria Category"));

            trigger OnValidate()
            begin
                PerformanceStep.RESET;
                PerformanceStep.SETRANGE(PerformanceStep.Steps, "Performance Criteria Step Code");
                IF PerformanceStep.FIND('-') THEN BEGIN
                    "Performance Step Description" := PerformanceStep.Description;
                END

                /*IF Type = Type::Item THEN
                BEGIN
                    Item.RESET;
                    IF Item.GET("No.") THEN
                    BEGIN
                        Description:=UPPERCASE(Item.Description);
                    END ELSE
                    BEGIN
                        Description:='';
                    END;
                END;
                
                IF Type = Type::"G/L Account" THEN
                BEGIN
                    GLAccount.RESET;
                    IF GLAccount.GET("No.") THEN
                    BEGIN
                        Description:=UPPERCASE(GLAccount.Name);
                    END ELSE
                    BEGIN
                        Description:='';
                    END;
                END;
                */

            end;
        }
        field(50006; Attributes; Option)
        {
            OptionCaption = 'HCD,COCUNUT,FIBRE,KSB.COFFEE,TEA';
            OptionMembers = HCD,COCUNUT,FIBRE,"KSB.COFFEE",TEA;
        }
        field(50008; "Global Dimension 1 Filter"; Code[20])
        {
        }
        field(50009; "Global Dimension 2 Filter"; Code[20])
        {
        }
        field(50010; Actuals; Integer)
        {
        }
        field(50011; Weights; Decimal)
        {
        }
        field(50012; "Status Last Contract Period"; Text[30])
        {
        }
        field(50013; "Target For Contract Period"; Integer)
        {
        }
        field(50014; Variance; Integer)
        {
        }
        field(50016; "Cumm To Date Actual"; Integer)
        {
        }
        field(50017; "Cumm To Date Target"; Integer)
        {
        }
        field(50018; "Cumm To Date Variance"; Integer)
        {
        }
        field(50019; "Target (Contract Period)"; Decimal)
        {
            DecimalPlaces = 3 : 3;
        }
        field(50020; "Target For Variance"; Integer)
        {
        }
        field(50021; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(50023; "Q Actual Same Period Last Year"; Decimal)
        {

            trigger OnValidate()
            begin
                "Q Cummulative to Date Variance" := Actuals - "Q Actual Same Period Last Year";
            end;
        }
        field(50024; "C Actual Same Period Last Year"; Decimal)
        {

            trigger OnValidate()
            begin
                "C Cummulative to Date Variance" := "Cumm To Date Actual" - "C Actual Same Period Last Year";
            end;
        }
        field(50025; "Cummulative Comment"; Text[250])
        {
        }
        field(50026; "Q Cummulative to Date Variance"; Decimal)
        {

            trigger OnValidate()
            begin
                "Q Cummulative to Date Variance" := Actuals - "Q Actual Same Period Last Year";
            end;
        }
        field(50027; "C Cummulative to Date Variance"; Decimal)
        {

            trigger OnValidate()
            begin
                "C Cummulative to Date Variance" := "Cumm To Date Actual" - "C Actual Same Period Last Year";
            end;
        }
        field(50028; "Contract Period"; Code[20])
        {
        }
        field(50029; No; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Activity Code", "Line No", "Performance Criteria Step Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        PerfCriteriaLineCasc1.RESET;
        PerfCriteriaLineCasc1.SETRANGE(PerfCriteriaLineCasc1."Performance Criteria Code", "Activity Code");
        IF PerfCriteriaLineCasc1.FIND('-') THEN
            Departments := PerfCriteriaLineCasc1.Departments;
        Directorates := PerfCriteriaLineCasc1.Directorates;
    end;

    var
        Performance: Record "Performance Criteria Code";
        PerformanceStep: Record "Performance Criteria Step Code";
        PerfCriteriaCas: Record "Performance Criteria Cascade 1";
        PerfCriteriaLineCasc1: Record "Performance Criteria Cascade 3";
}


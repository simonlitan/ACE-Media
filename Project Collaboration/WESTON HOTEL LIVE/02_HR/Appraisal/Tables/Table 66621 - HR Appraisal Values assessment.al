table 66621 "HR Appraisal Values assessment"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(2; "Appraisal Type"; Code[20])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST("Appraisal Type"));
        }
        field(3; "Appraisal Period"; Code[20])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST("Appraisal Period"));
        }
        field(4; "Value factors"; Text[250])
        {
        }
        field(5; "Code"; Code[20])

        // TableRelation = "Units Buffer"."Unit Code";
        {
            trigger OnValidate()
            begin
                IF hrValueassess.GET(Code) THEN BEGIN
                    "Value factors" := hrValueassess."Value factors";
                END;
            end;
        }
        field(6; "Appraisee Rating"; Decimal)
        {

            trigger OnValidate()
            begin
                // Employees.TESTFIELD("Job Scale");
                Employees.RESET;
                Employees.SETRANGE(Employees."No.", "Employee No");
                IF Employees.FIND('-') THEN BEGIN

                    //"Job Scale":=Employees."Job Scale";


                    hrvalues.RESET;
                    hrvalues.SETRANGE(hrvalues.Code, "Job Scale");
                    hrvalues.SETRANGE(hrvalues.Type, hrvalues.Type::CompetenceValues);
                    IF hrvalues.FIND('-') THEN BEGIN
                        IF "Appraisee Rating" > hrvalues."Weight Scores" THEN
                            ERROR('Your Rating Should Not Exceed %1', hrvalues."Weight Scores");
                    END;
                END;
            end;
        }
        field(7; "Appraiser Rating"; Decimal)
        {

            trigger OnValidate()
            begin
                Employees.RESET;
                Employees.SETRANGE(Employees."No.", "Employee No");
                IF Employees.FIND('-') THEN BEGIN

                    //"Job Scale":=Employees."Job Scale";


                    hrvalues.RESET;
                    hrvalues.SETRANGE(hrvalues.Code, "Job Scale");
                    hrvalues.SETRANGE(hrvalues.Type, hrvalues.Type::CompetenceValues);
                    IF hrvalues.FIND('-') THEN BEGIN
                        IF "Appraiser Rating" > hrvalues."Weight Scores" THEN
                            ERROR('Your Rating Should Not Exceed %1', hrvalues."Weight Scores");
                    END;
                END;
            end;
        }
        field(8; "Agreed Rating"; Integer)
        {

            trigger OnValidate()
            begin
                Employees.RESET;
                Employees.SETRANGE(Employees."No.", "Employee No");
                IF Employees.FIND('-') THEN BEGIN

                    //"Job Scale":=Employees."Job Scale";


                    hrvalues.RESET;
                    hrvalues.SETRANGE(hrvalues.Code, "Job Scale");
                    hrvalues.SETRANGE(hrvalues.Type, hrvalues.Type::CompetenceValues);
                    IF hrvalues.FIND('-') THEN BEGIN
                        IF "Agreed Rating" > hrvalues."Weight Scores" THEN
                            ERROR('Your Rating Should Not Exceed %1', hrvalues."Weight Scores");
                    END;
                END;
            end;
        }
        field(9; Reason; Text[250])
        {
        }
        field(10; "Overall Rating"; Decimal)
        {
            CalcFormula = Sum("HR Appraisal Values assessment"."Agreed Rating New" WHERE("Employee No" = FIELD("Employee No"),
                                                                                          "Appraisal Period" = FIELD("Appraisal Period"),
                                                                                          "Appraisal Type" = FIELD("Appraisal Type")));
            FieldClass = FlowField;
            InitValue = 0;
        }
        field(11; "Total Targets"; Integer)
        {
            CalcFormula = Count("HR Appraisal Values assessment" WHERE("Employee No" = FIELD("Employee No"),
                                                                        "Appraisal Period" = FIELD("Appraisal Period"),
                                                                        "Appraisal Type" = FIELD("Appraisal Type")));
            FieldClass = FlowField;
        }
        field(12; "Agreed Rating New"; Decimal)
        {

            trigger OnValidate()
            begin
                Employees.RESET;
                Employees.SETRANGE(Employees."No.", "Employee No");
                IF Employees.FIND('-') THEN BEGIN

                    //"Job Scale":=Employees."Job Scale";


                    hrvalues.RESET;
                    hrvalues.SETRANGE(hrvalues.Code, "Job Scale");
                    hrvalues.SETRANGE(hrvalues.Type, hrvalues.Type::CompetenceValues);
                    IF hrvalues.FIND('-') THEN BEGIN
                        IF "Agreed Rating New" > hrvalues."Weight Scores" THEN
                            ERROR('Your Rating Should Not Exceed %1', hrvalues."Weight Scores");
                    END;
                END;
            end;
        }
        field(50000; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(50001; "Agreed RatingS"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Line No", "Employee No", "Appraisal Type", "Appraisal Period", "Code")
        {
            SumIndexFields = "Agreed Rating New";
        }
        key(Key2; "Code")
        {
        }
        key(Key3; "Employee No", "Appraisal Period", "Appraisal Type")
        {
            SumIndexFields = "Appraiser Rating", "Agreed RatingS", "Agreed Rating New";
        }
    }

    fieldgroups
    {
    }

    var
        hrValueassess: Record "HR Appraisal Values assessment";
        Employees: Record "HRM-Employee C";
        "Job Scale": Code[10];
        hrvalues: Record "HRM-Lookup Values";
}


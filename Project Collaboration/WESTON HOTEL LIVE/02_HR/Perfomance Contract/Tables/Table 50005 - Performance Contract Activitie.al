table 50005 "Performance Contract Activitie"
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
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(4; Indentation; Integer)
        {
            Caption = 'Indentation';
            MinValue = 0;
        }
        field(13; "Workplan Code"; Code[20])
        {
        }
        field(15; "Strategic Plan Code"; Code[20])
        {

            trigger OnValidate()
            begin
                /*
                strategic.RESET;
                strategic.SETRANGE(strategic."Employee Code","Strategic Plan Code");
                IF Medium.FIND('-') THEN BEGIN
                  "Strategic Plan Desc":=FORMAT(strategic."Basic Pay");
                END
                */

            end;
        }
        field(16; "Strategic Plan Desc"; Text[100])
        {
        }
        field(18; "General Note"; Text[100])
        {
        }
        field(19; "PC Code"; Code[20])
        {

            trigger OnValidate()
            begin
                /*
                PC.RESET;
                PC.SETRANGE(PC."PC Code","PC Code");
                IF PC.FIND('-') THEN BEGIN
                  "PC Name":=PC."PC Activities";
                END
                */

            end;
        }
        field(20; "PC Name"; Text[100])
        {
        }
        field(21; "Performance Description"; Text[150])
        {
        }
        field(25; Comment; Text[250])
        {
            Editable = true;
        }
        field(50003; Quantity; Decimal)
        {
        }
        field(50004; units; Code[30])
        {
            //TableRelation = "Units".Code;
        }
        field(50005; "No."; Code[50])
        {

            trigger OnValidate()
            begin
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
        field(50010; Actuals; Decimal)
        {

            trigger OnValidate()
            begin
                Variance := Actuals - Target;
                "Q Cummulative to Date Variance" := Actuals - "Actual Same Period Last Year";
            end;
        }
        field(50011; Weights; Decimal)
        {
        }
        field(50012; Status; Text[30])
        {
        }
        field(50013; "Target For Contract Period"; Decimal)
        {
        }
        field(50014; Variance; Decimal)
        {

            trigger OnValidate()
            begin
                Variance := Actuals - Target;
            end;
        }
        field(50016; "Cumm To Date Actual"; Decimal)
        {

            trigger OnValidate()
            begin
                "Cumm To Date Variance" := "Cumm To Date Actual" - "Cumm To Date Target";
                "C Cummulative to Date Variance" := "Cumm To Date Actual" - "Actual Cumm Last Year";
            end;
        }
        field(50017; "Cumm To Date Target"; Decimal)
        {

            trigger OnValidate()
            begin
                "Cumm To Date Variance" := "Cumm To Date Actual" - "Cumm To Date Target";
            end;
        }
        field(50018; "Cumm To Date Variance"; Decimal)
        {

            trigger OnValidate()
            begin
                "Cumm To Date Variance" := "Cumm To Date Actual" - "Cumm To Date Target";
            end;
        }
        field(50019; Target; Decimal)
        {

            trigger OnValidate()
            begin
                Variance := Actuals - Target;
            end;
        }
        field(50020; "Target For Variance"; Decimal)
        {
        }
        field(50021; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(50022; "Shared Target"; Boolean)
        {
        }
        field(50023; "Cummulative Target"; Decimal)
        {
        }
        field(50024; "Actual Same Period Last Year"; Decimal)
        {

            trigger OnValidate()
            begin
                "Q Cummulative to Date Variance" := Actuals - "Actual Same Period Last Year";
            end;
        }
        field(50025; "Comment Compared To Last YR"; Text[250])
        {
        }
        field(50026; "Expenditure Code"; Code[50])
        {
            TableRelation = "Income and Expenditure Code"."Income & Expenditure Code";

            trigger OnValidate()
            begin
                /*IncomeExpenditureCode.RESET;
                IncomeExpenditureCode.SETRANGE(IncomeExpenditureCode."Income & Expenditure Code","Income and Expend Step Code");
                IF IncomeExpenditureCode.FIND('-') THEN
                  "Targets Description":=IncomeExpenditureCode.Description;*/

            end;
        }
        field(50027; "Income and Expend Step Code"; Code[100])
        {
            TableRelation = "Income and Expend Step Code"."Income & Expenditure Code" WHERE(Steps = FIELD("Expenditure Code"));

            trigger OnValidate()
            begin
                IncomeExpenditureCodestep.RESET;
                IncomeExpenditureCodestep.SETRANGE(IncomeExpenditureCodestep."Income & Expenditure Code", "Income and Expend Step Code");
                IF IncomeExpenditureCodestep.FIND('-') THEN
                    "Targets Description" := IncomeExpenditureCodestep.Description;
            end;
        }
        field(50028; "Comments For This Quarter"; Text[250])
        {
        }
        field(50029; "Actual Cumm Last Year"; Decimal)
        {

            trigger OnValidate()
            begin
                "C Cummulative to Date Variance" := "Cumm To Date Actual" - "Actual Cumm Last Year";
            end;
        }
        field(50030; "Q Actual Same Period Last Year"; Decimal)
        {

            trigger OnValidate()
            begin
                "Q Cummulative to Date Variance" := "Cumm To Date Actual" - "Q Actual Same Period Last Year";
            end;
        }
        field(50031; "C Actual Same Period Last Year"; Decimal)
        {

            trigger OnValidate()
            begin
                "C Cummulative to Date Variance" := "Cumm To Date Actual" - "C Actual Same Period Last Year";
            end;
        }
        field(50032; "Cummulative Comment"; Text[250])
        {
        }
        field(50033; "Q Cummulative to Date Variance"; Decimal)
        {

            trigger OnValidate()
            begin
                "Q Cummulative to Date Variance" := Actuals - "Actual Same Period Last Year";
            end;
        }
        field(50034; "C Cummulative to Date Variance"; Decimal)
        {

            trigger OnValidate()
            begin
                "C Cummulative to Date Variance" := "Cumm To Date Actual" - "Actual Cumm Last Year";
            end;
        }
    }

    keys
    {
        key(Key1; "Activity Code", "Line No")
        {
        }
    }

    fieldgroups
    {
    }

    var
        IncomeExpenditureCodestep: Record "Income and Expenditure Code";
}


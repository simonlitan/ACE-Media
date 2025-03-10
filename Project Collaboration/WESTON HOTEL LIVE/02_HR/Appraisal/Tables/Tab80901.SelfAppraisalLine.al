table 50214 "Self Appraisal Line"
{
    Caption = 'Self Appraisal Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[50])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Type"; enum "Appraisal Parameters")
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
        }
        field(3; "Max Score"; Decimal)
        {
            Caption = 'Max Score';
            DataClassification = ToBeClassified;
        }
        field(4; "Self Score"; Decimal)
        {
            Caption = 'Self Score';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Self Score" > "Max Score" then
                    Error('%1 cannot be greater than %2', "Self Score", "Max Score");
            end;
        }
        field(5; "Supervisor Score"; Decimal)
        {
            Caption = 'Supervisor Score';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Supervisor Score" > "Max Score" then
                    Error('%1 cannot be greater than %2', "Self Score", "Supervisor Score");
            end;
        }
        field(6; "Agreed Score"; Decimal)
        {
            Caption = 'Agreed Score';
            DataClassification = ToBeClassified;
        }
        field(7; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(8; "Type Code"; Code[50])
        {
            Caption = 'Type';
        }
        field(9; "Description"; Text[150])
        {
            Caption = 'Description';
        }
        field(10; Grade; Integer)
        {
            // FieldClass = FlowField;
            // CalcFormula = lookup
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}

table 52179203 "Financial Quater"
{
    Caption = 'Financial Quater';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Quater Code"; Code[10])
        {
            Caption = 'Quater Code';
        }

        field(2; "Financial Year"; Code[20])
        {
            Caption = 'Financial Year';
            TableRelation = "G/L Budget Name";
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Description := 'Quater ' + "Quater Code" + ' Financial year ' + "Financial Year";
            end;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "End Date" := CalcDate('3M', "Start Date")
            end;
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
        }
    }
    keys
    {
        key(PK; "Quater Code", "Financial Year")
        {
            Clustered = true;
        }
    }
}

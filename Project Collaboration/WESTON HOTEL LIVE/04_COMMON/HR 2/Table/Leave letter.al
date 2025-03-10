/// <summary>
/// Table Leave Letter (ID 52178917).
/// </summary>
table 52178917 "Leave Letter"
{
    DataClassification = ToBeClassified;

    fields
    {

        field(1; date; date)
        {
            DataClassification = ToBeClassified;


        }
        field(2; salutation; Option)
        {
            OptionMembers = " ",Sir,Madam;
        }
        field(3; "Current Financial Year"; code[30])
        {
            TableRelation = "FIN-Budget Periods Setup"."Budget Name";
            trigger OnValidate()
            begin
                date := Today;
            end;
        }
        field(4; "Previous Financial year"; code[30])
        {
            TableRelation = "FIN-Budget Periods Setup"."Budget Name";
        }
        field(5; No; code[10])
        {

        }
        field(6; "Job title"; code[100])
        {
            TableRelation = "HRM-Jobs"."Job Title";
        }
        field(7; "Days Carried forward"; Decimal)
        {

        }
        field(8; "Annual Leave Days"; Decimal)
        {

        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        GenLedgerSetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin

        if No = '' then begin
            GenLedgerSetup.Get();
            GenLedgerSetup.TestField(GenLedgerSetup."Leave Letter Numbers");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Leave Letter Numbers", xRec."No. Series", 0D, No, "No. Series");
        end;
    end;

}
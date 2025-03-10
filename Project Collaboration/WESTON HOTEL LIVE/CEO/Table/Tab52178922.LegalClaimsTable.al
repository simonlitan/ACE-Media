table 52178922 "Legal-Claims Table"
{
    Caption = 'Legal-Claims Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Claim Code"; Code[30])
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }

        field(2; "Title"; Text[100])
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
        field(3; "Date Raised"; Date)
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }

        field(5; "Raised By"; Text[100])
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
        field(12; "No Series"; Code[30])
        {

        }
        field(13; "Raised Against"; Text[100])
        {

        }
        field(14; "Claim Status"; Option)
        {
            OptionMembers = ,"New Claim",Pending,Settled,Renegotiated;
        }
        field(15; "Claim Description"; Text[100])
        {
            Caption = 'Claim Description';
            DataClassification = ToBeClassified;
        }
        field(16; "Claim Number"; Code[30])
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "Claim Code")
        {
        }
    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IF "Claim Code" = '' THEN BEGIN
            NoSeriesMgt.InitSeries('CLAIM_NUMBER', xRec."No Series", 0D, "Claim Code", "No Series");
        END;

    end;
}

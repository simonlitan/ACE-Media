tableextension 52178863 "User Task Ext" extends "User Task"
{
    fields
    {
        modify("Assigned To User Name")
        {
            Caption = 'Assigned To';
            TableRelation = User."User Security ID"; //...WHERE("License Type" = CONST("Full User"));            
        }
        field(50080; "Comments"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50082; "No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50084; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "No.")
        {
            // Clustered = true;
        }

    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IF "No." = '' THEN BEGIN

            NoSeriesMgt.InitSeries('TASKNo.s', xRec."No. Series", 0D, "No.", "No. Series");
        END;
    end;
}

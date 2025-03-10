table 52178907 "Legal-MoU Table"
{
    Caption = 'Legal-MoU Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[250])
        {

        }
        field(10; "MoU No."; Code[250])
        {
        }

        field(5; "Start Date"; Date)
        {
        }
        field(2; "Collaboration Areas"; Text[100])
        {
        }
        field(3; "End Date"; Date)
        {
        }


        field(9; "User Id"; Text[100])
        {
        }



        field(15; "No Series"; Code[30])
        {
        }
        field(16; "First Party"; Text[150])
        {
        }
        field(17; "Second Party"; Text[150])
        {
        }
        field(18; "Other Party One"; Text[150])
        {
        }
        field(19; "Other Party Two"; Text[150])
        {
        }

    }

    keys
    {
        key(Key1; "No")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IF "No" = '' THEN BEGIN

            NoSeriesMgt.InitSeries('MoUMgt', xRec."No Series", 0D, "No", "No Series");
        END;
        // "User Id" := USERID;
        //"Created On" := CURRENTDATETIME;
        //Date := TODAY;
    end;

    trigger OnModify()
    begin
        // "Modified By" := USERID;
        // "Modified On" := CURRENTDATETIME;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
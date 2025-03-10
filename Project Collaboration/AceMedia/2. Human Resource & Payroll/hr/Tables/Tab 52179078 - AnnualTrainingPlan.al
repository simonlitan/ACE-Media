table 52179078 "Annual Training Plan"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;

        }
        field(2; "Training Code"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Period; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Training Plan Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Activate; Boolean)
        {
        }
        field(6; "No Series"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Application Deadline"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Created Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Training Type"; Option)
        {
            OptionMembers = Annual,"Three Year";
        }
        field(9; "Status"; Option)
        {
            //OptionMembers = first,second,third,fourth;
            //OptionCaption = 
            OptionMembers = Open,Pending,Approved,Released,Rejected;
        }
    }

    keys
    {
        key(Key1; "No.", "Training Code", Period)
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
        IF "Training Code" = '' THEN BEGIN
            /* ACAGeneralSetUp.GET;
            ACAGeneralSetUp.TESTFIELD("Further Info Nos"); //rsk */
            NoSeriesMgt.InitSeries('TRAINPLAN', xRec."No Series", 0D, "Training Code", "No Series");
        END;
        "UserID" := USERID;
        "Created Date" := CURRENTDATETIME;
        //Date := TODAY;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}

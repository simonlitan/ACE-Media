table 52178923 "Milestones Lispart Table"
{
    Caption = 'Milestones Lispart Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Code"; Code[30])
        {
        }
        field(3; Date; Date)
        {
            // DataClassification = ToBeClassified;
        }
        field(4; Time; Time)
        {
            // DataClassification = ToBeClassified;
        }
        field(5; Status; Option)
        {
            OptionMembers = Other,Adjourned,Appeal,Bail,"Non-financial bond","Surety bond",Charge,Judgment;
        }
        field(6; "Remarks"; Text[500])
        {
            //  DataClassification = ToBeClassified;
        }
        field(7; "Modified By"; Text[500])
        {

            // DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.", Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;


    trigger OnInsert()

    begin
        "Modified By" := USERID;




    end;

    trigger OnModify()
    begin
        "Modified By" := USERID;
        // "Modified On" := CURRENTDATETIME;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
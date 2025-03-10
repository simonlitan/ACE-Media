table 52178911 "User Tasks"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Code"; Code[30])
        {
        }
        field(3; "Task Name"; Text[100])
        {
        }
        field(4; "Task Details"; Text[250])
        {
        }
        field(5; "Assign To"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            var
                objEmp: Record "HRM-Employee C";
            begin
                //Get the employee name
                "Full Name" := '';
                objEmp.Reset;
                objEmp.SetRange(objEmp."No.", Rec."Assign To");
                if objEmp.Find('-') then
                    "Full Name" := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
            end;
        }
        field(10; "Full Name"; Text[100])
        {
        }
        field(9; "User Id"; Text[100])
        {
        }
        field(6; "Due Date"; Date)
        {
        }
        field(7; "Due Time"; Time)
        {
        }
        field(8; "Status"; Option)
        {
            OptionCaption = 'Open,Closed,Pending,Cancelled';
            OptionMembers = Open,Closed,Pending,Cancelled;
        }
        field(11; "Feedback"; Text[250])
        {
        }
        field(12; "Modified By"; Code[30])
        {
        }
        field(13; "Modified On"; DateTime)
        {
        }
        field(14; "Created On"; DateTime)
        {
        }
        field(15; "No Series"; Code[30])
        {
        }
        field(16; "Linkt to appointment"; Boolean)
        {
        }
        field(17; "Comments"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
        /*  key(Key2; "Assign To")
         {
             //Clustered = true;
         } */
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IF "Code" = '' THEN BEGIN
            /* ACAGeneralSetUp.GET;
            ACAGeneralSetUp.TESTFIELD("Further Info Nos"); //rsk */
            NoSeriesMgt.InitSeries('TASK', xRec."No Series", 0D, "Code", "No Series");
        END;
        "User Id" := USERID;
        "Created On" := CURRENTDATETIME;
        //Date := TODAY;
    end;

    trigger OnModify()
    begin
        "Modified By" := USERID;
        "Modified On" := CURRENTDATETIME;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
table 52178918 "CEO-Calendar Entries2"
{
    Caption = 'CEO-Calendar Entries2';
    DataClassification = ToBeClassified;

    fields
    {

        field(14; "Code1"; Code[30])
        {


        }
        field(15; "Date"; Date)
        {
        }
        field(16; "Time"; Time)
        {
            Caption = 'Time In';
        }
        field(18; Status; Option)
        {
            OptionMembers = Open,Pending,Approved,Cancelled,Processing,Completed;
            OptionCaption = 'Open,Pending,Approved,Cancelled,Processing,Completed';
        }
        field(5; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Requesting Officer"; Text[250])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            var
                objEmp: Record "HRM-Employee C";
            begin
                //Get the employee name
                "Full Name" := '';
                objEmp.Reset;
                objEmp.SetRange(objEmp."No.", Rec."Requesting Officer");
                if objEmp.Find('-') then
                    "Full Name" := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
            end;


        }
        field(25; "Full Name"; Text[250])
        {

            DataClassification = ToBeClassified;
        }
        field(36; "Contact"; Text[100])
        {

        }
        field(24; "External Requesting Officer"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Firm/From Where"; Text[100])
        {

        }
        field(32; "Officer to be seen"; Text[100])
        {

        }
        field(33; "Received By"; Text[100])
        {

        }
        field(34; "Time Out"; Time)
        {

        }
        field(17; "Reason"; Text[250])
        {
        }
        field(37; "Comments"; Text[100])
        {

        }
    }
    keys
    {
        key(Key1; "Code1")
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
        // IF "Code" = '' THEN BEGIN

        //     NoSeriesMgt.InitSeries('CEOCAL', xRec."No. Series", 0D, "Code", "No. Series");
        // END;
        IF "Code1" = '' THEN BEGIN

            NoSeriesMgt.InitSeries('APPMNTS', xRec."No. Series", 0D, "Code1", "No. Series");
        END;
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

    /* var
    item: Record Item; */

}
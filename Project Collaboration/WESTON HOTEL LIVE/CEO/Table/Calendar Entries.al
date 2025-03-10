table 52178885 "CEO-Calendar Entries"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Code; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Calendar Name"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Date Filter"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Period Start"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Timee"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Calendar Component"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Planned Calendar Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Location Filter"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "No. of People"; Decimal)
        {
            CalcFormula = Sum("CEO-Production Forecast Entry"."Number of People" WHERE("Item No." = FIELD("Code"),
                                                                       "Calendar Name" = FIELD("Calendar Name")));
            //"Calendar Date" = FIELD("Date Filter"),
            //"Location Code" = FIELD("Location Filter"),
            //  "Calendar Component" = FIELD("Calendar Component")));
            Caption = 'No. of People';
            DecimalPlaces = 0;//: 5;
            FieldClass = FlowField;
        }
        field(13; "No. of People1"; Decimal)
        {
            //  TableRelation = "CEO-Production Forecast Entryy";

        }
        // field(13; "No."; Integer)
        // {
        //     AutoIncrement = true;

        // }
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
        field(17; "Reason"; Text[250])
        {
        }
        field(18; Status; Option)
        {
            OptionMembers = Open,Pending,Approved,Cancelled,Processing,Completed;
            OptionCaption = 'Open,Pending,Approved,Cancelled,Processing,Completed';
        }
        field(19; "User Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Date Created"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "No Series"; Code[30])
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
        field(24; "External Requesting Officer"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Agenda"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Attendant Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Responsibility"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Number"; Code[250])
        {
            // AutoIncrement = true;
            // DataClassification = ToBeClassified;

            // TableRelation = "CEO-Calendar Entries";

        }
        field(29; "Participants Code"; Code[250])
        {


        }
        field(30; "Venue"; Text[250])
        {


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
        // field(35; "Time In"; Time)
        // {

        // }
        field(36; "Contact"; Text[100])
        {

        }
        field(37; "Comments"; Text[100])
        {

        }

    }

    keys
    {
        key(Key1; "Code1", Code)
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
        IF "Code" = '' THEN BEGIN

            NoSeriesMgt.InitSeries('CEOCAL', xRec."No. Series", 0D, "Code", "No. Series");
        END;
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
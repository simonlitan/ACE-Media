table 52178884 "ISO-AuditTimetableListpartTabl"
{
    Caption = 'ISO-AuditTimetableListpartTabl';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Audit No."; Code[25])
        {

        }
        field(17; "Timetable No."; Code[25])
        {

        }
        field(2; "Audit date"; Date)
        {
        }
        field(3; "Audit day"; Text[250])
        {

        }
        field(4; "Time"; Code[250])
        {

        }
        field(5; "Audit Area"; Text[250])
        {

        }
        field(6; "Participants"; Code[100])
        {

        }


        field(12; "No Series"; Code[30])
        {

        }
        field(13; "User Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Date Created"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Status"; Option)
        {
            OptionMembers = Open,Ongoing,Suspended,Closed;
        }
        field(16; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Audit No.", "Audit date", "Time")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

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
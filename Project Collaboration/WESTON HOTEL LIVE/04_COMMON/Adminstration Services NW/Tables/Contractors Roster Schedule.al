/// <summary>
/// Table Contractors Roster (ID 52178478).
/// </summary>
table 52178863 "Contractors Roster"
{
    fields
    {
        field(1; "Line No."; integer)
        {
            AutoIncrement = true;
        }
        field(2; "Activity Code"; Code[30])
        {

        }
        field(3; Description; Text[100])
        {

        }
        field(4; "Start Day"; Date)
        {

        }
        field(5; "End Date"; Date)
        {

        }
        field(6; "Remarks"; Text[100])
        {

        }
        field(7; Status; Option)
        {
            OptionCaption = '   ,ongoing,Completed, Suspended, skipped';
            OptionMembers = "  ",ongoing,Completed,Suspended,skipped;
        }
        field(8; "Contract No."; Code[30])
        {

        }
        field(9; "Contact No."; Code[30])
        {

        }
        field(10; "ID No."; Code[30])
        {

        }
        field(11; "Name"; Text[30])
        {

        }

    }
    keys
    {
        key(key1; "Line No.", "Contract No.")
        {

        }

    }
}
/// <summary>
/// Table Outsourced Services (ID 52178476).
/// </summary>
table 52178864 "Outsourced Services"
{
    DrillDownPageId = "Outsourced Contract List";
    LookupPageId = "Outsourced Contract List";
    fields
    {
        field(1; "No."; Code[30])
        {

        }
        field(2; "Contract Type"; code[50])
        {
            TableRelation = "Contract Categories".Code;
        }
        field(3; "Contract Description"; Text[100])
        {

        }

        field(4; "Start Date"; Date)
        {

        }
        field(5; "End Date"; Date)
        {

        }
        field(6; "Contract Period"; Date)
        {

        }

        field(7; Status; Option)
        {
            OptionCaption = 'New,Active,Inactive, Blocked';
            OptionMembers = New,Active,Inactive,blocked;
        }

        field(8; Renewable; boolean)
        {

        }
        field(9; "Date Renewed"; Date)
        {

        }
        field(10; "End Of renewal Period"; Date)
        {

        }
        field(11; "Renewal Status"; Option)
        {
            OptionMembers = "  ",New,"Pending Approval",Approved,Renewed;
        }


    }
}
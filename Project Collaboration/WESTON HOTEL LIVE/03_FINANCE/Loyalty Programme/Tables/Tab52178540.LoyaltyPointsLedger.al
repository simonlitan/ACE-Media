table 52178540 "Loyalty Points Ledger"
{
    LookupPageId = "Loyalty Points Ledger";
    DrillDownPageId = "Loyalty Points Ledger";
    fields
    {
        field(1; "Entry No."; Integer)
        {

        }
        field(2; "Document No."; Code[30])
        {

        }
        field(3; "Posting Date"; date)
        {

        }
        field(4; "Loyalty Period"; Code[30])
        {

        }
        field(6; "Sales Amount"; Decimal)
        {

        }
        field(7; "Batch No."; Code[30])
        {

        }
        field(8; "Is Reversal"; Boolean)
        {

        }
        field(9; "Total Points"; Decimal)
        {

        }
        field(10; "Equivalence to Cash"; Decimal)
        {

        }
        field(11; "Account No."; Code[30])
        {

        }


        field(12; "Date Posted"; date)
        {

        }
        field(13; "Posted By"; Code[30])
        {

        }
        field(15; "Loyalty Programme"; Enum "Loyalty Programmes")
        {

        }
    }


}
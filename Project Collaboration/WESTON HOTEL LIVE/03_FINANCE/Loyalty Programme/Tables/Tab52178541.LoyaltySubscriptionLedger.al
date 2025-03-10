table 52178541 "Loyalty Subscription Ledger"
{
    DrillDownPageId = "Loyalty Subscription Ledger";
    LookupPageId = "Loyalty Subscription Ledger";
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
        field(6; "Subscription Amount"; Decimal)
        {

        }
        field(7; "Amount"; Decimal)
        {

        }
        field(8; "Batch No."; Code[30])
        {

        }
        field(9; "Is Reversal"; Boolean)
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
        field(15; "Programme Type"; Enum "Loyalty Programmes")
        {
        }
        field(16; "Programme"; Code[30])
        {

        }
        field(17; "Closed"; Boolean)
        {

        }
        field(18; "date Closed"; date)
        {

        }
        field(19; "Closed By"; Code[30])
        {

        }
    }


}
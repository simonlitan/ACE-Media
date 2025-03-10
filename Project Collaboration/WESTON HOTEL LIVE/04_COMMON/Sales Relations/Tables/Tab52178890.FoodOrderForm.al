table 52178890 "Food Order Form"
{
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

        }
        field(2; "Contact No."; Code[20])
        {

            TableRelation = Customer;
        }
        field(4; "Name"; Text[200])
        {

        }
        field(5; "Opportunity No."; Code[30])
        {

        }
        field(7; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));

        }
        field(8; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(9; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";

        }
        field(10; "Event Name"; Text[100])
        {

        }
        field(11; "Venue"; Code[50])
        {

        }
        field(12; "Date"; Date)
        {

        }
        field(13; "Day"; Text[100])
        {

        }
        field(14; "Type of Event"; Text[100])
        {

        }
        field(15; "Number of Pax: Expected"; Integer)
        {

        }
        field(16; "Guaranteed"; Integer)
        {

        }
        field(17; "Arrival Time"; time)
        {

        }
        field(18; "Meal Time"; time)
        {

        }
        field(19; "Menu Details"; Text[500])
        {

        }
        field(20; "Beverage Details"; text[500])
        {

        }
        field(21; "Setup Details"; Text[500])
        {

        }
        field(22; "Decoration details"; Text[500])
        {

        }
        field(23; "Entertainment"; text[500])
        {

        }
        field(24; "Other Details"; Text[1000])
        {

        }
        field(25; "Food"; Decimal)
        {

        }
        field(26; "Beverage"; Decimal)
        {

        }
        field(27; "Others"; Decimal)
        {

        }
        field(28; "Payment plan"; Text[200])
        {

        }
        field(29; "Event Agreement Details"; Text[500])
        {

        }
        field(30; "Organizer Name"; Text[200])
        {

        }
        field(31; "Telephone Contact"; Text[100])
        {

        }
        field(32; "Booked By"; Text[100])
        {

        }
        field(33; "Booked Date"; date)
        {

        }
        field(36; "Received By"; Text[100])
        {

        }
        field(37; "Received Date"; Date)
        {

        }
        field(40; "Username"; Code[30])
        {

        }
        field(41; "Document Date"; date)
        {

        }
    }
}
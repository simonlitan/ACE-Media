table 52178646 "NW-Board GL Accounts"
{
    fields
    {
        field(1; "No."; Code[30])
        {

        }
        field(2; "Sitting Allowance Acc"; code[50])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(3; "Mileage Claim Acc"; code[50])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(4; "Accomodation Allowance Acc"; code[50])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(5; "Lunch Allowance Acc"; code[30])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(6; "Honoraria Acc"; code[30])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(7; "Tax Acc"; Code[30])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(8; "Net Acc"; Code[30])
        {
            TableRelation = "G/L Account"."No.";
        }

    }

}
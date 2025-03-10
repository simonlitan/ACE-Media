table 52178537 "Loyalty Setups"
{
    fields
    {
        field(1; "Pk"; Code[30])
        {
        }
        field(2; "Loyalty Customers"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(3; "Sales Capture"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(5; WorkPlan; Code[20])
        {
            TableRelation = "No. Series";
        }

    }
}
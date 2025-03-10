xmlport 50200 "Export Loyalty Data"
{
    UseRequestPage = false;
    Direction = Export;

    schema
    {
        textelement(NodeName1)
        {
            tableelement(ledger; "Loyalty Ledger")
            {
                fieldattribute(CustNo; ledger."Customer No") { }
                fieldattribute(DocNo; ledger."Document No") { }
                fieldattribute(PostDate; ledger."Posting Date") { }
                fieldattribute(Points; ledger."Points") { }
            }
        }
    }
}
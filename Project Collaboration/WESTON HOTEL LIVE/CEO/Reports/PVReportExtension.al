reportextension 52178863 PVExtension extends "Payment Voucher"
{

    RDLCLayout = './CEO/Reports/SSR/PVreportFinal.rdl';
    dataset
    {
        add("<Payment Line>")
        {
            column(Vat_six_percent_rate; "<Payment Line>"."VAT Six % Rate")
            { }
            // add a new field to the dataset
            column(Advance_Amount; "<Payment Line>"."Advance Amount")
            { }


            // add a new field to the dataset
            column(Commission_Amount; "<Payment Line>"."Commision Amount")
            { }
        }

    }


}
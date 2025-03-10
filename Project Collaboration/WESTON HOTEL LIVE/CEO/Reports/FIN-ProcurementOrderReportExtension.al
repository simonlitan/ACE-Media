reportextension 52178861 "FIN-Procurement Order Report" extends "Procurement Report"
{
    dataset
    {
        add(purchaseHeader)
        {
            // add a new field to the dataset
            column(ApproverID; AppReqq."Approver ID")
            { }
        }
    }

    var
        AppReqq: Record "Approval Entry";
}

reportextension 52178862 "FIN-Purchase Requisition Note " extends "Purchase Requisitions"
{
    dataset
    {
        add(pl)
        {
            // add a new field to the dataset
            column(ApproverID; AppReqq."Approver ID")
            { }
        }
    }

    var
        AppReqq: Record "Approval Entry";
}

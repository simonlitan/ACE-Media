reportextension 52178864 "FIN-ClaimFormReportExtension" extends "Claim Requisition"
{
    dataset
    {
        add(Claims_Header)
        {

            column(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(ApproverID; AppReqq."Approver ID")
            { }
            column(designation; empdata."Job Title")
            { }

        }
    }
    var
        AppReqq: Record "Approval Entry";
        empdata: Record "HRM-Employee C";
}

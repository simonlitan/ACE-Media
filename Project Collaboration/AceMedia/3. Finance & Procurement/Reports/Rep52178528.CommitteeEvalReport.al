report 52178528 "Committee Eval Report1"
{
    RDLCLayout = './Reports/SSR/Tender.EvalReport.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Eval; "Proc Evaluation Report")
        {
            column(RequisitionNo_Eval; "Requisition No.")
            {
            }
            column(ProcurementMethods_Eval; "Procurement Methods")
            {
            }
            column(RecommendedforAward_Eval; "Recommended for Award")
            {
            }
            column(BidderSupplier_Eval; "Bidder/Supplier")
            {
            }
            column(name_Eval; name)
            {
            }
            column(CompName; info.Name)
            {

            }
            column(CompAddress; info.Address)
            {

            }
            column(CompMail; info."E-Mail")
            {

            }
            column(CompPhone; info."Phone No.")
            {

            }
            column(logo; info.Picture)
            {

            }

            dataitem(bids; "Purchase Header")
            {
                DataItemLink = "Request for Quote No." = field("No.");
                DataItemTableView = where("Document Type" = filter(quote));
                column(No_bids; "No.")
                {
                }
                column(BuyfromVendorNo_bids; "Buy-from Vendor No.")
                {
                }
                column(BuyfromVendorName_bids; "Buy-from Vendor Name")
                {
                }
                column(TechnicalEvaluation_bids; "Technical Evaluation")
                {
                }
                column(FinalTechnicalDemo_bids; "Final Technical/Demo")
                {
                }
                column(FinancialScore_bids; "Financial Score")
                {
                }
                column(DemoEvaluation_bids; "Demo Evaluation")
                {
                }
                column(sno; sno)
                {

                }

                trigger OnPreDataItem()
                begin
                    sno := 0;
                end;

                trigger OnAfterGetRecord()
                begin
                    sno := sno + 1;
                end;

            }

            trigger OnPreDataItem()
            begin
                info.get;
                info.CalcFields(Picture);

            end;
        }
    }

    var
        info: Record "Company Information";
        sno: Integer;

}
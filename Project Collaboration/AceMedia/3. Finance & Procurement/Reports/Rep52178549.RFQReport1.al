report 52178549 "RFQ Report 1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/RFQReport1.rdl';

    dataset
    {
        dataitem(ReqHeader; "PROC-Purchase Quote Header")
        {
            RequestFilterFields = "No.";
            column(No_ReqHeader; ReqHeader."No.")
            {
            }
            column(Title_ReqHeader; ReqHeader."Category Description")
            {
            }
            column(RequisitionNo_ReqHeader; ReqHeader."No.")
            {
            }
            /* column(ProcurementPlanNo_ReqHeader; ReqHeader."Procurement Plan No")
           {
           }  */
            column(CreationDate_ReqHeader; ReqHeader."Document Date")
            {
            }
            column(UserID_ReqHeader; ReqHeader."Created By")
            {
            }
            column(ProcurementMethod_ReqHeader; ReqHeader."Procurement Methods")
            {
            }
            /* column(NoSeries_ReqHeader; ReqHeader."No.Series")
            {
            } */
            column(ReturnDate_ReqHeader; ReqHeader."Expected Closing Date")
            {
            }
            /* column(ReturnTime_ReqHeader; ReqHeader."Return Time")
            {
            }
            column(TenderType_ReqHeader; ReqHeader."Tender Type")
            {
            } */
            column(DocumentNo_ReqHeader; ReqHeader."No.")
            {
            }
            /*  column(NoofTenderDocuments_ReqHeader; ReqHeader."No of Tender Documents")
            {
            } */
            column(ExtendedDate_ReqHeader; ReqHeader."Expected Opening Date")
            {
            }
            /* column(TenderAmount_ReqHeader; ReqHeader.Amount)
            {
            } */
            /* column(ValidityPeriod_ReqHeader; ReqHeader."Validity Period")
            {
            } */
            column(IssuedDate_ReqHeader; ReqHeader."Document Date")
            {
            }
            /* column(Closed_ReqHeader; ReqHeader.Closed)
            {
            } */
            column(Compname; info.Name)
            {
            }
            column(CompAddress; info.Address)
            {
            }
            column(CompPhone; info."Phone No.")
            {
            }
            column(CompLogo; info.Picture)
            {
            }
            column(CompMail; info."E-Mail")
            {
            }
            column(CompUrl; info."Home Page")
            {
            }
            dataitem(ReqLines; "PROC-Purchase Quote Line")
            {
                DataItemLink = "No." = FIELD("No.");
                column(RequisitionNo_ReqLines; ReqLines."No.")
                {
                }
                column(LineNo_ReqLines; ReqLines."Line No.")
                {
                }
                column(Type_ReqLines; ReqLines.Type)
                {
                }
                column(No_ReqLines; ReqLines."No.")
                {
                }
                column(Description_ReqLines; ReqLines.Description)
                {
                }
                column(Quantity_ReqLines; ReqLines.Quantity)
                {
                }
                column(UnitofMeasure_ReqLines; ReqLines."Unit of Measure")
                {
                }
                column(UnitPrice_ReqLines; ReqLines."Unit Cost")
                {
                }
                column(Amount_ReqLines; ReqLines.Amount)
                {
                }
                /* column(Select_ReqLines; ReqLines.Select)
                {
                } */
                column(SupplierCategory_ReqLines; ReqLines."Transaction Type")
                {
                }
                /* column(Ordered_ReqLines; ReqLines.)
                {
                }  */
                column(OrderDate_ReqLines; ReqLines."Order Date")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                info.GET();
                info.CALCFIELDS(Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        info: Record 79;
}


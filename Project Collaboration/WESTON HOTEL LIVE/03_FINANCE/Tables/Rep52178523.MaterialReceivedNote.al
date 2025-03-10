report 52178523 "Material Received Note"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/MaterialReceivedNote.rdlc';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                column(No; "Purch. Rcpt. Line"."No.")
                {
                }
                column(Desc; "Purch. Rcpt. Line".Description)
                {
                }
                column(Supplier; "Purch. Rcpt. Line"."Buy-from Vendor No.")
                {
                }
                column(Quantity; "Purch. Rcpt. Line".Quantity)
                {
                }
                column(UOM; "Purch. Rcpt. Line"."Unit of Measure")
                {
                }
                column(Unit_Price; "Purch. Rcpt. Line"."Unit Cost (LCY)")
                {
                }
                column(Total; "Purch. Rcpt. Line"."VAT Base Amount")
                {
                }
                column(Pic; iNFO.Picture)
                {
                }
                column(VAT_Amount; AmtVat)
                {
                }
                column(TodayFormatted; FORMAT(TODAY, 0, 4))
                {
                }
                column(VAT; VAT)
                {
                }
                column(TAmt; TAmt)
                {
                }
                column(OrdNo; OrdNo)
                {
                }
                column(DocNo; "Purch. Rcpt. Line"."Document No.")
                {
                }
                column(userid; USERID)
                {
                }
                column(Date; "Purch. Rcpt. Line"."Posting Date")
                {
                }
                column(User; userid)
                {
                }
                column(Ven_no; PurchLine."Pay-to Vendor No.")
                {
                }
                column(PVName; PayVeName)
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange("Document No.", "Purch. Rcpt. Header"."No.");
                end;

                trigger OnAfterGetRecord()
                begin
                    Purchheader.RESET;
                    Purchheader.SETRANGE(Purchheader."No.", "Purch. Rcpt. Line"."Document No.");
                    IF Purchheader.FIND('-') THEN BEGIN
                        PayVeName := Purchheader."Pay-to Name";
                        OrdNo := Purchheader."Order No.";
                        DocNo := Purchheader."No.";
                    END;

                    IF "Purch. Rcpt. Line".Quantity = 0 THEN CurrReport.SKIP;
                    CLEAR(AmtVat);
                    CLEAR(VAT);
                    CLEAR(TAmt);
                    PurchLine.RESET;
                    PurchLine.SETRANGE(PurchLine."Document No.", "Purch. Rcpt. Line"."Document No.");//Purch. Rcpt. Line"."Document No."
                    PurchLine.SETRANGE(PurchLine."Line No.", "Purch. Rcpt. Line"."Line No.");
                    IF PurchLine.FIND('-') THEN BEGIN
                        TAmt := PurchLine.Quantity * "Purch. Rcpt. Line"."Unit Cost (LCY)";
                        AmtVat := ((PurchLine."VAT %" / 100) * TAmt) + TAmt;

                        VAT := AmtVat - TAmt;
                    END;
                end;
            }
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

    trigger OnPreReport()
    begin
        IF iNFO.GET THEN iNFO.CALCFIELDS(iNFO.Picture);
    end;

    var
        iNFO: Record 79;
        PurchLine: Record 121;
        AmtVat: Decimal;
        VAT: Decimal;
        TAmt: Decimal;
        OrdNo: Code[20];
        DocNo: Code[20];
        Purchheader: Record 120;
        PayVeName: Text;
}


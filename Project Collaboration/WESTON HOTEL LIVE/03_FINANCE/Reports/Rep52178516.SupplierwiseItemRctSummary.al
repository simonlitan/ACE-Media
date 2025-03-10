report 52178516 "Supplierwise Item Rct Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/SupplierwiseItemRctSummary.rdlc';
    ApplicationArea = ALL;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Purch. Rcpt. Line"; 121)
        {
            column(Vend_No; "Purch. Rcpt. Line"."Buy-from Vendor No.")
            {
            }
            column(Item_No; "Purch. Rcpt. Line"."No.")
            {
            }
            column(Quantity; "Purch. Rcpt. Line".Quantity)
            {
            }
            column(UOM; "Purch. Rcpt. Line"."Unit of Measure")
            {
            }
            column(Unit_cost; "Purch. Rcpt. Line"."Direct Unit Cost")
            {
            }
            column(Amount; "Purch. Rcpt. Line"."VAT Base Amount")
            {
            }
            column(Item_Description; "Purch. Rcpt. Line".Description)
            {
            }
            column(Location; "Purch. Rcpt. Line"."Location Code")
            {
            }
            column(Company_Name; CompName)
            {
            }
            column(Vendor_Name; VendName)
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(StartDate; StartDate)
            {
            }
            column(P_Date; "Purch. Rcpt. Line"."Posting Date")
            {
            }
            column(Category; "Purch. Rcpt. Line"."Item Category Code")
            {
            }
            column(Product_Group; '')
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF "Purch. Rcpt. Line".Quantity = 0 THEN
                    CurrReport.SKIP;
                RESET;
                SETRANGE("Purch. Rcpt. Line"."Posting Date", StartDate, EndDate);


                Vend.RESET;
                Vend.SETRANGE(Vend."No.", "Purch. Rcpt. Line"."Buy-from Vendor No.");
                IF Vend.FIND('-') THEN
                    VendName := Vend.Name;
            end;

            trigger OnPreDataItem()
            begin
                /*DimValue.RESET;
                DimValue.SETRANGE(DimValue.Code,"Store Requistion Lines"."Shortcut Dimension 1 Code");
                IF DimValue.FIND ('-') THEN
                Branch:=DimValue.Name;

                DimValue.RESET;
                DimValue.SETRANGE(DimValue.Code,"Store Requistion Lines"."Shortcut Dimension 2 Code");
                IF DimValue.FIND ('-') THEN
                 CostCenter:=DimValue.Name;
                */
                IF CompInfo.GET THEN
                    CompName := CompInfo.Name;
                //if Vend.get("Purchase Line"."Buy-from Vendor No.") then
                //VendName:=Vend.Name;
                /*IF EndDate=0D THEN
                EndDate:=WORKDATE;
                IF StartDate=0D THEN
                StartDate:=01010000D;
                */

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(StartDate; StartDate)
                {
                    Caption = 'Starting From';
                }
                field(EndDate; EndDate)
                {
                    Caption = 'Ending On';
                }
            }
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
        IF StartDate = 0D THEN ERROR('You must enter start date!');
    end;

    var
        Location: Code[20];
        Product: Code[20];
        StartDate: Date;
        EndDate: Date;
        ProdGroup: Code[20];
        Value: Decimal;
        PostDate: Date;
        DimValue: Record 349;
        CostCenter: Text[100];
        Branch: Text[100];
        CompInfo: Record 79;
        CompName: Text[100];
        Vend: Record 23;
        VendName: Text[100];
}


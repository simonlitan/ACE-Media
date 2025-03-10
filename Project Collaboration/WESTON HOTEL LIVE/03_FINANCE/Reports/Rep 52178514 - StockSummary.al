report 52178514 "Stock Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/StockSummary.rdl';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Item; 27)
        {
            //DataItemTableView = WHERE("Request Status" = FILTER(posted));

            column(No; Item."No.")
            {
            }
            column(Description; Item.Description)
            {
            }
            column(Quantity; Item.Inventory)
            {
            }
            column(UOM; Item."Base Unit of Measure")
            {
            }
            column(Unit_cost; Item."Unit Cost")
            {
            }
            column(Item_Group; Item."Location Code")
            {
            }
            column(Company_Name; UPPERCASE(CompInfo.Name))
            {
            }
            column(Amount; TAmout)
            {
            }
            column(LIssueDate; LIssueD)
            {
            }
            column(LRecptDate; LRcptD)
            {
            }
            column(pic; CompInfo.Picture)
            {
            }
            column(TDate; TDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF Inventory = 0 THEN
                    CurrReport.SKIP;

                //CLEAR(LIssueD);
                //CLEAR(LRcptD);
                Sreq.RESET;
                Sreq.SETRANGE(Sreq."No.", Items."No.");
                Sreq.SETRANGE(Sreq."Request Status", Sreq."Request Status"::Closed);

                IF Sreq.FIND('+') THEN
                    LIssueD := Sreq."Posting Date";

                ItemEnt.RESET;
                ItemEnt.SETRANGE(ItemEnt."Item No.", Item."No.");
                ItemEnt.SETRANGE(ItemEnt."Entry Type", ItemEnt."Entry Type"::"Positive Adjmt.");
                ItemEnt.SETRANGE(ItemEnt."Document Type", ItemEnt."Document Type"::"Purchase Receipt");
                IF ItemEnt.FIND('+') THEN
                    LRcptD := ItemEnt."Posting Date";

                Items.RESET;
                Items.SETRANGE(Items."No.", Item."No.");
                IF Items.FIND('-') THEN BEGIN
                    Items.CALCFIELDS(Items.Inventory);
                    TAmout := Items.Inventory * Items."Unit Price";
                END;
            end;

            trigger OnPreDataItem()
            begin


                IF CompInfo.GET THEN CompInfo.CALCFIELDS(CompInfo.Picture);
                CompName := CompInfo.Name;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(TDate; TDate)
                {
                    Caption = 'Enter Date';
                    ApplicationArea = all;
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
        TAmout: Decimal;
        Items: Record 27;
        LIssueDate: Date;
        LRecptDate: Date;
        TDate: Date;
        Sreq: Record "PROC-Store Requistion Lines";
        LIssueD: Date;
        LRcptD: Date;
        ItemEnt: Record 32;
}


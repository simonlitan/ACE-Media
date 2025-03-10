report 52178515 "Item Transaction History"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/ItemTransactionHistory.rdlc';
    ApplicationArea = ALL;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Item Ledger Entry"; 32)
        {
            column(Posting_Date; "Item Ledger Entry"."Posting Date")
            {
            }
            column(Entry_Type; "Item Ledger Entry"."Entry Type")
            {
            }
            column(Quantity; "Item Ledger Entry".Quantity)
            {
            }
            column(UOM; "Item Ledger Entry"."Unit of Measure Code")
            {
            }
            column(Rate; UnitCost)
            {
            }
            column(MR_No; "Item Ledger Entry"."Document No.")
            {
            }
            column(Company_Name; CompName)
            {
            }
            column(Item_No; "Item Ledger Entry"."Item No.")
            {
            }
            column(Department; "Item Ledger Entry"."Global Dimension 1 Code")
            {
            }
            column(Item_Desc; "Item Ledger Entry".Description)
            {
            }
            column(Cost_Center; "Item Ledger Entry"."Global Dimension 2 Code")
            {
            }
            column(Ent_Type; "Item Ledger Entry"."Entry Type Two")
            {
            }
            column(Item_Name; ItemName)
            {
            }
            column(StartDate; StartDate)
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(Branch; Branch)
            {
            }
            column(CostCenter; CostCenter)
            {
            }
            column(VendName; VendName)
            {
            }
            column(Amount; Amount)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //RESET;
                SETRANGE("Item Ledger Entry"."Posting Date", StartDate, EndDate);
                IF ItemNum <> '' THEN
                    SETRANGE("Item Ledger Entry"."Item No.", ItemNum);
                Amount := 0;
                Items.RESET;
                Items.SETRANGE(Items."No.", "Item Ledger Entry"."Item No.");
                IF Items.FIND('-') THEN
                    UnitCost := Items."Unit Cost";
                IF "Item Ledger Entry"."Entry Type Two" = 'ISSUES' THEN
                    Amount := (-1 * "Item Ledger Entry".Quantity) * UnitCost ELSE
                    Amount := "Item Ledger Entry".Quantity * UnitCost;

                DimValue.RESET;
                DimValue.SETRANGE(DimValue.Code, "Item Ledger Entry"."Global Dimension 1 Code");
                IF DimValue.FIND('-') THEN
                    Branch := DimValue.Name;

                DimValue.RESET;
                DimValue.SETRANGE(DimValue.Code, "Item Ledger Entry"."Global Dimension 2 Code");
                IF DimValue.FIND('-') THEN
                    CostCenter := DimValue.Name;

                IF "Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::Purchase THEN
                    "Item Ledger Entry"."Document No." := '';
                IF "Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::Purchase THEN
                    "Item Ledger Entry"."Entry Type Two" := 'RECEIPTS';
                "Item Ledger Entry".MODIFY;
                IF "Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::"Negative Adjmt." THEN
                    "Item Ledger Entry"."Entry Type Two" := 'ISSUES';
                "Item Ledger Entry".MODIFY;


                Vend.RESET;
                Vend.SETRANGE(Vend."No.", "Item Ledger Entry"."Source No.");
                IF Vend.FIND('-') THEN
                    VendName := Vend.Name;
                IF "Item Ledger Entry"."Entry Type Two" = 'ISSUES' THEN VendName := '';
                //RESET;
                /*
                SETRANGE("Item Ledger Entry"."Posting Date",StartDate,EndDate);
                IF ItemNum<>'' THEN
                SETRANGE("Item Ledger Entry"."Item No.",ItemNum);
                Amount:=0;
                Items.RESET;
                Items.SETRANGE(Items."No.","Item Ledger Entry"."Item No.");
                IF Items.FIND ('-') THEN
                UnitCost:=Items."Unit Cost";
                IF "Item Ledger Entry"."Entry Type Two" ='ISSUES' THEN
                Amount:=(-1*"Item Ledger Entry".Quantity)*UnitCost ELSE
                Amount:="Item Ledger Entry".Quantity*UnitCost;
                 */

                IF Items.GET("Item Ledger Entry"."Item No.") THEN
                    ItemName := Items.Description;
                //"Item Ledger Entry"."Posting Date":=CALCDATE(0D,"Item Ledger Entry"."Posting Date");
                //"Item Ledger Entry".MODIFY;

            end;

            trigger OnPreDataItem()
            begin
                IF CompInfo.GET THEN
                    CompName := CompInfo.Name;
                //if Vend.get("Purchase Line"."Buy-from Vendor No.") then
                //VendName:=Vend.Name;
                IF EndDate = 0D THEN
                    EndDate := WORKDATE;
                IF ItemNum <> '' THEN
                    "Item Ledger Entry".SETRANGE("Item Ledger Entry"."Item No.", ItemNum);
                "Item Ledger Entry".SETFILTER("Item Ledger Entry"."Posting Date", '>%1', StartDate);
                "Item Ledger Entry".SETFILTER("Item Ledger Entry"."Posting Date", '<%1', EndDate);

                //get opening and closing balances
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Item No.", ItemNum);
                ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Posting Date", '<%1', StartDate);
                ItemLedgerEntry.CALCSUMS(ItemLedgerEntry.Quantity);
                OpeningBalance := ItemLedgerEntry.Quantity;
                //MESSAGE(FORMAT(OpeningBalance));
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
                field(ItemNum; ItemNum)
                {
                    Caption = 'Item No';
                    TableRelation = Item."No.";
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
        Items: Record 27;
        UnitCost: Decimal;
        ItemName: Text[50];
        ItemNum: Code[20];
        Amount: Decimal;
        OpeningBalance: Decimal;
        ClosingBalance: Decimal;
        ItemLedgerEntry: Record 32;
}


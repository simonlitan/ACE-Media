report 52178541 "Item Consuption Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/ItemConsuptionSummary.rdl';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Item Ledger Entry";"Item Ledger Entry")
        {
            column(ItemNo; "Item No." ){}
            column(Description;Item.Description){}
            column(UOM; Item."Base Unit of Measure"){}
            column(QuantityG; Quantity * -1){}
            column(TotalAmountG; "Cost Amount (Actual)" * -1){}
            column(UnitCostG;UnitCostG ){}
            //column(Item_Group; item."Item Group"){}
            column(StartDate;StartDate){}
            column(EndDate;EndDate){}
            column(Posting_Date;"Posting Date"){}
            column(DescriptionG;DescriptionG){}
            column(ItemGroupG;ItemGroupG){}
            
            
            trigger OnPreDataItem()
           begin
            SetRange("Entry Type", "Entry Type"::"Negative Adjmt.");
            SetRange("Posting Date", StartDate, EndDate);
           end;
           trigger OnAfterGetRecord()
           begin
            Item.SetRange("No.", "Item No.");
            if Item.FindFirst()then
            begin
                CalcFields("Cost Amount (Actual)");
                DescriptionG := Item.Description; 
               // QuantityG := ILE.Quantity;
               // UOMG := Item."Base Unit of Measure";
                ItemGroupG := Item."Item Group";
                UnitCostG := Item."Unit Cost";
               // TotalAmountG := ILE."Cost Amount (Actual)"
                // TotalAmountG := ILE."Cost Amount (Actual)" * -1;
                
            end;
           end;

        }

       

        

    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field("Start Date"; StartDate)
                {
                    ApplicationArea = Basic, Suite;
                }

                field("End Date"; EndDate)
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }

        actions
        {
        }

    }

    labels
    {

        AllAmountsinLCYLabel = 'All amounts are in LCY';
        DescriptionLabel = 'Description';
        UnitOfMeasureLabel = 'Unit of Measure';
        TotalLabel = 'Total';
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin

    end;


    var
        Text000: Label 'Period: %1';
        VendFilter: Text;
        ItemLedgEntryFilter: Text;
        InvoicedQuantity: Decimal;
        DiscountAmount: Decimal;
        StartDate, EndDate : Date;
        Amount: Decimal;
        Item: Record Item;
        DescriptionG: Text;
        QuantityG : Decimal;
        TotalAmountG: Decimal;
        UOMG : TEXT;
        ItemGroupG: Text;
        ILE: Record "Item Ledger Entry";
        UnitCostG : Decimal;

    
}

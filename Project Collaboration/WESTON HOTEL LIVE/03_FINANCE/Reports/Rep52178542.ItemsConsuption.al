report 52178542 "Items Consuption"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/ItemConsuption.rdl';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Item Category", "Item Category Code";

            column(No_; "No.") { }
            column(Description; Description) { }
            column(Unit_Cost; "Unit Cost") { }
            column(UoM; "Base Unit of Measure") { }
            column(TotalItems; TotalItems) { }
            column(Quantity; ILE.Quantity) { }
            column(Item_Category; "Item Category") { }
            column(Item_Group; item."Item Group") { }
             column(Value_Entry__Invoiced_Quantity_; InvoicedQuantity)
                {
                    DecimalPlaces = 0 : 5;
                }
             column(Value_Entry___Cost_Amount__Actual__; CostAmountActual){}
            column(Item_Category_Code; "Item Category Code") { }
            column(Amount; Amount) { }
            column(StartDate; StartDate) { }

            column(EndDate; EndDate) { }
            
    //         trigger OnAfterGetRecord()
    //         var
    //             myInt: Integer;
    //         begin
    //             TotalItems := 0;
    //             ILE.Reset();
    //             ILE.SetRange("Posting Date", StartDate, EndDate);
    //             ILE.SetRange("Entry Type", ILE."Entry Type"::"Negative Adjmt.");
    //             ILE.SetFilter(Quantity, '<>%1', 0);
    //             if ILE.FindFirst() then begin
    //                 repeat
    //                     TotalItems += ILE.Quantity;
    //                 until ILE.Next() = 0;
    //                 TotalItems := TotalItems * -1;
    //                 Amount := TotalItems * "Unit Cost";
    //             end;
    //         end;

    //     }

    // }
                trigger OnAfterGetRecord()
                begin
                    if not Item.Get(ILE."Item No.") then
                        Item.Init();

                    if ResetItemTotal then begin
                        ILE.Reset();
                        ResetItemTotal := false;
                        InvoicedQuantity := ILE."Invoiced Quantity";
                        CostAmountActual :=ILE. "Cost Amount (Actual)";
                       
                    end else begin
                        InvoicedQuantity += ILE."Invoiced Quantity";
                        CostAmountActual += ILE. "Cost Amount (Actual)";
                        
                    end;

                    if not (ILE.Next() = 0) then begin
                        if ILE."Item No." = ILE."Item No." then
                            CurrReport.Skip();
                        ResetItemTotal := true
                    end
                end;

                trigger OnPreDataItem()
                begin
                    ResetItemTotal := true;
                    ILE.SetCurrentKey("Source Type", "Source No.", "Item No.", "Posting Date");
                  //  ILE.CopyFilters(I);
                    if ILE.FindSet() then;
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
        TotalItems: Decimal;
        Text000: Label 'Period: %1';
        //  ValueEntry: Record "Value Entry";
        VendFilter: Text;
        ItemLedgEntryFilter: Text;
        InvoicedQuantity: Decimal;
        CostAmountActual: Decimal;
        DiscountAmount: Decimal;
        ILE: Record "Item Ledger Entry";
        StartDate, EndDate : Date;
        Amount: Decimal;
        ResetItemTotal: Boolean;
}

report 52178548 "Phys Inventory Journal"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/PhysInventoryList3.rdl';
    ApplicationArea = Warehouse;
    Caption = 'Physical Inventory List';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Item Journal Line"; "Item Journal Line")
        {
            column(Posting_Date; "Posting Date")
            {

            }

            column(Document_No_; "Document No.")
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Description; Description)
            {

            }
            column(CostCenter; "Shortcut Dimension 1 Code")
            {

            }
            column(Branch; "Shortcut Dimension 2 Code")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            column(Qty___Phys__Inventory_; "Qty. (Phys. Inventory)")
            {

            }
            column(Unit_Amount; "Unit Amount")
            {

            }
            column(Amount; Amount)
            {

            }
            column(Unit_Cost; "Unit Cost")
            {

            }
            column(Logo; CompInfo.Picture)
            {

            }
            column(CompName; CompName)
            {

            }


            trigger OnPreDataItem()

            begin
                if CompInfo.get then
                    CompInfo.CalcFields(Picture);
                CompName := CompInfo.Name;

            end;
        }
    }


    var
        CompInfo: Record "Company Information";
        CompName: Text[100];
}


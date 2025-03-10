report 52178509 "Cost Center (Product Groups W)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/CostCenterProductGroupW.rdl';

    dataset
    {
        dataitem(DataItem1; "PROC-Store Requistion Lines")
        {
            // DataItemTableView = WHERE (Request Status=FILTER(Closed));
            RequestFilterFields = "Location Filter", "Category Filter", "Cost Center Filter", "Date Filter", "Item Product Group Filter";
            column(No; DataItem1."No.")
            {
            }
            column(Description; DataItem1.Description)
            {
            }
            column(Quantity; DataItem1.Quantity)
            {
            }
            column(UOM; DataItem1."Unit of Measure")
            {
            }
            column(Unit_cost; DataItem1."Unit Cost")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Amount; DataItem1."Line Amount")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Branch; "Shortcut Dimension 1 Code")
            {
            }
            column(Cost_center; UPPERCASE("Shortcut Dimension 2 Code"))
            {
            }
            dataitem(DataItem2; Item)
            {


                column(Item_Category; DataItem2."Item Category")
                {
                }
                // column(Start_Date;DataItem2.start
                // {
                // }
                column(End_Date; DataItem2."Next Counting End Date")
                {
                }
                // column(Product_Group;ProdGroup)
                // {
                // }
                column(Location; DataItem2."Location code")
                {
                }
                // column(Company_Name;UPPERCASE(CompInfo.Name))
                // {
                // }
                column(MR_No; DataItem1."Requistion No")
                {
                }
                dataitem(DataItem3; "PROC-Store Requistion Header")
                {
                    column(posting_date; DataItem3."Issue Date")
                    {
                    }
                    column(IssStore; DataItem1."Issuing Store")
                    {
                    }
                    column(CostC; DataItem1."Shortcut Dimension 2 Code")
                    {
                    }
                    // column(C_Code; DataItem1."Category Code")
                    // {
                    // }
                    // column(Location_Filt; DataItem1."Location Filter")
                    // {
                    // }
                    // column(Category_Filter;GETFILTER(DataItem2."Item Category"))
                    // {
                    // }
                    // column(Cost_Center_Filter;GETFILTER(DataItem3."Shortcut Dimension 2 Code"))
                    // {
                    // }
                    // column(Date_Filter;GETFILTER(DataItem1."Date Filter"))
                    // {
                    // }
                    // column(Location_Filter;GETFILTER("Store Requistion Lines"."Location Filter"))
                    // {
                    // }
                    // column(Product_Group_Filter;GETFILTER("Store Requistion Lines"."Item Product Group Filter"))
                    // {
                    // }
                    // column(Item_Prod_Group; DataItem2."Item Product Group")
                    // {
                    // }

                    trigger OnAfterGetRecord()
                    begin
                        IF (DataItem1.Quantity = 0) OR
                        (DataItem1."Request Status" = DataItem1."Request Status"::Pending)
                        THEN
                            CurrReport.SKIP;
                        // DataItem1.CALCFIELDS(DataItem2."Item Category");


                        //RESET;
                        //IF StartDate<>0D THEN
                        //SETRANGE("Store Requistion Lines"."Posting Date",StartDate,EndDate);
                        //SETRANGE("Store Requistion Lines"."Category Code",Product);

                        DimValue.RESET;
                        DimValue.SETRANGE(DimValue.Code, DataItem1."Shortcut Dimension 1 Code");
                        IF DimValue.FIND('-') THEN
                            Branch := DimValue.Name;

                        DimValue.RESET;
                        DimValue.SETRANGE(DimValue.Code, DataItem1."Shortcut Dimension 2 Code");
                        IF DimValue.FIND('-') THEN
                            CostCenter := DimValue.Name;
                    end;

                    // trigger OnPreDataItem()
                    // begin
                    //    //+- DataItem1.CALCFIELDS(DataItem2."Product Group");
                    //     IF CompInfo.GET THEN
                    //     CompName:=CompInfo.Name;
                    //     CLEAR("Store Requistion Lines"."Issuing Store");
                    //     //if EndDate=0d then EndDate:=workdate;
                    //     IF GETFILTER(DataItem1."Location Filter")<>'' THEN
                    //     DataItem1.SETFILTER(DataItem1."Issuing Store",'=%1',(GETFILTER(DataItem1."Location Filter")));
                    //     IF GETFILTER("Store Requistion Lines"."Cost Center Filter")<>'' THEN
                    //     "Store Requistion Lines".SETFILTER("Store Requistion Lines"."Shortcut Dimension 2 Code",'=%1',(GETFILTER("Store Requistion Lines"."Cost Center Filter")));
                    //     IF  GETFILTER("Store Requistion Lines"."Category Filter") <>'' THEN
                    //     "Store Requistion Lines".SETFILTER("Store Requistion Lines"."Product Group",'=%1',(GETFILTER("Store Requistion Lines"."Category Filter")));
                    //     IF GETFILTER("Store Requistion Lines"."Date Filter") <>'' THEN
                    //     "Store Requistion Lines".SETFILTER("Store Requistion Lines"."Posting Date",(GETFILTER("Store Requistion Lines"."Date Filter")));
                    //     IF GETFILTER("Store Requistion Lines"."Item Product Group Filter") <>'' THEN
                    //     "Store Requistion Lines".SETFILTER("Store Requistion Lines"."Item Product Group",(GETFILTER("Store Requistion Lines"."Item Product Group Filter")));
                    // end;
                }
            }
        }
    }





    // layout
    // {
    // }

    // actions
    // {
    // }


    labels
    {
    }

    trigger OnPreReport()
    begin
        //IF StartDate=0D THEN ERROR('Please Enter the start date!');
    end;


    var
        Location: Code[20];
        Product: Code[20];
        StartDate: Date;
        EndDate: Date;
        ProdGroup: Code[20];
        Value: Decimal;
        PostDate: Date;
        DimValue: Record Dimension;
        CostCenter: Text[100];
        Branch: Text[100];
        CompInfo: Record "Company Information";
        CompName: Text[100];
        Dept: Code[10];

}




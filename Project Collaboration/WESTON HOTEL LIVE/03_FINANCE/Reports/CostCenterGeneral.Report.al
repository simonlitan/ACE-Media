// report 52178518 "Cost Center General"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Reports/SSR/CostCenterGeneral.rdlc';
//     ApplicationArea = ALL;
//     UsageCategory = ReportsAndAnalysis;

//     dataset
//     {
//         dataitem("Store Requistion Lines"; "PROC-Store Requistion Lines")
//         {
//             DataItemTableView = WHERE("Request Status" = FILTER(Closed));
//             RequestFilterFields = "Location Filter", "Category Filter", "Cost Center Filter", "Date Filter";
//             column(No; "Store Requistion Lines"."No.")
//             {
//             }
//             column(Description; "Store Requistion Lines".Description)
//             {
//             }
//             column(Quantity; "Store Requistion Lines".Quantity)
//             {
//             }
//             column(UOM; "Store Requistion Lines"."Unit of Measure")
//             {
//             }
//             column(Unit_cost; "Store Requistion Lines"."Unit Cost")
//             {
//                 DecimalPlaces = 2 : 2;
//             }
//             column(Amount; "Store Requistion Lines"."Line Amount")
//             {
//                 DecimalPlaces = 2 : 2;
//             }
//             column(Branch; Branch)
//             {
//             }
//             column(Cost_center; UPPERCASE(CostCenter))
//             {
//             }
//             column(Item_Category; "Store Requistion Lines"."Product Group")
//             {
//             }
//             column(Start_Date; StartDate)
//             {
//             }
//             column(End_Date; EndDate)
//             {
//             }
//             column(Product_Group; ProdGroup)
//             {
//             }
//             column(Location; Location)
//             {
//             }
//             column(Company_Name; UPPERCASE(CompInfo.Name))
//             {
//             }
//             column(MR_No; "Store Requistion Lines"."Requistion No")
//             {
//             }
//             column(posting_date; "Store Requistion Lines"."Posting Date")
//             {
//             }
//             column(IssStore; "Store Requistion Lines"."Issuing Store")
//             {
//             }
//             column(CostC; "Store Requistion Lines"."Shortcut Dimension 2 Code")
//             {
//             }
//             column(C_Code; "Store Requistion Lines"."Category Code")
//             {
//             }
//             column(Location_Filt; "Store Requistion Lines"."Location Filter")
//             {
//             }
//             column(Category_Filter; GETFILTER("Store Requistion Lines"."Category Filter"))
//             {
//             }
//             column(Cost_Center_Filter; GETFILTER("Store Requistion Lines"."Cost Center Filter"))
//             {
//             }
//             column(Date_Filter; GETFILTER("Store Requistion Lines"."Date Filter"))
//             {
//             }
//             column(Location_Filter; GETFILTER("Store Requistion Lines"."Location Filter"))
//             {
//             }
//             column(Item_Product_Group; "Store Requistion Lines"."Item Product Group")
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 // IF UserSet.GET(USERID) THEN BEGIN
//                 //     IF UserSet."View Inventory" = FALSE THEN ERROR('You dont have rights, contact system administrator');
//                 // END ELSE BEGIN
//                 //     ERROR('User Setup not yet done')
//                 // END;


//                 IF ("Store Requistion Lines".Quantity = 0) OR
//                 ("Store Requistion Lines"."Request Status" = "Store Requistion Lines"."Request Status"::Pending)
//                 THEN
//                     CurrReport.SKIP;
//                 "Store Requistion Lines".CALCFIELDS("Store Requistion Lines"."Product Group");


//                 //RESET;
//                 //IF StartDate<>0D THEN
//                 //SETRANGE("Store Requistion Lines"."Posting Date",StartDate,EndDate);
//                 //SETRANGE("Store Requistion Lines"."Category Code",Product);

//                 DimValue.RESET;
//                 DimValue.SETRANGE(DimValue.Code, "Store Requistion Lines"."Shortcut Dimension 1 Code");
//                 IF DimValue.FIND('-') THEN
//                     Branch := DimValue.Name;

//                 DimValue.RESET;
//                 DimValue.SETRANGE(DimValue.Code, "Store Requistion Lines"."Shortcut Dimension 2 Code");
//                 IF DimValue.FIND('-') THEN
//                     CostCenter := DimValue.Name;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 "Store Requistion Lines".CALCFIELDS("Store Requistion Lines"."Product Group");
//                 IF CompInfo.GET THEN
//                     CompName := CompInfo.Name;
//                 CLEAR("Store Requistion Lines"."Issuing Store");
//                 //if EndDate=0d then EndDate:=workdate;
//                 IF GETFILTER("Store Requistion Lines"."Location Filter") <> '' THEN
//                     "Store Requistion Lines".SETFILTER("Store Requistion Lines"."Issuing Store", '=%1', (GETFILTER("Store Requistion Lines"."Location Filter")));
//                 IF GETFILTER("Store Requistion Lines"."Cost Center Filter") <> '' THEN
//                     "Store Requistion Lines".SETFILTER("Store Requistion Lines"."Shortcut Dimension 2 Code", '=%1', (GETFILTER("Store Requistion Lines"."Cost Center Filter")));
//                 IF GETFILTER("Store Requistion Lines"."Category Filter") <> '' THEN
//                     "Store Requistion Lines".SETFILTER("Store Requistion Lines"."Product Group", '=%1', (GETFILTER("Store Requistion Lines"."Category Filter")));
//                 IF GETFILTER("Store Requistion Lines"."Date Filter") <> '' THEN
//                     "Store Requistion Lines".SETFILTER("Store Requistion Lines"."Posting Date", (GETFILTER("Store Requistion Lines"."Date Filter")));
//                 //CostCenter:='';
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     trigger OnPreReport()
//     begin
//         //IF StartDate=0D THEN ERROR('Please Enter the start date!');
//         DimValue.RESET;
//         DimValue.SETRANGE(DimValue.Code, "Store Requistion Lines"."Shortcut Dimension 2 Code");
//         IF DimValue.FIND('-') THEN
//             CostCenter := DimValue.Name;
//     end;

//     var
//         Location: Code[20];
//         Product: Code[20];
//         StartDate: Date;
//         EndDate: Date;
//         ProdGroup: Code[20];
//         Value: Decimal;
//         PostDate: Date;
//         DimValue: Record 349;
//         CostCenter: Text[100];
//         Branch: Text[100];
//         CompInfo: Record 79;
//         CompName: Text[100];
//         Dept: Code[10];
//         UserSet: Record 91;
// }


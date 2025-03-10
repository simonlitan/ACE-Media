// /// <summary>
// /// Page Case Management Rolecenter (ID 52178905).
// /// </summary>
// page 52179009 "Asset Management Rolecenter"
// {
//     Caption = 'Asset Management Rolecenter';
//     PageType = RoleCenter;


//     layout
//     {
//         area(RoleCenter)
//         {
//             part(ApprovalsActivities; "Approvals Activities")
//             {
//                 ApplicationArea = Suite;
//             }

//         }
//     }
//     actions
//     {
//         area(Processing)
//         {
//             group(Setups)
//             {
//                 action("Number Setups")
//                 {
//                     ApplicationArea = all;
//                     Image = NumberSetup;
//                     RunObject = page "Asset No Series";
//                 }
//                 action("Categorization")
//                 {
//                     ApplicationArea = All;
//                     Image = FixedAssetLedger;
//                     RunObject = page "Asset categorization";
//                 }
//                 action("Posting Groups")
//                 {
//                     ApplicationArea = All;
//                     Image = PostInventoryToGL;
//                     RunObject = page "Asset Posting Group";
//                 }
//                 action("Depreciation Books")
//                 {
//                     ApplicationArea = All;
//                     Image = DepreciationBooks;
//                     RunObject = page "Asset Recovery Book";
//                 }


//             }

//             group("Property Setups")
//             {

//                 action(Floors)
//                 {
//                     ApplicationArea = All;
//                     Image = FiledOverview;
//                     RunObject = page FLoors;
//                 }
//                 action(Occupants)
//                 {
//                     ApplicationArea = All;
//                     Image = PersonInCharge;
//                     RunObject = page Occupants;
//                 }
//             }
//             group(Reports)
//             {
//                 action("Case Register Report")
//                 {
//                     ApplicationArea = all;
//                     image = Report;
//                     RunObject = report "Case Register";

//                 }
//             }


//         }
//         area(Sections)
//         {

//             group("Assets")
//             {
//                 action("Preserved Assets")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Preserved Asset List";
//                 }
//                 action("Forfeited Assets")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Forfeited Asset List";
//                 }
//                 action("Released Assets")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Released Asset List";
//                 }
//             }
//             group("Rent Schedules")
//             {
//                 action("Rent Periods")
//                 {
//                     ApplicationArea = All;
//                     Image = Period;
//                     RunObject = page "Rent Periods";
//                 }
//                 action("Schedules")
//                 {
//                     ApplicationArea = All;
//                     Image = ShowSelected;
//                     RunObject = page "Rent Payment Schedule";
//                 }
//                 action("Submitted Schedules")
//                 {
//                     ApplicationArea = All;
//                     Image = ShowSelected;
//                     RunObject = page "Rent Schedule Submitted";

//                 }
//             }
//             group("AssetIncome")
//             {
//                 Caption = 'Asset Income';
//                 action("Asset Income")
//                 {
//                     ApplicationArea = All;
//                     Image = ImportCodes;
//                     RunObject = page "Asset Recovery Income";
//                 }
//                 action("Posted Asset Income")
//                 {
//                     ApplicationArea = All;
//                     Image = PostponedInteractions;
//                     RunObject = page "Asset Posted Income";

//                 }
//             }
//             group("Asset Valuation")
//             {
//                 action("Revaluation")
//                 {
//                     ApplicationArea = All;
//                     Image = ReservationLedger;
//                     RunObject = page "Asset Appreciation Revaluation";
//                 }
//                 action("Posted Valuation")
//                 {
//                     ApplicationArea = All;
//                     Image = ValueLedger;
//                     RunObject = page "Asset Posted Revaluation";
//                 }

//             }
//             group("Depreciations")
//             {
//                 action("Asset depreciation")
//                 {
//                     ApplicationArea = All;
//                     Image = DepreciationBooks;
//                     RunObject = page "Asset Depreciation list";
//                 }
//                 action("Posted Depreciations")
//                 {
//                     ApplicationArea = All;
//                     Image = CalculateDepreciation;
//                     RunObject = page "Asset Posted Depreciation";
//                 }
//             }
//             group("Disposal")
//             {
//                 action("Disposals")
//                 {
//                     ApplicationArea = All;
//                     image = DistributionGroup;
//                     RunObject = page "Asset Disposals";
//                 }
//                 action("posted Disposals")
//                 {
//                     ApplicationArea = All;
//                     Image = PostedDeposit;
//                     RunObject = page "Asset Posted Disposals";
//                 }


//             }
//             group(Common_req)
//             {
//                 Caption = 'Common Requisitions';
//                 Image = LotInfo;
//                 action("Stores Requisitions")
//                 {

//                     Caption = 'Stores Requisitions';
//                     RunObject = Page "PROC-Store Requisition";
//                     ApplicationArea = All;
//                 }
//                 action("Imprest Requisitions")
//                 {

//                     Caption = 'Imprest Requisitions';
//                     RunObject = Page "FIN-Imprest List UP";
//                     ApplicationArea = All;
//                 }
//                 action("My Posted Imprests")
//                 {
//                     RunObject = page "FIN-Posted imprest list";
//                     ApplicationArea = all;
//                 }
//                 action("Imprest Accounting")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Imprest Accounting';
//                     Image = Journal;
//                     RunObject = Page "FIN-Imprest Accounting";
//                     ToolTip = 'Imprest Accounting';
//                 }
//                 action("Memo applications")
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Memo Application';

//                     RunObject = Page "FIN-Memo Header List All";
//                     ToolTip = 'Create Memo application from departments.';
//                 }
//                 action("Leave Reliever")
//                 {

//                     Caption = 'Leave Reliever Requests';
//                     RunObject = Page "HRM-Leave Reliever";
//                     ApplicationArea = All;
//                 }
//                 action("Leave Planner")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Individual Leave Planner List";
//                 }
//                 action("Leave Applications")
//                 {

//                     Caption = 'Leave Applications';
//                     RunObject = Page "HRM-Leave Requisition List";
//                     ApplicationArea = All;
//                 }

//                 action("Individual Training Projections")
//                 {
//                     ApplicationArea = all;

//                     RunObject = Page "Individual Projection List";
//                 }
//                 action("Training Application")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "HRM-Training Application List";
//                 }

//                 action("My Approved Leaves")
//                 {

//                     Caption = 'My Approved Leaves';
//                     Image = History;
//                     RunObject = Page "HRM-My Approved Leaves List";
//                     ApplicationArea = All;
//                 }


//                 action("Purchase  Requisitions")
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Purchase Requisitions';
//                     RunObject = Page "FIN-Purchase Requisition";
//                     ToolTip = 'Create purchase requisition from departments.';
//                 }


//             }





//         }

//     }
// }

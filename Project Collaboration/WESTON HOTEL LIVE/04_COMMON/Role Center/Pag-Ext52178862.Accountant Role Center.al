/// <summary>
/// PageExtension ExtAccountant Role Center (ID 52178862) extends Record Accountant Role Center.
/// </summary>
pageextension 52178862 "ExtAccountant Role Center" extends "Accountant Role Center"
{
    layout
    {

    }
    actions
    {
        addafter("Posted Documents")
        {
            group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = LotInfo;
                action("Stores Requisitions")
                {

                    Caption = 'Stores Requisitions';
                    RunObject = Page "PROC-Store Requisition";
                    ApplicationArea = All;
                }
                action("Imprest Requisitions")
                {

                    Caption = 'Imprest Requisitions';
                    RunObject = Page "FIN-Imprest List UP";
                    ApplicationArea = All;
                }
                action("Purchase  Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Requisitions';

                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Create purchase requisition from departments.';
                }
                action("Memo applications")
                {
                    ApplicationArea = Suite;
                    Caption = 'Memo Application';

                    RunObject = Page "FIN-Memo Header List All";
                    ToolTip = 'Create Memo application from departments.';
                }
                action("Leave Applications")
                {

                    Caption = 'Leave Applications';
                    RunObject = Page "HRM-Leave Requisition List";
                    ApplicationArea = All;
                }
                action("My Approved Leaves")
                {

                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }

            }
        }
        addafter("Recurring Fixed Asset Journals")
        {
            action("Fixed Asset Setup")
            {
                ApplicationArea = all;
                Caption = 'Fixed Asset Setup';
                RunObject = page "Fixed Asset Setup";
            }
        }
        addbefore("Trial Bala&nce/Budget")
        {
            action("Detailed Trial Balance")
            {
                ApplicationArea = all;
                Caption = 'Trial Balance Detail/Summary';
                RunObject = report "Trial Balance Detail/Summary2";
                Image = Report;
            }

        }
        addafter("Cash Management")
        {
            group("Finance Operations")
            {
                Caption = 'Finance Operations';
                Image = Journals;
                ToolTip = 'Imprests, Payment and bank transfers';

                action("Receipts List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Receipts List';
                    Image = Journal;
                    RunObject = Page "FIN-Receipts List";
                    ToolTip = 'Receipts List';
                }

                action("Posted Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Receipts List';
                    Image = Journal;
                    RunObject = Page "FIN-Posted Receipts list";
                    ToolTip = 'Posted Receipts';
                }


                action("Imprest")
                {//Receipt List
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Warrant';
                    Image = Journal;
                    RunObject = Page "FIN-Imprests List";
                    //RunPageView = WHERE("Template Type" = CONST(General),Recurring = CONST(false));
                    ToolTip = 'Imprest Requests';
                }

                action("Posted Imprest")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Imprest';
                    Image = Journal;
                    RunObject = Page "FIN-Posted imprest list";
                    ToolTip = 'Posted Imprests';
                }
                action("Imprest Accounting")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Accounting';
                    Image = Journal;
                    RunObject = Page "FIN-Imprest Accounting";
                    ToolTip = 'Imprest Accounting';
                }
                action("Posted Imprest Accounting")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Imprest Accounting';
                    Image = Journal;
                    //RunObject = Page "FIN-Travel Advance Acc. UP";
                    RunObject = Page "FIN-Posted Imprest Accounting";
                    //RunObject = Page "FIN-Posted Travel Advs. Acc.";
                    ToolTip = 'Posted Imprest Accounting';
                }
                action("Payment Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Vouchers';
                    Image = Journal;
                    RunObject = Page "FIN-Payment Vouchers";
                    ToolTip = 'Payment Vouchers';
                }
                action("Posted Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Vouchers';
                    Image = Journal;
                    RunObject = Page "FIN-Posted Payment Vouch.";
                    ToolTip = 'Posted Payment Vouchers';
                }
                action("Petty Cash")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Petty Cash';
                    Image = Journal;
                    RunObject = Page "FIN-Petty Cash Vouchers List";
                    ToolTip = 'Petty Cash Vouchers';
                }
                action("Posted Petty Cash")
                {
                    ApplicationArea = All;
                    Image = PostedDeposit;
                    RunObject = page "FIN-Petty Cash Posted List";
                }
                action("Inter Bank Tranfers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Transfers';
                    Image = Journal;
                    RunObject = Page "FIN-Interbank Transfer";
                    ToolTip = 'Bank Trasfers';
                }
                action("Posted Bank Trasfers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Bank Transfers';
                    Image = Journal;
                    RunObject = Page "FIN-Posted Interbank Trans2";
                    ToolTip = 'Posted Bank Trasfers';
                }
            }
            group("Financial Setups")
            {
                Caption = 'Financial Setups';
                Image = Setup;
                ToolTip = 'Financial Setups';

                action("Cash Office User Templet")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Office User Templet';
                    Image = Setup;
                    RunObject = Page "Cash Office User Template UP";
                    ToolTip = 'Cash Office User Templet';
                }

                action("Imprests Types")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprests Types';
                    Image = Journal;
                    RunObject = Page "FIN-Imprest Types";
                    //RunPageView = WHERE("Template Type" = CONST(General),Recurring = CONST(false));
                    ToolTip = 'Imprest Requests';
                }

                action("Payment Types")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Types';
                    Image = Journal;
                    RunObject = Page "FIN-Payment Types";
                    //RunPageView = WHERE("Template Type" = CONST(General),Recurring = CONST(false));
                    ToolTip = 'Payment Types';
                }

                action("Receipt Types")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Receipt Types';
                    Image = Journal;
                    RunObject = Page "FIN-Receipts Types";
                    ToolTip = 'Receipt Types';
                }

                action("Claim Types")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Claim Types';
                    Image = Journal;
                    RunObject = Page "FIN-Claim Types";
                    ToolTip = 'Claim Types';

                }
                action("Tarrif Codes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Tarriff Codes Setup';
                    Image = Journal;
                    RunObject = Page "FIN-Tarriff Codes List";
                    ToolTip = 'FIN-Tarriff Codes List';
                }

                action("Cash Office Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Office Setup';
                    Image = Journal;
                    RunObject = Page "Cash Office Setup UP";
                    //RunPageView = WHERE("Template Type" = CONST(General),Recurring = CONST(false));
                    ToolTip = 'Cash Office Setup';
                }

                action("Budgetary Control setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Budgetary Control setup';
                    Image = Journal;
                    RunObject = Page "Budgetary Control Setup";
                    //RunPageView = WHERE("Template Type" = CONST(General),Recurring = CONST(false));
                    ToolTip = 'Budgetary Control setup';
                }
                action("Budget Entries")
                {
                    applicationarea = all;
                    runobject = page "FIN-Budget Entries List";
                }
                action("Edms")
                {
                    ApplicationArea = All;
                    RunObject = Page EDMS;
                }

            }
            group(Memo)
            {
                Caption = 'Memo';
                Image = Marketing;
                ToolTip = 'Memo Processing';
                action("Memo Application")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Memo Applications';
                    Image = Setup;
                    RunObject = Page "FIN-Memo List All";

                    ToolTip = 'Memo';
                }

                action(MemoRegions)
                {
                    ApplicationArea = All;
                    Caption = 'Region Classifications';
                    Image = List;

                    RunObject = Page "Fin Memo Regions List";
                }
                action("Memo References")
                {
                    ApplicationArea = All;
                    Image = ReferenceData;

                    RunObject = Page "FIN-Memo Refs";
                }
                action("Ministry Representatives")
                {
                    ApplicationArea = All;

                    RunObject = Page "HRM-Other Payees";
                }

            }
            group(BoardPayroll)
            {
                Caption = 'Board Payroll';
                action("BoardAlmanac")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Board Almanac List';
                    Image = CalendarWorkcenter;
                    RunObject = Page "Board Almanac List";
                    ToolTip = 'Board Calander';
                }
                action(AlmanacV)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Yearly Almanac';
                    Image = ProfileCalender;
                    RunObject = page "NW-Boad Almanac ViewL";
                }
                action("BoardCommittes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Board Commitees';
                    Image = Group;
                    RunObject = Page "Board Committes Listing";
                    ToolTip = 'Board Commitees';
                }
                action("BoardTax")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Board TAx';
                    Image = Payment;
                    RunObject = Page "Board Tax setup";
                    ToolTip = 'Board Tax';
                }
                action("MileageRates")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Mileage Rates';
                    Image = Payment;
                    RunObject = Page "NW-Mileage Allowance Rates";
                    ToolTip = 'Mileage Rates';
                }
                action(GlAccounts)
                {
                    Caption = 'Board Accounts';
                    ApplicationArea = Basic, Suite;
                    Image = Accounts;
                    RunObject = Page "NW-Board GL Accounts";
                    ToolTip = 'Specifies the accounts to be credited and debited';
                }
                action("BoardEntitlements")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Board Entitlements';
                    Image = Payment;
                    RunObject = Page "Board Members Allowances";
                    ToolTip = 'Board Commitees';
                }
                action("BoardMembers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Board Members';
                    Image = Payment;
                    RunObject = Page "NW-Board Members List";
                    ToolTip = 'Board Payroll Card';
                }
                action("BoardPayrolls")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Board Payroll';
                    Image = Payment;
                    RunObject = Page "NW-Board Payroll";
                    ToolTip = 'Board Payroll Card';
                }
                action(PrlPeriod)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payroll Period';
                    Image = Payment;
                    RunObject = Page "NW-Board Payroll Periods";
                    ToolTip = 'Board Payroll Periods';
                }
            }
            Group(EFTPayments)
            {
                Caption = 'EFT Payment';
                Image = CashFlow;

                action(BatchHeader)
                {
                    ApplicationArea = All;
                    Caption = 'Batch Header';
                    Image = PostBatch;
                    RunObject = page "EFT batch Header";

                }


            }
        }



    }
}

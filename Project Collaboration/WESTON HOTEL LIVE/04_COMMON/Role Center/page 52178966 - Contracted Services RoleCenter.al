/// <summary>
/// Page Contracted Services RoleCenter (ID 52178481).
/// </summary>
page 52178966 "Contracted Services RoleCenter"

{
    Caption = 'Administration', Comment = 'Use same translation as ''Profile Description'' (if applicable)';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }

            part("Approvals1"; "Approvals Activities Initial")
            {
                ApplicationArea = Suite;
            }
            part("Approvals2"; "Approvals Activities One")
            {
                ApplicationArea = Suite;
            }
            part("Approvals3"; "Approvals Activities Two")
            {
                ApplicationArea = Suite;
            }
            part("Approvals4"; "Approvals Activities Three")
            {
                ApplicationArea = Suite;

            }
            part("Approvals5"; "Approvals Activities Four")
            {
                ApplicationArea = Suite;

            }
            part("Approvals6"; "Approvals Activities Five")
            {
                ApplicationArea = Suite;

            }
            part("Approvals7"; "Approvals Activities six")
            {
                ApplicationArea = Suite;
            }
            part("Approvals8"; "Approvals Activities seven")
            {
                ApplicationArea = Suite;
            }
            part("Approvals9"; "Approvals Activities Eight")
            {
                ApplicationArea = Suite;
            }
            part("Approvals10"; "Approvals Activities Nine")
            {
                ApplicationArea = Suite;
            }
            part("Approvals11"; "Approvals Activities Ten")
            {
                ApplicationArea = Suite;
            }
            part("Approvals12"; "Approvals Activities Eleven")
            {
                ApplicationArea = Suite;
            }
            part("Approvals13"; "Approvals Activities Twelve")
            {
                ApplicationArea = Suite;
            }
            part("Approvals14"; "Approvals Activities Thirteen")
            {
                ApplicationArea = Suite;
            }
            part(Control76; "Headline RC Accountant")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control1902304208; "Accountant Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control1020030; "Team Member Activities")
            {
                ApplicationArea = Suite;
            }

            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }

            part(Control1907692008; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control1020028; "My Vendors")
            {
                ApplicationArea = Basic, Suite;
            }
            group(Control1900724708)
            {
                ShowCaption = false;
            }
            part(Control1020027; "Finance Performance")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control9; "Help And Chart Wrapper")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control10; "Product Video Topics")
            {
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced with Assisted Setup.';
                Visible = false;
                ApplicationArea = All;
                ObsoleteTag = '17.0';
            }
            part(Control100; "Cash Flow Forecast Chart")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control108; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
            part(Control122; "Power BI Report Spinner Part")
            {
                ApplicationArea = Basic, Suite;
            }
            systempart(Control1901377608; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {

        /*  area(embedding)
         {
             action("Contracts")
             {
                 ApplicationArea = Basic, Suite;
                 Caption = 'Chart of Accounts';
                 RunObject = Page "Chart of Accounts";
                 ToolTip = 'Open the chart of accounts.';
             }

         } */

        area(sections)
        {
            group(Contracts)
            {
                Caption = 'Contracts';
                image = Job;
                action(ContractList)
                {
                    Caption = 'Contracts List';
                    ApplicationArea = All;

                    RunObject = Page "Outsourced Contract List";
                }//"Contract Renewal List"

                action(ContractRenewal)
                {
                    Caption = 'Contract Renewals';
                    ApplicationArea = All;

                    RunObject = Page "Contract Renewal List";
                }//

            }
            /*      group("Staff Housing")
                 {
                     Caption = 'Staff Housing';

                     action(BlockList)
                     {
                         Caption = 'Block List';
                         ApplicationArea = All;
                         Promoted = true;
                         PromotedCategory = process;
                         RunObject = page "Block Listing";
                     }//"Housing Application"

                     action(Application)
                     {
                         Caption = 'Applications';
                         ApplicationArea = All;
                         Promoted = true;
                         PromotedCategory = process;
                         RunObject = page "Housing Application";
                     }//"Housing Application"

                     action(ExitForm)
                     {
                         Caption = 'Exit form';
                         ApplicationArea = All;
                         Promoted = true;
                         PromotedCategory = process;
                         RunObject = Page "House Exiting Form";
                     }//"Housing Pending Approval"

                     action(ExitPending)
                     {
                         Caption = 'Exit Pending Approval';
                         ApplicationArea = All;
                         Promoted = true;
                         PromotedCategory = process;
                         RunObject = Page "Housing Pending Approval";
                     }//"Housing Pending Approval"


                 }

                 group(KeYNamangement)
                 {
                     Caption = 'Keys Management';
                     action(OfficeBlocks)
                     {
                         Caption = 'Office Blocks';
                         ApplicationArea = All;
                         Promoted = true;
                         PromotedCategory = process;
                         RunObject = Page "Key Blocks List";
                     }

                 }
      */
            group(Action16)
            {
                Caption = 'Fixed Assets';
                Image = FixedAssets;
                ToolTip = 'Manage depreciation and insurance of your fixed assets.';
                action(Action17)
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Fixed Assets';

                    RunObject = Page "Fixed Asset List";
                    ToolTip = 'Manage periodic depreciation of your machinery or machines, keep track of your maintenance costs, manage insurance policies related to fixed assets, and monitor fixed asset statistics.';
                }
                action("Fixed Assets G/L Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Fixed Assets G/L Journals';

                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Assets),
                                        Recurring = CONST(false));
                    ToolTip = 'Post fixed asset transactions, such as acquisition and depreciation, in integration with the general ledger. The FA G/L Journal is a general journal, which is integrated into the general ledger.';
                }
                action("Fixed Assets Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Fixed Assets Journals';

                    RunObject = Page "FA Journal Batches";
                    RunPageView = WHERE(Recurring = CONST(false));
                    ToolTip = 'Post fixed asset transactions, such as acquisition and depreciation book without integration to the general ledger.';
                }
                action("Fixed Assets Reclass. Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Fixed Assets Reclass. Journals';

                    RunObject = Page "FA Reclass. Journal Batches";
                    ToolTip = 'Transfer, split, or combine fixed assets by preparing reclassification entries to be posted in the fixed asset journal.';
                }
                action(Insurance)
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Insurance';

                    RunObject = Page "Insurance List";
                    ToolTip = 'Manage insurance policies for fixed assets and monitor insurance coverage.';
                }
                action("Insurance Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Insurance Journals';

                    RunObject = Page "Insurance Journal Batches";
                    ToolTip = 'Post entries to the insurance coverage ledger.';
                }
                action("Recurring Fixed Asset Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Recurring Fixed Asset Journals';

                    RunObject = Page "FA Journal Batches";
                    RunPageView = WHERE(Recurring = CONST(true));
                    ToolTip = 'Post recurring fixed asset transactions, such as acquisition and depreciation book without integration to the general ledger.';
                }
            }


        }
        area(creation)
        {
            action(Action1020012)
            {
                AccessByPermission = TableData "Gen. Journal Template" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Deposit';
                //RunObject = Page deposi
                RunPageMode = Create;
                ToolTip = 'Create a new deposit. ';
            }
        }
        area(processing)
        {
            group(Bank)
            {
                Caption = 'Bank';
                action("Payment Reconciliation Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Reconciliation Journals';
                    Image = ApplyEntries;

                    RunObject = Page "Pmt. Reconciliation Journals";
                    RunPageMode = View;
                    ToolTip = 'Open the list of journals where you can reconcile unpaid documents automatically with their related bank transactions by importing bank a bank statement feed or file.';
                }
            }
            group(Action1020015)
            {
                Caption = 'General';
                action("General Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Journal';
                    Image = GeneralLedger;
                    RunObject = Page "General Journal Batches";
                    RunPageMode = View;
                    RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(false));
                    ToolTip = 'Prepare to post any transaction to the company books.';
                }
                action("Recurring General Journal")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Recurring General Journal';
                    Image = GL;
                    RunObject = Page "General Journal Batches";
                    RunPageMode = View;
                    RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(true));
                    ToolTip = 'Prepare to post any recurring transaction to the company books.';
                }
            }
            group(Receivables)
            {
                Caption = 'Receivables';
                action("Cash Receipt Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Receipt Journals';
                    Image = CashReceiptJournal;
                    RunObject = Page "General Journal Batches";
                    RunPageMode = View;
                    RunPageView = WHERE("Template Type" = CONST("Cash Receipts"),
                                        Recurring = CONST(false));
                    ToolTip = 'Register received payments by applying them to the related customer, vendor, or bank ledger entries.';
                }
            }
            group(Payables)
            {
                Caption = 'Payables';
                action("Payment Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Journals';
                    Image = PaymentJournal;
                    RunObject = Page "General Journal Batches";
                    RunPageMode = View;
                    RunPageView = WHERE("Template Type" = CONST(Payments),
                                        Recurring = CONST(false));
                    ToolTip = 'Open the list of payment journals where you can register payments to vendors.';
                }
                action("Purchase Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Journals';
                    Image = Purchasing;
                    RunObject = Page "General Journal Batches";
                    RunPageMode = View;
                    RunPageView = WHERE("Template Type" = CONST(Purchases),
                                        Recurring = CONST(false));
                    ToolTip = 'Open the list of purchase journals where you can batch post purchase transactions to G/L, bank, customer, vendor and fixed assets accounts.';
                }
                action("Purchase Credit Memos")
                {
                    AccessByPermission = TableData "Purchase Header" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Credit Memos';
                    Image = CreditMemo;
                    RunObject = Page "Purchase Credit Memo";
                    ToolTip = 'Open the list of purchase credit memos where you can manage returned items to a vendor.';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                group("Financial Statements")
                {
                    Caption = 'Financial Statements';
                    Image = ReferenceData;
                    action("Balance Sheet")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Balance Sheet';
                        Image = "Report";

                        RunObject = Report "Balance Sheet";
                        ToolTip = 'View a report that shows your company''s assets, liabilities, and equity.';
                    }
                    action("Income Statement")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Income Statement';
                        Image = "Report";

                        RunObject = Report "Income Statement";
                        ToolTip = 'View a report that shows your company''s income and expenses.';
                    }
                    action("Statement of Cash Flows")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Cash Flows';
                        Image = "Report";

                        RunObject = Report "Statement of Cashflows";
                        ToolTip = 'View a financial statement that shows how changes in balance sheet accounts and income affect the company''s cash holdings, displayed for operating, investing, and financing activities respectively.';
                    }
                    action("Statement of Retained Earnings")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement of Retained Earnings';
                        Image = "Report";

                        RunObject = Report "Retained Earnings Statement";
                        ToolTip = 'View a report that shows your company''s changes in retained earnings for a specified period by reconciling the beginning and ending retained earnings for the period, using information such as net income from the other financial statements.';
                    }
                }
                group("Excel Reports")
                {
                    Caption = 'Excel Reports';
                    Image = Excel;
                    action(ExcelTemplatesBalanceSheet)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Balance Sheet';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Balance Sheet";
                        ToolTip = 'Open a spreadsheet that shows your company''s assets, liabilities, and equity.';
                    }
                    action(ExcelTemplateIncomeStmt)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Income Statement';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Income Stmt.";
                        ToolTip = 'Open a spreadsheet that shows your company''s income and expenses.';
                    }
                    action(ExcelTemplateCashFlowStmt)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Cash Flow Statement';
                        Image = "Report";
                        RunObject = Codeunit "Run Template CashFlow Stmt.";
                        ToolTip = 'Open a spreadsheet that shows how changes in balance sheet accounts and income affect the company''s cash holdings.';
                    }
                    action(ExcelTemplateRetainedEarn)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Retained Earnings Statement';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Retained Earn.";
                        ToolTip = 'Open a spreadsheet that shows your company''s changes in retained earnings based on net income from the other financial statements.';
                    }
                    action(ExcelTemplateTrialBalance)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Trial Balance';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Trial Balance";
                        ToolTip = 'Open a spreadsheet that shows a summary trial balance by account.';
                    }
                    action(ExcelTemplateAgedAccPay)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Aged Accounts Payable';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Aged Acc. Pay.";
                        ToolTip = 'Open a spreadsheet that shows a list of aged remaining balances for each vendor by period.';
                    }
                    action(ExcelTemplateAgedAccRec)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Aged Accounts Receivable';
                        Image = "Report";
                        RunObject = Codeunit "Run Template Aged Acc. Rec.";
                        ToolTip = 'Open a spreadsheet that shows when customer payments are due or overdue by period.';
                    }
                }
                action("Run Consolidation")
                {
                    ApplicationArea = Suite;
                    Caption = 'Run Consolidation';
                    Ellipsis = true;
                    Image = ImportDatabase;
                    RunObject = Report "Import Consolidation from DB";
                    ToolTip = 'Run the Consolidation report.';
                }
            }
            group(Setup)
            {
                Caption = 'Setup';
                action(Action112)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Assisted Setup';
                    Image = QuestionaireSetup;
                    RunObject = Page "Assisted Setup";
                    ToolTip = 'Set up core functionality such as sales tax, sending documents as email, and approval workflow by running through a few pages that guide you through the information.';
                }
                action("Accounting /Periods")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Accounting /Periods';
                    Image = AccountingPeriods;
                    RunObject = Page "Accounting Periods";
                    ToolTip = 'Set up the number of accounting periods, such as 12 monthly periods, within the fiscal year and specify which period is the start of the new fiscal year.';
                }
                action("General &Ledger Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General &Ledger Setup';
                    Image = Setup;
                    RunObject = Page "General Ledger Setup";
                    ToolTip = 'Define your general accounting policies, such as the allowed posting period and how payments are processed. Set up your default dimensions for financial analysis.';
                }
                action("&Sales && Receivables Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Sales && Receivables Setup';
                    Image = Setup;
                    RunObject = Page "Sales & Receivables Setup";
                    ToolTip = 'Define your general policies for sales invoicing and returns, such as when to show credit and stockout warnings and how to post sales discounts. Set up your number series for creating customers and different sales documents.';
                }
                action("&Purchases && Payables Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Purchases && Payables Setup';
                    Image = Setup;
                    RunObject = Page "Purchases & Payables Setup";
                    ToolTip = 'Define your general policies for purchase invoicing and returns, such as whether to require vendor invoice numbers and how to post purchase discounts. Set up your number series for creating vendors and different purchase documents.';
                }
                action("Cost Accounting Setup")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Accounting Setup';
                    Image = CostAccountingSetup;
                    RunObject = Page "Cost Accounting Setup";
                    ToolTip = 'Specify how you transfer general ledger entries to cost accounting, how you link dimensions to cost centers and cost objects, and how you handle the allocation ID and allocation document number.';
                }
                action("Business Units")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Business Units';
                    Image = Setup;
                    RunObject = Page "Business Unit List";
                    ToolTip = 'Set up Business Units that you need to consolidate into this company.';
                }
            }
            group(History)
            {
                Caption = 'History';
                action("Navi&gate")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Find entries...';
                    Image = Navigate;
                    RunObject = Page Navigate;
                    ShortCutKey = 'Shift+Ctrl+I';
                    ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
                }
            }
            group(Flow)
            {
                Caption = 'Flow';
                action("Manage Flows")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Manage Flows';
                    Image = Flow;
                    RunObject = Page "Flow Selector";
                    ToolTip = 'Set up events and responses to connect users or tasks in workflows. ';
                }
            }
        }
    }
}
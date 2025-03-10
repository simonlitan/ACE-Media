/// <summary>
/// Page Finance Accountant (ID 52179116).
/// </summary>
page 52178892 "Finance Accountant"

{

    Caption = 'Accountant Role Center';
    PageType = RoleCenter;
    layout
    {
        area(rolecenter)
        {

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

            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
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
        }
    }

    actions
    {



        area(sections)
        {
            group(Action172)
            {
                Caption = 'General Ledger';
                Image = Journals;
                ToolTip = 'Collect and make payments, prepare statements, and reconcile bank accounts.';
                action("Chart of Account")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Accounts';
                    RunObject = Page "Chart of Accounts";
                    ToolTip = 'Open the chart of accounts.';
                }
                action("Account Schedules")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Account Schedules';

                    RunObject = Page "Account Schedule Names";
                    ToolTip = 'Get insight into the financial data stored in your chart of accounts. Account schedules analyze figures in G/L accounts, and compare general ledger entries with general ledger budget entries. For example, you can view the general ledger entries as percentages of the budget entries. Account schedules provide the data for core financial statements and views, such as the Cash Flow chart.';
                }

                group("General Setups.")
                {


                    action("Accounting Periods")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Accounting Periods';
                        Image = AccountingPeriods;
                        RunObject = Page "Accounting Periods";

                        ToolTip = 'Set up the number of accounting periods, such as 12 monthly periods, within the fiscal year and specify which period is the start of the new fiscal year.';
                    }
                    action("Number Series")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Number Series';
                        RunObject = Page "No. Series";
                        ToolTip = 'View or edit the number series that are used to organize transactions';
                    }
                    action(Dimensions)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Dimensions';
                        Image = Dimensions;

                        RunObject = Page Dimensions;
                        ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                    }
                    action(Action38)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Currencies';
                        Image = Currency;
                        RunObject = Page Currencies;
                        ToolTip = 'View the different currencies that you trade in or update the exchange rates by getting the latest rates from an external service provider.';
                    }
                    action("General Ledger Setup")
                    {
                        ApplicationArea = all;
                        Image = Report;
                        RunObject = page "General Ledger Setup";
                    }

                }



                group("Financial Setups")
                {
                    Caption = 'Financial Setups';

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
                    action("PettyCash Types")
                    {
                        Visible = true;
                        ApplicationArea = Basic, Suite;
                        Caption = 'PettyCash Types';
                        Image = Journal;
                        RunObject = Page "Fin-PettyCash Types";
                        // RunPageView = WHERE(Type = const("Petty Cash"));
                        ToolTip = 'PettyCash Types';
                    }
                    action("Claim Types")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Claim Types';
                        Image = Journal;
                        RunObject = Page "FIN-Claim Types";
                        ToolTip = 'Claim Types';

                    }
                    action("Advance Salary Type")
                    {
                        ApplicationArea = Basic, Suite;
                        //Caption = 'Claim Types';
                        Image = Journal;
                        RunObject = Page "Advance Salary Type";
                        //ToolTip = 'Claim Types';

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
                        //  RunPageView = WHERE("Template Type" = CONST(General),Recurring = CONST(false));
                        ToolTip = 'Budgetary Control setup';
                    }

                }
                group("Journal Vouchers")
                {
                    action("JVS")
                    {
                        Caption = 'End of Year Journal';
                        ApplicationArea = all;
                        image = AllocatedCapacity;
                        RunObject = page "Journal Voucher list";
                    }
                    action("Posted Jvs")
                    {
                        Caption = 'Posted Journal';
                        ApplicationArea = all;
                        image = AllocatedCapacity;
                        RunObject = page "Posted Journals";
                    }
                    action("General journal")
                    {
                        ApplicationArea = All;
                        Image = ApplicationWorksheet;
                        RunObject = page "General Journal";
                    }
                    action("Ledger Correction")
                    {
                        ApplicationArea = All;
                        Image = ApplicationWorksheet;
                        RunObject = page "Ledger Correction Buffer";
                    }
                }
                group("G/L Reports")
                {
                    Caption = 'G/L Reports';
                    action("&G/L Trial Balance")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = '&G/L Trial Balance';
                        Image = "Report";
                        RunObject = Report "Trial Balance";
                        ToolTip = 'View, print, or send a report that shows the balances for the general ledger accounts, including the debits and credits. You can use this report to ensure accurate accounting practices.';
                    }
                    action(" Detail Trial Balance")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Detail Trial Balance';
                        Image = "Report";
                        RunObject = Report "Trial Balance Detail/Summary2";
                        ToolTip = 'View, print, or send a report that shows a detailed trial balance for selected bank accounts. You can use the report at the close of an accounting period or fiscal year.';
                    }
                    action("&Bank Detail Trial Balance")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = '&Bank Detail Trial Balance';
                        Image = "Report";
                        RunObject = Report "Bank Acc. - Detail Trial Bal.";
                        ToolTip = 'View, print, or send a report that shows a detailed trial balance for selected bank accounts. You can use the report at the close of an accounting period or fiscal year.';
                    }
                    action("&Account Schedule")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = '&Account Schedule';
                        Image = "Report";
                        RunObject = Report "Account Schedule";
                        ToolTip = 'Open an account schedule to analyze figures in general ledger accounts or to compare general ledger entries with general ledger budget entries.';
                    }
                    action("Bu&dget")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bu&dget';
                        Image = "Report";
                        RunObject = Report Budget;
                        ToolTip = 'View or edit estimated amounts for a range of accounting periods.';
                    }
                    action("Trial Bala&nce/Budget")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Trial Bala&nce/Budget';
                        Image = "Report";
                        RunObject = Report "Trial Balance/Budget";
                        ToolTip = 'View a trial balance in comparison to a budget. You can choose to see a trial balance for selected dimensions. You can use the report at the close of an accounting period or fiscal year.';
                    }
                    action("Trial Balance by &Period")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Trial Balance by &Period';
                        Image = "Report";
                        RunObject = Report "Trial Balance by Period";
                        ToolTip = 'Show the opening balance by general ledger account, the movements in the selected period of month, quarter, or year, and the resulting closing balance.';
                    }
                    action("&Fiscal Year Balance")
                    {
                        Visible = false;
                        ApplicationArea = Basic, Suite;
                        Caption = '&Fiscal Year Balance';
                        Image = "Report";
                        RunObject = Report "Fiscal Year Balance";
                        ToolTip = 'View, print, or send a report that shows balance sheet movements for selected periods. The report shows the closing balance by the end of the previous fiscal year for the selected ledger accounts. It also shows the fiscal year until this date, the fiscal year by the end of the selected period, and the balance by the end of the selected period, excluding the closing entries. The report can be used at the close of an accounting period or fiscal year.';
                    }
                    action("Balance Comp. - Prev. Y&ear")
                    {
                        Visible = false;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Balance Comp. - Prev. Y&ear';
                        Image = "Report";
                        RunObject = Report "Balance Comp. - Prev. Year";
                        ToolTip = 'View a report that shows your company''s assets, liabilities, and equity compared to the previous year.';
                    }
                    action("&Closing Trial Balance")
                    {
                        Visible = false;
                        ApplicationArea = Basic, Suite;
                        Caption = '&Closing Trial Balance';
                        Image = "Report";
                        RunObject = Report "Closing Trial Balance";
                        ToolTip = 'View, print, or send a report that shows this year''s and last year''s figures as an ordinary trial balance. The closing of the income statement accounts is posted at the end of a fiscal year. The report can be used in connection with closing a fiscal year.';
                    }
                    action("Dimensions - Total")
                    {
                        Visible = false;
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions - Total';
                        Image = "Report";
                        RunObject = Report "Dimensions - Total";
                        ToolTip = 'View how dimensions or dimension sets are used on entries based on total amounts over a specified period and for a specified analysis view.';
                    }

                }
                group(Reports)
                {
                    Caption = 'Reports';
                    group("Financial Statements")
                    {
                        Caption = 'Financial Statements';

                        action("Balance Sheet")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Balance Sheet';
                            Image = "Report";
                            RunObject = Report "Balance Sheet";
                            ToolTip = 'View a report that shows your company''s assets, liabilities, and equity.';
                        }
                        action("Detailed Trial Balance")
                        {
                            ApplicationArea = all;
                            Caption = 'Trial Balance Detail/Summary';
                            RunObject = report "Trial Balance Detail/Summary2";
                            Image = Report;
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

                group("VAT Reports.")
                {
                    Caption = 'VAT Reports';
                    action("&VAT Registration No. Check")
                    {
                        Visible = false;
                        ApplicationArea = VAT;
                        Caption = '&VAT Registration No. Check';
                        Image = "Report";
                        RunObject = Report "VAT Registration No. Check";
                        ToolTip = 'Use an EU VAT number validation service to validated the VAT number of a business partner.';
                    }
                    action("VAT E&xceptions")
                    {
                        Visible = false;
                        ApplicationArea = VAT;
                        Caption = 'VAT E&xceptions';
                        Image = "Report";
                        RunObject = Report "VAT Exceptions";
                        ToolTip = 'View the VAT entries that were posted and placed in a general ledger register in connection with a VAT difference. The report is used to document adjustments made to VAT amounts that were calculated for use in internal or external auditing.';
                    }
                    action("VAT &Statement")
                    {
                        ApplicationArea = VAT;
                        Caption = 'VAT &Statement';
                        Image = "Report";
                        RunObject = Report "VAT Statement";
                        ToolTip = 'View a statement of posted VAT and calculate the duty liable to the customs authorities for the selected period.';
                    }

                    group("General Setups")
                    {
                        Visible = false;

                        action("Cost Accounting P/L Statement")
                        {
                            ApplicationArea = CostAccounting;
                            Caption = 'Cost Accounting P/L Statement';
                            Image = "Report";
                            RunObject = Report "Cost Acctg. Statement";
                            ToolTip = 'View the credit and debit balances per cost type, together with the chart of cost types.';
                        }
                        action("CA P/L Statement per Period")
                        {
                            ApplicationArea = CostAccounting;
                            Caption = 'CA P/L Statement per Period';
                            Image = "Report";
                            RunObject = Report "Cost Acctg. Stmt. per Period";
                            ToolTip = 'View profit and loss for cost types over two periods with the comparison as a percentage.';
                        }
                        action("CA P/L Statement with Budget")
                        {
                            ApplicationArea = CostAccounting;
                            Caption = 'CA P/L Statement with Budget';
                            Image = "Report";
                            RunObject = Report "Cost Acctg. Statement/Budget";
                            ToolTip = 'View a comparison of the balance to the budget figures and calculates the variance and the percent variance in the current accounting period, the accumulated accounting period, and the fiscal year.';
                        }
                        action("Cost Accounting Analysis")
                        {
                            ApplicationArea = CostAccounting;
                            Caption = 'Cost Accounting Analysis';
                            Image = "Report";
                            RunObject = Report "Cost Acctg. Analysis";
                            ToolTip = 'View balances per cost type with columns for seven fields for cost centers and cost objects. It is used as the cost distribution sheet in Cost accounting. The structure of the lines is based on the chart of cost types. You define up to seven cost centers and cost objects that appear as columns in the report.';
                        }
                    }
                }

            }
            group("Cash Management")
            {
                Caption = 'Cash Management';
                ToolTip = 'Process incoming and outgoing payments. Set up bank accounts and service connections for electronic banking.  ';
                action(CashReceiptJournals)
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Receipt Journals';
                    Image = Journals;


                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST("Cash Receipts"),
                                        Recurring = CONST(false));
                    ToolTip = 'Register received payments by manually applying them to the related customer, vendor, or bank ledger entries. Then, post the payments to G/L accounts and thereby close the related ledger entries.';
                }
                action(PaymentJournals)
                {
                    Visible = false;

                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Journals';
                    Image = Journals;


                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Payments),
                                        Recurring = CONST(false));
                    ToolTip = 'Register payments to vendors. A payment journal is a type of general journal that is used to post outgoing payment transactions to G/L, bank, customer, vendor, employee, and fixed assets accounts. The Suggest Vendor Payments functions automatically fills the journal with payments that are due. When payments are posted, you can export the payments to a bank file for upload to your bank if your system is set up for electronic banking. You can also issue computer checks from the payment journal.';
                }
                action(Action164)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;


                    RunObject = Page "Bank Account List";
                    ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
                }
                action("Direct Debit Collections")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Direct Debit Collections';


                    RunObject = Page "Direct Debit Collections";
                    ToolTip = 'Instruct your bank to withdraw payment amounts from your customer''s bank account and transfer them to your company''s account. A direct debit collection holds information about the customer''s bank account, the affected sales invoices, and the customer''s agreement, the so-called direct-debit mandate. From the resulting direct-debit collection entry, you can then export an XML file that you send or upload to your bank for processing.';
                }
                action("Payment Recon. Journals")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Recon. Journals';
                    Image = ApplyEntries;


                    RunObject = Page "Pmt. Reconciliation Journals";
                    ToolTip = 'Reconcile unpaid documents automatically with their related bank transactions by importing a bank statement feed or file. In the payment reconciliation journal, incoming or outgoing payments on your bank are automatically, or semi-automatically, applied to their related open customer or vendor ledger entries. Any open bank account ledger entries related to the applied customer or vendor ledger entries will be closed when you choose the Post Payments and Reconcile Bank Account action. This means that the bank account is automatically reconciled for payments that you post with the journal.';
                }
                action("Bank Acc. Statements")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Acc. Statements';
                    Image = BankAccountStatement;


                    RunObject = Page "Bank Account Statement List";
                    ToolTip = 'View statements for selected bank accounts. For each bank transaction, the report shows a description, an applied amount, a statement amount, and other information.';
                }
                action("Payment Terms")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Terms';
                    Image = Payment;


                    RunObject = Page "Payment Terms";
                    ToolTip = 'Set up the payment terms that you select from customer cards or sales documents to define when the customer must pay, such as within 14 days.';
                }
                action("Cash Flow Forecasts")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Forecasts';


                    RunObject = Page "Cash Flow Forecast List";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Chart of Cash Flow Accounts")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Cash Flow Accounts';


                    RunObject = Page "Chart of Cash Flow Accounts";
                    ToolTip = 'View a chart contain a graphical representation of one or more cash flow accounts and one or more cash flow setups for the included general ledger, purchase, sales, services, or fixed assets accounts.';
                }
                action("Cash Flow Manual Revenues")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Manual Revenues';


                    RunObject = Page "Cash Flow Manual Revenues";
                    ToolTip = 'Record manual revenues, such as rental income, interest from financial assets, or new private capital to be used in cash flow forecasting.';
                }
                action("Cash Flow Manual Expenses")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Manual Expenses';


                    RunObject = Page "Cash Flow Manual Expenses";
                    ToolTip = 'Record manual expenses, such as salaries, interest on credit, or planned investments to be used in cash flow forecasting.';
                }
                action(BankAccountReconciliations)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Account Reconciliations';
                    Image = BankAccountRec;


                    RunObject = Page "Bank Acc. Reconciliation List";
                    ToolTip = 'Reconcile bank accounts in your system with bank statements received from your bank.';
                }
                action(Customer)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'All Customers';
                    Image = Customer;
                    RunObject = Page "Customer List";
                    ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
                }
            }

            group(Receivables)
            {
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
                group(Customers)
                {

                    action(Customers1)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Staff Customers';
                        Image = Customer;
                        RunObject = Page "Customer Staff List";
                        ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
                    }
                    action(Customers2)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Interns Customers';
                        Image = Customer;
                        RunObject = Page "Customer Interns List";
                        ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
                    }
                    action(Customers3)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Board Customers';
                        Image = Customer;
                        RunObject = Page "Customer Board List";
                        ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
                    }
                    action(Customers4)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Other Customers';
                        Image = Customer;
                        RunObject = Page "Customer Others List";
                        ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
                    }

                }





            }
            group(Payables)
            {
                action(Vendors)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendors';
                    Image = Vendor;
                    RunObject = Page "Vendor List";
                    ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
                }
                action("Purchase Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Invoices';
                    Image = Invoice;
                    RunObject = Page "Purchase Invoices";
                    ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }
                action("Posted Purchase Invoices.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }
                action("P&urchase Credit Memo")
                {
                    AccessByPermission = TableData "Purchase Header" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'P&urchase Credit Memo';
                    RunObject = Page "Purchase Credit Memo";
                    RunPageMode = Create;
                    ToolTip = 'Create a new purchase credit memo so you can manage returned items to a vendor.';
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }


                action(VendorsBalance)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Balance';
                    Image = Balance;
                    RunObject = Page "Vendor List";
                    RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                    ToolTip = 'View a summary of the bank account balance in different periods.';
                }
                action("Purchase Orders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Orders';
                    RunObject = Page "Purchase Order List";
                    ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }

            }

            group("Payments.")
            {
                Caption = 'Payments';
                Image = Journals;
                ToolTip = 'Imprests, Payment and bank transfers';
                group(Payments)
                {
                    action("Payment Vouchers")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Payment Vouchers';

                        Image = Journal;
                        RunObject = Page "Pending Payment Vourchers";
                        //RunObject = page "Payment Voucher List";
                        ToolTip = 'Payment Vouchers';
                    }
                    action("Approved Payment Voucher")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'HOD Approved Payment Vouchers';
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
                    action("Archived Payment Vouchers")
                    {
                        ApplicationArea = Basic, Suite;

                        Image = Journal;
                        RunObject = Page "Archive PV";


                    }
                }

                group("Imprest.")
                {

                    action("Imprest")
                    {//Receipt List
                        ApplicationArea = Basic, Suite;
                        Caption = 'Imprest Warrant';
                        Image = Journal;
                        RunObject = Page "Fin- All Imprest";
                        //RunPageView = WHERE("Template Type" = CONST(General),Recurring = CONST(false));
                        ToolTip = 'Imprest Requests';
                    }
                    action("Approved Imprest")
                    {
                        ApplicationArea = all;
                        Image = Journal;
                        RunObject = page "Approved Imprest Requisitions";
                    }

                    action("Posted Imprest")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Imprest';
                        Image = Journal;
                        RunObject = Page "FIN-Posted Imprest List 2";
                        ToolTip = 'Posted Imprests';
                    }
                    action("Archived Imprest")
                    {
                        ApplicationArea = Basic, Suite;

                        Image = Journal;
                        RunObject = Page "Archived Imprest Document";


                    }
                }
                group("Imprest Surrender")
                {
                    action("Imprest Accounting")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Imprest Surrender';
                        Image = Journal;
                        RunObject = Page "Fin-Imprest Surrender";
                        ToolTip = 'Imprest Surrender';
                    }
                    action("Approved ImprestAccounting")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Approved Imprest Accounting';
                        Image = Journal;
                        RunObject = Page "Fin-Approved Imprest Surrender";
                        ToolTip = 'Approved Imprest Accounting';
                    }
                    action("Posted Imprest Accounting")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Imprest Accounting';
                        Image = Journal;
                        RunObject = Page "FIN-Posted Imprest Accounting";

                        ToolTip = 'Posted Imprest Accounting';
                    }
                     action("UnSurrendered Imprest")
                    {
                        ApplicationArea = Basic, Suite;
                        
                        Image = Journal;
                        RunObject = page "Un_Surrendered Imprests";

                        
                    }
                    action("Archived Imprest Accounting")
                    {
                        ApplicationArea = Basic, Suite;

                        Image = Journal;
                        RunObject = Page "Archive Surrenders";


                    }
                }
                group(SalaryAdvance)
                {

                    Caption = 'Salary Advance';
                    action(SalaryAdvance2)
                    {
                        Caption = 'Salary Advance';
                        ApplicationArea = all;
                        RunObject = page "FIN-Staff Advance List";

                    }
                    action(SalaryAdvance5)
                    {
                        Caption = 'Posted Salary Advance';
                        ApplicationArea = all;
                        RunObject = page "Posted Salary Advance";

                    }

                    action(SalaryAdvance3)
                    {
                        Caption = 'Salary Advance Surrender';
                        ApplicationArea = all;
                        RunObject = page "FIN-Staff Advance Surr. List";

                    }
                    action(SalaryAdvance6)
                    {
                        Caption = 'Posted Salary Advance Surrender';
                        ApplicationArea = all;
                        RunObject = page "Fin-Posted Salary Advance Surr";

                    }
                }

                group("Petty_Cash")
                {

                    action("PettyCash")
                    {
                        Visible = true;
                        ApplicationArea = ALL;
                        Image = Journal;
                        RunObject = Page "FIN-Petty Cash Vouchers List";
                    }
                    action("Posted PettyCash")
                    {
                        ApplicationArea = Basic, Suite;
                        Visible = true;
                        Image = Journal;
                        // RunObject = Page "FIN-Posted petty cash";
                        ToolTip = 'Posted Petty Cash Vouchers';
                    }
                }






                group("Claim Request")
                {

                    action(ClaimReq)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Claim Request List';
                        Image = Journal;
                        RunObject = Page "FIN-Staff Claim List";
                        ToolTip = 'Travel Request List';
                        //  FIN-Staff Claim List Posted
                    }
                    action("Posted Claim Request")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posted Claim List';
                        Image = Journal;
                        RunObject = Page "FIN-Staff Claim List Posted";

                        // FIN-Staff Claim List Posted
                    }



                }




                group("Inter Bank Transfer")
                {

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

            }



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
                /* action(Insurance)
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Insurance';

                    RunObject = Page "Insurance List";
                    ToolTip = 'Manage insurance policies for fixed assets and monitor insurance coverage.';
                } */
                /* action("Insurance Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Insurance Journals';

                    RunObject = Page "Insurance Journal Batches";
                    ToolTip = 'Post entries to the insurance coverage ledger.';
                } */
                action("Recurring Fixed Asset Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Recurring Fixed Asset Journals';

                    RunObject = Page "FA Journal Batches";
                    RunPageView = WHERE(Recurring = CONST(true));
                    ToolTip = 'Post recurring fixed asset transactions, such as acquisition and depreciation book without integration to the general ledger.';
                }
            }
            group("Journal Vourcher")
            {
                action("Journals Transfer")
                {
                    Caption = 'Journal Transfer';
                    ApplicationArea = all;
                    RunObject = page "Journal Voucher list";
                }
                action("Posted Jvs1")
                {
                    Caption = 'Posted Journal';
                    ApplicationArea = all;
                    image = AllocatedCapacity;
                    RunObject = page "Posted Journals";
                }
                action("LedgerCorrection")
                {
                    ApplicationArea = All;
                    Image = ApplicationWorksheet;
                    RunObject = page "Ledger Correction Buffer";
                }
            }
            group(Budget)
            {

                action(Budgets)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Budgets';
                    RunObject = Page "G/L Budget Names";
                    ToolTip = 'View or edit estimated amounts for a range of accounting periods.';
                }

                action("Budget Entries")
                {
                    applicationarea = all;
                    runobject = page "FIN-Budget Entries List";
                }

            }
            group("PR Invoices")
            {
                action("PR Invoice")
                {
                    ApplicationArea = all;
                    RunObject = page "Sales Invoice";
                }
                  action("Posted PR Invoice")
                {
                    ApplicationArea = all;
                    RunObject = page "Posted Sales Invoice";
                }
            }
             group(PayrollPeoro)
            {
                Caption = 'Payroll Products Reports';
                Image = RegisteredDocs;
                action("Detailed Payroll Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Master Payroll Summary';
                    Image = Report2;


                    RunObject = Report "Payroll Summary 3";
                }



                action(Action1000000047)
                {
                    ApplicationArea = all;
                    Caption = 'Company Payroll Summary';
                    Image = "Report";

                    RunObject = Report "PRL-Company Payroll Summary 3";
                }


                action(Action1000000044)
                {
                    ApplicationArea = all;
                    Caption = 'Earnings Summary';
                    Image = DepositSlip;
                    RunObject = Report "PRL-Earnings Summary 5";
                }
                /*  action(Action1000000042)
                 {
                     ApplicationArea = all;
                     Caption = 'Earnings Summary 2';
                     Image = "Report";

                     RunObject = Report "PRL-Payments Summary 2 a";
                 } */
                action("bank Schedule2")
                {
                    ApplicationArea = all;
                    Caption = 'bank Schedule';
                    Image = "Report";
                    RunObject = Report "PRL-Bank Schedule";
                }


                action(Action1000000045)
                {
                    ApplicationArea = all;
                    Caption = 'Deductions Summary';
                    Image = Report;
                    RunObject = Report "PRL-Deductions Summary 2 a";
                }



                action("Gratuity Report")
                {
                    ApplicationArea = all;
                    Image = PrintForm;
                    RunObject = report Gratuity;
                }
                action(Transactions)
                {
                    ApplicationArea = all;
                    Caption = 'Transactions';
                    Image = "Report";
                    RunObject = Report "pr Transactions";
                }


                action("Departmental Summary")
                {

                    ApplicationArea = all;
                    Caption = 'Departmental Summary';
                    Image = "Report";


                    RunObject = Report "Detailed Payrol Summary/Dept";
                }

                action(Action1000000040)
                {
                    ApplicationArea = all;
                    Caption = 'Gross Netpay';
                    Image = Giro;
                    RunObject = Report prGrossNetPay;
                }


                /* action("P.10")
                {
                    ApplicationArea = all;
                    Caption = 'P.10';
                    Image = "Report";

                    RunObject = Report P10;
                } */
                action("Paye Scheule")
                {
                    ApplicationArea = all;
                    Caption = 'Paye Schedule';
                    Image = "Report";

                    RunObject = Report "prPaye Schedule mst";
                }

                action("NSSF Schedule")
                {
                    ApplicationArea = all;
                    Caption = 'NSSF Schedule';
                    Image = "Report";

                    RunObject = Report "prNSSF mst";
                }


                /*  action("Pension Report")
                 {
                     ApplicationArea = all;
                     Caption = 'Combined Pension Report';
                     Image = PrintForm;


                     RunObject = Report "PRL - Pension Combined 2";
                 }
  */
                action("NHIF Report")
                {
                    ApplicationArea = all;
                    Caption = 'NHIF Report';
                    Image = "Report";

                    RunObject = Report "PRL-NHIF Report";
                }
                /* action("SACCO Report")
                {
                    ApplicationArea = all;
                    Caption = 'SACCO Report';
                    Image = "Report";

                    RunObject = Report "PRL-Welfare Report";
                } */
                action("HELB Report")
                {
                    ApplicationArea = all;
                    Caption = 'HELB Report';
                    Image = "Report";


                    RunObject = Report "PRL-HELB Report";
                }
                action("NSSF Report (A)")
                {
                    ApplicationArea = all;
                    Caption = 'NSSF Report Old Tier';
                    Image = "Report";

                    RunObject = Report "PRL-NSSF Report (A)";
                }
                action("NSSF Report")
                {
                    ApplicationArea = all;
                    Caption = 'New NSSF (Tier) Report';
                    Image = "Report";

                    RunObject = Report "New NSSF Report";
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
                action("Approved Memo Application")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Memo';
                    Image = Setup;
                    RunObject = Page "Approved Memo";
                    ToolTip = 'Memo';

                }
                action("Expense Code Setup")
                {
                    ApplicationArea = All;
                    Caption = 'Expense Codes';
                    Image = List;
                    RunObject = Page "FIN-Memo Expense Codes Setup";
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
                action("Non Staff")
                {
                    ApplicationArea = All;

                    RunObject = Page "HRM-Other Payees";
                }
            }



            group("General Activities")
            {

                group(Appraisal)
                {
                    action("Self Workplan")
                    {
                        ApplicationArea = all;
                        RunObject = page "Staff Workplan";
                    }
                    action("Self Appraisal")
                    {
                        ApplicationArea = all;
                        RunObject = page "Staff Self Appraisal";
                    }
                }

                action("Memo applications")
                {
                    ApplicationArea = Suite;
                    Caption = 'Memo Application';

                    RunObject = Page "FIN-Memo Header List All";
                    ToolTip = 'Create Memo application from departments.';
                }
                action("Approved Memo applications")
                {
                    Visible = false;
                    ApplicationArea = Suite;
                    Caption = 'Approved Memo Application';

                    RunObject = Page "FIN-Memo List All";
                    ToolTip = 'Create Memo application from departments.';
                }





                action("Imprest Requisitions")
                {

                    Caption = 'Imprest Requisitions';
                    ApplicationArea = all;
                    RunObject = page "FIN-Imprests List";

                }
                action("My Approved Imprest")
                {
                    Visible = false;
                    ApplicationArea = all;
                    RunObject = Page "FIN-Imprest List UP";

                }
                action("My Posted Imprests")
                {
                    Visible = false;
                    RunObject = page "FIN-Posted imprest list";
                    ApplicationArea = all;
                }



                action("ImprestAccounting")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Surrender';
                    Image = Journal;
                    RunObject = Page "FIN-Imprest Accounting";
                    ToolTip = 'Imprest Surrender';
                }
                action("ImprestAccounting.")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'My Approved Imprest Accounting';
                    Image = Journal;
                    RunObject = Page "Approved Imprest Surrender";
                    ToolTip = 'Imprest Surrender';
                }
                action("ImprestAccounting1")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'My Posted Imprest Accounting';
                    Image = Journal;
                    RunObject = Page "Posted Imprest Surrender";
                    ToolTip = 'Imprest Surrender';


                }
                action(SalaryAdvance8)
                {
                    Caption = 'Salary Advance';
                    ApplicationArea = all;
                    RunObject = page "Staff Advance";

                }
                action(ClaimReq1)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Claim Request List';
                    Image = Journal;
                    RunObject = Page "Staff Claim";
                    //ToolTip = 'Travel Request List';
                    //  FIN-Staff Claim List Posted
                }

                action("Leave Applications")
                {

                    Caption = 'Leave Applications';
                    RunObject = Page "HRM-All Leave Requisitions";
                    ApplicationArea = All;
                }
                action("Training Projection & Development")
                {
                    ApplicationArea = all;
                    RunObject = page "Training & Development List";
                }
                action("Approved Leave Applications")
                {
                    Visible = false;

                    Caption = 'My Approved Leave Applications';
                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }
                action("Posted Leave Applications")
                {
                    Visible = false;

                    Caption = 'My Posted Leave Applications';
                    RunObject = Page "HRM-Leave Requisition List";
                    ApplicationArea = All;
                }



                action("Purchase  Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Requisitions';

                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Create purchase requisition from departments.';
                }
                action("Approved Purchase  Requisitions")
                {
                    Visible = false;
                    ApplicationArea = Suite;
                    Caption = 'Approved Purchase Requisitions';

                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Create purchase requisition from departments.';
                }
                action("Posted Purchase  Requisitions")
                {
                    Visible = false;
                    ApplicationArea = Suite;
                    Caption = 'Posted Purchase Requisitions';

                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Create purchase requisition from departments.';
                }


                action("Stores Requisitions")
                {

                    Caption = 'Stores Requisitions';
                    RunObject = Page "PROC-Store Requisition";
                    ApplicationArea = All;
                }
                action("Approved Stores Requisitions")
                {
                    Visible = false;

                    Caption = 'Approved Stores Requisitions';
                    RunObject = Page "PROC-Store Requisition2";
                    ApplicationArea = All;

                }
                action("Posted Stores Requisitions")
                {
                    Visible = false;

                    Caption = 'Posted Stores Requisitions';
                    RunObject = Page "PROC-Posted Store Req List";
                    ApplicationArea = All;
                }

            }
        }
    }
}



















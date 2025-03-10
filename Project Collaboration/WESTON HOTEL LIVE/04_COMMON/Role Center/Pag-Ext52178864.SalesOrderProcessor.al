pageextension 52178864 "Sales Order Processor" extends "Order Processor Role Center"
{
    layout
    {


    }
    actions
    {
        addbefore(Action76)
        {
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
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Warrant';
                    Image = Journal;
                    RunObject = Page "FIN-Imprests List";
                    //RunPageView = WHERE("Template Type" = CONST(General),Recurring = CONST(false));
                    ToolTip = 'Imprest Requests';
                }

                action("Posted Imprest")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Imprest';
                    Image = Journal;
                    RunObject = Page "FIN-Posted imprest list";
                    ToolTip = 'Posted Imprests';
                }
                action("ImprestAccounting")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Accounting';
                    Image = Journal;
                    RunObject = Page "FIN-Imprest Accounting";
                    ToolTip = 'Imprest Accounting';
                }
                action("Posted Imprest Accounting")
                {
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
                action("Advance PettyCash")
                {
                    ApplicationArea = ALL;
                    Image = Journal;
                    RunObject = Page "Advance PettyCash List";
                }
                action("PettyCash Surrender")
                {
                    ApplicationArea = ALL;
                    Image = Journal;
                    RunObject = Page "Petty Cash Surrender List";
                }
                action("Posted Petty Cash")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Petty Cash';
                    Image = Journal;
                    RunObject = Page "FIN-Posted petty cash";
                    ToolTip = 'Posted Petty Cash Vouchers';
                }
                action(Claims)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Claims List';
                    Image = Journal;
                    RunObject = Page "FIN-Staff Claim List";
                    ToolTip = 'Claims List';
                    //FIN-Staff Claim List Posted
                }
                action("Posted Claims")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Claims List';
                    Image = Journal;
                    RunObject = Page "FIN-Staff Claim List Posted";
                    ToolTip = 'posted Claims List';
                    //FIN-Staff Claim List Posted
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
            group(Action172)
            {
                Caption = 'Finance';
                Image = Journals;
                ToolTip = 'Collect and make payments, prepare statements, and reconcile bank accounts.';
                action("General Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Journals';
                    Image = Journal;
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(false));
                    ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
                }
                action("Recurring General Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Recurring General Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(true));
                    ToolTip = 'Define how to post transactions that recur with few or no changes to general ledger, bank, customer, vendor, or fixed asset accounts';
                }
                action(Action170)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Accounts';


                    RunObject = Page "Chart of Accounts";
                    ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
                }
                action("G/L Account Categories")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Account Categories';


                    RunObject = Page "G/L Account Categories";
                    ToolTip = 'Personalize the structure of your financial statements by mapping general ledger accounts to account categories. You can create category groups by indenting subcategories under them. Each grouping shows a total balance. When you choose the Generate Account Schedules action, the account schedules for the underlying financial reports are updated. The next time you run one of these reports, such as the balance statement, new totals and subentries are added, based on your changes.';
                }
                action(Currencies)
                {
                    ApplicationArea = Suite;
                    Caption = 'Currencies';
                    Image = Currency;


                    RunObject = Page Currencies;
                    ToolTip = 'View the different currencies that you trade in or update the exchange rates by getting the latest rates from an external service provider.';
                }

                action(Action14)
                {
                    ApplicationArea = VAT;
                    Caption = 'VAT Statements';


                    RunObject = Page "VAT Statement Names";
                    ToolTip = 'View a statement of posted VAT amounts, calculate your VAT settlement amount for a certain period, such as a quarter, and prepare to send the settlement to the tax authorities.';
                }
                action("Intrastat Journals")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'Intrastat Journals';


                    RunObject = Page "Intrastat Jnl. Batches";
                    ToolTip = 'Summarize the value of your purchases and sales with business partners in the EU for statistical purposes and prepare to send it to the relevant authority.';
                }
                action("Analysis Views")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Analysis Views';


                    RunObject = Page "Analysis View List";
                    ToolTip = 'Analyze amounts in your general ledger by their dimensions using analysis views that you have set up.';
                }

                action(Deferrals)
                {
                    ApplicationArea = Suite;
                    Caption = 'Deferrals';
                    RunObject = Page "Deferral Template List";
                    ToolTip = 'Distribute revenues or expenses to the relevant accounting periods instead of the date of posting the transaction. Set up a deferral template for the resource, item, or G/L account that the revenue or expense will be posted for. When you post the related sales or purchase document, the revenue or expense is deferred to the involved accounting periods, according to a deferral schedule that is governed by settings in the deferral template and the posting date.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Suite;
                    Caption = 'Dimensions';
                    Image = Dimensions;


                    RunObject = Page Dimensions;
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action(Partners)
                {
                    ApplicationArea = Intercompany;
                    Caption = 'Partners';


                    RunObject = Page "IC Partner List";
                    ToolTip = 'Set up each company or department within the group of companies as an intercompany partner of type Vendor or Customer. Intercompany partners can then be inserted on regular sales and purchase documents or journal lines that are exchanged through the intercompany inbox/outbox system and posted to agreed accounts in an intercompany chart of accounts.';
                }
                action(Action171)
                {
                    ApplicationArea = Intercompany;
                    Caption = 'IC Chart of Accounts';


                    RunObject = Page "IC Chart of Accounts";
                    ToolTip = 'Manage intercompany transactions within your group of companies in an aligned chart of accounts that uses the same account numbers and settings. In the setup phase, the parent company of the group can create a simplified version of their own chart of accounts and exports it to an XML file that each subsidiary can quickly implement.';
                }
                action(Action173)
                {
                    ApplicationArea = Intercompany;
                    Caption = 'Intercompany Dimensions';


                    RunObject = Page "IC Dimensions";
                    ToolTip = 'Enable companies within a group to exchange transactions with dimensions and to perform financial analysis by dimensions across the group. The parent company of the group can create a simplified version of their own set of dimensions and export them to an XML file that each subsidiary can import into the intercompany Dimensions window and then map them to their own dimensions.';
                }

                action(Action38)
                {
                    ApplicationArea = Suite;
                    Caption = 'Currencies';
                    Image = Currency;
                    RunObject = Page Currencies;
                    ToolTip = 'View the different currencies that you trade in or update the exchange rates by getting the latest rates from an external service provider.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Duplicated action use action(Currencies)';
                    ObsoleteTag = '19.0';
                }

                action(Action144)
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    Visible = false;
                    RunObject = Page "Employee List";
                    ToolTip = 'Manage employees'' details and related information, such as qualifications and pictures, or register and analyze employee absence. Keeping up-to-date records about your employees simplifies personnel tasks. For example, if an employee''s address changes, you register this on the employee card.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Duplicated action use action(Employees)';
                    ObsoleteTag = '19.0';
                }

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

                action("Bank Account Posting Groups")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Account Posting Groups';
                    RunObject = Page "Bank Account Posting Groups";
                    ToolTip = 'Set up posting groups, so that payments in and out of each bank account are posted to the specified general ledger account.';
                }
            }
            group(Journals)
            {
                Caption = 'Journals';
                Image = Journals;
                ToolTip = 'Post financial transactions.';
                action(GeneralJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Journals';
                    Image = Journal;


                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(false));
                    ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
                }
                action("<Action3>")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Recurring General Journals';


                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(true));
                    ToolTip = 'Define how to post transactions that recur with few or no changes to general ledger, bank, customer, vendor, or fixed asset accounts';
                }

                action(ICGeneralJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'IC General Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Intercompany),
                                        Recurring = CONST(false));
                    ToolTip = 'Post intercompany transactions. IC general journal lines must contain either an IC partner account or a customer or vendor account that has been assigned an intercompany partner code.';
                }
                action(Action1102601002)
                {
                    ApplicationArea = BasicEU;
                    Caption = 'Intrastat Journals';
                    Image = "Report";
                    RunObject = Page "Intrastat Jnl. Batches";
                    ToolTip = 'Summarize the value of your purchases and sales with business partners in the EU for statistical purposes and prepare to send it to the relevant authority.';
                }
                action(PostedGeneralJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted General Journals';
                    RunObject = Page "Posted General Journal";
                    ToolTip = 'Open the list of posted general journal lines.';
                }
            }
            group("Cash Management")
            {
                Caption = 'Cash Management';
                ToolTip = 'Process incoming and outgoing payments. Set up bank accounts and service connections for electronic banking.  ';

                action(PaymentJournals)
                {
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
                    ApplicationArea = Basic, Suite;
                    Caption = 'Direct Debit Collections';


                    RunObject = Page "Direct Debit Collections";
                    ToolTip = 'Instruct your bank to withdraw payment amounts from your customer''s bank account and transfer them to your company''s account. A direct debit collection holds information about the customer''s bank account, the affected sales invoices, and the customer''s agreement, the so-called direct-debit mandate. From the resulting direct-debit collection entry, you can then export an XML file that you send or upload to your bank for processing.';
                }
                action("Payment Recon. Journals")
                {
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
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Forecasts';


                    RunObject = Page "Cash Flow Forecast List";
                    ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                }
                action("Chart of Cash Flow Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Cash Flow Accounts';


                    RunObject = Page "Chart of Cash Flow Accounts";
                    ToolTip = 'View a chart contain a graphical representation of one or more cash flow accounts and one or more cash flow setups for the included general ledger, purchase, sales, services, or fixed assets accounts.';
                }
                action("Cash Flow Manual Revenues")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Manual Revenues';


                    RunObject = Page "Cash Flow Manual Revenues";
                    ToolTip = 'Record manual revenues, such as rental income, interest from financial assets, or new private capital to be used in cash flow forecasting.';
                }
                action("Cash Flow Manual Expenses")
                {
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
            }
            group(Action84)
            {
                Caption = 'Cost Accounting';
                ToolTip = 'Allocate actual and budgeted costs of operations, departments, products, and projects to analyze the profitability of your company.';
                action("Cost Types")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Types';


                    RunObject = Page "Chart of Cost Types";
                    ToolTip = 'View the chart of cost types with a structure and functionality that resembles the general ledger chart of accounts. You can transfer the general ledger income statement accounts or create your own chart of cost types.';
                }
                action("Cost Centers")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Centers';


                    RunObject = Page "Chart of Cost Centers";
                    ToolTip = 'Manage cost centers, which are departments and profit centers that are responsible for costs and income. Often, there are more cost centers set up in cost accounting than in any dimension that is set up in the general ledger. In the general ledger, usually only the first level cost centers for direct costs and the initial costs are used. In cost accounting, additional cost centers are created for additional allocation levels.';
                }
                action("Cost Objects")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Objects';


                    RunObject = Page "Chart of Cost Objects";
                    ToolTip = 'Set up cost objects, which are products, product groups, or services of a company. These are the finished goods of a company that carry the costs. You can link cost centers to departments and cost objects to projects in your company.';
                }
                action("Cost Allocations")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Allocations';


                    RunObject = Page "Cost Allocation Sources";
                    ToolTip = 'Manage allocation rules to allocate costs and revenues between cost types, cost centers, and cost objects. Each allocation consists of an allocation source and one or more allocation targets. For example, all costs for the cost type Electricity and Heating are an allocation source. You want to allocate the costs to the cost centers Workshop, Production, and Sales, which are three allocation targets.';
                }
                action("Cost Budgets")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Budgets';


                    RunObject = Page "Cost Budget Names";
                    ToolTip = 'Set up cost accounting budgets that are created based on cost types just as a budget for the general ledger is created based on general ledger accounts. A cost budget is created for a certain period of time, for example, a fiscal year. You can create as many cost budgets as needed. You can create a new cost budget manually, or by importing a cost budget, or by copying an existing cost budget as the budget base.';
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

            group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = LotInfo;
                action("Petty Cash.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Petty Cash';
                    Image = Journal;
                    RunObject = Page "Petty Cash List";
                    ToolTip = 'Petty Cash Vouchers';
                }

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
                action("Imprest Accounting")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Accounting';
                    Image = Journal;
                    RunObject = Page "FIN-Imprest Accounting";
                    ToolTip = 'Imprest Accounting';
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
                action("Training Application")
                {
                    ApplicationArea = all;
                    RunObject = page "HRM-Training Application List";
                }
                /* action(Appraisal)
                {
                    ApplicationArea = all;
                    RunObject = page "Employee Perf AppraisalsL";
                    
                } */
                action("My Approved Leaves")
                {

                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }

            }
        }
        addbefore("Sales &Quote")
        {


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
                    ApplicationArea = Basic, Suite;
                    Caption = '&Fiscal Year Balance';
                    Image = "Report";
                    RunObject = Report "Fiscal Year Balance";
                    ToolTip = 'View, print, or send a report that shows balance sheet movements for selected periods. The report shows the closing balance by the end of the previous fiscal year for the selected ledger accounts. It also shows the fiscal year until this date, the fiscal year by the end of the selected period, and the balance by the end of the selected period, excluding the closing entries. The report can be used at the close of an accounting period or fiscal year.';
                }
                action("Balance Comp. - Prev. Y&ear")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Balance Comp. - Prev. Y&ear';
                    Image = "Report";
                    RunObject = Report "Balance Comp. - Prev. Year";
                    ToolTip = 'View a report that shows your company''s assets, liabilities, and equity compared to the previous year.';
                }
                action("&Closing Trial Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Closing Trial Balance';
                    Image = "Report";
                    RunObject = Report "Closing Trial Balance";
                    ToolTip = 'View, print, or send a report that shows this year''s and last year''s figures as an ordinary trial balance. The closing of the income statement accounts is posted at the end of a fiscal year. The report can be used in connection with closing a fiscal year.';
                }
                action("Dimensions - Total")
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions - Total';
                    Image = "Report";
                    RunObject = Report "Dimensions - Total";
                    ToolTip = 'View how dimensions or dimension sets are used on entries based on total amounts over a specified period and for a specified analysis view.';
                }
            }
            group("Cash Flow")
            {
                Caption = 'Cash Flow';
                action("Cash Flow Date List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cash Flow Date List';
                    Image = "Report";
                    RunObject = Report "Cash Flow Date List";
                    ToolTip = 'View forecast entries for a period of time that you specify. The registered cash flow forecast entries are organized by source types, such as receivables, sales orders, payables, and purchase orders. You specify the number of periods and their length.';
                }
            }
            group("Customers and Vendors")
            {
                Caption = 'Customers and Vendors';
                action("Aged Accounts &Receivable")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Aged Accounts &Receivable';
                    Image = "Report";
                    RunObject = Report "Aged Accounts Receivable";
                    ToolTip = 'View an overview of when your receivables from customers are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
                }
                action("Aged Accounts Pa&yable")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Aged Accounts Pa&yable';
                    Image = "Report";
                    RunObject = Report "Aged Accounts Payable";
                    ToolTip = 'View an overview of when your payables to vendors are due or overdue (divided into four periods). You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
                }
                action("Reconcile Cus&t. and Vend. Accs")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Reconcile Cus&t. and Vend. Accs';
                    Image = "Report";
                    RunObject = Report "Reconcile Cust. and Vend. Accs";
                    ToolTip = 'View if a certain general ledger account reconciles the balance on a certain date for the corresponding posting group. The report shows the accounts that are included in the reconciliation with the general ledger balance and the customer or the vendor ledger balance for each account and shows any differences between the general ledger balance and the customer or vendor ledger balance.';
                }
            }
            group("VAT Reports")
            {
                Caption = 'VAT Reports';
                action("&VAT Registration No. Check")
                {
                    ApplicationArea = VAT;
                    Caption = '&VAT Registration No. Check';
                    Image = "Report";
                    RunObject = Report "VAT Registration No. Check";
                    ToolTip = 'Use an EU VAT number validation service to validated the VAT number of a business partner.';
                }
                action("VAT E&xceptions")
                {
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
                action("VAT - VIES Declaration Tax Aut&h")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'VAT - VIES Declaration Tax Aut&h';
                    Image = "Report";
                    RunObject = Report "VAT- VIES Declaration Tax Auth";
                    ToolTip = 'View information to the customs and tax authorities for sales to other EU countries/regions. If the information must be printed to a file, you can use the VAT- VIES Declaration Disk report.';
                }
                action("VAT - VIES Declaration Dis&k")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'VAT - VIES Declaration Dis&k';
                    Image = "Report";
                    RunObject = Report "VAT- VIES Declaration Disk";
                    ToolTip = 'Report your sales to other EU countries or regions to the customs and tax authorities. If the information must be printed out on a printer, you can use the VAT- VIES Declaration Tax Auth report. The information is shown in the same format as in the declaration list from the customs and tax authorities.';
                }
                action("EC Sales &List")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'EC Sales &List';
                    Image = "Report";
                    RunObject = Report "EC Sales List";
                    ToolTip = 'Calculate VAT amounts from sales, and submit the amounts to a tax authority.';
                }
            }
            group(Action60)
            {
                Caption = 'Intrastat';
                action("&Intrastat - Checklist")
                {
                    ApplicationArea = BasicEU;
                    Caption = '&Intrastat - Checklist';
                    Image = "Report";
                    RunObject = Report "Intrastat - Checklist";
                    ToolTip = 'View a checklist that you can use to find possible errors before printing and also as documentation for what is printed. You can use the report to check the Intrastat journal before you use the Intrastat - Make Disk Tax Auth batch job.';
                }
                action("Intrastat - For&m")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'Intrastat - For&m';
                    Image = "Report";
                    RunObject = Report "Intrastat - Form";
                    ToolTip = 'View all the information that must be transferred to the printed Intrastat form.';
                }
            }
            group("Cost Accounting")
            {
                Caption = 'Cost Accounting';
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
        addafter("Sales Orders")
        {
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'Open the chart of accounts.';
            }
        }
    }
}

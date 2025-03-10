page 52179045 "Director Role center"
{
    // CurrPage."Help And Setup List".ShowFeatured;

    Caption = 'CEO Role Center', Comment = '{Dependency=Match,"ProfileDescription_SMALLBUSINESS"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            // part(Control1389)
            // {
            //     ApplicationArea = Basic, Suite;
            // }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;

            }
            part(Control48; "Team Member Activities No Msgs")
            {
                Visible = true;
                ApplicationArea = Suite;
                Caption = 'CHIEF EXECUTIVE OFFICER';
            }
            part(Control1902899408; "Payroll Cue")
            {
                ApplicationArea = All;
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

                Visible = true;

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

                Visible = true;
            }
            part("Approvals11"; "Approvals Activities Ten")
            {
                ApplicationArea = Suite;

                Visible = true;
            }
            part("Approvals12"; "Approvals Activities Eleven")
            {
                ApplicationArea = Suite;

                Visible = true;
            }
            part("Approvals13"; "Approvals Activities Twelve")
            {
                ApplicationArea = Suite;

                Visible = true;
            }
            part("Approvals14"; "Approvals Activities Twelve")
            {
                ApplicationArea = Suite;

                Visible = true;
            }
            part(headlin; "Headline RC Administrator")
            {
                ApplicationArea = suite;
                Visible = true;
            }


            part(Control16; "O365 Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
                Visible = true;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }

            part(Control46; "Team Member Activities No Msgs")
            {
                Visible = true;
                ApplicationArea = Suite;
                Caption = 'CHIEF EXECUTIVE OFFICER';
            }
            part(Control55; "Help And Chart Wrapper")
            {
                Visible = true;
                ApplicationArea = Basic, Suite;
                Caption = 'CHIEF EXECUTIVE OFFICER';
            }
        }
    }

    actions
    {
        area(reporting)
        {
            group(Action39)
            {
                Caption = 'Finance Reports';
                Image = Journals;
                ToolTip = 'Post financial transactions, manage budgets, analyze G/L  data, and prepare financial statements.';
                action(GeneralJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(General),
                                        Recurring = CONST(false));
                    ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
                }
                action(Action3)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Chart of Accounts';
                    RunObject = Page "Chart of Accounts";
                    ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
                }

                action("Account Schedules")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Account Schedules';
                    RunObject = Page "Account Schedule Names";
                    ToolTip = 'Get insight into the financial data stored in your chart of accounts. Account schedules analyze figures in G/L accounts, and compare general ledger entries with general ledger budget entries. For example, you can view the general ledger entries as percentages of the budget entries. Account schedules provide the data for core financial statements and views, such as the Cash Flow chart.';
                }


                action("Detail Trial Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Detail Trial Balance';
                    Image = "Report";

                    RunObject = Report "Detail Trial Balance";
                    ToolTip = 'View a detail trial balance for the general ledger accounts that you specify.';
                }
                action("Trial Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Trial Balance';
                    Image = "Report";

                    //RunObject = Report "Trial Balance Detail/Summary";
                    ToolTip = 'View the chart of accounts that have balances and net changes.';
                    AboutTitle = 'Get the financial overview';
                    AboutText = 'With the **Trial Balance** reports you get the balance sheet, income statement, or the full trial balance.';
                }
                action("Trial Balance by Period")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Trial Balance by Period';
                    Image = "Report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Trial Balance by Period";
                    ToolTip = 'View the opening balance by general ledger account, the movements in the selected period of month, quarter, or year, and the resulting closing balance.';
                }
                action("Intrastat Journals")
                {
                    Visible = false;
                    ApplicationArea = BasicEU;
                    Caption = 'Intrastat Journals';
                    RunObject = Page "Intrastat Jnl. Batches";
                    ToolTip = 'Summarize the value of your purchases and sales with business partners in the EU for statistical purposes and prepare to send it to the relevant authority.';
                }
                action("Sales Budgets")
                {
                    Visible = false;
                    ApplicationArea = SalesBudget;
                    Caption = 'Sales Budgets';
                    RunObject = Page "Budget Names Sales";
                    ToolTip = 'Enter item sales values of type amount, quantity, or cost for expected item sales in different time periods. You can create sales budgets by items, customers, customer groups, or other dimensions in your business. The resulting sales budgets can be reviewed here or they can be used in comparisons with actual sales data in sales analysis reports.';
                }
                action("Purchase Budgets")
                {
                    Visible = false;
                    ApplicationArea = PurchaseBudget;
                    Caption = 'Purchase Budgets';
                    RunObject = Page "Budget Names Purchase";
                    ToolTip = 'Enter item purchases values of type amount, quantity, or cost for expected item purchases in different time periods. You can create purchase budgets by items, vendors, vendor groups, or other dimensions in your business. The resulting purchase budgets can be reviewed here or they can be used in comparisons with actual purchases data in purchase analysis reports.';
                }
                action("Sales Analysis Reports")
                {
                    Visible = false;
                    ApplicationArea = SalesAnalysis;
                    Caption = 'Sales Analysis Reports';
                    RunObject = Page "Analysis Report Sale";
                    ToolTip = 'Analyze the dynamics of your sales according to key sales performance indicators that you select, for example, sales turnover in both amounts and quantities, contribution margin, or progress of actual sales against the budget. You can also use the report to analyze your average sales prices and evaluate the sales performance of your sales force.';
                }
                action("Purchase Analysis Reports")
                {
                    Visible = false;
                    ApplicationArea = PurchaseAnalysis;
                    Caption = 'Purchase Analysis Reports';
                    RunObject = Page "Analysis Report Purchase";
                    ToolTip = 'Analyze the dynamics of your purchase volumes. You can also use the report to analyze your vendors'' performance and purchase prices.';
                }
                action("Inventory Analysis Reports")
                {
                    ApplicationArea = InventoryAnalysis;
                    Caption = 'Inventory Analysis Reports';
                    RunObject = Page "Analysis Report Inventory";
                    ToolTip = 'Analyze the dynamics of your inventory according to key performance indicators that you select, for example inventory turnover. You can also use the report to analyze your inventory costs, in terms of direct and indirect costs, as well as the value and quantities of your different types of inventory.';
                }
                action("VAT Returns")
                {
                    Visible = false;
                    ApplicationArea = VAT;
                    Caption = 'VAT Returns';
                    RunObject = Page "VAT Report List";
                    ToolTip = 'Prepare the VAT Return report so you can submit VAT amounts to a tax authority.';
                }
                action(Currencies)
                {
                    Visible = false;
                    ApplicationArea = Suite;
                    Caption = 'Currencies';
                    Image = Currency;
                    RunObject = Page Currencies;
                    ToolTip = 'View the different currencies that you trade in or update the exchange rates by getting the latest rates from an external service provider.';
                }
                action(Employees)
                {
                    Visible = false;
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    RunObject = Page "Employee List";
                    ToolTip = 'View or modify employees'' details and related information, such as qualifications and pictures, or register and analyze employee absence. Keeping up-to-date records about your employees simplifies personnel tasks. For example, if an employee''s address changes, you register this on the employee card.';
                }
                action("VAT Statements")
                {
                    Visible = false;
                    ApplicationArea = VAT;
                    Caption = 'VAT Statements';
                    RunObject = Page "VAT Statement Names";
                    ToolTip = 'View a statement of posted VAT amounts, calculate your VAT settlement amount for a certain period, such as a quarter, and prepare to send the settlement to the tax authorities.';
                }
                action(Dimensions)
                {
                    Visible = false;
                    ApplicationArea = Suite;
                    Caption = 'Dimensions';
                    RunObject = Page Dimensions;
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action(PostedGeneralJournals)
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted General Journals';
                    RunObject = Page "Posted General Journal";
                    ToolTip = 'Open the list of posted general journal lines.';
                }
            }
            group("Financial Statements")
            {
                Visible = false;
                Caption = 'Financial Reports';
                Image = ReferenceData;
                action("Balance Sheet")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Balance Sheet Report';
                    RunObject = Report "Balance Sheet";
                    ToolTip = 'View your company''s assets, liabilities, and equity.';
                }
                action("Income Statement")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Income Statement Report';
                    RunObject = Report "Income Statement";
                    ToolTip = 'View your company''s income and expenses.';
                }
                action("G/L Account Categories")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Account Categories';
                    RunObject = Page "G/L Account Categories";
                    ToolTip = 'Personalize the structure of your financial statements by mapping general ledger accounts to account categories. You can create category groups by indenting subcategories under them. Each grouping shows a total balance. When you choose the Generate Account Schedules action, the account schedules for the underlying financial reports are updated. The next time you run one of these reports, such as the balance statement, new totals and subentries are added, based on your changes.';
                }
                action("G/L Budgets")
                {
                    ApplicationArea = Suite;
                    Caption = 'G/L Budgets';
                    RunObject = Page "G/L Budget Names";
                    ToolTip = 'View summary information about the amount budgeted for each general ledger account in different time periods.';
                }

            }
            group("Payroll Reports")
            {
                Caption = 'Payroll Reports';
                Image = Payables;
                action(Payslips)
                {
                    ApplicationArea = all;
                    Caption = 'Payslips';
                    RunObject = Report "PRL-Payslips V 1.1.1";
                    ToolTip = 'Executes the Payslips action.';
                }
                action("Master Payroll Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Master Payroll Summary';
                    RunObject = Report "PRL-Company Payroll Summary 3";
                    ToolTip = 'Executes the Master Payroll Summary action.';
                }
                action("Payroll Summary2")
                {
                    ApplicationArea = all;
                    Caption = 'Payroll Summary';
                    RunObject = Report "PRL-Company Payroll Summary 3";
                    ToolTip = 'Executes the Payroll Summary action.';
                }
                action("Deductions Summary 2")
                {
                    ApplicationArea = all;
                    Caption = 'Deductions Summary';
                    RunObject = Report "PRL-Deductions Summary1";
                    ToolTip = 'Executes the Deductions Summary action.';
                }
                action("Earnings Summary 2")
                {
                    ApplicationArea = all;
                    Caption = 'Earnings Summary';
                    RunObject = Report "PRL-Payments Summary 2 a";
                    ToolTip = 'Executes the Earnings Summary action.';
                }
                action("vew payslip")
                {
                    ApplicationArea = all;
                    Caption = 'vew payslip';
                    RunObject = Report "Individual Payslips V.1.1.3";
                    //RunObject = Report "PRL-Payslips V 1.1.1 backup";
                    ToolTip = 'Executes the vew payslip action.';
                }
                action("Payroll summary")
                {
                    ApplicationArea = all;
                    Caption = 'Payroll summary';
                    RunObject = Report "Payroll Summary 2";
                    ToolTip = 'Executes the Payroll summary action.';
                }
                action("Deductions Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Deductions Summary';
                    RunObject = Report "PRL-Deductions Summary1";
                    ToolTip = 'Executes the Deductions Summary action.';
                }
                action("Earnings Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Earnings Summary';
                    RunObject = Report "PRL-Earnings Summary 5";
                    ToolTip = 'Executes the Earnings Summary action.';
                }
                // action("Staff pension")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Staff pension';
                //     RunObject = Report "prStaff Pension Contrib";
                //     ToolTip = 'Executes the Staff pension action.';
                // }
                action("Gross Netpay")
                {
                    ApplicationArea = all;
                    Caption = 'Gross Netpay';
                    Image = "Report";
                    RunObject = Report prGrossNetPay;
                    ToolTip = 'Executes the Gross Netpay action.';
                }
                action("Third Rule")
                {
                    Caption = 'Third Rule';
                    Image = "Report";
                    RunObject = Report "A third Rule Report";
                    ToolTip = 'Executes the Third Rule action.';
                    ApplicationArea = All;
                }
                action("P9 Report")
                {
                    ApplicationArea = all;
                    Caption = 'P9 Report';
                    RunObject = Report "P9 Report (Final)";
                    ToolTip = 'Executes the P9 Report action.';
                }
                action("Co_op Remittance")
                {
                    ApplicationArea = all;
                    Caption = 'Co_op Remittance';
                    Image = "Report";
                    RunObject = Report "prCoop remmitance";
                    ToolTip = 'Executes the Co_op Remittance action.';
                }
                action(Transactions)
                {
                    ApplicationArea = all;
                    Caption = 'Transactions';
                    Image = "Report";
                    RunObject = Report "pr Transactions";
                    ToolTip = 'Executes the Transactions action.';
                }
                action("bank Schedule2")
                {
                    ApplicationArea = all;
                    Caption = 'bank Schedule';
                    Image = "Report";
                    RunObject = Report "pr Bank Schedule";
                    ToolTip = 'Executes the bank Schedule action.';
                }
            }
            group("Procurement Reports")
            {
                action("Purchase Order")
                {
                    ApplicationArea = all;
                    RunObject = page 9307;
                }
                action("Purchase Invoice")
                {
                    ApplicationArea = all;
                    RunObject = page 9308;
                }
                action("Sales Order")
                {
                    ApplicationArea = all;
                    RunObject = page 9305;
                }
                action("Item List")
                {
                    ApplicationArea = all;
                    RunObject = page 31;
                }
                action("Posted Store Requests")
                {
                    ApplicationArea = all;
                    //RunObject = page 52178502;
                }
                action("Item Purchase Summary")
                {
                    ApplicationArea = all;
                    RunObject = report "Vendor/Item Purchases";

                }

            }


            group("Store Reports")
            {
                action("Cost_Center General")
                {
                    ApplicationArea = All;
                    //  RunObject = report 52178512;
                }
                action("Cost_Center General Summary")
                {
                    ApplicationArea = All;
                    //RunObject = report 52178519;
                }
                action("Stock Summary")
                {
                    ApplicationArea = All;
                    // RunObject = report "Stock Summary";
                }
                action("Stock Report")
                {
                    ApplicationArea = All;
                    RunObject = report "Stock Report";
                }
                action("Cost Center (Product Group W)")
                {
                    ApplicationArea = All;
                    // RunObject = report 52178508;
                }
                action("Inventory - Transaction Detail")
                {
                    ApplicationArea = All;
                    RunObject = report "Inventory - Transaction Detail";
                }
                action("Inventory Availability")
                {
                    ApplicationArea = All;
                    RunObject = report "Inventory Availability";
                }
                action("Inventory Valuation - WIP")
                {

                    ApplicationArea = All;
                    RunObject = report "Inventory Valuation - WIP";
                }
                action("Item Purchase Sumarry")
                {
                    ApplicationArea = all;
                    RunObject = report "Vendor/Item Purchases";

                }
                action("Items Consuption Report")
                {
                    ApplicationArea = all;
                    //  RunObject = report "Item Consuption Report";
                }
            }
            // group("Gen_Jornal list")
            // {
            //     action(Journals)
            //     {
            //         ApplicationArea = all;
            //         RunObject = page "Gen_Jornal list";
            //     }
            // }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View posted purchase invoices and credit memos, and analyze G/L registers.';
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("Posted Return Shipments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Open the list of posted return shipments.';
                }
                action("Posted Payment Voucher")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Payment Voucher';
                    RunObject = Page "FIN-Posted Payment Vouch.";
                }
                action("Posted Receipts")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Receipts';
                    RunObject = Page "FIN-Posted Receipts list";
                }
                action("Posted Imprest ")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Imprest';
                    RunObject = Page "FIN-Posted imprest list";
                }
                action("Posted Imprest Surr")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Imprest Accounting';
                    RunObject = Page "FIN-Posted Travel Advs. Acc.";
                }

                action("Posted Staff Claims")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Staff Claims';
                    RunObject = Page "FIN-Staff Claim List Posted";
                }
                action("G/L Registers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = Page "G/L Registers";
                    ToolTip = 'View posted G/L entries.';
                }
            }




        }

        area(processing)
        {
            group(New)
            {
                Visible = false;
                Caption = 'New';
                Image = New;
                action(Customer)
                {
                    AccessByPermission = TableData Customer = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer';
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageMode = Create;
                    ToolTip = 'Register a new customer.';
                }
                action(Vendor)
                {
                    AccessByPermission = TableData Vendor = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendor';
                    Image = Vendor;
                    RunObject = Page "Vendor Card";
                    RunPageMode = Create;
                    ToolTip = 'Register a new vendor.';
                }
                action("Statement of Cash Flows")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Statement of Cash Flows';
                    RunObject = Report "Statement of Cashflows";
                    ToolTip = 'View a financial statement that shows how changes in balance sheet accounts and income affect the company''s cash holdings, displayed for operating, investing, and financing activities respectively.';
                }
                action("Statement of Retained Earnings")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Statement of Retained Earnings Report';
                    RunObject = Report "Retained Earnings Statement";
                    ToolTip = 'View a report that shows your company''s changes in retained earnings for a specified period by reconciling the beginning and ending retained earnings for the period, using information such as net income from the other financial statements.';
                }
                action("Sales Taxes Collected")
                {
                    ApplicationArea = SalesTax;
                    Caption = 'Sales Taxes Collected';
                    RunObject = Report "Sales Taxes Collected";
                    ToolTip = 'View a report that shows the sales taxes that have been collected on behalf of the authorities.';
                }

            }

            group(Reports)
            {
                Caption = 'Financial Reports';

            }
            group(Setup)
            {
                Visible = false;
                Caption = 'Setup';
                Image = Setup;
                action("Company Settings")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Company Settings';
                    Image = CompanyInformation;
                    RunObject = Page "Company Information";
                    ToolTip = 'Enter the company name, address, and bank information that will be inserted on your business documents.';
                }
                action("Assisted Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Assisted Setup';
                    Image = QuestionaireSetup;
                    RunObject = Page "Assisted Setup";
                    ToolTip = 'Set up core functionality such as sales tax, sending documents as email, and approval workflow by running through a few pages that guide you through the information.';
                }
                group("Services & Extensions")
                {
                    Caption = 'Services & Extensions';
                    Image = ServiceSetup;
                    action(Extensions)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Extensions';
                        Image = NonStockItemSetup;
                        RunObject = Page "Extension Management";
                        ToolTip = 'Install Extensions for greater functionality of the system.';
                    }
                    action("Service Connections")
                    {
                        ApplicationArea = Service;
                        Caption = 'Service Connections';
                        Image = ServiceTasks;
                        RunObject = Page "Service Connections";
                        ToolTip = 'Enable and configure external services, such as exchange rate updates, Microsoft Social Engagement, and electronic bank integration.';
                    }
                }
            }
        }





        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
            action("Approval Tracker")
            {
                ApplicationArea = All;
                RunObject = page "Approvals Tracker";
            }

            action(Customers)
            {
                Visible = true;
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Vendors)
            {
                Visible = true;
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }

            action(Action62)
            {
                ApplicationArea = FixedAssets;
                Caption = 'Fixed Assets';
                RunObject = Page "Fixed Asset List";
                ToolTip = 'Manage periodic depreciation of your machinery or machines, keep track of your maintenance costs, manage insurance policies related to fixed assets, and monitor fixed asset statistics.';
            }
            action(Items)
            {
                Visible = false;
                ApplicationArea = Basic, Suite;
                Caption = 'Items';
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action("Bank Accounts")
            {
                Visible = false;
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
                ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
            }
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
            }
            //  action(Contacts)
            // {
            //     ApplicationArea = RelationshipMgmt;
            //     Caption = 'Contacts';
            //     Image = CustomerContact;
            //     RunObject = Page "Contact List";
            //     ToolTip = 'View a list of all your contacts.';
            // }
            // action(Opportunities)
            // {
            //     ApplicationArea = RelationshipMgmt;
            //     Caption = 'Opportunities';
            //     RunObject = Page "Opportunities List";
            //     ToolTip = 'View the sales opportunities that are handled by salespeople for the contact. Opportunities must involve a contact and can be linked to campaigns.';
            // }
            // action("Sales Quotes1")
            // {
            //     ApplicationArea = RelationshipMgmt;
            //     Caption = 'Sales Quotes';
            //     Image = Quote;
            //     RunObject = Page "Sales Quote List";
            //     ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
            // }
            // action("Sales Invoice")
            // {
            //     ApplicationArea = RelationshipMgmt;
            //     Image = Quote;
            //     RunObject = Page "Sales Invoice.List";
            //     ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
            // }
            // action(Salespersons)
            // {
            //     ApplicationArea = Suite, RelationshipMgmt;
            //     Caption = 'Salespersons';
            //     RunObject = Page "Salespersons/Purchasers";
            //     ToolTip = 'View or edit information about the sales people that work for you and which customers they are assigned to.';
            // }
        }
        area(sections)
        {


            group("Cash Management")
            {
                Visible = false;
                Caption = 'Cash Management';
                ToolTip = 'Process incoming and outgoing payments. Set up bank accounts and service connections for electronic banking.';
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
                action(CashReceiptJournals)
                {
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
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Journals';
                    Image = Journals;
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Payments),
                                        Recurring = CONST(false));
                    ToolTip = 'Register payments to vendors. A payment journal is a type of general journal that is used to post outgoing payment transactions to G/L, bank, customer, vendor, employee, and fixed assets accounts. The Suggest Vendor Payments functions automatically fills the journal with payments that are due. When payments are posted, you can export the payments to a bank file for upload to your bank if your system is set up for electronic banking. You can also issue computer checks from the payment journal.';
                }
                action(Action23)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = Page "Bank Account List";
                    ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
                }
                action("Bank Acc. Statements")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Acc. Statements';
                    Image = BankAccountStatement;
                    RunObject = Page "Bank Account Statement List";
                    ToolTip = 'View statements for selected bank accounts. For each bank transaction, the report shows a description, an applied amount, a statement amount, and other information.';
                }
                action("Payment Recon. Journals")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Recon. Journals';
                    Image = ApplyEntries;
                    RunObject = Page "Pmt. Reconciliation Journals";
                    ToolTip = 'Reconcile unpaid documents automatically with their related bank transactions by importing a bank statement feed or file. In the payment reconciliation journal, incoming or outgoing payments on your bank are automatically, or semi-automatically, applied to their related open customer or vendor ledger entries. Any open bank account ledger entries related to the applied customer or vendor ledger entries will be closed when you choose the Post Payments and Reconcile Bank Account action. This means that the bank account is automatically reconciled for payments that you post with the journal.';
                }
                action("Direct Debit Collections")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Direct Debit Collections';
                    RunObject = Page "Direct Debit Collections";
                    ToolTip = 'Instruct your bank to withdraw payment amounts from your customer''s bank account and transfer them to your company''s account. A direct debit collection holds information about the customer''s bank account, the affected sales invoices, and the customer''s agreement, the so-called direct-debit mandate. From the resulting direct-debit collection entry, you can then export an XML file that you send or upload to your bank for processing.';
                }
                action("Payment Terms")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Terms';
                    Image = Payment;
                    RunObject = Page "Payment Terms";
                    ToolTip = 'Set up the payment terms that you select from on customer cards to define when the customer must pay, such as within 14 days.';
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
            group(Action40)
            {
                Visible = false;
                Caption = 'Sales';
                Image = Sales;
                ToolTip = 'Make quotes, orders, and credit memos to customers. Manage customers and view transaction history.';
                action(Sales_CustomerList)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customers';
                    RunObject = Page "Customer List";
                    ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
                }
                action(Action129)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Items';
                    RunObject = Page "Item List";
                    ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit.';
                }
                action("Item Charges")
                {
                    ApplicationArea = Suite;
                    Caption = 'Item Charges';
                    RunObject = Page "Item Charges";
                    ToolTip = 'View or edit the codes for item charges that you can assign to purchase and sales transactions to include any added costs, such as freight, physical handling, and insurance that you incur when purchasing or selling items. This is important to ensure correct inventory valuation. For purchases, the landed cost of a purchased item consists of the vendor''s purchase price and all additional direct item charges that can be assigned to individual receipts or return shipments. For sales, knowing the cost of shipping sold items can be as vital to your company as knowing the landed cost of purchased items.';
                }
                action("Sales Quotes")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Quotes';
                    RunObject = Page "Sales Quotes";
                    ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
                }
                action("Sales Orders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Orders';
                    RunObject = Page "Sales Order List";
                    ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
                }
                action("Blanket Sales Orders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Blanket Sales Orders';
                    Image = Reminder;
                    RunObject = Page "Blanket Sales Orders";
                    ToolTip = 'Use blanket sales orders as a framework for a long-term agreement between you and your customers to sell large quantities that are to be delivered in several smaller shipments over a certain period of time. Blanket orders often cover only one item with predetermined delivery dates. The main reason for using a blanket order rather than a sales order is that quantities entered on a blanket order do not affect item availability and thus can be used as a worksheet for monitoring, forecasting, and planning purposes..';
                }
                action("Sales Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Invoices';
                    RunObject = Page "Sales Invoice List";
                    ToolTip = 'Register your sales to customers and invite them to pay according to the delivery and payment terms by sending them a sales invoice document. Posting a sales invoice registers shipment and records an open receivable entry on the customer''s account, which will be closed when payment is received. To manage the shipment process, use sales orders, in which sales invoicing is integrated.';
                }
                action("Sales Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Credit Memos';
                    RunObject = Page "Sales Credit Memos";
                    ToolTip = 'Revert the financial transactions involved when your customers want to cancel a purchase or return incorrect or damaged items that you sent to them and received payment for. To include the correct information, you can create the sales credit memo from the related posted sales invoice or you can create a new sales credit memo with copied invoice information. If you need more control of the sales return process, such as warehouse documents for the physical handling, use sales return orders, in which sales credit memos are integrated. Note: If an erroneous sale has not been paid yet, you can simply cancel the posted sales invoice to automatically revert the financial transaction.';
                }
                action("Sales Return Orders")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Sales Return Orders';
                    RunObject = Page "Sales Return Order List";
                    ToolTip = 'Compensate your customers for incorrect or damaged items that you sent to them and received payment for. Sales return orders support warehouse documents for the item handling, the ability to return items from multiple sales documents with one return, and automatic creation of related sales credit memos or other return-related documents, such as a replacement sales order.';
                }
                action(Reminders)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reminders';
                    Image = Reminder;
                    RunObject = Page "Reminder List";
                    ToolTip = 'Remind customers about overdue amounts based on reminder terms and the related reminder levels. Each reminder level includes rules about when the reminder will be issued in relation to the invoice due date or the date of the previous reminder and whether interests are added. Reminders are integrated with finance charge memos, which are documents informing customers of interests or other money penalties for payment delays.';
                }
                action("Finance Charge Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Finance Charge Memos';
                    Image = FinChargeMemo;
                    RunObject = Page "Finance Charge Memo List";
                    ToolTip = 'Send finance charge memos to customers with delayed payments, typically following a reminder process. Finance charges are calculated automatically and added to the overdue amounts on the customer''s account according to the specified finance charge terms and penalty/interest amounts.';
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
                action("Posted Sales Return Receipts")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Posted Sales Return Receipts';
                    RunObject = Page "Posted Return Receipts";
                    ToolTip = 'Open the list of posted sales return receipts.';
                }
                action("Issued Reminders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Reminders';
                    Image = OrderReminder;
                    RunObject = Page "Issued Reminder List";
                    ToolTip = 'View the list of issued reminders.';
                }
                action("Issued Finance Charge Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Finance Charge Memos';
                    Image = PostedMemo;
                    RunObject = Page "Issued Fin. Charge Memo List";
                    ToolTip = 'View the list of issued finance charge memos.';
                }
            }


            group(Action41)
            {
                Visible = false;
                Caption = 'Purchasing';
                Image = AdministrationSalesPurchases;
                ToolTip = 'Manage purchase invoices and credit memos. Maintain vendors and their history.';
                action(Purchase_VendorList)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendors';
                    RunObject = Page "Vendor List";
                    ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
                }
                action("Incoming Documents")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Incoming Documents';
                    Gesture = None;
                    RunObject = Page "Incoming Documents";
                    ToolTip = 'Handle incoming documents, such as vendor invoices in PDF or as image files, that you can manually or automatically convert to document records, such as purchase invoices. The external files that represent incoming documents can be attached at any process stage, including to posted documents and to the resulting vendor, customer, and general ledger entries.';
                }
                action(Action131)
                {
                    ApplicationArea = Suite;
                    Caption = 'Item Charges';
                    RunObject = Page "Item Charges";
                    ToolTip = 'View or edit the codes for item charges that you can assign to purchase and sales transactions to include any added costs, such as freight, physical handling, and insurance that you incur when purchasing or selling items. This is important to ensure correct inventory valuation. For purchases, the landed cost of a purchased item consists of the vendor''s purchase price and all additional direct item charges that can be assigned to individual receipts or return shipments. For sales, knowing the cost of shipping sold items can be as vital to your company as knowing the landed cost of purchased items.';
                }
                action("Purchase Quotes")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Quotes';
                    RunObject = Page "Purchase Quotes";
                    ToolTip = 'Create purchase quotes to represent your request for quotes from vendors. Quotes can be converted to purchase orders.';
                }
                action("<Page Purchase Orders>")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Orders';
                    RunObject = Page "Purchase Order List";
                    ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }
                action("Blanket Purchase Orders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Blanket Purchase Orders';
                    RunObject = Page "Blanket Purchase Orders";
                    ToolTip = 'Use blanket purchase orders as a framework for a long-term agreement between you and your vendors to buy large quantities that are to be delivered in several smaller shipments over a certain period of time. Blanket orders often cover only one item with predetermined delivery dates. The main reason for using a blanket order rather than a purchase order is that quantities entered on a blanket order do not affect item availability and thus can be used as a worksheet for monitoring, forecasting, and planning purposes.';
                }
                action("<Page Purchase Invoices>")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Invoices';
                    RunObject = Page "Purchase Invoices";
                    ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }
                action("<Page Purchase Credit Memos>")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Credit Memos';
                    RunObject = Page "Purchase Credit Memos";
                    ToolTip = 'Create purchase credit memos to mirror sales credit memos that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. If you need more control of the purchase return process, such as warehouse documents for the physical handling, use purchase return orders, in which purchase credit memos are integrated. Purchase credit memos can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
                }
                action("Purchase Return Orders")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Purchase Return Orders';
                    RunObject = Page "Purchase Return Order List";
                    ToolTip = 'Create purchase return orders to mirror sales return documents that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. Purchase return orders enable you to ship back items from multiple purchase documents with one purchase return and support warehouse documents for the item handling. Purchase return orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
                }
                action("<Page Posted Purchase Invoices>")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }
                action("<Page Posted Purchase Credit Memos>")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("<Page Posted Purchase Receipts>")
                {
                    ApplicationArea = Suite;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }
                action("Posted Purchase Return Shipments")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Posted Purchase Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Open the list of posted purchase return shipments.';
                }
            }
            group("General Activities")
            {
                group("Memo Application.")
                {
                    action("Memo applications")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Memo Application';

                        RunObject = Page "FIN-Memo Header List All";
                        ToolTip = 'Create Memo application from departments.';
                    }
                    action("Approved Memo applications")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Approved Memo Application';

                        RunObject = Page "FIN-Memo List All";
                        ToolTip = 'Create Memo application from departments.';
                    }



                }
                group("Imprest Application")
                {
                    action("Imprest Requisitions")
                    {

                        Caption = 'Imprest Requisitions';
                        ApplicationArea = all;
                        RunObject = page "FIN-Imprests List";

                    }
                    action("My Approved Imprest")
                    {
                        ApplicationArea = all;
                        RunObject = Page "FIN-Imprest List UP";

                    }
                    action("My Posted Imprests")
                    {
                        RunObject = page "FIN-Posted imprest list";
                        ApplicationArea = all;
                    }

                }
                group("Imprest Accounting.")
                {

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
                        ApplicationArea = Basic, Suite;
                        Caption = 'My Approved Imprest Accounting';
                        Image = Journal;
                        RunObject = Page "Approved Imprest Surrender";
                        ToolTip = 'Imprest Surrender';
                    }
                    action("ImprestAccounting1")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'My Posted Imprest Accounting';
                        Image = Journal;
                        RunObject = Page "Posted Imprest Surrender";
                        ToolTip = 'Imprest Surrender';
                    }

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
                group("Leave Application")
                {
                    action("Leave Applications")
                    {

                        Caption = 'Leave Applications';
                        RunObject = Page "HRM-All Leave Requisitions";
                        ApplicationArea = All;
                    }
                    action("Approved Leave Applications")
                    {

                        Caption = 'My Approved Leave Applications';
                        RunObject = Page "HRM-My Approved Leaves List";
                        ApplicationArea = All;
                    }
                    action("Posted Leave Applications")
                    {

                        Caption = 'My Posted Leave Applications';
                        RunObject = Page "HRM-Leave Requisition List";
                        ApplicationArea = All;
                    }

                }
                group("Purchase Requisition")
                {
                    action("Purchase  Requisitions")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Purchase Requisitions';

                        RunObject = Page "FIN-Purchase Requisition";
                        ToolTip = 'Create purchase requisition from departments.';
                    }
                    action("Approved Purchase  Requisitions")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Approved Purchase Requisitions';

                        RunObject = Page "FIN-Purchase Requisition";
                        ToolTip = 'Create purchase requisition from departments.';
                    }
                    action("Posted Purchase  Requisitions")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Posted Purchase Requisitions';

                        RunObject = Page "FIN-Purchase Requisition";
                        ToolTip = 'Create purchase requisition from departments.';
                    }

                }
                group("Store Requisitions")
                {
                    action("Stores Requisitions")
                    {

                        Caption = 'Stores Requisitions';
                        RunObject = Page "PROC-Store Requisition";
                        ApplicationArea = All;
                    }
                    action("Approved Stores Requisitions")
                    {

                        Caption = 'Approved Stores Requisitions';
                        RunObject = Page "PROC-Store Requisition2";
                        ApplicationArea = All;

                    }
                    action("Posted Stores Requisitions")
                    {

                        Caption = 'Posted Stores Requisitions';
                        RunObject = Page "PROC-Posted Store Req List";
                        ApplicationArea = All;
                    }

                }
            }
        }
    }
    var
        HdlTxt: Label 'CHIEF EXECUTIVE OFFICER';
}

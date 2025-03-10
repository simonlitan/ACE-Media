page 52179116 "Finance Accountant"
{
    PageType = RoleCenter;
    layout
    {
        area(rolecenter)
        {
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;

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

                Visible = false;

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

                Visible = false;
            }
            part("Approvals11"; "Approvals Activities Ten")
            {
                ApplicationArea = Suite;

                Visible = false;
            }
            part("Approvals12"; "Approvals Activities Eleven")
            {
                ApplicationArea = Suite;

                Visible = false;
            }
            part("Approvals13"; "Approvals Activities Twelve")
            {
                ApplicationArea = Suite;

                Visible = false;
            }
            part("Approvals14"; "Approvals Activities Twelve")
            {
                ApplicationArea = Suite;

                Visible = false;
            }

        }
    }

    actions
    {



        area(reporting)

        {
            group("G/L Reports")
            {
                Caption = 'G/L Reports';
                action("Trial Balance")
                {
                    ApplicationArea = all;
                    Caption = 'Detailed Trial Balance Summary';
                    Image = Report;
                    RunObject = report "Trial Balance Detail/Summary3";
                }

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

            group("Other Reports")
            {
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
            }
            group("KRA Reports")
            {
                action("VAT INPUT.")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'VAT INPUT';
                    Image = "Report";
                    RunObject = Report "VAT Input";
                    ToolTip = 'Report your sales to other EU countries or regions to the customs and tax authorities. If the information must be printed out on a printer, you can use the VAT- VIES Declaration Tax Auth report. The information is shown in the same format as in the declaration list from the customs and tax authorities.';
                }
                action("NHIF Report.")
                {
                    ApplicationArea = all;
                    Caption = 'NHIF Report';
                    Image = "Report";

                    RunObject = Report "PRL-NHIF Report";
                    //RunObject = report "prNHIF- new";
                }
                action("NSSF Report.")
                {
                    ApplicationArea = all;
                    //  Caption = 'NHIF Report';
                    Image = "Report";

                    RunObject = Report "prNSSF mst";
                    //RunObject = report "prNSSF - new";
                }
                action("Itax/p10 Report.")
                {
                    ApplicationArea = all;
                    //  Caption = 'NHIF Report';
                    Image = "Report";

                    // RunObject = Report return
                    // RunObject = report Pritax_Itax;
                    RunObject = report "Returns Report";
                }
                action(NITA)
                {
                    Image = "Report";
                    ApplicationArea = all;
                    RunObject = report "Nita Report";
                }
                action("Casual Report")
                {
                    Image = "Report";
                    ApplicationArea = all;
                    RunObject = report "Casual Requisition Report";
                }
                action("House Levy Report")
                {
                    Image = "Report";
                    ApplicationArea = all;
                    RunObject = report "House Levy Report";
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
                action("VAT INPUT")
                {
                    ApplicationArea = BasicEU;
                    Caption = 'VAT INPUT';
                    Image = "Report";
                    RunObject = Report "VAT Input";
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

                action("NHIF Report")
                {
                    ApplicationArea = all;
                    Caption = 'NHIF Report';
                    Image = "Report";

                    //RunObject = Report "PRL-NHIF Report";
                    RunObject = report "prNHIF- new";
                }
                action("Vendor Statement")
                {
                    ApplicationArea = all;
                    Caption = 'Vendor Statement';
                    Image = "Report";

                    RunObject = Report "Vendor Statement";
                }
                action("VAT Statement")
                {
                    ApplicationArea = all;
                    //  Caption = 'NHIF Report';
                    Image = "Report";

                    //  RunObject = Report "VAT Statement";
                    RunObject = report "VAT Statement";
                }
                action("NSSF Report")
                {
                    ApplicationArea = all;
                    //  Caption = 'NHIF Report';
                    Image = "Report";

                    RunObject = Report "PRL-NSSF Report Combined";
                    // RunObject = report "prNSSF - new";
                }
                action("Itax/p10 Report")
                {
                    ApplicationArea = all;
                    //  Caption = 'NHIF Report';
                    Image = "Report";

                    RunObject = Report priTax;
                    // RunObject = report Pritax_Itax;
                }
                action(Tax)
                {
                    ApplicationArea = all;
                    RunObject = report "P.10 A mst";
                }
                action(Tax1)
                {
                    ApplicationArea = all;
                    RunObject = report P10;
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

            group("Finance Data Upload")
            {
                action("Import G/L Entries")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Journal;
                    RunObject = xmlport "G_L Entries Import";

                }
                action("Budget Upload")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Journal;
                    RunObject = report "Import Budget";

                }
                action("Vendor Ledger Entry")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Journal;
                    RunObject = xmlport "Import Vendor Ledgers";
                }

                action("Import Petty Cash")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Journal;
                    RunObject = xmlport "Petty Cash";

                }
                action("Import PV")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Journal;
                    RunObject = xmlport "Import Payment Voucher";

                }
                action("Import Employees")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Journal;
                    RunObject = xmlport "Import Employees";

                }
                action("Import Storelines")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Journal;
                    RunObject = xmlport "Sore lines Clone";

                }
                action("Import Store Req")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Journal;
                    RunObject = xmlport "Store Requsition Lines";

                }
            }

            group("Payroll Reports")
            {
                group(PayRepts2)
                {
                    Caption = 'Individual Reports';
                    Image = ResourcePlanning;
                    action("Individual Payslip")
                    {
                        ApplicationArea = all;
                        Caption = 'All Payslips';
                        Image = Report2;


                        RunObject = Report "Individual Payslips V.1.1.3";
                    }
                    action(Payslips)
                    {
                        ApplicationArea = all;
                        Caption = 'Individual Payslip 1';
                        Image = Report;

                        RunObject = Report "PRL-Payslips V 1.1.1";
                    }
                    action(Action1000000029)
                    {
                        ApplicationArea = all;
                        Caption = 'Third Rule';
                        Image = AddWatch;
                        RunObject = Report "A third Rule Report";
                    }

                }

                group(PayrollPeoro)
                {
                    Caption = 'Common Reports';
                    Image = RegisteredDocs;
                    action("Detailed Payroll Summary")
                    {
                        ApplicationArea = all;
                        Caption = 'Master Payroll Summary';
                        Image = Report2;


                        RunObject = Report "Payroll Summary 3";
                    }

                    action(Action1000000044)
                    {
                        ApplicationArea = all;
                        Caption = 'Earnings Summary';
                        Image = DepositSlip;
                        RunObject = Report "PRL-Earnings Summary 5";
                    }
                    action("bank Schedule2")
                    {
                        ApplicationArea = all;
                        Caption = 'Bank Schedule';
                        Image = "Report";
                        RunObject = Report "PRL-Bank Schedule";
                    }
                    action(Action1000000043)
                    {
                        ApplicationArea = all;
                        Caption = 'All Deductions';
                        Image = "Report";

                        RunObject = Report "PRL-Deductions Summary 2 a";
                    }
                    action(Action1000000045)
                    {
                        ApplicationArea = all;
                        Caption = 'Deductions Summary';
                        Image = Report;
                        RunObject = Report "PRL-Deductions Summary1";
                    }
                    action("Payroll Summary2")
                    {
                        ApplicationArea = all;
                        Caption = 'Payroll Summary';
                        Image = "Report";

                        RunObject = Report "PRL-Company Payroll Summary 3";
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

                }

                group(prlComparision)
                {
                    action(payrollvar)
                    {
                        Visible = true;
                        ApplicationArea = all;
                        Caption = 'Payroll Cost Analysis';
                        Image = Aging;
                        RunObject = Report "PR Payroll Summary - Variance";
                    }
                    action(payrollvariace)
                    {
                        Visible = true;
                        ApplicationArea = all;
                        Caption = 'Payroll variance 1';
                        Image = Aging;
                        RunObject = Report "PRL-Payroll Variance Report";
                    }
                    action(payrollvar2)
                    {

                        ApplicationArea = all;
                        Caption = 'Payroll Variance 2';
                        Image = Aging;
                        RunObject = Report "Payroll Variance Report 2";
                    }
                    action(Variance3)
                    {
                        ApplicationArea = all;
                        Caption = 'Payroll Variance 3';
                        Image = Aging;
                        RunObject = report "PRL-Payroll Variance Report2";
                    }

                }
            }
        }
        area(embedding)
        {
            action("Chart of Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
                ToolTip = 'Open the chart of accounts.';
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
                ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
            }
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
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
            action(CustomersBalance)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Customer List";
                RunPageView = WHERE("Balance (LCY)" = FILTER(<> 0));
                ToolTip = 'View a summary of the bank account balance in different periods.';
            }
            action("Incoming Documents")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Incoming Documents';
                Image = Documents;
                RunObject = Page "Incoming Documents";
                ToolTip = 'Handle incoming documents, such as vendor invoices in PDF or as image files, that you can manually or automatically convert to document records, such as purchase invoices. The external files that represent incoming documents can be attached at any process stage, including to posted documents and to the resulting vendor, customer, and general ledger entries.';
            }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoices';
                Image = Invoice;
                RunObject = Page "Purchase Invoices";
                ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action("EC Sales List")
            {
                ApplicationArea = VAT;
                Caption = 'EC Sales List';
                RunObject = Page "EC Sales List Reports";
                ToolTip = 'Calculate VAT amounts from sales, and submit the amounts to a tax authority.';
            }
            action("VAT Returns")
            {
                ApplicationArea = VAT;
                Caption = 'VAT Returns';
                RunObject = Page "VAT Report List";
                ToolTip = 'Prepare the VAT Return report so you can submit VAT amounts to a tax authority.';
            }
            action(Budgets)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Budgets';
                RunObject = Page "G/L Budget Names";
                ToolTip = 'View or edit estimated amounts for a range of accounting periods.';
            }
            action("VAT Statements")
            {
                ApplicationArea = VAT;
                Caption = 'VAT Statements';
                Image = VATStatement;
                RunObject = Page "VAT Statement Names";
                ToolTip = 'View a statement of posted VAT amounts, calculate your VAT settlement amount for a certain period, such as a quarter, and prepare to send the settlement to the tax authorities.';
            }
            action(Intrastat)
            {
                ApplicationArea = BasicEU;
                Caption = 'Intrastat';
                RunObject = Page "Intrastat Jnl. Batches";
                ToolTip = 'Report your trade with other EU countries/regions for Intrastat reporting.';
            }
        }
        area(sections)
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
                    Visible = true;
                    //Caption = 'Imprest Warrant';
                    Image = Journal;
                    RunObject = Page "FIN-Imprests List";
                    //RunPageView = WHERE("Template Type" = CONST(General),Recurring = CONST(false));
                    ToolTip = 'Imprest Requests';
                }

                action("Posted Imprest")
                {
                    Visible = true;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Imprest';
                    Image = Journal;
                    RunObject = Page "FIN-Posted imprest list 2";
                    ToolTip = 'Posted Imprests';
                }
                action("ImprestAccounting")
                {
                    Visible = true;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Accounting';
                    Image = Journal;
                    RunObject = Page "Fin-Imprest Accounting List";
                    ToolTip = 'Imprest Accounting';
                }
                action("Posted Imprest Accounting")
                {
                    Visible = true;
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
                action("Payment Voucher")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Released Payment Vouchers';
                    Image = Journal;
                    RunObject = Page "Approved Payment Voucher";
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
                action("Advance PettyCash")
                {
                    Visible = true;
                    ApplicationArea = ALL;
                    Image = Journal;
                    RunObject = Page "Advance PettyCash List";
                }
                action("Posted Petty Cash.")
                {

                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Petty Cash';
                    Image = Journal;
                    RunObject = Page "FIN-Posted petty cash";
                    ToolTip = 'Posted Petty Cash Vouchers';
                }
                action("PettyCash Surrender")
                {
                    Visible = true;
                    ApplicationArea = ALL;
                    Image = Journal;
                    RunObject = Page "Petty Cash Surrender List";
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
            group("Salary Advances")
            {
                Caption = 'Salary Advance';


                action("Approved Salary Advance")
                {
                    ApplicationArea = all;
                    RunObject = page "Approved Salary Advance";

                }
                action("Posted Salary Advance")
                {
                    ApplicationArea = all;
                    RunObject = page "Posted Salary Advance";
                }

            }
            group("Journal Vouchers")
            {
                action("JVS")
                {
                    Caption = 'Journal Vouchers';
                    ApplicationArea = all;
                    image = AllocatedCapacity;
                    RunObject = page "Journal Voucher list";
                }
                action("Ledger Correction")
                {
                    ApplicationArea = All;
                    Image = ApplicationWorksheet;
                    RunObject = page "Ledger Correction Buffer";
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

                action(Dimensions)
                {
                    ApplicationArea = Suite;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page Dimensions;
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
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
#if not CLEAN19

#endif
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
                    RunPageView = WHERE("Template Type" = CONST(General), Recurring = CONST(false));
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
                action(PurchaseJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Purchases),
                                        Recurring = CONST(false));
                    ToolTip = 'Post any purchase-related transaction directly to a vendor, bank, or general ledger account instead of using dedicated documents. You can post all types of financial purchase transactions, including payments, refunds, and finance charge amounts. Note that you cannot post item quantities with a purchase journal.';
                }
                action(SalesJournals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = WHERE("Template Type" = CONST(Sales),
                                        Recurring = CONST(false));
                    ToolTip = 'Post any sales-related transaction directly to a customer, bank, or general ledger account instead of using dedicated documents. You can post all types of financial sales transactions, including payments, refunds, and finance charge amounts. Note that you cannot post item quantities with a sales journal.';
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
                    RunPageView = WHERE("Template Type" = CONST(Assets), Recurring = CONST(false));
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
                action("Recurring Fixed Asset Journals")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Recurring Fixed Asset Journals';
                    RunObject = Page "FA Journal Batches";
                    RunPageView = WHERE(Recurring = CONST(true));
                    ToolTip = 'Post recurring fixed asset transactions, such as acquisition and depreciation book without integration to the general ledger.';
                }
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View the posting history for sales, shipments, and inventory.';
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
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
                action("Issued Reminders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Reminders';
                    Image = OrderReminder;
                    RunObject = Page "Issued Reminder List";
                    ToolTip = 'Open the list of issued reminders.';
                }
                action("Issued Fin. Charge Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Issued Fin. Charge Memos';
                    Image = PostedMemo;
                    RunObject = Page "Issued Fin. Charge Memo List";
                    ToolTip = 'Open the list of issued finance charge memos.';
                }
                action("G/L Registers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = Page "G/L Registers";
                    ToolTip = 'View auditing details for all general ledger entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action("Cost Accounting Registers")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Accounting Registers';
                    RunObject = Page "Cost Registers";
                    ToolTip = 'View auditing details for all cost accounting entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
                action("Cost Accounting Budget Registers")
                {
                    ApplicationArea = CostAccounting;
                    Caption = 'Cost Accounting Budget Registers';
                    RunObject = Page "Cost Budget Registers";
                    ToolTip = 'View auditing details for all cost accounting budget entries. Every time an entry is posted, a register is created in which you can see the first and last number of its entries in order to document when entries were posted.';
                }
            }
            group(Common_req)
            {

                Caption = 'Common Requisitions';
                Image = LotInfo;
                action("Advance PettyCash.")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                    Image = Journal;
                    RunObject = Page "Advance PettyCash List";
                }
                action("PettyCash Surrender.")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                    Image = Journal;
                    RunObject = Page "Petty Cash Surrender List";
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
                action("My Posted Imprests")
                {
                    RunObject = page "FIN-Posted imprest list";
                    ApplicationArea = all;
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

                action("My Approved Leaves")
                {

                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }


                action("Pending Offs and Double Shifts")
                {
                    ApplicationArea = all;
                    RunObject = page "Pending Offs & Double Shifts";
                }
                action("Casual Requisition")
                {
                    ApplicationArea = All;
                    RunObject = page "Casual Requisition List";
                }
                action("Staff Requisition")
                {
                    ApplicationArea = All;
                    RunObject = page "HRM-Employee Requisitions List";
                }

            }
#if not CLEAN18

#endif
        }
        area(creation)
        {
            group("Action")
            {
                action("Sales &Credit Memo")
                {
                    AccessByPermission = TableData "Sales Header" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales &Credit Memo';
                    RunObject = Page "Sales Credit Memo";
                    RunPageMode = Create;
                    ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
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
                action("G/L Journal Entry")
                {
                    AccessByPermission = TableData "G/L Entry" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Journal Entry';
                    RunObject = Page "General Journal";
                    ToolTip = 'Prepare to post any transaction to the company books.';
                }
                action("Payment Journal Entry")
                {
                    AccessByPermission = TableData "Gen. Journal Batch" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Journal Entry';
                    RunObject = Page "Payment Journal";
                    ToolTip = 'Pay your vendors by filling the payment journal automatically according to payments due, and potentially export all payment to your bank for automatic processing.';
                }
            }
        }
        area(processing)
        {
            group("More Action")
            {
                group(Payments)
                {
                    Caption = 'Payments';
                    action("Cas&h Receipt Journal")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Cas&h Receipt Journal';
                        Image = CashReceiptJournal;
                        RunObject = Page "Cash Receipt Journal";
                        ToolTip = 'Apply received payments to the related non-posted sales documents.';
                    }
                    action("Pa&yment Journal")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Pa&yment Journal';
                        Image = PaymentJournal;
                        RunObject = Page "Payment Journal";
                        ToolTip = 'Make payments to vendors.';
                    }
                }
                group(Analysis)
                {
                    Caption = 'Analysis';
                    action("Analysis &Views")
                    {
                        ApplicationArea = Dimensions;
                        Caption = 'Analysis &Views';
                        Image = AnalysisView;
                        RunObject = Page "Analysis View List";
                        ToolTip = 'Analyze amounts in your general ledger by their dimensions using analysis views that you have set up.';
                    }
                    action("Analysis by &Dimensions")
                    {
                        ApplicationArea = Dimensions;
                        Caption = 'Analysis by &Dimensions';
                        Image = AnalysisViewDimension;
                        RunObject = Page "Analysis by Dimensions";
                        ToolTip = 'Analyze activities using dimensions information.';
                        Visible = false;
                        ObsoleteState = Pending;
                        ObsoleteReason = 'This functionality runs correctly from the Analysis View List page';
                        ObsoleteTag = '18.0';
                    }
                }
                group(Tasks)
                {
                    Caption = 'Tasks';
                    action("Calculate Deprec&iation")
                    {
                        ApplicationArea = FixedAssets;
                        Caption = 'Calculate Deprec&iation';
                        Ellipsis = true;
                        Image = CalculateDepreciation;
                        RunObject = Report "Calculate Depreciation";
                        ToolTip = 'Calculate depreciation according to the conditions that you define. If the fixed assets that are included in the batch job are integrated with the general ledger (defined in the depreciation book that is used in the batch job), the resulting entries are transferred to the fixed assets general ledger journal. Otherwise, the batch job transfers the entries to the fixed asset journal. You can then post the journal or adjust the entries before posting, if necessary.';
                    }
                    action("Import Co&nsolidation from Database")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Import Co&nsolidation from Database';
                        Ellipsis = true;
                        Image = ImportDatabase;
                        RunObject = Report "Import Consolidation from DB";
                        ToolTip = 'Import entries from the business units that will be included in a consolidation. You can use the batch job if the business unit comes from the same database in Business Central as the consolidated company.';
                    }
                    action("Bank Account R&econciliation")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bank Account R&econciliation';
                        Image = BankAccountRec;
                        RunObject = Page "Bank Acc. Reconciliation";
                        ToolTip = 'View the entries and the balance on your bank accounts against a statement from the bank.';
                    }
                    action("Payment Reconciliation Journals")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Payment Reconciliation Journals';
                        Image = ApplyEntries;



                        RunObject = Page "Pmt. Reconciliation Journals";
                        RunPageMode = View;
                        ToolTip = 'Reconcile unpaid documents automatically with their related bank transactions by importing a bank statement feed or file. In the payment reconciliation journal, incoming or outgoing payments on your bank are automatically, or semi-automatically, applied to their related open customer or vendor ledger entries. Any open bank account ledger entries related to the applied customer or vendor ledger entries will be closed when you choose the Post Payments and Reconcile Bank Account action. This means that the bank account is automatically reconciled for payments that you post with the journal.';
                    }

                    action("P&ost Inventory Cost to G/L")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'P&ost Inventory Cost to G/L';
                        Image = PostInventoryToGL;
                        RunObject = Report "Post Inventory Cost to G/L";
                        ToolTip = 'Record the quantity and value changes to the inventory in the item ledger entries and the value entries when you post inventory transactions, such as sales shipments or purchase receipts.';
                    }
                    action("Intrastat &Journal")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Intrastat &Journal';
                        Image = Journal;
                        RunObject = Page "Intrastat Jnl. Batches";
                        ToolTip = 'Summarize the value of your purchases and sales with business partners in the EU for statistical purposes and prepare to send it to the relevant authority.';
                    }
                    action("Calc. and Pos&t VAT Settlement")
                    {
                        ApplicationArea = VAT;
                        Caption = 'Calc. and Pos&t VAT Settlement';
                        Image = SettleOpenTransactions;
                        RunObject = Report "Calc. and Post VAT Settlement";
                        ToolTip = 'Close open VAT entries and transfers purchase and sales VAT amounts to the VAT settlement account. For every VAT posting group, the batch job finds all the VAT entries in the VAT Entry table that are included in the filters in the definition window.';
                    }
                }
                group(Create)
                {
                    Caption = 'Create';
                    action("C&reate Reminders")
                    {
                        ApplicationArea = Suite;
                        Caption = 'C&reate Reminders';
                        Ellipsis = true;
                        Image = CreateReminders;
                        RunObject = Report "Create Reminders";
                        ToolTip = 'Create reminders for one or more customers with overdue payments.';
                    }
                    action("Create Finance Charge &Memos")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Create Finance Charge &Memos';
                        Ellipsis = true;
                        Image = CreateFinanceChargememo;
                        RunObject = Report "Create Finance Charge Memos";
                        ToolTip = 'Create finance charge memos for one or more customers with overdue payments.';
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
                group("Casual Payroll")
                {
                    action("Casual List")
                    {
                        ApplicationArea = All;
                        Image = HumanResources;
                        // RunObject = Page "HRM-WorkStudy List";
                        ToolTip = 'Shows a list of all the Workstudy Students';
                    }
                    action("Casual Salary Card")
                    {
                        ApplicationArea = All;
                        Image = CustomerSalutation;
                        //RunObject = Page "HRM-WorkStudy Pay List";
                        ToolTip = 'WorkStudy Salary Card';
                    }
                    action("Casuals Worked Hours")
                    {
                        ApplicationArea = All;
                        Image = Customer;
                        //RunObject = Page "PRL-WorkStudy Worked Hours";
                        ToolTip = 'Workstudy Worked Days';
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
                    action("&Fixed Asset Setup")
                    {
                        ApplicationArea = FixedAssets;
                        Caption = '&Fixed Asset Setup';
                        Image = Setup;
                        RunObject = Page "Fixed Asset Setup";
                        ToolTip = 'Define your accounting policies for fixed assets, such as the allowed posting period and whether to allow posting to main assets. Set up your number series for creating new fixed assets.';
                    }
                    action("Cash Flow Setup")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Cash Flow Setup';
                        Image = CashFlowSetup;
                        RunObject = Page "Cash Flow Setup";
                        ToolTip = 'Set up the accounts where cash flow figures for sales, purchase, and fixed-asset transactions are stored.';
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
            }
        }
    }



}
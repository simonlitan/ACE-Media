page 52178889 "GEN-Audit Man. Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }

            /* part("Approvals1"; "Approvals Activities Initial")
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
            } */
        }
    }

    actions
    {
        area(reporting)
        {
            group(Finance_01)
            {
                Caption = 'Finance';
                group(Finance)
                {
                    Caption = 'Finance';
                    Image = LotInfo;
                    action("&G/L Trial Balance")
                    {
                        Caption = '&G/L Trial Balance';
                        Image = "Report";


                        ApplicationArea = All;
                        //RunObject = Report 6;
                    }
                    action("&Bank Detail Trial Balance")
                    {
                        Caption = '&Bank Detail Trial Balance';
                        Image = "Report";
                        RunObject = Report "Bank Acc. - Detail Trial Bal.";
                        ApplicationArea = All;
                    }
                    action("&Account Schedule")
                    {
                        Caption = '&Account Schedule';
                        Image = "Report";
                        RunObject = Report "Account Schedule";
                        ApplicationArea = All;
                    }
                    /* action("Bu&dget")
                    {
                        Caption = 'Bu&dget';
                        Image = "Report";
                        RunObject = Report 8;
                    } */
                    action("Trial Bala&nce/Budget")
                    {
                        Caption = 'Trial Bala&nce/Budget';
                        Image = "Report";
                        RunObject = Report "Trial Balance/Budget";
                        ApplicationArea = All;
                    }
                    action("Trial Balance by &Period")
                    {
                        Caption = 'Trial Balance by &Period';
                        Image = "Report";
                        RunObject = Report "Trial Balance by Period";
                        ApplicationArea = All;
                    }
                    action("&Fiscal Year Balance")
                    {
                        Caption = '&Fiscal Year Balance';
                        Image = "Report";
                        RunObject = Report "Fiscal Year Balance";
                        ApplicationArea = All;
                    }
                    action("Balance Comp. - Prev. Y&ear")
                    {
                        Caption = 'Balance Comp. - Prev. Y&ear';
                        Image = "Report";
                        RunObject = Report "Balance Comp. - Prev. Year";
                        ApplicationArea = All;
                    }
                    /*  action("&Closing Trial Balance")
                     {
                         Caption = '&Closing Trial Balance';
                         Image = "Report";
                         RunObject = Report 10;
                     } */
                    separator("   ")
                    {
                    }
                    action("Cash Flow Date List")
                    {
                        Caption = 'Cash Flow Date List';
                        Image = "Report";
                        RunObject = Report "Cash Flow Date List";
                        ApplicationArea = All;
                    }
                    separator("    ")
                    {
                    }
                    action("Aged Accounts &Receivable")
                    {
                        Caption = 'Aged Accounts &Receivable';
                        Image = "Report";
                        RunObject = Report "Aged Accounts Receivable";
                        ApplicationArea = All;
                    }
                    action("Aged Accounts Pa&yable")
                    {
                        Caption = 'Aged Accounts Pa&yable';
                        Image = "Report";
                        RunObject = Report "Aged Accounts Payable";
                        ApplicationArea = All;
                    }
                    action("Reconcile Cus&t. and Vend. Accs")
                    {
                        Caption = 'Reconcile Cus&t. and Vend. Accs';
                        Image = "Report";
                        RunObject = Report "Reconcile Cust. and Vend. Accs";
                        ApplicationArea = All;
                    }
                    separator("T")
                    {
                    }
                    action("&VAT Registration No. Check")
                    {
                        Caption = '&VAT Registration No. Check';
                        Image = "Report";
                        RunObject = Report "VAT Registration No. Check";
                        ApplicationArea = All;
                    }
                    action("VAT E&xceptions")
                    {
                        Caption = 'VAT E&xceptions';
                        Image = "Report";
                        RunObject = Report "VAT Exceptions";
                        ApplicationArea = All;
                    }
                    action("VAT &Statement")
                    {
                        Caption = 'VAT &Statement';
                        Image = "Report";
                        RunObject = Report "VAT Statement";
                        ApplicationArea = All;
                    }
                    action("VAT - VIES Declaration Tax Aut&h")
                    {
                        Caption = 'VAT - VIES Declaration Tax Aut&h';
                        Image = "Report";
                        RunObject = Report "VAT- VIES Declaration Tax Auth";
                        ApplicationArea = All;
                    }
                    action("VAT - VIES Declaration Dis&k")
                    {
                        Caption = 'VAT - VIES Declaration Dis&k';
                        Image = "Report";
                        RunObject = Report "VAT- VIES Declaration Disk";
                        ApplicationArea = All;
                    }
                    action("EC Sales &List")
                    {
                        Caption = 'EC Sales &List';
                        Image = "Report";
                        RunObject = Report "EC Sales List";
                        ApplicationArea = All;
                    }
                    separator(" ")
                    {
                    }
                    action("&Intrastat - Checklist")
                    {
                        Caption = '&Intrastat - Checklist';
                        Image = "Report";
                        RunObject = Report "Intrastat - Checklist";
                        ApplicationArea = All;
                    }
                    action("Intrastat - For&m")
                    {
                        Caption = 'Intrastat - For&m';
                        Image = "Report";
                        RunObject = Report "Intrastat - Form";
                        ApplicationArea = All;
                    }
                    separator("  ")
                    {
                    }
                    action("Cost Accounting P/L Statement")
                    {
                        Caption = 'Cost Accounting P/L Statement';
                        Image = "Report";
                        RunObject = Report "Cost Acctg. Statement";
                        ApplicationArea = All;
                    }
                    action("CA P/L Statement per Period")
                    {
                        Caption = 'CA P/L Statement per Period';
                        Image = "Report";
                        RunObject = Report "Cost Acctg. Stmt. per Period";
                        ApplicationArea = All;
                    }
                    action("CA P/L Statement with Budget")
                    {
                        Caption = 'CA P/L Statement with Budget';
                        Image = "Report";
                        RunObject = Report "Cost Acctg. Statement/Budget";
                        ApplicationArea = All;
                    }
                    action("Cost Accounting Analysis")
                    {
                        Caption = 'Cost Accounting Analysis';
                        Image = "Report";
                        RunObject = Report "Cost Acctg. Analysis";
                        ApplicationArea = All;
                    }
                    separator("s")
                    {
                    }
                    action("Vendor - T&op 10 List")
                    {
                        Caption = 'Vendor - T&op 10 List';
                        Image = "Report";
                        ApplicationArea = All;
                        //RunObject = Report 311;
                    }
                    action("Vendor/&Item Purchases")
                    {
                        Caption = 'Vendor/&Item Purchases';
                        Image = "Report";
                        ApplicationArea = All;
                        //RunObject = Report 313;
                    }
                    separator("p")
                    {
                    }
                }
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
            }
            group("Procurement Reports")
            {
                Caption = 'Posted Procurement Documents';
                group("Posted Purchases")
                {
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

                }
                group(Procurement)
                {
                    Caption = 'Procurement Reports';
                    Image = ProductDesign;
                    action("Inventory - &Availability Plan")
                    {
                        Caption = 'Inventory - &Availability Plan';
                        Image = ItemAvailability;


                        RunObject = Report 707;
                    }
                    action("Inventory &Purchase Orders")
                    {
                        Caption = 'Inventory &Purchase Orders';
                        Image = "Report";


                        RunObject = Report 709;
                    }
                    action("Inventory - &Vendor Purchases")
                    {
                        Caption = 'Inventory - &Vendor Purchases';
                        Image = "Report";


                        RunObject = Report 714;
                    }
                    action("Inventory &Cost and Price List")
                    {
                        Caption = 'Inventory &Cost and Price List';
                        Image = "Report";


                        RunObject = Report 716;
                    }
                    /* action("Purchase Quote Request Report")
                    {
                        Caption = 'Purchase Quote Request Report';
                        Image = "Report";
                        
                        
                        RunObject = Report 51074;
                    } */


                }
            }
            group(LeavReports)
            {
                Caption = 'HR Reports';
                action("Leave")
                {
                    Caption = 'Leave Types';
                    ApplicationArea = all;
                    image = Report;

                    RunObject = report "Leave Types";
                }

                action(LeaveTransactions)
                {
                    Caption = 'Employee Leave Tansaction';
                    ApplicationArea = all;
                    Image = Translation;
                    RunObject = Report "Standard Leave Balance Report";
                }

                action(EmployeeList)
                {
                    ApplicationArea = all;
                    Caption = 'Employee List';
                    Image = Employee;
                    RunObject = Report "HR Employee List";
                }
                action(Qualifications)
                {
                    ApplicationArea = all;
                    Caption = 'Employee Qualifications';
                    image = QualificationOverview;
                    RunObject = report "Staff Qualifications";
                }
                action(mployeeBeneficiaries)
                {
                    ApplicationArea = all;
                    Caption = 'Employee Beneficiaries';
                    Image = "Report";
                    RunObject = Report "HR Employee Beneficiaries";
                }
                action(EmployeeCVSunmmary)
                {
                    ApplicationArea = all;
                    Caption = 'Employee CV Sunmmary';
                    Image = SuggestGrid;
                    RunObject = Report "Employee Details Summary";
                }


            }

            group("PayrollReports")
            {
                Caption = 'Payroll Reports';
                group(payroll_Reports)
                {
                    Caption = 'Payroll Reports';
                    Image = Receivables;
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
                    action("P9 Report")
                    {
                        ApplicationArea = all;
                        Caption = 'P9 Report';
                        Image = PrintForm;


                        RunObject = Report "P9 Report (Final)";
                    }

                    action(Action1000000041)
                    {
                        ApplicationArea = all;
                        Caption = 'Staff pension';


                        Image = Aging;
                        RunObject = Report "PRL-Pension Report";
                    }
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
                    action("Company payroll")
                    {
                        ApplicationArea = all;
                        Caption = 'Company Payroll Summary 2';
                        Image = Report;

                        RunObject = report "PRL-Payroll Cost Analysis";
                    }


                    action(Action1000000044)
                    {
                        ApplicationArea = all;
                        Caption = 'Earnings Summary';
                        Image = DepositSlip;
                        RunObject = Report "PRL-Earnings Summary 5";
                    }
                    action(Action1000000042)
                    {
                        ApplicationArea = all;
                        Caption = 'Earnings Summary 2';
                        Image = "Report";

                        RunObject = Report "PRL-Payments Summary 2 a";
                    }
                    action("bank Schedule2")
                    {
                        ApplicationArea = all;
                        Caption = 'bank Schedule';
                        Image = "Report";
                        RunObject = Report "PRL-Bank Schedule";
                    }
                    action(Action1000000043)
                    {
                        ApplicationArea = all;
                        Caption = 'Deductions Summary 2';
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
                    action("Deductions Summary 2")
                    {
                        ApplicationArea = all;
                        Caption = 'Deductions Summary 2';
                        Image = "Report";

                        RunObject = Report "PRL-Deductions Summary 2 a";
                    }




                    action("Co_op Remittance")
                    {
                        ApplicationArea = all;
                        Caption = 'Co_op Remittance';
                        Image = "Report";
                        RunObject = Report "prCoop remmitance";
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


                    action("P.10")
                    {
                        ApplicationArea = all;
                        Caption = 'P.10';
                        Image = "Report";

                        RunObject = Report P10;
                    }
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

                    action(Action1000000028)
                    {

                        Caption = 'Co_op Remittance';
                        Image = CreateForm;
                        RunObject = Report "prCoop remmitance";
                        ApplicationArea = All;
                        Visible = false;
                    }


                    action("Pension Report")
                    {
                        ApplicationArea = all;
                        Caption = 'Combined Pension Report';
                        Image = PrintForm;


                        RunObject = Report "PRL - Pension Combined 2";
                    }

                    action("NHIF Report")
                    {
                        ApplicationArea = all;
                        Caption = 'NHIF Report';
                        Image = "Report";

                        RunObject = Report "PRL-NHIF Report";
                    }


                    action("NSSF Report (A)")
                    {
                        ApplicationArea = all;
                        Caption = 'NSSF Report (A)';
                        Image = "Report";

                        RunObject = Report "PRL-NSSF Report (A)";
                    }
                    action("NSSF Report (B)")
                    {
                        ApplicationArea = all;
                        Caption = 'NSSF Report (B)';
                        Image = "Report";

                        RunObject = Report "PRL-NSSF Report (B)";
                    }
                    action("NSSF Report (Combined)")
                    {
                        ApplicationArea = all;
                        Caption = 'NSSF Report (Combined)';
                        Image = "Report";

                        RunObject = Report "PRL-NSSF Report Combined";
                    }
                }
            }
            group("FixedReports")
            {
                Caption = 'Fixed Assets Reports';
                group(Fixed_Reports)
                {
                    Caption = 'Fixed Assets';
                    Image = Worksheets;
                    separator("Fixed Assets")
                    {
                        Caption = 'Fixed Assets';
                    }
                    action("Fixed Assets List")
                    {
                        Caption = 'Fixed Assets List';
                        Image = "Report";


                        RunObject = Report "Fixed Asset - List";
                        ApplicationArea = All;
                    }
                    action("Acquisition List")
                    {
                        Caption = 'Acquisition List';
                        Image = "Report";

                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = "Report";
                        RunObject = Report "Fixed Asset - Acquisition List";
                        ApplicationArea = All;
                    }
                    action(Details)
                    {
                        Caption = 'Details';
                        Image = View;


                        RunObject = Report "Fixed Asset - Details";
                        ApplicationArea = All;
                    }
                    action("Book Value 01")
                    {
                        Caption = 'Book Value 01';
                        Image = "Report";

                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = "Report";
                        RunObject = Report "Fixed Asset - Book Value 01";
                        ApplicationArea = All;
                    }
                    action("Book Value 02")
                    {
                        Caption = 'Book Value 02';
                        Image = "Report";

                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = "Report";
                        RunObject = Report "Fixed Asset - Book Value 02";
                        ApplicationArea = All;
                    }
                    action(Analysis)
                    {
                        Caption = 'Analysis';
                        Image = "Report";


                        RunObject = Report "Fixed Asset - Analysis";
                        ApplicationArea = All;
                    }
                    action("Projected Value")
                    {
                        Caption = 'Projected Value';
                        Image = "Report";


                        RunObject = Report "Fixed Asset - Projected Value";
                        ApplicationArea = All;
                    }
                    action("G/L Analysis")
                    {
                        Caption = 'G/L Analysis';
                        Image = "Report";

                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = "Report";
                        RunObject = Report "Fixed Asset - G/L Analysis";
                        ApplicationArea = All;
                    }

                }
            }

            Group("Financial Management")
            {
                Image = Departments;
                ToolTip = 'Receipts, Imprests, Payment and bank transfers';

                action("Posted Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Receipts List';
                    Image = Journal;
                    RunObject = Page "FIN-Posted Receipts list";
                    ToolTip = 'Posted Receipts';
                }
                action("Posted Imprest")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Imprest';
                    Image = Journal;
                    RunObject = Page "FIN-Posted imprest list";
                    ToolTip = 'Posted Imprests';
                }
                action("Posted Imprest Accounting")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Imprest Accounting';
                    Image = Journal;
                    RunObject = Page "FIN-Posted Imprest Accounting";
                    ToolTip = 'Posted Imprest Accounting';
                }
                action("Posted Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Vouchers';
                    Image = Journal;
                    RunObject = Page "FIN-Posted Payment Vouch.";
                    ToolTip = 'Posted Payment Vouchers';
                }
                action("Posted Petty Cash")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Petty Cash';
                    Image = Journal;
                    RunObject = Page "FIN-Posted petty cash";
                    ToolTip = 'Posted Petty Cash Vouchers';
                }
                action("Posted Claims")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Staff Claims';
                    Image = Journal;
                    RunObject = Page "FIN-Staff Claim List Posted";
                    ToolTip = 'posted Claims List';
                }
                action("Posted Bank Trasfers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Bank Transfers';
                    Image = Journal;
                    RunObject = Page "FIN-Posted Interbank Trans2";
                    ToolTip = 'Posted Bank Trasfers';
                }
                action(Budget)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Budgets';
                    Image = CostBudget;
                    RunObject = Page "G/L Budget Names";
                    ToolTip = 'Financial Budgets';
                }
            }
            Group("Sales")
            {
                Caption = 'Posted Sales';
                action("Posted Sales Invoice")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action("Posted Sales Credit Memo")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
            }



        }

        area(sections)
        {

            ToolTip = 'Risk Register';
            group("Risks Register")
            {
                Visible = false;
                Image = RegisteredDocs;
                action("Risk List")
                {
                    RunObject = Page "AUDIT - Risk analysis lines";
                    ApplicationArea = All;
                }
                action("Submitted Risks Under Audit")
                {
                    RunObject = Page "Audit List in Unde Auditing";
                    ApplicationArea = All;
                }
            }
            group("Audit Planner")
            {
                Visible = false;
                Image = Job;
                action("Audit-Plan-Master")
                {
                    RunObject = Page "Audit-Plan-Master";
                    ApplicationArea = All;
                }
            }
            group("Audit Assessment")
            {
                Visible = false;
                Image = AnalysisView;
                action("Audit Assessment List")
                {
                    RunObject = Page "Audit Assessment";
                    ApplicationArea = All;
                }
                action("Audit Review List")
                {
                    RunObject = Page "Audit Assessmnt Review List";
                    ApplicationArea = All;
                }
                action("Archived Audit List")
                {
                    RunObject = Page "Audit Assemnt Archived";
                    ApplicationArea = All;
                }
            }

            group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = Payables;
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
                action("Memo applications")
                {
                    ApplicationArea = Suite;
                    Caption = 'Memo Application';

                    RunObject = Page "FIN-Memo Header List All";
                    ToolTip = 'Create Memo application from departments.';
                }
                action("Purchase  Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Requisitions';
                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Create purchase requisition from departments.';
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

                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }

            }

        }
    }
}


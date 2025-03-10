/// <summary>
/// Page PRL-Payroll Role Center (ID 68919).
/// </summary>
page 52178979 "PRL-Payroll Role Center"
{
    Caption = ' Payroll Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {

            part(Control1902899408; "Payroll Cue")
            {
                ApplicationArea = All;
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
        }
    }

    actions
    {


        area(reporting)
        {


        }
        area(sections)
        {
            group(UploadTransactions)
            {
                action(UploadTransaction)
                {
                    ApplicationArea = all;
                    RunObject = xmlport "Employee Transactions";
                }
                action(UploadTransaction1)
                {
                    Visible = false;
                    ApplicationArea = all;
                    RunObject = xmlport "Employee Transaction";
                }
            }
            group(Payroll)
            {
                Caption = 'Payroll';
                Image = SNInfo;
                action("Salary Card")
                {
                    ApplicationArea = all;
                    Caption = 'Salary Card';
                    Image = Employee;

                    RunObject = Page "HRM-Employee-List";

                    //  RunPageView = where(status = filter(status::Active));
                }
                action(Action23)
                {
                    ApplicationArea = all;
                    Caption = 'Inactive Employees';
                    RunObject = Page "HRM-Employee List";
                    RunPageView = where(status = filter(<> active));
                }

                action("NHIF Setup")
                {
                    ApplicationArea = all;
                    Caption = 'NHIF Setup';
                    Image = SetupLines;

                    RunObject = Page "PRL-NHIF SetUp";
                }

                action("Payroll Approval")
                {
                    ApplicationArea = All;
                    Image = Approval;

                    RunObject = page "Prl-Approval List";
                }
                action(p10)
                {
                    ApplicationArea = all;
                    RunObject = report "P.10 A mst";
                }

            }
            // group(BoardPayroll)
            // {
            //     Caption = 'Board Payroll';
            //     action("BoardAlmanac")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Board Almanac List';
            //         Image = CalendarWorkcenter;
            //         RunObject = Page "Board Almanac List";
            //         ToolTip = 'Board Calander';
            //     }
            //     action(AlmanacV)
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Yearly Almanac';
            //         Image = ProfileCalender;
            //         RunObject = page "NW-Boad Almanac ViewL";
            //     }
            //     action("BoardCommittes")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Board Commitees';
            //         Image = Group;
            //         RunObject = Page "Board Committes Listing";
            //         ToolTip = 'Board Commitees';
            //     }
            // action("BoardTax")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Board TAx';
            //     Image = Payment;
            //     RunObject = Page "Board Tax setup";
            //     ToolTip = 'Board Tax';
            // }
            // action("MileageRates")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Mileage Rates';
            //     Image = Payment;
            //     RunObject = Page "NW-Mileage Allowance Rates";
            //     ToolTip = 'Mileage Rates';
            // }
            // action(GlAccounts)
            // {
            //     Caption = 'Board Accounts';
            //     ApplicationArea = Basic, Suite;
            //     Image = Accounts;
            //     RunObject = Page "NW-Board GL Accounts";
            //     ToolTip = 'Specifies the accounts to be credited and debited';
            // }
            // action("BoardEntitlements")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Board Entitlements';
            //     Image = Payment;
            //     RunObject = Page "Board Members Allowances";
            //     ToolTip = 'Board Commitees';
            // }
            // action("BoardMembers")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Board Members';
            //     Image = Payment;
            //     RunObject = Page "NW-Board Members List";
            //     ToolTip = 'Board Payroll Card';
            // }
            // action("BoardPayrolls")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Board Payroll';
            //     Image = Payment;
            //     RunObject = Page "NW-Board Payroll";
            //     ToolTip = 'Board Payroll Card';
            // }
            // action(PrlPeriod)
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Payroll Period';
            //     Image = Payment;
            //     RunObject = Page "NW-Board Payroll Periods";
            //     ToolTip = 'Board Payroll Periods';
            // }



            // }

            // group(Casual)
            // {
            //     Caption = 'Casual Payroll';
            //     Image = Payroll;
            //     action(CasualEmpList)
            //     {
            //         Caption = 'Casual Employee List';
            //         Image = CustomerList;
            //         RunObject = Page "HRM-Casual Pay List";
            //         ApplicationArea = All;
            //     }
            //     action(CasualWorkDays)
            //     {
            //         Caption = 'Casual Worked Days';
            //         Image = Workdays;
            //         RunObject = Page "PRL-Casual Worked Days";
            //         ApplicationArea = All;
            //     }
            //     action(CasualPayrollPeriods)
            //     {
            //         Caption = 'Casual Payroll Periods';
            //         Image = PaymentPeriod;
            //         RunObject = Page "PRL-Casual Payroll Periods";
            //         ApplicationArea = All;
            //     }

            // }
            // group("Salary Increaments")
            // {
            //     Caption = 'Salary Increaments';
            //     Image = Intrastat;
            //     action("Salary Increament Process")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Salary Increament Process';
            //         Image = AddAction;

            //         RunObject = Page "HRM-Emp. Categories";
            //     }
            //     action("Salary Increament Register")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Salary Increament Register';
            //         Image = Register;

            //         RunObject = Page "HRM-Salary Increament Register";
            //     }
            //     action("Un-Afected Salary Increaments")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Un-Afected Salary Increaments';
            //         Image = UndoCategory;

            //         RunObject = Page "HRM-Unaffected Sal. Increament";
            //     }
            //     action("Leave Allowance Buffer")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Leave Allowance Buffer';
            //         Image = Bins;

            //         RunObject = Page "HRM-Leave Allowance List";
            //     }
            // }
            group(Journals)
            {
                action("Journals Transfer")
                {
                    ApplicationArea = all;
                    RunObject = page "Journal Voucher list";
                }
                action("Ledger Correction")
                {
                    ApplicationArea = All;
                    Image = ApplicationWorksheet;
                    RunObject = page "Ledger Correction Buffer";
                }
            }
             group("Opera Journals")
            {
                action("Opera Journals Transfer")
                {
                    ApplicationArea = all;
                    RunObject = page "Gen_Jornal list";
                }
            }
            group(CUSTOMERS1)
            {
                Caption = 'Customers';
                action(Customers)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customers';
                    Image = Customer;
                    RunObject = Page "Customer List";
                    ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
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

            }
            group(Finance)
            {
                action("Receipts List1")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Receipts List';
                    Image = Journal;
                    RunObject = Page "FIN-Receipts List";
                    ToolTip = 'Receipts List';
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
                    Visible = true;
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


                action("Posted Receipts1")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Receipts List';
                    Image = Journal;
                    RunObject = Page "FIN-Posted Receipts list";
                    ToolTip = 'Posted Receipts';
                }

                action("Sales &Credit Memo1")
                {
                    AccessByPermission = TableData "Sales Header" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales &Credit Memo';
                    RunObject = Page "Sales Credit Memo";
                    RunPageMode = Create;
                    ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
                }
                action("Posted Sales Credit Memo")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
                action("Sales Invoices")
                {
                    AccessByPermission = TableData "Sales Header" = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Invoice';
                    RunObject = Page "Sales invoice list";
                    RunPageMode = Create;
                    ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
                }
                action("Posted Sales Invoice")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
            }
            group(Opera)
            {
                action("Micros Cost centers")
                {
                    ApplicationArea = All;
                    RunObject = page "Micros Cost centers";
                    Image = MachineCenter;
                }
                action("Micros G/L Accounts")
                {
                    ApplicationArea = All;
                    RunObject = page "Micros G/L Accounts";
                    Image = MachineCenterLoad;
                }


                action("Opera Import")
                {
                    ApplicationArea = all;
                    RunObject = xmlport "Import Safari Transactions";
                }
                action("Opera Data Import")
                {
                    ApplicationArea = all;
                    RunObject = page "opera Data Import";
                }
                action("Opera Report")
                {
                    ApplicationArea = all;
                    RunObject = report "Post Opera Transactions";
                }
                action("City Ledger Import")
                {
                    ApplicationArea = all;
                    RunObject = page "City Ledger Import";
                }
                action("ImportCity Ledger Transactions")
                {
                    ApplicationArea = all;
                    RunObject = xmlport "ImportCity Ledger Transactions";
                }
                action("CityLedger Report")
                {
                    ApplicationArea = all;
                    RunObject = report "Post City Ledger Transactions";
                }
            }


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
                action("Salary Advance")
                {
                    ApplicationArea = all;

                    RunObject = page "FIN-Staff Advance List";
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
                /*  action(Appraisal)
                 {
                     ApplicationArea = all;
                     RunObject = page "Employee Perf AppraisalsL";
                 } */
                action("My Approved Leaves")
                {

                    Caption = 'My Approved Leaves';

                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }

            }

            // group(ATT)
            // {
            //     Caption = 'Attendance';
            //     action("Staff Register")
            //     {

            //         Caption = 'Staff Register';
            //         //RunObject = Page "Staff Reg.Ledger List";
            //         ApplicationArea = All;
            //     }
            //     action("Staff Register History")
            //     {

            //         Caption = 'Staff Register History';
            //         //RunObject = Page "Staff Ledger History";
            //         ApplicationArea = All;
            //     }
            //     action("Casuals Register")
            //     {

            //         Caption = 'Casuals Register';
            //         RunObject = Page "Casuals  Reg.Ledger List";
            //         ApplicationArea = All;
            //     }
            //     action("Casuals History")
            //     {

            //         Caption = 'Casuals History';
            //         RunObject = Page "Casuals Ledger History";
            //         ApplicationArea = All;
            //     }
            // }


        }
        area(Embedding)
        {
            action("employeeupload")
            {
                RunObject = xmlport "Employee Upload";
                Caption = 'Employee Details bulk upload';
                ApplicationArea = all;


            }

            action("salarygrade")
            {
                RunObject = xmlport "Salary Grades";
                Caption = 'import salary grades';
                ApplicationArea = all;


            }

        }
        area(creation)
        {
            group(Payroll_Setups)
            {
                Caption = 'Setups';
                Image = HRSetup;
                action("Payroll Period")
                {
                    ApplicationArea = all;
                    Caption = 'Payroll Period';
                    Image = Period;
                    RunObject = Page "PRL-Payroll Periods";
                }
                action("Pr Rates")
                {
                    ApplicationArea = all;
                    Caption = 'Pr Rates';
                    Image = SetupColumns;

                    RunObject = Page "PRL-Rates & Ceilings";
                }
                action("paye Setup")
                {
                    ApplicationArea = all;
                    Caption = 'paye Setup';
                    Image = SetupPayment;

                    RunObject = Page "PRL-P.A.Y.E Setup";
                }
                action(Action7)
                {
                    ApplicationArea = all;
                    Caption = 'Transcation Codes';
                    Image = Setup;

                    RunObject = Page "PRL-Transaction Codes List";
                }

                action(Action6)
                {
                    ApplicationArea = all;
                    Caption = 'NHIF Setup';
                    Image = SetupLines;

                    RunObject = Page "PRL-NHIF SetUp";
                }
                action("Nssf Tiers")
                {
                    ApplicationArea = all;
                    Image = LineReserve;
                    RunObject = page "PRL-NSSF";
                }

                action("Bank Structure")
                {
                    ApplicationArea = all;
                    Caption = 'Bank Structure';
                    Image = Bank;

                    RunObject = Page "PRL-Bank Structure (B)";
                }
                action("control information")
                {
                    ApplicationArea = all;
                    Caption = 'control information';
                    Image = CompanyInformation;

                    RunObject = Page "GEN-Control-Information";
                }
                action("Salary Grades")
                {
                    ApplicationArea = all;
                    Caption = 'Salary Grades';
                    Image = EmployeeAgreement;

                    RunObject = Page "PRL-Salary Grades";
                }
                action("posting group")
                {
                    ApplicationArea = all;
                    Caption = 'posting group';
                    Image = PostingEntries;

                    RunObject = Page "PRL-Employee Posting Group";
                }
                action(Action69)
                {
                    ApplicationArea = all;
                    Caption = 'Salary Increament Process';
                    Image = AddAction;

                    RunObject = Page "HRM-Emp. Categories";
                }
                action(Action68)
                {
                    ApplicationArea = all;
                    Caption = 'Salary Increament Register';
                    Image = Register;

                    RunObject = Page "HRM-Salary Increament Register";
                }
                action(Action66)
                {
                    ApplicationArea = all;
                    Caption = 'Un-Afected Salary Increaments';
                    Image = UndoCategory;

                    RunObject = Page "HRM-Unaffected Sal. Increament";
                }
                /* action(Action9)
                {
                    ApplicationArea = all;
                    Caption = 'Payment Vouchers';
                    RunObject = Page "FIN-Payment Vouchers";
                } */
                action("Staff Welfare Loan Tires")
                {
                    Image = UndoCategory;
                    ApplicationArea = all;
                    Caption = 'Staff Welfare Loan Tires';
                    RunObject = Page "HRM Welfare Loan Tiers";
                }
            }


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
                    // RunObject = Report "PRL-Payslips V 1.1.1 backup";
                }
                action(Payslips)
                {
                    ApplicationArea = all;
                    Caption = 'Individual Payslip 1';
                    Image = Report;
                    // RunObject = Report "Individual Payslips V.1.1.3";
                    //  RunObject = Report "PRL-Payslips V 1.1.1";
                    RunObject = Report "PRL-Payslips V 1.1.1 backup";
                }


                action("Individual Payslip 2")
                {
                    ApplicationArea = all;
                    Caption = 'Individual Payslip 2';
                    Image = Report2;


                    RunObject = Report "Individual Payslips mst";
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

            }
            // group(ProcessPCA)
            // {
            //     Caption = 'Pay Change Advice Processing';
            //     action(PCA)
            //     {
            //         Caption = 'PR-PCA List';
            //         Image = Change;


            //         RunObject = page "prPCA list";
            //         ApplicationArea = all;
            //     }
            //     action(prPostedPCAMassList)
            //     {
            //         Caption = 'Mass PCA List';
            //         Image = Change;


            //         RunObject = page prPCAMassList;
            //         ApplicationArea = all;
            //     }
            //     action(PostedMAssPCAList)
            //     {
            //         Caption = 'Posted Mass PCA List';
            //         Image = Change;


            //         RunObject = page prPostedPCAMassList;
            //         ApplicationArea = all;
            //     }
            //     action(OthermPCAList)
            //     {
            //         Caption = 'Other Mass PCA List';
            //         Image = Change;


            //         RunObject = page "Other mPCA list";
            //         ApplicationArea = all;
            //     }
            // }
            group(PayrollPeoro)
            {
                Caption = 'Company Reports';
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
                action("Company payroll")
                {
                    ApplicationArea = all;
                    Caption = 'Company Payroll Summary 2';
                    Image = Report;

                    RunObject = report "PRL-Payroll Cost Analysis";
                }
                /*action("Company Payslip")
                 {
                    ApplicationArea = all;
                    Caption = 'Company Payslip';
                    Image = "Report";
                    
                    RunObject = Report "PRL-Company Payslip";
                } */

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
                action("Earnings Summary 2")
                {
                    ApplicationArea = all;
                    Caption = 'Earnings Summary 2';
                    Image = "Report";

                    //todo  RunObject = Report "PRL-Payments Summary 2";
                }

                action("Payroll summary")
                {
                    ApplicationArea = all;
                    Caption = 'Payroll summary';
                    Image = "Report";

                    RunObject = Report "Payroll Summary 2";
                }
                action("Deductions Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Deductions Summary';
                    Image = "Report";

                    //RunObject = Report "PRL-Deductions Summary";
                }
                action("Earnings Summary")
                {
                    ApplicationArea = all;
                    Caption = 'Earnings Summary';
                    Image = "Report";

                    //RunObject = Report "PRL-Earnings Summary";
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

                action("Employer Certificate")
                {

                    Caption = 'Employer Certificate';
                    Image = "Report";


                    ApplicationArea = All;

                    //RunObject = Report "Employer Certificate P.10 mst";
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
                action("NHIF Schedule")
                {
                    ApplicationArea = all;
                    Caption = 'NHIF Schedult';
                    Image = "Report";

                    Visible = false;
                    //RunObject = Report "prNHIF mst";
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
                action("payroll Journal Transfer")
                {
                    ApplicationArea = all;
                    Caption = 'Payroll Journal Transfer';
                    Image = Journals;

                    Visible = false;
                    //RunObject = Report prPayrollJournalTransfer;
                }
                action("mass update Transactions")
                {
                    ApplicationArea = all;
                    Caption = 'mass update Transactions';
                    Image = PostBatch;

                    Visible = false;
                    //RunObject = Report "Mass Update Transactions";
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
                action("SACCO Report")
                {
                    ApplicationArea = all;
                    Caption = 'SACCO Report';
                    Image = "Report";

                    RunObject = Report "PRL-Welfare Report";
                }
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
            group(PeriodicActivities)
            {
                Caption = 'Journals';
                action(JournalTransfer)
                {
                    ApplicationArea = all;
                    Image = Journal;
                    RunObject = report "Payroll JVS Transfer";
                    //RunObject = report PrPayrollJournalTransfer;
                }
                action("payrollJournal Transfer")
                {
                    ApplicationArea = all;
                    Caption = 'Casual Journal Transfer';
                    Image = Journals;

                    RunObject = Report "PRl-Casual Journal Transfer";
                }
            }
            group(prlComparision)
            {
                Caption = 'Comparison Reports';
                action(CumAll)
                {
                    Visible = true;
                    ApplicationArea = all;
                    Caption = 'Cummulative Allowances';
                    Image = Aging;
                    RunObject = Report "PRL-Cummulative Allowances";
                }
                action(cumDed)
                {
                    Visible = true;
                    ApplicationArea = all;
                    Caption = 'Cummulative Deductions';
                    Image = Aging;
                    RunObject = Report "PRL-Cummulative Deductions";
                }
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
                action(DetPayVar)
                {
                    Visible = true;
                    ApplicationArea = all;
                    Caption = 'Details Payroll Variance';
                    Image = Aging;
                    RunObject = Report "PRL-Detailed Payroll Variance";
                }
                action(DetailedSimplifiedReport)
                {
                    ApplicationArea = all;
                    Caption = 'Detailed Simplified Payroll Report';
                    Image = Aging;
                    //RunObject = Report "PRL Detailed simplified Report";
                }
            }
        }
    }
}


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

        }
    }

    actions
    {

        area(reporting)
        {


        }
        area(sections)
        {
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



                action("Payroll Approval")
                {
                    ApplicationArea = All;
                    Image = Approval;

                    RunObject = page "Prl-Approval List";
                }

            }
            group(BoardPayroll)
            {
                Visible = false;
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

            group(Casual)
            {
                Caption = 'Casual Payroll';
                Image = Payroll;
                /* action(CasualEmpList)
                {
                    Caption = 'Casual Employee List';
                    Image = CustomerList;
                    RunObject = Page "HRM-Casual Pay List";
                    ApplicationArea = All;
                } */
                action(CasualWorkDays)
                {
                    Caption = 'Casual Worked Days';
                    Image = Workdays;
                    RunObject = Page "PRL-Casual Worked Days";
                    ApplicationArea = All;
                }
                action(CasualPayrollPeriods)
                {
                    Caption = 'Casual Payroll Periods';
                    Image = PaymentPeriod;
                    RunObject = Page "PRL-Casual Payroll Periods";
                    ApplicationArea = All;
                }

            }
            group("Salary Increaments")
            {
                Caption = 'Salary Increaments';
                Image = Intrastat;
                action("Salary Increament Process")
                {
                    ApplicationArea = all;
                    Caption = 'Salary Increament Process';
                    Image = AddAction;

                    RunObject = Page "HRM-Emp. Categories";
                }
                action("Salary Increament Register")
                {
                    ApplicationArea = all;
                    Caption = 'Salary Increament Register';
                    Image = Register;

                    RunObject = Page "HRM-Salary Increament Register";
                }
                action("Un-Afected Salary Increaments")
                {
                    ApplicationArea = all;
                    Caption = 'Un-Afected Salary Increaments';
                    Image = UndoCategory;

                    RunObject = Page "HRM-Unaffected Sal. Increament";
                }
                action("Leave Allowance Buffer")
                {
                    ApplicationArea = all;
                    Caption = 'Leave Allowance Buffer';
                    Image = Bins;

                    RunObject = Page "HRM-Leave Allowance List";
                }
            }
            group("General Activities")
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

            group(ATT)
            {
                Visible = false;
                Caption = 'Attendance';
                action("Staff Register")
                {

                    Caption = 'Staff Register';
                    //RunObject = Page "Staff Reg.Ledger List";
                    ApplicationArea = All;
                }
                action("Staff Register History")
                {

                    Caption = 'Staff Register History';
                    //RunObject = Page "Staff Ledger History";
                    ApplicationArea = All;
                }
                action("Casuals Register")
                {

                    Caption = 'Casuals Register';
                    RunObject = Page "Casuals  Reg.Ledger List";
                    ApplicationArea = All;
                }
                action("Casuals History")
                {

                    Caption = 'Casuals History';
                    RunObject = Page "Casuals Ledger History";
                    ApplicationArea = All;
                }
            }


        }
        area(Embedding)
        {
            action("employeeupload")
            {
                RunObject = xmlport "Employee Upload";
                Caption = 'Employee Details bulk upload';
                ApplicationArea = all;
                Visible = false;




            }

            action("salarygrade")
            {
                RunObject = xmlport "Salary Grades";
                Caption = 'import salary grades';
                ApplicationArea = all;
                Visible = false;


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
                }
                /* action(Payslips)
                {
                    ApplicationArea = all;
                    Caption = 'Individual Payslip 1';
                    Image = Report;

                    RunObject = Report "PRL-Payslips V 1.1.1";
                }


                action("Individual Payslip 2")
                {
                    ApplicationArea = all;
                    Caption = 'Individual Payslip 2';
                    Image = Report2;


                    RunObject = Report "Individual Payslips mst";
                } */
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

                /*  action(Action1000000041)
                 {
                     ApplicationArea = all;
                     Caption = 'Staff pension';


                     Image = Aging;
                     RunObject = Report "PRL-Pension Report";
                 } */

            }
            group(ProcessPCA)
            {
                Caption = 'Pay Change Advice Processing';
                action(PCA)
                {
                    Caption = 'PR-PCA List';
                    Image = Change;


                    RunObject = page "prPCA list";
                    ApplicationArea = all;
                }
                action(prPostedPCAMassList)
                {
                    Caption = 'Mass PCA List';
                    Image = Change;


                    RunObject = page prPCAMassList;
                    ApplicationArea = all;
                }
                action(PostedMAssPCAList)
                {
                    Caption = 'Posted Mass PCA List';
                    Image = Change;


                    RunObject = page prPostedPCAMassList;
                    ApplicationArea = all;
                }
                action(OthermPCAList)
                {
                    Caption = 'Other Mass PCA List';
                    Image = Change;


                    RunObject = page "Other mPCA list";
                    ApplicationArea = all;
                }
            }
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

                /*  action("NSSF Report (Combined)")
                 {
                     ApplicationArea = all;
                     Caption = 'NSSF Report (Combined)';
                     Image = "Report";

                     RunObject = Report "PRL-NSSF Report Combined";
                 }
  */


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
                    RunObject = Report "Detailed Payrol Summary";
                }
            }
        }
    }
}


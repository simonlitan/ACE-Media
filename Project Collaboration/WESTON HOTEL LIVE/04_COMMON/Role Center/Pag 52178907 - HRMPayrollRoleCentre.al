page 52178907 "HRM Payroll Role Centre"
{
    Caption = 'Role Center';
    PageType = RoleCenter;
    UsageCategory = Administration;
    ApplicationArea = All, Basic, Suite, Advance;

    layout
    {
        area(rolecenter)
        {
            // part(Control1902899408; "Payroll Cue")
            // {
            //     ApplicationArea = All;
            // }
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
                Visible = false;
            }
            part("Approvals2"; "Approvals Activities One")
            {
                ApplicationArea = Suite;
                Visible = false;
            }
            part("Approvals3"; "Approvals Activities Two")
            {
                ApplicationArea = Suite;
                Visible = false;
            }
            part("Approvals4"; "Approvals Activities Three")
            {
                ApplicationArea = Suite;
                Visible = false;

            }
            part("Approvals5"; "Approvals Activities Four")
            {
                ApplicationArea = Suite;

            }
            part("Approvals6"; "Approvals Activities Five")
            {
                ApplicationArea = Suite;
                Visible = false;

            }
            part("Approvals7"; "Approvals Activities six")
            {
                ApplicationArea = Suite;
                Visible = false;
            }
            part("Approvals8"; "Approvals Activities seven")
            {
                ApplicationArea = Suite;
                Visible = false;
            }
            part("Approvals9"; "Approvals Activities Eight")
            {
                ApplicationArea = Suite;
                Visible = false;
            }
            part("Approvals10"; "Approvals Activities Nine")
            {
                ApplicationArea = Suite;
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
            part("Approvals14"; "Approvals Activities Thirteen")
            {
                ApplicationArea = Suite;
                Visible = false;
            }
        }
    }
    actions
    {
        area(sections)
        {
            // group("Human Resource")
            // {
            group(EmployeeMan)
            {
                Caption = 'Employee Manager';

                action(Action22)
                {
                    ApplicationArea = all;
                    Caption = 'Active Employee List';
                    RunObject = Page "HRM-Employee List";
                    RunPageView = where(status = filter(active), "Contract Type" = filter(<> Casual));
                }
                action(Action23)
                {
                    ApplicationArea = all;
                    Caption = 'Inactive Employees';
                    RunObject = Page "HRM-Employee-List (Inactive)";
                    RunPageView = where(status = filter(<> active));
                }
                // action(Action24)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Interns';
                //     RunObject = Page "HRM-Employee List";
                //     RunPageView = where(status = filter(active), "employee type" = const(intern));
                // }
                group(Interns)
                {
                    action("Interns List")
                    {
                        ApplicationArea = all;
                        RunObject = page "HRM-Intern&Attach List";
                    }
                    action("Application List")
                    {
                        Caption = 'Register Intern';
                        ApplicationArea = all;
                        RunObject = page "HRM-Attachment Register";
                    }
                }

                action(Action221)
                {
                    Visible = false;
                    ApplicationArea = all;
                    Caption = 'Active Employee List';
                    RunObject = Page "HRM-Employee List";
                    RunPageView = where(status = filter(active), "Posting Group" = filter('SALARY'));
                }
                action(Casuals)
                {
                    ApplicationArea = all;
                    Caption = 'Casuals';
                    RunObject = Page "HRM-Casuals Lists";
                }

                action(EmpExit)
                {
                    Caption = 'Employee Exit';
                    ApplicationArea = All;
                    RunObject = page "HRM-Emp. Exit Requisition";
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
                    // RunObject = Page "HRM-WorkStudy Pay List";
                    ToolTip = 'WorkStudy Salary Card';
                }
                action("Casuals Worked Hours")
                {
                    ApplicationArea = All;
                    Image = Customer;
                    // RunObject = Page "PRL-WorkStudy Worked Hours";
                    ToolTip = 'Workstudy Worked Days';
                }
            }
            group(Payroll)
            {
                //Visible = false;
                Caption = 'Payroll';

                action("Salary Card")
                {

                    Caption = 'Salary Card';
                    Image = Employee;

                    RunObject = Page "HRM-Employee-List";
                    ApplicationArea = All;
                }
                action("Transcation Codes")
                {

                    Caption = 'Transcation Codes';
                    Image = Setup;

                    RunObject = Page "PRL-Transaction Codes List";
                    ApplicationArea = All;
                }
                // action("NHIF Setup")
                // {

                //     Caption = 'NHIF Setup';
                //     Image = SetupLines;

                //     RunObject = Page "PRL-NHIF SetUp";
                //     ApplicationArea = All;
                // }
                action("Payroll Mass Changes")
                {

                    Caption = 'Payroll Mass Changes';
                    Image = AddAction;

                    RunObject = Page "HRM-Import Emp. Trans Buff";
                    ApplicationArea = All;
                }
                action("Payroll Approval")
                {
                    ApplicationArea = All;
                    Image = Approval;

                    RunObject = page "Prl-Approval List";
                }
                // action(" payment Vouchers")
                // {

                //     Caption = ' payment Vouchers';
                //     ApplicationArea = All;
                //     //RunObject = Page "FIN-Payment Vouchers";
                // }
            }

            group(LeaveMan)
            {
                Caption = 'Leave Management';

                action(Action14)
                {
                    ApplicationArea = all;
                    Caption = 'All Leave Applications';
                    Image = Register;

                    RunObject = Page "All Leave Requisitions";
                }
                action(Action16)
                {
                    ApplicationArea = all;
                    Caption = 'Approved Leave Applications';

                    RunObject = Page "HRM-Leave Approved Leave List";

                }
                action("Posted Leaves")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Leaves';
                    RunObject = Page "HRM-Leave Requisition Posted";
                }
                action("Leave Journals")
                {
                    ApplicationArea = all;
                    Caption = 'Leave Journals';
                    Image = Journals;

                    RunObject = Page "HRM-Emp. Leave Journal Lines";
                }
                action("Posted Leave")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Leave Journals';
                    RunObject = Page "HRM-Posted Leave Journal";
                }
                // action("Staff Back To Office")
                // {
                //     ApplicationArea = all;
                //     RunObject = Page "HRM-Return to Office";
                //     ToolTip = 'Is filled by staff when they return from leave';
                // }
                action(leavetypes2)
                {
                    ApplicationArea = all;
                    Caption = 'Leave Types';

                    RunObject = page "HRM-Leave Types";

                }
                group(LeavReports)
                {
                    Caption = 'Employee Leave Report';
                    action(SummaryLeaveBalances)
                    {
                        Caption = 'Summary Leave Balances';
                        ApplicationArea = all;
                        Image = Balance;
                        RunObject = Report  51447;
                    }

                    action(LeaveBalances)
                    {
                        Caption = 'Employee Leave Balances';
                        ApplicationArea = all;
                        Image = Balance;
                        RunObject = Report "Annual Leave Balances";
                    }

                    action(LeaveTransactions)
                    {
                        Caption = 'Employee Leave Tansaction';
                        ApplicationArea = all;
                        Image = Translation;
                        RunObject = Report "Standard Leave Balance Report";
                    }
                    action(LeaveStatement)
                    {
                        Caption = 'Employee Leave Statement';
                        ApplicationArea = all;
                        Image = LedgerEntries;
                        RunObject = Report "HR Leave Statement";
                    }
                }

            }

            group("Casuals' Management")
            {
                //Caption = 'Casuals Management';
                // group("Casuals Management")
                // {
                action("All Casual Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'All Casuals Requisition List';
                    Image = Job;
                    RunObject = Page "All Casual Requisitions";
                }

                action("Posted Casual Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Casual Requisitions';
                    Image = Job;
                    RunObject = Page "Posted Casual Requisitions";
                }

                action("Pending Casual Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Pending Casual Requisitions';
                    Image = Job;
                    RunObject = Page "Pending Casual Requisitions";
                }

                action("Rejected Casual Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Rejected Casual Requisitions';
                    Image = Job;
                    RunObject = Page "Rejected Casual Requisitions";
                }



                //}
            }

            group(Common_req)
            {
                Caption = 'Common Requisitions';
                action(" PettyCash User Application")
                {
                    ApplicationArea = ALL;
                    Image = Journal;
                    RunObject = Page "Petty Cash List";
                }

                action("Stores Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Stores Requisitions';

                    RunObject = Page "PROC-Store Requisition";
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

                action(Action1000000003)
                {
                    ApplicationArea = all;
                    Caption = 'Leave Applications';
                    RunObject = Page "HRM-Leave Requisition List";
                }
                // action("Training Application")
                // {
                //     ApplicationArea = all;
                //     RunObject = page "HRM-Training Application List";
                // }
                /* action("Self Appraisal")
                {
                    ApplicationArea = all;
                    RunObject = page "Appraisal List";
                } */
                action("Pending Offs and Double Shifts")
                {
                    ApplicationArea = all;
                    RunObject = page "Pending Offs & Double Shifts";
                    Visible = false;
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

                action("My Approved Leaves")
                {
                    ApplicationArea = all;
                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page "HRM-My Approved Leaves List";
                }
            }
            group(Appraisal)
            {
                Caption = 'Perfomance Management';

                action("Appraisal Level Setup")
                {
                    Caption = 'Appraisal Categories And Level';
                    ApplicationArea = All;
                    RunObject = Page "Appraisal Categories And Level";
                }
                action("KRA")
                {
                    Caption = 'Startegic Pillar';
                    ApplicationArea = All;
                    RunObject = Page KRA;
                }
                action("Strategic Obj Setup List")
                {
                    Caption = 'Strategic Obj Setup List';
                    ApplicationArea = All;
                    RunObject = Page "Strategic Obj Setup List";
                }
                action("Work Plan")
                {
                    Caption = 'Target Settings';
                    ApplicationArea = All;
                    RunObject = Page "work Plan";
                }
                action("Apporved Work Plan")
                {
                    Caption = 'Approved Target Settings';
                    ApplicationArea = All;
                    RunObject = Page "Approved WorkPlan List";
                }
                action("Self Appraisal list")
                {
                    Caption = 'Self Appraisal list';
                    ApplicationArea = All;
                    RunObject = Page "Self Appraisal List";
                }
                action("Released Appraisal list")
                {
                    Caption = 'Release Appraisal list';
                    ApplicationArea = All;
                    RunObject = Page "Released Self Appraisal List";
                }
            }

            // group(PerformanceAppraisal)
            // {
            //     Caption = 'Performance Appraisal';
            //     Image = Capacities;

            //     action("Appraisal Years")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Appraisal Years';
            //         RunObject = Page "HRM-Appraisal Years List";
            //     }
            //     action("Supervisor Appraisal List")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Supervisor Appraisal List';
            //         RunObject = Page "HRM-Appraisal Sup. Emp. List";
            //     }
            //     action("Appraisee Self Targets")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Appraisee Self Targets';
            //         RunObject = Page "HRM-Appraisee Self Targets";
            //     }
            //     action("Appraisal HR List")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Appraisal HR List';
            //         RunObject = Page "HRM-Appraisal HR Emp. List";
            //     }
            // }

            group("Recruitment Management")
            {
                Caption = 'Recruitment Management';

                action("Jobs List")
                {
                    ApplicationArea = all;
                    Caption = 'Jobs List';
                    Image = Job;

                    RunObject = Page "HRM-Jobs List";
                }

                action("Advertised Jobs")
                {
                    ApplicationArea = all;
                    Caption = 'Advertised Jobs';
                    RunObject = Page "HRM-Advertised Job List";
                }
                action("Employee Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Requisitions';
                    Image = ApplicationWorksheet;



                    RunObject = Page "HRM-Employee Requisitions List";
                }
                action("Job Applications List")
                {
                    ApplicationArea = all;
                    Caption = 'Job Applications List';
                    RunObject = Page "HRM-Job Applications List";
                }
                action("Short Listing")
                {
                    ApplicationArea = all;
                    Caption = 'Short Listing';
                    RunObject = Page "HRM-Shortlisting List";
                }
                action("Qualified Job Applicants")
                {
                    ApplicationArea = all;
                    Caption = 'Qualified Job Applicants';
                    RunObject = Page "HRM-Job Applicants Qualified";
                }
                action("Unqualified Applicants")
                {
                    ApplicationArea = all;
                    Caption = 'Unqualified Applicants';
                    RunObject = Page "HRM-Job Applicants Unqualified";
                }

            }

            group(pension)
            {
                Caption = 'Pension Management';

                Visible = false;
                action(Action40)
                {
                    ApplicationArea = all;
                    Caption = 'Employee Beneficiaries';
                    RunObject = Page "HRM-Emp. Beneficiaries List";
                }
                action("Pension Payments List")
                {
                    ApplicationArea = all;
                    Caption = 'Pension Payments List';
                    RunObject = Page "HRM-Pension Payments List";
                }
            }

            group(Grievance)
            {
                Caption = 'Grievance Management';
                Image = Alerts;

                action(DisciplineRegister)
                {
                    ApplicationArea = all;
                    Caption = 'Discipline Register';
                    RunObject = Page "HRM-Disciplinary Cases List";
                }
                action(Grievances)
                {
                    //Visible = false;
                    ApplicationArea = all;
                    Caption = 'Grievances';
                    RunObject = Page "Complaints List";
                }
                action(Pending)
                {
                    //Visible = false;
                    ApplicationArea = all;
                    Caption = 'Pending Grievances';
                    RunObject = Page "Complaints Pending";
                }
                action(ClosedCasesEnd)
                {
                    //Visible = false;
                    ApplicationArea = all;
                    Caption = 'Closed Cases';
                    RunObject = Page "Complaints Closed";
                }
                action(DisciplineCasesEnd)
                {
                    ApplicationArea = all;
                    Caption = 'Discipline Setup';
                    RunObject = Page "Discipline Cases Page Setup";
                }
                action(DisciplineYears)
                {
                    //Visible = false;
                    ApplicationArea = all;
                    Caption = 'Discipline Years';
                    RunObject = Page "Discipline Years List";
                }
            }
        }

        area(Reporting)
        {

            group("Human Resource Setups")
            {
                // action("Institutions List")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Institutions List';
                //     Image = Line;

                //     RunObject = Page "HRM-Institutions List";
                // }
                action("General HRM Setup")
                {
                    ApplicationArea = all;
                    Caption = 'General HRM Setup';
                    Image = Line;

                    RunObject = Page "HRM-Setup";
                }
                action("Base Calendar")
                {
                    ApplicationArea = all;
                    Caption = 'Base Calendar';
                    Image = Calendar;
                    RunObject = Page "Base Calendar List";
                }
                // action("Hr Setups")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Hr Setups';
                //     Image = Setup;
                //     RunObject = Page "HRM-Setup";
                // }
                action("Hr Number Series")
                {
                    ApplicationArea = all;
                    Caption = 'Hr Number Series';
                    Image = NumberSetup;
                    RunObject = Page "Human Resource Setup";
                }
                // action(Committees)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Committees';
                //     Image = Employee;
                //     RunObject = Page "HRM-Committees";
                // }
                action("Look Up Values")
                {
                    ApplicationArea = all;
                    Caption = 'Look Up Values';
                    Image = ValueLedger;
                    RunObject = Page "HRM-Lookup Values List";
                }
                action("Hr Calendar")
                {
                    ApplicationArea = all;
                    Caption = 'Hr Calendar';
                    Image = Calendar;
                    RunObject = Page "Base Calendar List";
                }
                action(" Email Parameters List")
                {
                    ApplicationArea = all;
                    Caption = ' Email Parameters List';
                    Image = Email;
                    RunObject = Page "HRM-Email Parameters List";
                }
                action("No.Series")
                {
                    ApplicationArea = all;
                    Caption = 'No.Series';
                    Visible = false;
                    RunObject = Page "No. Series";
                }
                action("Salary Steps")
                {
                    ApplicationArea = all;
                    Caption = 'Salary Steps';
                    Image = Line;
                    RunObject = Page "HRM-Job_Salary Grade/Steps";
                }
                action("prVital Setup Info")
                {
                    ApplicationArea = all;
                    Caption = 'prVital Setup Info';
                    Image = Line;
                    RunObject = page "prVital Setup Info";
                }
            }

            group(Payroll_Setups)
            {
                Caption = 'Payroll Setups';
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
                    Caption = 'PAYE Setup';
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
                    Caption = 'Control Information';
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
                    Caption = 'Posting Group';
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


                    //RunObject = Report "Individual Payslips V.1.1.3";
                    RunObject = Report "PRL-Payslips V 1.1.1 backup";
                }
                action(Action1000000029)
                {
                    ApplicationArea = all;
                    Caption = 'Third Rule';
                    Image = AddWatch;
                    RunObject = Report "A third Rule Report";
                }
                action("Employee Reports")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Report';
                    Image = PrintForm;


                    RunObject = Report "Employee Report";
                }

                // action(Action1000000041)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Staff pension';


                //     Image = Aging;
                //     RunObject = Report "PRL-Pension Report";
                // }

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

                // action(Action1000000040)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Gross Netpay';
                //     Image = Giro;
                //     RunObject = Report prGrossNetPay;
                // }
                action("NHIF Report")
                {
                    ApplicationArea = all;
                    Caption = 'NHIF Report';
                    Image = "Report";

                    RunObject = Report "PRL-NHIF Report";
                }

            }

            group(Comparisions)
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

            group(Approvals)
            {
                Caption = 'Approvals';
                Image = Alerts;

                action("Pending Approval")
                {
                    ApplicationArea = all;
                    Caption = 'Requests to Approval';
                    RunObject = Page 654;
                }
                action("Pending My Approval")
                {
                    ApplicationArea = all;
                    Caption = 'Pending My Approval';
                    RunObject = Page "Approval Entries";
                }
                action("My Approval requests")
                {
                    ApplicationArea = all;
                    Caption = 'My Approval requests';
                    RunObject = Page "Approval Request Entries";
                }
            }

            group("Casual Requisitions")
            {
                action(allreqs)
                {
                    Visible = true;
                    ApplicationArea = All;
                    Caption = 'Import Casual Attendance';
                    Image = Aging;
                    RunObject = xmlport "Import Casual Attendance";
                }
                action("Casual Attendance List")
                {
                    Visible = true;
                    ApplicationArea = all;
                    RunObject = page "Casual Attendance";
                }
            }




        }
    }
}













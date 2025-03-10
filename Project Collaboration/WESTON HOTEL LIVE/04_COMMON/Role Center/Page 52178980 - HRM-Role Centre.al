page 52178980 "HRM-Role Centre"
{
    Caption = 'HRM-Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {




            part(page1; "Payroll Cue")
            {
                ApplicationArea = all;
                Caption = 'Employees';
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
        area(creation)
        {
            group(Setups)
            {
                action("Institutions List")
                {
                    ApplicationArea = all;
                    Caption = 'Institutions List';
                    Image = Line;

                    RunObject = Page "HRM-Institutions List";
                }
                action("Base Calendar")
                {
                    ApplicationArea = all;
                    Caption = 'Base Calendar';
                    Image = Calendar;
                    RunObject = Page "Base Calendar List";
                }
                action("Hr Setups")
                {
                    ApplicationArea = all;
                    Caption = 'Hr Setups 1';
                    Image = Setup;
                    RunObject = Page "HRM-Setup";
                }
                action("Hr Number Series")
                {
                    ApplicationArea = all;
                    Caption = 'Hr Number Setup 2';
                    Image = NumberSetup;
                    RunObject = Page "Human Resource Setup";
                }
                action(Committees)
                {
                    ApplicationArea = all;
                    Caption = 'Committees';
                    Image = Employee;
                    RunObject = Page "HRM-Committees";
                }
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

            }
            group(LeavReports)
            {
                Caption = 'Reports';
                action("Leave")
                {
                    Caption = 'Leave Types';
                    ApplicationArea = all;
                    image = Report;

                    RunObject = report "Leave Types";
                }
                action(LeaveBalances)
                {
                    Caption = 'Employee Leave Balances';
                    ApplicationArea = all;
                    Image = Balance;



                    RunObject = Report "Employee Leave";
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
                action(Commission_Report)
                {
                    ApplicationArea = all;
                    Caption = 'Commission Report';
                    Image = Report2;



                    //RunObject = Report "HRM-Commission For Univ. Rep.";
                }

            }
            group(Approvals)
            {
                Caption = 'Approvals';
                Image = Alerts;
                action("Pending My Approval")
                {
                    ApplicationArea = all;
                    Caption = 'Pending My Approval';
                    RunObject = Page "Requests to Approve";
                }
                action("My Approval requests")
                {
                    ApplicationArea = all;
                    Caption = 'My Approval requests';
                    RunObject = Page "Approval Request Entries";
                }

            }
        }

        area(sections)
        {
            group(EmployeeMan)
            {
                Caption = 'Employee Manager';
                Image = HumanResources;
                action(Action22)
                {
                    ApplicationArea = all;
                    Caption = 'Active Employee List';
                    RunObject = Page "HRM-Employee List";
                    RunPageView = where(status = filter(active), "employee type" = filter(<> intern));
                }
                action(Action23)
                {
                    ApplicationArea = all;
                    Caption = 'Inactive Employees';
                    RunObject = Page "HRM-Employee List";
                    RunPageView = where(status = filter(<> active));
                }
                action(Action24)
                {
                    ApplicationArea = all;
                    Caption = 'Interns';
                    RunObject = Page "HRM-Employee List";
                    RunPageView = where(status = filter(active), "employee type" = const(intern));
                }
                action(Casuals)
                {
                    ApplicationArea = all;
                    Caption = 'Casuals';
                    RunObject = Page "HRM-Casuals Lists";
                }


            }
            group(Payroll)
            {
                Visible = false;
                Caption = 'Payroll';
                Image = SNInfo;
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
                action("NHIF Setup")
                {

                    Caption = 'NHIF Setup';
                    Image = SetupLines;

                    RunObject = Page "PRL-NHIF SetUp";
                    ApplicationArea = All;
                }
                action("Payroll Mass Changes")
                {

                    Caption = 'Payroll Mass Changes';
                    Image = AddAction;

                    RunObject = Page "HRM-Import Emp. Trans Buff";
                    ApplicationArea = All;
                }
                action(" payment Vouchers")
                {

                    Caption = ' payment Vouchers';
                    ApplicationArea = All;
                    //RunObject = Page "FIN-Payment Vouchers";
                }
            }
            /* group(Appraisal)
            {
                Caption = 'Perfomance Management';

                action(HRMAppraisal)
                {
                    Caption = 'Institution Appraisals';
                    ApplicationArea = All;

                    RunObject = Page "HRM Perfomance AppraisalL";
                }
                action(DPrtAppraisal)
                {
                    Caption = 'Departmental Appraisals';
                    ApplicationArea = All;

                    RunObject = Page "Depart Perfomance AppraisalL";
                }
                action(IndividualAppraisals)
                {
                    Caption = 'Individual Appraisals';
                    ApplicationArea = All;
                    RunObject = Page "HRM-Employee Appraisal List";
                }
                action(AppraisalsView)
                {
                    Caption = 'Appraisals Targets View';
                    ApplicationArea = All;
                    RunObject = Page "Periodic Appraisal TargetsL";
                }
                action(EscalatedView)
                {
                    Caption = 'Employee targets view';
                    ApplicationArea = All;
                    RunObject = Page "Employee Perfomance Appraisals";
                }
            } */
            group("Perfomance Appraisal")
            {
                Caption = 'Perfomance Appraisal';

                group(Setup)
                {
                    action("Appraisal setup")
                    {
                        ApplicationArea = all;
                        RunObject = page "Appraisal Setups";
                    }


                    action("Core Values")
                    {
                        ApplicationArea = all;
                        RunObject = page "Core Value";
                    }
                    action("Response Scale")
                    {
                        ApplicationArea = all;
                        RunObject = page "Response Scales";
                    }


                }
                group(Workplan)
                {
                    action(Workplans)
                    {
                        ApplicationArea = all;
                        RunObject = page "Annual Workplan List";
                    }
                }
                group(Appraisals)
                {
                    action(Appraisal)
                    {
                        ApplicationArea = all;
                        RunObject = page "Appraisal List";
                    }

                }
            }
            group("Salary Increaments")
            {
                Caption = 'Salary Increaments';
                Image = Intrastat;
                action("Salary Increament Process")
                {

                    Caption = 'Salary Increament Process';
                    Image = AddAction;

                    RunObject = Page "HRM-Emp. Categories";
                    ApplicationArea = All;
                }
                action("Salary Increament Register")
                {

                    Caption = 'Salary Increament Register';
                    Image = Register;

                    RunObject = Page "HRM-Salary Increament Register";
                    ApplicationArea = All;
                }
                action("Un-Afected Salary Increaments")
                {

                    Caption = 'Un-Afected Salary Increaments';
                    Image = UndoCategory;

                    RunObject = Page "HRM-Unaffected Sal. Increament";
                    ApplicationArea = All;
                }
                action("Leave Allowance Buffer")
                {

                    Caption = 'Leave Allowance Buffer';
                    Image = Bins;

                    RunObject = Page "HRM-Leave Allowance List";
                    ApplicationArea = All;
                }
            }


            group("Salary Advances")
            {
                Caption = 'Salary Advance';

                action("Salary Advance")
                {
                    ApplicationArea = all;

                    //RunObject=page "FIN-Staff Advance List";
                }
                action("Salary Advance retiring")
                {
                    ApplicationArea = all;
                    Caption = 'Advance Surrender';
                    //RunObject=page "FIN-Staff Advance Surr. List";


                }
            }
            group(Internships)
            {
                action("Intern List")
                {
                    ApplicationArea = all;

                    RunObject = page "HRM-Intern&Attach List";
                }
                action("Application List")
                {
                    Caption = 'Register';
                    ApplicationArea = all;


                    RunObject = page "HRM-Attachment Register";
                }

            }
            group(ATT)
            {
                Caption = 'Attendance';
                Visible = false;
                action("Staff Register")
                {
                    ApplicationArea = all;
                    Caption = 'Staff Register';
                    RunObject = Page "Staff Reg.Ledger List";
                }
                action("Staff Register History")
                {
                    ApplicationArea = all;
                    Caption = 'Staff Register History';
                    RunObject = Page "Staff Ledger History";
                }
                action("Casuals Register")
                {
                    ApplicationArea = all;
                    Caption = 'Casuals Register';
                    RunObject = Page "Casuals  Reg.Ledger List";
                }
                action("Casuals History")
                {
                    ApplicationArea = all;
                    Caption = 'Casuals History';
                    RunObject = Page "Casuals Ledger History";
                }
            }
            group(Attnd)
            {
                Caption = 'Staff Attendance';
                Image = Statistics;
                action(ParmStaffCurr)
                {
                    ApplicationArea = all;
                    Caption = 'Permanent Staff (Present)';
                    Image = AddContacts;



                    RunObject = Page "Staff Attendance (Current)";
                    ToolTip = 'Open List of Staff register (Daily Attendance)';
                }
                action(CasualStaffCurr)
                {
                    ApplicationArea = all;
                    Caption = 'Casual Staff (Present)';
                    Image = Purchasing;



                    RunObject = Page "Casual Attendance (Current)";
                    ToolTip = 'Open Attendance List for Casual Employees';
                }
                action(ParmStaff)
                {
                    ApplicationArea = all;
                    Caption = 'Permanent Staff (History)';
                    Image = AddContacts;



                    RunObject = Page "Staff Attendance View";
                    ToolTip = 'Open List of Staff register (Daily Attendance)';
                }
                action(CasualStaff)
                {
                    ApplicationArea = all;
                    Caption = 'Casual Staff (History)';
                    Image = Purchasing;



                    RunObject = Page "Casual Staff Attendance View";
                    ToolTip = 'Open Attendance List for Casual Employees';
                }
            }
            group(LeaveMan)
            {
                Caption = 'Leave Management';
                Image = Capacities;
                action(leavetypes)
                {
                    ApplicationArea = all;
                    Caption = 'Leave Types';

                    RunObject = page "HRM-Leave Types";

                }
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
                action("Generate Leave Letter")
                {
                    ApplicationArea = all;
                    RunObject = page "HRM-Leave letter generate";
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
                action("Staff Back To Office")
                {
                    ApplicationArea = all;
                    RunObject = Page "HRM-Return to Office";
                    ToolTip = 'Is filled by staff when they return from leave';
                }

            }
            group(JobMan)
            {
                Caption = 'Jobs Management';
                Image = ResourcePlanning;
                action("Jobs List")
                {
                    ApplicationArea = all;
                    Caption = 'Jobs List';
                    Image = Job;

                    RunObject = Page "HRM-Jobs List";
                }
            }
            group(Recruit)
            {
                Caption = 'Recruitment Management';
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
                action("Advertised Jobs")
                {
                    ApplicationArea = all;
                    Caption = 'Advertised Jobs';
                    RunObject = Page "HRM-Advertised Job List";
                }
            }
            group(Welfare)
            {
                Caption = 'Welfare Management';
                Image = Capacities;
                action("Company Activity")
                {
                    ApplicationArea = all;
                    Caption = 'Company Activity';
                    RunObject = Page "HRM-Company Activities List";
                }
                action("Welfare Application")
                {
                    ApplicationArea = all;
                    Caption = 'Welfare Application';
                    RunObject = page "HRM-Welfare Application";
                }
            }
            group(setus)
            {
                Caption = 'Setups';
                Image = HRSetup;

            }
            group(pension)
            {
                Caption = 'Pension Management';
                Image = History;
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
            group(train)
            {
                Caption = 'Training Management';
                action("Training Applications")
                {
                    ApplicationArea = all;
                    Caption = 'Training Applications';
                    RunObject = Page "HRM-Training Application List";
                }
                action("Training Courses")
                {
                    ApplicationArea = all;
                    Caption = 'Training Courses';
                    RunObject = Page "HRM-Course List";
                }
                action("Training Providers")
                {
                    ApplicationArea = all;
                    Caption = 'Training Providers';
                    RunObject = Page "HRM-Training Providers List";
                }
                action("Training Needs")
                {
                    ApplicationArea = all;
                    Caption = 'Training Needs';
                    RunObject = Page "HRM-Train Need Analysis List";
                }
                action("Back To Office")
                {
                    ApplicationArea = all;
                    Caption = 'Back To Office';
                    RunObject = Page "HRM-Back To Office List";
                }
            }
            group(exitInterview)
            {
                Caption = 'Interviews';
                Image = Alerts;
                action("Interview")
                {
                    ApplicationArea = all;
                    RunObject = page "HRM-Interview Details List";

                }
                action(" Exit Interview")
                {
                    ApplicationArea = all;
                    Caption = ' Exit Interview';
                    RunObject = Page "HRM-Exit Interview List";
                }
            }

            group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = LotInfo;
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


                action(Action1000000003)
                {
                    ApplicationArea = all;
                    Caption = 'Leave Applications';
                    RunObject = Page "HRM-Leave Requisition List";
                }
                action("Training Application")
                {
                    ApplicationArea = all;
                    RunObject = page "HRM-Training Application List";
                }
                /* action(Appraisals)
                {
                    ApplicationArea = all;
                    RunObject = page "Employee Perf AppraisalsL";
                } */
                action("My Approved Leaves")
                {
                    ApplicationArea = all;
                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page "HRM-My Approved Leaves List";
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
            }

        }
        area(Reporting)
        {

        }




    }
}


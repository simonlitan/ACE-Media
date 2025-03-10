page 52179097 "HRM-HR&Payroll Role Cente"
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
                group(Internships)
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


            }
            // group(Payroll)
            // {
            //     Visible = false;
            //     Caption = 'Payroll';

            //     action("Salary Card")
            //     {

            //         Caption = 'Salary Card';
            //         Image = Employee;

            //         RunObject = Page "HRM-Employee-List";
            //         ApplicationArea = All;
            //     }
            //     action("Transcation Codes")
            //     {

            //         Caption = 'Transcation Codes';
            //         Image = Setup;

            //         RunObject = Page "PRL-Transaction Codes List";
            //         ApplicationArea = All;
            //     }
            //     action("NHIF Setup")
            //     {

            //         Caption = 'NHIF Setup';
            //         Image = SetupLines;

            //         RunObject = Page "PRL-NHIF SetUp";
            //         ApplicationArea = All;
            //     }
            //     action("Payroll Mass Changes")
            //     {

            //         Caption = 'Payroll Mass Changes';
            //         Image = AddAction;

            //         RunObject = Page "HRM-Import Emp. Trans Buff";
            //         ApplicationArea = All;
            //     }
            //     action(" payment Vouchers")
            //     {

            //         Caption = ' payment Vouchers';
            //         ApplicationArea = All;
            //         //RunObject = Page "FIN-Payment Vouchers";
            //     }
            // }
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
            // group("Salary Increaments")
            // {
            //     Caption = 'Salary Increaments';

            //     action("Salary Increament Process")
            //     {

            //         Caption = 'Salary Increament Process';
            //         Image = AddAction;

            //         RunObject = Page "HRM-Emp. Categories";
            //         ApplicationArea = All;
            //     }
            //     action("Salary Increament Register")
            //     {

            //         Caption = 'Salary Increament Register';
            //         Image = Register;

            //         RunObject = Page "HRM-Salary Increament Register";
            //         ApplicationArea = All;
            //     }
            //     action("Un-Afected Salary Increaments")
            //     {

            //         Caption = 'Un-Afected Salary Increaments';
            //         Image = UndoCategory;

            //         RunObject = Page "HRM-Unaffected Sal. Increament";
            //         ApplicationArea = All;
            //     }
            //     action("Leave Allowance Buffer")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Leave Allowance Buffer';
            //         Image = Bins;

            //         RunObject = Page "HRM-Leave Allowance List";
            //     }

            // }
            // group("Salary Advances")
            // {
            //     Caption = 'Salary Advance';

            //     action("Salary Advance")
            //     {
            //         ApplicationArea = all;

            //         //RunObject=page "FIN-Staff Advance List";
            //     }
            //     action("Salary Advance retiring")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Advance Surrender';
            //         //RunObject=page "FIN-Staff Advance Surr. List";


            //     }
            // }
            // group(Internships)
            // {
            //     action("Intern List")
            //     {
            //         ApplicationArea = all;

            //         RunObject = page "HRM-Intern&Attach List";
            //     }
            //     action("Application List")
            //     {
            //         Caption = 'Register';
            //         ApplicationArea = all;


            //         RunObject = page "HRM-Attachment Register";
            //     }

            // }
            // group(ATT)
            // {
            //     Caption = 'Attendance';
            //     Visible = false;
            //     action("Staff Register")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Staff Register';
            //         RunObject = Page "Staff Reg.Ledger List";
            //     }
            //     action("Staff Register History")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Staff Register History';
            //         RunObject = Page "Staff Ledger History";
            //     }
            //     action("Casuals Register")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Casuals Register';
            //         RunObject = Page "Casuals  Reg.Ledger List";
            //     }
            //     action("Casuals History")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Casuals History';
            //         RunObject = Page "Casuals Ledger History";
            //     }
            // }
            // group(Attnd)
            // {
            //     Caption = 'Staff Attendance';

            //     action(ParmStaffCurr)
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Permanent Staff (Present)';
            //         Image = AddContacts;



            //         RunObject = Page "Staff Attendance (Current)";
            //         ToolTip = 'Open List of Staff register (Daily Attendance)';
            //     }
            //     action(CasualStaffCurr)
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Casual Staff (Present)';
            //         Image = Purchasing;



            //         RunObject = Page "Casual Attendance (Current)";
            //         ToolTip = 'Open Attendance List for Casual Employees';
            //     }
            //     action(ParmStaff)
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Permanent Staff (History)';
            //         Image = AddContacts;



            //         RunObject = Page "Staff Attendance View";
            //         ToolTip = 'Open List of Staff register (Daily Attendance)';
            //     }
            //     action(CasualStaff)
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Casual Staff (History)';
            //         Image = Purchasing;



            //         RunObject = Page "Casual Staff Attendance View";
            //         ToolTip = 'Open Attendance List for Casual Employees';
            //     }
            // }
            group(LeaveMan)
            {
                Caption = 'Leave Management';

                action(leavetypes)
                {
                    ApplicationArea = all;
                    Caption = 'Leave Types';

                    RunObject = page "HRM-Leave Types";

                }
                action(leavetypes1)
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
                action(leavetypes2)
                {
                    ApplicationArea = all;
                    Caption = 'Leave Types';

                    RunObject = page "HRM-Leave Types";

                }

            }
            // group(Welfare)
            // {
            //     Caption = 'Welfare Management';

            //     action("Company Activity")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Company Activity';
            //         RunObject = Page "HRM-Company Activities List";
            //     }
            //     action("Welfare Application")
            //     {
            //         ApplicationArea = all;
            //         Caption = 'Welfare Application';
            //         RunObject = page "HRM-Welfare Application";
            //     }
            // }
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

            group("HRM Jobs Management")
            {
                Caption = 'Jobs Management';
                group("Job Management")
                {
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

            }

            // group(setus)
            // {
            //     Caption = 'Setups';


            // }
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

            //     group(exitInterview)
            //     {
            //         Caption = 'Interviews';

            //         action("Interview")
            //         {
            //             ApplicationArea = all;
            //             RunObject = page "HRM-Interview Details List";

            //         }
            //         action(" Exit Interview")
            //         {
            //             ApplicationArea = all;
            //             Caption = ' Exit Interview';
            //             RunObject = Page "HRM-Exit Interview List";
            //         }
            //     }





            //     group("Payroll Management")
            //     {
            //         group(Payroll2)
            //         {
            //             Caption = 'Payroll';

            //             action("Salary Card1")
            //             {
            //                 ApplicationArea = all;
            //                 Caption = 'Salary Card';
            //                 Image = Employee;

            //                 RunObject = Page "HRM-Employee-List";


            //             }
            //             action(Action232)
            //             {
            //                 ApplicationArea = all;
            //                 Caption = 'Inactive Employees';
            //                 RunObject = Page "HRM-Employee List";
            //                 RunPageView = where(status = filter(<> active));
            //             }



            //             action("Payroll Approval")
            //             {
            //                 ApplicationArea = All;
            //                 Image = Approval;

            //                 RunObject = page "Prl-Approval List";
            //             }

            //         }
            //         group(BoardPayroll)
            //         {
            //             Caption = 'Board Payroll';
            //             action("BoardAlmanac")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Board Almanac List';
            //                 Image = CalendarWorkcenter;
            //                 RunObject = Page "Board Almanac List";
            //                 ToolTip = 'Board Calander';
            //             }
            //             action(AlmanacV)
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Yearly Almanac';
            //                 Image = ProfileCalender;
            //                 RunObject = page "NW-Boad Almanac ViewL";
            //             }
            //             action("BoardCommittes")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Board Commitees';
            //                 Image = Group;
            //                 RunObject = Page "Board Committes Listing";
            //                 ToolTip = 'Board Commitees';
            //             }
            //             action("BoardTax")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Board TAx';
            //                 Image = Payment;
            //                 RunObject = Page "Board Tax setup";
            //                 ToolTip = 'Board Tax';
            //             }
            //             action("MileageRates")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Mileage Rates';
            //                 Image = Payment;
            //                 RunObject = Page "NW-Mileage Allowance Rates";
            //                 ToolTip = 'Mileage Rates';
            //             }
            //             action(GlAccounts)
            //             {
            //                 Caption = 'Board Accounts';
            //                 ApplicationArea = Basic, Suite;
            //                 Image = Accounts;
            //                 RunObject = Page "NW-Board GL Accounts";
            //                 ToolTip = 'Specifies the accounts to be credited and debited';
            //             }
            //             action("BoardEntitlements")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Board Entitlements';
            //                 Image = Payment;
            //                 RunObject = Page "Board Members Allowances";
            //                 ToolTip = 'Board Commitees';
            //             }
            //             action("BoardMembers")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Board Members';
            //                 Image = Payment;
            //                 RunObject = Page "NW-Board Members List";
            //                 ToolTip = 'Board Payroll Card';
            //             }
            //             action("BoardPayrolls")
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Board Payroll';
            //                 Image = Payment;
            //                 RunObject = Page "NW-Board Payroll";
            //                 ToolTip = 'Board Payroll Card';
            //             }
            //             action(PrlPeriod)
            //             {
            //                 ApplicationArea = Basic, Suite;
            //                 Caption = 'Payroll Period';
            //                 Image = Payment;
            //                 RunObject = Page "NW-Board Payroll Periods";
            //                 ToolTip = 'Board Payroll Periods';
            //             }



            //         }
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
                    //  RunObject = Page "HRM-WorkStudy Pay List";
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


            group(Common_req)
            {
                Caption = 'Common Requisitions';

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
                // action("Memo applications")
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Memo Application';

                //     RunObject = Page "FIN-Memo Header List All";
                //     ToolTip = 'Create Memo application from departments.';
                // }
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
                action("My Approved Leaves")
                {
                    ApplicationArea = all;
                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page "HRM-My Approved Leaves List";
                }
            }
        }

        area(Reporting)
        {

            group("Human Resource Setups")
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
                    Caption = 'Hr Setups';
                    Image = Setup;
                    RunObject = Page "HRM-Setup";
                }
                action("Hr Number Series")
                {
                    ApplicationArea = all;
                    Caption = 'Hr Number Series';
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
            }

        }
    }
}




//                 group(Payroll_Setups)
//                 {
//                     Caption = 'Payroll Setups';
//                     Image = HRSetup;
//                     action("Payroll Period")
//                     {
//                         ApplicationArea = all;
//                         Caption = 'Payroll Period';
//                         Image = Period;
//                         RunObject = Page "PRL-Payroll Periods";
//                     }
//                     action("Pr Rates")
//                     {
//                         ApplicationArea = all;
//                         Caption = 'Pr Rates';
//                         Image = SetupColumns;

//                         RunObject = Page "PRL-Rates & Ceilings";
//                     }
//                     action("paye Setup")
//                     {
//                         ApplicationArea = all;
//                         Caption = 'paye Setup';
//                         Image = SetupPayment;

//                         RunObject = Page "PRL-P.A.Y.E Setup";
//                     }
//                     action(Action7)
//                     {
//                         ApplicationArea = all;
//                         Caption = 'Transcation Codes';
//                         Image = Setup;

//                         RunObject = Page "PRL-Transaction Codes List";
//                     }

//                     action(Action6)
//                     {
//                         ApplicationArea = all;
//                         Caption = 'NHIF Setup';
//                         Image = SetupLines;

//                         RunObject = Page "PRL-NHIF SetUp";
//                     }
//                     action("Nssf Tiers")
//                     {
//                         ApplicationArea = all;
//                         Image = LineReserve;
//                         RunObject = page "PRL-NSSF";
//                     }

//                     action("Bank Structure")
//                     {
//                         ApplicationArea = all;
//                         Caption = 'Bank Structure';
//                         Image = Bank;

//                         RunObject = Page "PRL-Bank Structure (B)";
//                     }
//                     action("control information")
//                     {
//                         ApplicationArea = all;
//                         Caption = 'control information';
//                         Image = CompanyInformation;

//                         RunObject = Page "GEN-Control-Information";
//                     }
//                     action("Salary Grades")
//                     {
//                         ApplicationArea = all;
//                         Caption = 'Salary Grades';
//                         Image = EmployeeAgreement;

//                         RunObject = Page "PRL-Salary Grades";
//                     }
//                     action("posting group")
//                     {
//                         ApplicationArea = all;
//                         Caption = 'posting group';
//                         Image = PostingEntries;

//                         RunObject = Page "PRL-Employee Posting Group";
//                     }
//                     action(Action69)
//                     {
//                         ApplicationArea = all;
//                         Caption = 'Salary Increament Process';
//                         Image = AddAction;

//                         RunObject = Page "HRM-Emp. Categories";
//                     }
//                     action(Action68)
//                     {
//                         ApplicationArea = all;
//                         Caption = 'Salary Increament Register';
//                         Image = Register;

//                         RunObject = Page "HRM-Salary Increament Register";
//                     }
//                     action(Action66)
//                     {
//                         ApplicationArea = all;
//                         Caption = 'Un-Afected Salary Increaments';
//                         Image = UndoCategory;

//                         RunObject = Page "HRM-Unaffected Sal. Increament";
//                     }
//                     /* action(Action9)
//                     {
//                         ApplicationArea = all;
//                         Caption = 'Payment Vouchers';
//                         RunObject = Page "FIN-Payment Vouchers";
//                     } */
//                     action("Staff Welfare Loan Tires")
//                     {
//                         Image = UndoCategory;
//                         ApplicationArea = all;
//                         Caption = 'Staff Welfare Loan Tires';
//                         RunObject = Page "HRM Welfare Loan Tiers";
//                     }
//                 }

//             }



//             group(PayRepts2)
//             {
//                 Caption = 'Individual Reports';
//                 Image = ResourcePlanning;
//                 action("Individual Payslip")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'All Payslips';
//                     Image = Report2;


//                     RunObject = Report "Individual Payslips V.1.1.3";
//                 }
//                 action(Payslips)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Individual Payslip 1';
//                     Image = Report;

//                     RunObject = Report "PRL-Payslips V 1.1.1";
//                 }


//                 action("Individual Payslip 2")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Individual Payslip 2';
//                     Image = Report2;


//                     RunObject = Report "Individual Payslips mst";
//                 }
//                 action(Action1000000029)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Third Rule';
//                     Image = AddWatch;
//                     RunObject = Report "A third Rule Report";
//                 }
//                 action("P9 Report")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'P9 Report';
//                     Image = PrintForm;


//                     RunObject = Report "P9 Report (Final)";
//                 }

//                 action(Action1000000041)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Staff pension';


//                     Image = Aging;
//                     RunObject = Report "PRL-Pension Report";
//                 }

//             }
//             group(ProcessPCA)
//             {
//                 Caption = 'Pay Change Advice Processing';
//                 action(PCA)
//                 {
//                     Caption = 'PR-PCA List';
//                     Image = Change;


//                     RunObject = page "prPCA list";
//                     ApplicationArea = all;
//                 }
//                 action(prPostedPCAMassList)
//                 {
//                     Caption = 'Mass PCA List';
//                     Image = Change;


//                     RunObject = page prPCAMassList;
//                     ApplicationArea = all;
//                 }
//                 action(PostedMAssPCAList)
//                 {
//                     Caption = 'Posted Mass PCA List';
//                     Image = Change;


//                     RunObject = page prPostedPCAMassList;
//                     ApplicationArea = all;
//                 }
//                 action(OthermPCAList)
//                 {
//                     Caption = 'Other Mass PCA List';
//                     Image = Change;


//                     RunObject = page "Other mPCA list";
//                     ApplicationArea = all;
//                 }
//             }
//             group(PayrollPeoro)
//             {
//                 Caption = 'Company Reports';
//                 Image = RegisteredDocs;
//                 action("Detailed Payroll Summary")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Master Payroll Summary';
//                     Image = Report2;


//                     RunObject = Report "Payroll Summary 3";
//                 }



//                 action(Action1000000047)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Company Payroll Summary';
//                     Image = "Report";

//                     RunObject = Report "PRL-Company Payroll Summary 3";
//                 }
//                 action("Company payroll")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Company Payroll Summary 2';
//                     Image = Report;

//                     RunObject = report "PRL-Payroll Cost Analysis";
//                 }
//                 /*action("Company Payslip")
//                  {
//                     ApplicationArea = all;
//                     Caption = 'Company Payslip';
//                     Image = "Report";

//                     RunObject = Report "PRL-Company Payslip";
//                 } */

//                 action(Action1000000044)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Earnings Summary';
//                     Image = DepositSlip;
//                     RunObject = Report "PRL-Earnings Summary 5";
//                 }
//                 action(Action1000000042)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Earnings Summary 2';
//                     Image = "Report";

//                     RunObject = Report "PRL-Payments Summary 2 a";
//                 }
//                 action("bank Schedule2")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'bank Schedule';
//                     Image = "Report";
//                     RunObject = Report "PRL-Bank Schedule";
//                 }
//                 action(Action1000000043)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Deductions Summary 2';
//                     Image = "Report";

//                     RunObject = Report "PRL-Deductions Summary 2 a";
//                 }
//                 action(Action1000000045)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Deductions Summary';
//                     Image = Report;
//                     RunObject = Report "PRL-Deductions Summary1";
//                 }

//                 action("Payroll Summary2")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Payroll Summary';
//                     Image = "Report";

//                     RunObject = Report "PRL-Company Payroll Summary 3";
//                 }
//                 action("Deductions Summary 2")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Deductions Summary 2';
//                     Image = "Report";

//                     RunObject = Report "PRL-Deductions Summary 2 a";
//                 }
//                 action("Earnings Summary 2")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Earnings Summary 2';
//                     Image = "Report";

//                     //todo  RunObject = Report "PRL-Payments Summary 2";
//                 }

//                 action("Payroll summary")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Payroll summary';
//                     Image = "Report";

//                     RunObject = Report "Payroll Summary 2";
//                 }
//                 action("Deductions Summary")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Deductions Summary';
//                     Image = "Report";

//                     //RunObject = Report "PRL-Deductions Summary";
//                 }
//                 action("Earnings Summary")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Earnings Summary';
//                     Image = "Report";

//                     //RunObject = Report "PRL-Earnings Summary";
//                 }
//                 action("Co_op Remittance")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Co_op Remittance';
//                     Image = "Report";
//                     RunObject = Report "prCoop remmitance";
//                 }
//                 action(Transactions)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Transactions';
//                     Image = "Report";
//                     RunObject = Report "pr Transactions";
//                 }


//                 action("Departmental Summary")
//                 {

//                     ApplicationArea = all;
//                     Caption = 'Departmental Summary';
//                     Image = "Report";


//                     RunObject = Report "Detailed Payrol Summary/Dept";
//                 }

//                 action(Action1000000040)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Gross Netpay';
//                     Image = Giro;
//                     RunObject = Report prGrossNetPay;
//                 }

//                 action("Employer Certificate")
//                 {

//                     Caption = 'Employer Certificate';
//                     Image = "Report";


//                     ApplicationArea = All;

//                     //RunObject = Report "Employer Certificate P.10 mst";
//                 }
//                 action("P.10")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'P.10';
//                     Image = "Report";

//                     RunObject = Report P10;
//                 }
//                 action("Paye Scheule")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Paye Schedule';
//                     Image = "Report";

//                     RunObject = Report "prPaye Schedule mst";
//                 }
//                 action("NHIF Schedule")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'NHIF Schedult';
//                     Image = "Report";

//                     Visible = false;
//                     //RunObject = Report "prNHIF mst";
//                 }
//                 action("NSSF Schedule")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'NSSF Schedule';
//                     Image = "Report";

//                     RunObject = Report "prNSSF mst";
//                 }

//                 action(Action1000000028)
//                 {

//                     Caption = 'Co_op Remittance';
//                     Image = CreateForm;
//                     RunObject = Report "prCoop remmitance";
//                     ApplicationArea = All;
//                     Visible = false;
//                 }
//                 action("payroll Journal Transfer")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Payroll Journal Transfer';
//                     Image = Journals;

//                     Visible = false;
//                     //RunObject = Report prPayrollJournalTransfer;
//                 }
//                 action("mass update Transactions")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'mass update Transactions';
//                     Image = PostBatch;

//                     Visible = false;
//                     //RunObject = Report "Mass Update Transactions";
//                 }
//                 action("Pension Report")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Combined Pension Report';
//                     Image = PrintForm;


//                     RunObject = Report "PRL - Pension Combined 2";
//                 }

//                 action("NHIF Report")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'NHIF Report';
//                     Image = "Report";

//                     RunObject = Report "PRL-NHIF Report";
//                 }
//                 action("SACCO Report")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'SACCO Report';
//                     Image = "Report";

//                     RunObject = Report "PRL-Welfare Report";
//                 }
//                 action("HELB Report")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'HELB Report';
//                     Image = "Report";


//                     RunObject = Report "PRL-HELB Report";
//                 }
//                 action("NSSF Report (A)")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'NSSF Report (A)';
//                     Image = "Report";

//                     RunObject = Report "PRL-NSSF Report (A)";
//                 }
//                 action("NSSF Report (B)")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'NSSF Report (B)';
//                     Image = "Report";

//                     RunObject = Report "PRL-NSSF Report (B)";
//                 }
//                 action("NSSF Report (Combined)")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'NSSF Report (Combined)';
//                     Image = "Report";

//                     RunObject = Report "PRL-NSSF Report Combined";
//                 }



//             }
//             group(PeriodicActivities)
//             {
//                 Caption = 'Journals';
//                 action(JournalTransfer)
//                 {
//                     ApplicationArea = all;
//                     Image = Journal;
//                     RunObject = report PrPayrollJournalTransfer;
//                 }
//                 action("payrollJournal Transfer")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Casual Journal Transfer';
//                     Image = Journals;

//                     RunObject = Report "PRl-Casual Journal Transfer";
//                 }
//             }
//             group(HRDATA_Upload)
//             {
//                 action("Import Employees")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Employees Upload';
//                     Image = Journal;
//                     RunObject = xmlport "Import Employees";

//                 }
//                 action(LeaveUpload)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Leave Upload';
//                     Image = Journal;
//                     RunObject = xmlport "HRM-Leave App Upload";

//                 }
//                 action(LeaveUpload1)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Leave Ledgerentry Upload';
//                     Image = Journal;
//                     RunObject = xmlport "Leave Ledger Entry Upload";

//                 }
//             }
//             group(prlComparision)
//             {
//                 Caption = 'Comparison Reports';
//                 action(CumAll)
//                 {
//                     Visible = true;
//                     ApplicationArea = all;
//                     Caption = 'Cummulative Allowances';
//                     Image = Aging;
//                     RunObject = Report "PRL-Cummulative Allowances";
//                 }
//                 action(cumDed)
//                 {
//                     Visible = true;
//                     ApplicationArea = all;
//                     Caption = 'Cummulative Deductions';
//                     Image = Aging;
//                     RunObject = Report "PRL-Cummulative Deductions";
//                 }
//                 action(payrollvar)
//                 {
//                     Visible = true;
//                     ApplicationArea = all;
//                     Caption = 'Payroll Cost Analysis';
//                     Image = Aging;
//                     RunObject = Report "PR Payroll Summary - Variance";
//                 }
//                 action(payrollvariace)
//                 {
//                     Visible = true;
//                     ApplicationArea = all;
//                     Caption = 'Payroll variance 1';
//                     Image = Aging;
//                     RunObject = Report "PRL-Payroll Variance Report";
//                 }
//                 action(payrollvar2)
//                 {

//                     ApplicationArea = all;
//                     Caption = 'Payroll Variance 2';
//                     Image = Aging;
//                     RunObject = Report "Payroll Variance Report 2";
//                 }
//                 action(DetPayVar)
//                 {
//                     Visible = true;
//                     ApplicationArea = all;
//                     Caption = 'Details Payroll Variance';
//                     Image = Aging;
//                     RunObject = Report "PRL-Detailed Payroll Variance";
//                 }
//                 action(DetailedSimplifiedReport)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Detailed Simplified Payroll Report';
//                     Image = Aging;
//                     //RunObject = Report "PRL Detailed simplified Report";
//                 }










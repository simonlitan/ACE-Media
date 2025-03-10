/// <summary>
/// Page HRM HRPayroll Role Cente (ID 52179097).
/// </summary>
page 52178890 "HRM-HR&Payroll Role Cente"
{
    Caption = 'Role Center';
    PageType = RoleCenter;
    UsageCategory = Administration;
    ApplicationArea = All, Basic, Suite, Advance;

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
        area(sections)
        {
            group("Human Resource")
            {

                group(EmployeeMan)
                {
                    Caption = 'Employee Manager';

                    action(" ")
                    {

                    }
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
                    action(Action27)
                    {
                        ApplicationArea = all;
                        Caption = 'Attachees';
                        RunObject = Page "HRM-Employee List";
                        RunPageView = where(status = filter(active), "employee type" = const(Attachee));
                    }
                    action(Casuals)
                    {
                        ApplicationArea = all;
                        Caption = 'apprenticeship';
                        RunObject = Page "HRM-Casuals Lists";
                    }


                }



                group(LeaveMan)
                {
                    Caption = 'Leave Management';


                    action(leavetypes)
                    {
                        Caption = 'Leave Types';
                        ApplicationArea = all;
                        Image = SetupList;
                        RunObject = page "HRM-Leave Types";

                    }
                    action("Leave Planner List")
                    {
                        ApplicationArea = all;
                        visible = false;
                        Image = Planning;
                        RunObject = page "HRM-Leave Plan List";
                    }
                    action(Action14)
                    {
                        ApplicationArea = all;
                        Caption = 'All Leave Applications';
                        Image = Register;

                        RunObject = Page "HRM-All Leave Requisitions";
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

                    action("Staff Back To Office")
                    {
                        ApplicationArea = all;
                        RunObject = Page "HRM-Return to Office";
                        ToolTip = 'Is filled by staff when they return from leave';
                    }
                    action("Recalled Leaves")
                    {
                        ApplicationArea = all;
                        RunObject = Page "HRM-Recalled Leave List";
                        ToolTip = 'Is filled by staff when they recalled from leave';
                    }

                }


                group(train)
                {
                    Caption = 'Training Management';
                    action(Courses)
                    {
                        ApplicationArea = All;
                        Caption = 'Course';
                        RunObject = Page "HRM-Course List";
                    }
                    action("Training Needs")
                    {
                        ApplicationArea = all;
                        Caption = 'Training Needs';
                        //RunObject = Page "HRM-Train Need Analysis List";
                        RunObject = Page "HRM-Course List";
                    }
                    // action("Training Plan")
                    // {
                    //     ApplicationArea = all;
                    //     Caption = 'Training Projections';
                    //     RunObject = page "Annual Training Plan List";
                    // }
                    action("Training Projections")
                    {
                        ApplicationArea = All;
                        Caption = 'Staff Training Projections';
                        ToolTip = 'Three years projection';
                        RunObject = page "Training and Development List";
                    }

                    action("Training Applications")
                    {
                        ApplicationArea = all;
                        Caption = 'Training Applications';
                        RunObject = Page "HRM-Training Application List";
                    }

                    action("Training Providers")
                    {
                        ApplicationArea = all;
                        Caption = 'Training Providers';
                        RunObject = Page "HRM-Training Providers List";
                    }
                    action("Back To Office")
                    {
                        ApplicationArea = all;
                        Caption = 'Back To Office';
                        RunObject = Page "HRM-Back To Office List";
                    }
                }
                group("Complaint Management")
                {
                    Visible = false;
                    action("  ")
                    {

                    }
                    action("Complaints List")
                    {
                        ApplicationArea = all;
                        RunObject = page "HRM-Complaint List";
                    }
                    action("Alternative Dispute Resolution")
                    {
                        ApplicationArea = all;
                        RunObject = page "Alternative Dispute List";
                    }
                }
                group("Disciplinary")
                {

                    action("    ")
                    {

                    }
                    action("Disciplinary List")
                    {
                        ApplicationArea = all;
                        RunObject = page "HRM-Disciplinary Cases List";
                    }
                }
                group(exitInterview)
                {

                    Caption = 'Employee Separation';
                    action("  - ")
                    {
                        Caption = ' ';
                    }
                    action("  -- ")
                    {
                        Caption = ' ';
                    }

                    /* action("Interview")
                    {
                        ApplicationArea = all;
                        RunObject = page "HRM-Interview Details List";

                    } */
                    action("Exit Interview")
                    {
                        ApplicationArea = all;
                        Caption = 'Employee Separation';
                        RunObject = Page "HRM-Exit Interview List";
                    }
                }

                action("Biometric Logs")
                {
                    Visible = false;
                    ApplicationArea = all;
                    Caption = 'Biometric Logs';
                    //  RunObject = page "Biometric Logs";
                }




            }
            group("Other Payments")
            {
                action("Other Payment")
                {
                    ApplicationArea = all;
                    RunObject = page "Payroll PV";
                }
            }
            group("Job Management")
            {
                group(JobMan)
                {
                    Caption = 'Jobs Management';
                    action(action021)
                    {
                        Caption = '';
                    }
                    action(action022)
                    {
                        Caption = '';
                    }
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

                    action("        ")
                    {
                        Caption = '';
                    }

                    action("Employee Requisitions")
                    {
                        ApplicationArea = all;
                        Caption = 'Employee Requisitions';
                        Image = ApplicationWorksheet;

                        RunObject = Page "HRM-Employee Requisitions List";
                    }
                    action("Advertised Jobs")
                    {
                        ApplicationArea = all;
                        Caption = 'Advertised Jobs';
                        RunObject = Page "HRM-Advertised Job List";
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
                        Caption = 'Succesful Job Applicants';
                        RunObject = Page "HRM-Job Applicants Qualified";
                    }
                    action("Unqualified Applicants")
                    {
                        ApplicationArea = all;
                        Caption = 'Unsuccesful Applicants';
                        RunObject = Page "HRM-Job Applicants Unqualified";
                    }

                }
                group(Appraisal)
                {
                    Caption = 'Perfomance Management';



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
                    // action(DPrtAppraisal)
                    // {
                    //     Caption = 'Departmental Appraisals';
                    //     ApplicationArea = All;

                    //     RunObject = Page "Depart Perfomance AppraisalL";
                    // }
                    // action(IndividualAppraisals)
                    // {
                    //     Caption = 'Individual Appraisals';
                    //     ApplicationArea = All;

                    //     RunObject = Page "HRM-Employee Appraisal List";
                    // }
                    // action(AppraisalsView)
                    // {
                    //     Caption = 'Appraisals Targets View';
                    //     ApplicationArea = All;

                    //     RunObject = Page "Periodic Appraisal TargetsL";
                    // }
                    // action(EscalatedView)
                    // {
                    //     Caption = 'Employee targets view';
                    //     ApplicationArea = All;

                    //     RunObject = Page "Employee Perfomance Appraisals";
                    // }
                }
                group(Setup)
                {
                    action(KRA)
                    {
                        Caption = 'Startegic Pillar';
                        ApplicationArea = All;
                        RunObject = Page KRA;

                    }
                    action("Appraisal Level Setup")
                    {
                        Caption = 'Appraisal Categories And Level';
                        ApplicationArea = All;
                        RunObject = Page "Appraisal Categories And Level";
                    }
                    action(Activities)
                    {

                        ApplicationArea = All;
                        RunObject = Page Activities;

                    }
                    action("Means Of Verification")
                    {

                        ApplicationArea = All;
                        RunObject = Page "Means Of Verification";

                    }

                    action("Expected Output")
                    {

                        ApplicationArea = All;
                        RunObject = Page "Expected Output";

                    }
                    action(Strategies)
                    {

                        ApplicationArea = All;
                        RunObject = Page Strategies;

                    }
                }
            }


            group("Payroll Management")
            {
                group(Payroll2)
                {
                    Caption = 'Payroll';


                    action("Salary Card1")
                    {
                        ApplicationArea = all;
                        Caption = 'Salary List';
                        Image = Employee;

                        RunObject = Page "HRM-Employee-List";


                    }



                    action("Payroll Approval")
                    {
                        ApplicationArea = All;
                        Image = Approval;
                        RunObject = page "Prl-Approval List";
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
                group("Salary Increaments")
                {
                    Caption = 'Salary Increaments';
                    action(action01)
                    {
                        Caption = '';
                    }

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
                        ApplicationArea = all;
                        Caption = 'Leave Allowance Buffer';
                        Image = Bins;

                        RunObject = Page "HRM-Leave Allowance List";
                    }

                }
                group(ProcessPCA)
                {

                    Visible = true;
                    Caption = 'Pay Change Management';
                    action(PCA)
                    {
                        ApplicationArea = all;
                        Caption = 'Individual PCA List';
                        Image = Employee;
                        RunObject = page "prPCA list";

                    }
                    action(prPostedPCAMassList)
                    {
                        ApplicationArea = all;
                        Caption = 'Group PCA List';
                        Image = DistributionGroup;
                        RunObject = page prPCAMassList;

                    }
                    action(PostedMAssPCAList)
                    {
                        ApplicationArea = all;
                        Caption = 'Posted PCA List';
                        Image = SerialNoProperties;
                        RunObject = page prPostedPCAMassList;

                    }
                    /* action(OthermPCAList)
                    {
                        Caption = 'Other Mass PCA List';
                        Image = Change;
                        RunObject = page "Other mPCA list";
                        ApplicationArea = all;
                    } */
                }
                group(BoardPayroll)
                {
                    visible = false;
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

            }

            group("Repair & Maintenance")
            {
                Visible = false;
                action("New Applications")
                {
                    ApplicationArea = All;
                    Image = JobLines;
                    RunObject = Page "Repair and Maintenance App";
                }
                action("Pending Applications")
                {
                    ApplicationArea = All;
                    Image = Approvals;
                    RunObject = page "RM-Pending";
                }
                action("Under Repair/Maintenance")
                {
                    ApplicationArea = All;
                    Image = CompleteLine;
                    RunObject = page "RM-Under Maintenance";
                }
                action("Repair/Maintenance Completed")
                {
                    ApplicationArea = All;
                    Image = Completed;
                    RunObject = page "RM-Maintenance Complete";
                }
                group("Repair/Maintenance Report")
                {
                    action(" '' ")
                    {

                    }
                    action("Repair/Maintenance Report ")
                    {
                        ApplicationArea = all;
                        RunObject = report "Repair/Maintenance Report";
                    }
                }
            }
            group("Cleaning Services")
            {
                Visible = false;

                action("Open Cleaning Schedules")
                {
                    ApplicationArea = all;
                    RunObject = page "Cleaning List";
                }
                action("Closed Cleaning Schedules")
                {
                    ApplicationArea = all;
                    RunObject = page "Closed Cleaning Schedule";
                }
                group("Cleaning Reports")
                {
                    action("Cleaning Schedule")
                    {
                        ApplicationArea = all;
                        RunObject = report "Cleaning Schedule Report";
                    }
                }
            }
            group("Customer Management")
            {
                Visible = false;
                action("New Visitors")
                {
                    ApplicationArea = all;
                    RunObject = page "Cm Visitors List";

                }
                action("Checked-In Visitors")
                {
                    ApplicationArea = all;
                    RunObject = page "Checked-In visitors";
                }
                action("Checked-Out Visitors")
                {
                    ApplicationArea = all;
                    RunObject = page "Checked-Out visitors";
                }
                group("Reports ")
                {
                    action("Visitors Report")
                    {
                        ApplicationArea = all;
                        RunObject = report "Visitors Report";
                    }
                    action("Visitors Items Report")
                    {
                        ApplicationArea = all;
                        RunObject = report "Visitors Items Report";
                    }
                    action("Firearms Report")
                    {
                        ApplicationArea = all;
                        RunObject = report "Visitors Firearm report";
                    }
                }
            }
            group("General Activities")
            {
                group(AppraisalApplication)
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
        area(Reporting)
        {
            group(Setups)
            {
                group("Human Resource Setup")
                {
                    image = SetupLines;
                    action(leavetypes1)
                    {
                        ApplicationArea = all;
                        Caption = 'Leave Types';
                        Image = SuggestChartOfAccounts;
                        RunObject = page "HRM-Leave Types";
                    }
                    action("Leave Periods")
                    {
                        ApplicationArea = all;
                        Image = Period;
                        RunObject = page "HRM-Leave Periods";
                    }
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
                        Caption = 'Employee Categories';
                        Image = AddAction;

                        RunObject = Page "HRM-Emp. Categories";
                    }


                    /* action(Action68)
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
                      action(Action9)
                     {
                         ApplicationArea = all;
                         Caption = 'Payment Vouchers';
                         RunObject = Page "FIN-Payment Vouchers";
                     } 
                     action("Staff Welfare Loan Tires")
                     {
                         Image = UndoCategory;
                         ApplicationArea = all;
                         Caption = 'Staff Welfare Loan Tires';
                         RunObject = Page "HRM Welfare Loan Tiers";
                     } */
                }

            }

            group("Reports")
            {
                group(PayRepts2)
                {
                    Caption = 'Payroll Reports';
                    Image = ResourcePlanning;
                    action("Individual Payslip")
                    {
                        ApplicationArea = all;
                        Caption = 'Payslips';
                        Image = Report2;


                        RunObject = Report "Individual Payslips V.1.1.3";
                    }
                    action(Payslips)
                    {
                        Visible = false;
                        ApplicationArea = all;
                        Caption = 'Individual Payslip 1';
                        Image = Report;

                        RunObject = Report "PRL-Payslips V 1.1.1";
                    }


                    action("Individual Payslip 2")
                    {
                        Visible = false;
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




                    action("NHIF Report")
                    {
                        ApplicationArea = all;
                        Caption = 'NHIF Report';
                        Image = "Report";

                        RunObject = Report "PRL-NHIF Report";
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
                group(LeavReports)
                {
                    Caption = 'Hr Reports';
                    image = ResourcePlanning;
                    action("Leave")
                    {
                        Caption = 'Leave Types';
                        ApplicationArea = all;
                        image = ListPage;

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
                        Caption = 'Leave Transactions';
                        ApplicationArea = all;
                        Image = Translation;

                        RunObject = Report "Standard Leave Balance Report";
                    }

                    action(EmployeeList)
                    {
                        ApplicationArea = all;
                        Caption = 'Employee List';
                        Image = Employee;
                        RunObject = Report "All employees list";
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
                        Caption = 'Employee Summary';
                        Image = SuggestGrid;
                        RunObject = Report "Employee Details Summary";
                    }


                }
            }




            group(PeriodicActivities)
            {
                Caption = 'Journals';
                action(JournalTransfer)
                {
                    ApplicationArea = all;
                    Image = Journal;
                    //RunObject = report "Payroll JVS Transfer";
                    RunObject = report "Payroll JVS Transfer";
                }
                /*  action("payrollJournal Transfer")
                 {
                     ApplicationArea = all;
                     Caption = 'Casual Journal Transfer';
                     Image = Journals;

                     RunObject = Report "PRl-Casual Journal Transfer";
                 } */
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
                    Visible = false;
                    Image = ApplicationWorksheet;
                    RunObject = page "Ledger Correction Buffer";
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


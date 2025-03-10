page 52178914 "HRM-Rc"
//page 52178487 "HRM Role Center"
{
    Caption = 'HRM-Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }



        }
    }

    actions
    {
        area(Creation)
        {

            action(HRMJobs)
            {
                ApplicationArea = all;
                Caption = 'Jobs Management';
                Image = Job;

                RunObject = Page "HRM-Jobs List";

            }

            action(HRMemployee)
            {
                ApplicationArea = all;
                Caption = 'Employee List';
                RunObject = Page "HRM-Employee List";
            }
            action(HRMEmployees)
            {
                ApplicationArea = all;
                Caption = 'Inactive Employee List';
                Image = Job;

                RunObject = Page "HRM-Employee-List (Inactive)";

            }
            action(HRMEmployee1)
            {
                ApplicationArea = all;
                Caption = 'Casual Employee List';
                Image = Job;

                RunObject = Page "HRM-Casuals Lists";

            }
            action(LeaveJournal)
            {
                ApplicationArea = all;
                Caption = 'Leave Journals';
                Image = Journals;

                ToolTip = 'Allocate and Post leave days for Employees';
                RunObject = Page "HRM-Emp. Leave Journal Lines";

            }
            action(HRMLeaves)
            {
                ApplicationArea = all;
                Caption = 'Leave Applications';
                RunObject = Page "HRM-Leave Requisition List";
            }
            action(HRMLeavesApplies)
            {
                ApplicationArea = all;
                Caption = 'View Leave Applications';
                RunObject = Page "HRM-View Leave List";
            }

            action(HRMPostedLeaves)
            {
                ApplicationArea = all;
                Caption = 'Posted Leave';
                RunObject = Page "HRM-Leave Requisition Posted";
            }
            action(LeaveAdj)
            {
                ApplicationArea = all;
                Caption = 'Leave Adjustment';
                // RunObject = page "Leave Adjustments";
            }
        }

        area(Reporting)
        {
            group(HRMReport)
            {
                Caption = 'Employee Reports';
                ToolTip = 'Get Reports Related to Employee Manager';
                action(EmployeeList)
                {
                    ApplicationArea = all;
                    Caption = 'Employee List';
                    Image = Employee;

                    RunObject = Report "HR Employee List";
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

                action(Employee_List)
                {
                    ApplicationArea = all;
                    Caption = 'Employee List';
                    Image = "Report";

                    RunObject = Report "HR Employee List";
                }
                action("Employee Beneficiaries")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Beneficiaries';
                    Image = "Report";

                    RunObject = Report "HR Employee Beneficiaries";
                }
                action(Employee_CVSunmmary)
                {
                    ApplicationArea = all;
                    Caption = 'Employee CV Sunmmary';
                    Image = SuggestGrid;

                    RunObject = Report "Employee Details Summary";
                }
            }






            /*  action(CommissionReport)
             {
                 ApplicationArea = all;
                 Caption = 'Commission Report';
                 Image = Report2;
                
                 PromotedIsBig = true;
                 RunObject = Report "HRM-Commission For Univ. Rep.";
             }*/

        }

        area(sections)
        {
            group(EmployeeMan)
            {
                Caption = 'Employee Manager';
                Image = HumanResources;
                group("Employees")
                {
                    action(HRMemploye)
                    {
                        ApplicationArea = all;
                        Caption = 'New Employee';
                        RunObject = Page "HRM-Employee List";
                    }
                    action(Action22)
                    {
                        ApplicationArea = all;
                        Caption = 'Active Employees';
                        RunObject = Page "HRM-Employee List";
                    }
                    action(Casuals)
                    {
                        ApplicationArea = all;
                        Caption = 'Casuals';
                        RunObject = Page "HRM-Casuals Lists";
                    }
                    action(Interns)
                    {
                        ApplicationArea = all;
                        Caption = 'Interns';
                        // RunObject = Page "HRM-Intern&Attach List";
                    }

                }
            }
            /*  group(Payroll)
             {
                 Visible = false;
                 Caption = 'Payroll';
                 Image = SNInfo;
                 action("Salary Card")
                 {

                     Caption = 'Salary Card';
                     Image = Employee;
                    
                     RunObject = Page "HRM-Employee-List";
                 }
                 action("Transcation Codes")
                 {

                     Caption = 'Transcation Codes';
                     Image = Setup;
                    
                     RunObject = Page "PRL-Transaction Codes List";
                 }
                 action("NHIF Setup")
                 {

                     Caption = 'NHIF Setup';
                     Image = SetupLines;
                    
                     RunObject = Page "PRL-NHIF SetUp";
                 }
                 action("Payroll Mass Changes")
                 {

                     Caption = 'Payroll Mass Changes';
                     Image = AddAction;
                    
                     RunObject = Page "HRM-Import Emp. Trans Buff";
                 }
                 action(" payment Vouchers")
                 {

                     Caption = ' payment Vouchers';
                     RunObject = Page "FIN-Payment Vouchers";
                 }
             } */
            /* group("Salary Increaments")
            {
                Caption = 'Salary Increaments';
                Image = Intrastat;
                Visible = false;
                action("Salary Increament Process")
                {

                    Caption = 'Salary Increament Process';
                    Image = AddAction;
                   
                    RunObject = Page "HRM-Emp. Categories";
                }
                action("Salary Increament Register")
                {

                    Caption = 'Salary Increament Register';
                    Image = Register;
                   
                    RunObject = Page "HRM-Salary Increament Register";
                }
                action("Un-Afected Salary Increaments")
                {

                    Caption = 'Un-Afected Salary Increaments';
                    Image = UndoCategory;
                   
                    RunObject = Page "HRM-Unaffected Sal. Increament";
                }
                action("Leave Allowance Buffer")
                {

                    Caption = 'Leave Allowance Buffer';
                    Image = Bins;
                   
                    RunObject = Page "HRM-Leave Allowance Buffer";
                }
            }*/

            group(JobMan)
            {
                Caption = 'Jobs Management';
                Image = ResourcePlanning;
                Visible = false;
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



                // action("Recruitment Plan")
                // {
                //     Caption = 'Recruitment Plan';
                //     ApplicationArea = All;

                //     RunObject = Page "Recruitment Plan List";
                // }
                // action("Recruitment Requisition")
                // {
                //     Caption = 'Recruitment Requisition';
                //     ApplicationArea = All;

                //     RunObject = Page "Recruitment Requisition List";
                // }
                // action("Approved Recruisitions")
                // {
                //     Caption = 'Approved Recruisitions';
                //     ApplicationArea = All;

                //     RunObject = Page "Recruitment Req Approved";
                // }

                action("Employee Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Recruitment  Request';
                    Image = ApplicationWorksheet;
                    Visible = false;

                    RunObject = Page "HRM-Employee Requisitions List";
                }
                action("Job Applications List")
                {
                    ApplicationArea = all;
                    Caption = 'Submitted Applicantions';
                    RunObject = Page "HRM-Job Applications List";
                }
                action("Short Listing")
                {
                    ApplicationArea = all;
                    Caption = 'Short Listing Applicants';
                    RunObject = Page "HRM-Shortlisting List";
                }
                action("Qualified Job Applicants")
                {
                    ApplicationArea = all;
                    Caption = 'Shortlisted Applicants';
                    RunObject = Page "HRM-Job Applicants Qualified";
                }
                action("Unqualified Applicants")
                {
                    ApplicationArea = all;
                    Caption = 'Unsuccessful Applicants';
                    RunObject = Page "HRM-Job Applicants Unqualified";
                }
                action("Advertised Jobs")
                {
                    ApplicationArea = all;
                    Caption = 'Advertised Jobs';
                    RunObject = Page "HRM-Advertised Job List";
                }
                group("Recruitment Setup")
                {
                    action("JobsList")
                    {
                        ApplicationArea = all;
                        Caption = 'Recrutment Plan';
                        Image = Job;

                        RunObject = Page "HRM-Jobs List";
                    }

                }
            }
            group(LeaveMan)
            {
                Caption = 'Leave Management';
                Image = Capacities;

                action(Action14)
                {
                    ApplicationArea = all;
                    Caption = 'Leave Applications';
                    Image = Register;

                    RunObject = Page "HRM-Leave Requisition List";
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
                /* action("Leave Carry Forward")
                {
                    ApplicationArea = All;
                    Caption = 'Leave Carry Forward';
                    ToolTip = 'Carry forward a maximum of 15 days';
                    //RunObject = page "";

                } */
                group(LeavReports)
                {
                    Caption = 'Employee Leave Report';
                    action(LeaveBalances)
                    {
                        Caption = 'Employee Leave Balances';
                        ApplicationArea = all;
                        Image = Balance;

                        RunObject = Report "Employee Leaves";
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
                group("Leave Setup")
                {
                    action(LeaveType)
                    {
                        ApplicationArea = all;
                        Caption = 'Leave Types';
                        Image = Register;

                        RunObject = Page "HRM-Leave Types";
                    }
                }


            }



            group(train)
            {
                Caption = 'Training Management';
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
                // action("Training Application")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Staff Training Projections';
                //     ToolTip = 'Three years projection';
                //     RunObject = page "Training and Development List2";
                // }

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
            group(DisplinaryProcess)
            {
                Caption = 'Displinary Cases';
                action(DisplinaryCases)
                {
                    Caption = 'Displinary Cases List';
                    ApplicationArea = All;

                    //RunObject = Page "HRM-Disciplinary Cases New";

                }

                action(PendingApproval)
                {
                    Caption = 'Cases Awaiting Approval';
                    ApplicationArea = All;

                    // RunObject = Page "HRM-Disciplinary Cases Pending";

                }

                // action(UnderInvestigation)
                // {
                //     Caption = 'Cases Under Investigation';
                //     ApplicationArea = All;

                //     RunObject = Page "HRM-Disciplinary Approved";

                // }


            }
            group(setups)
            {
                Caption = 'Setups';
                Image = HRSetup;

                action("Base Calendar")
                {
                    ApplicationArea = all;
                    Caption = 'Base Calendar';
                    RunObject = Page "Base Calendar List";
                }
                action("Hr Setups")
                {
                    ApplicationArea = all;
                    Caption = 'Hr Setups';
                    RunObject = Page "HRM-SetUp List";
                }
                action("Hr Number Series")
                {
                    ApplicationArea = all;
                    Caption = 'Hr Number Series';
                    RunObject = Page "Human Resource Setup";
                }
                action(LeaveTypes)
                {
                    ApplicationArea = all;
                    Caption = 'Leave Types';
                    Image = Register;

                    RunObject = Page "HRM-Leave Types";
                }

                action("Hr Calendar")
                {
                    ApplicationArea = all;
                    Caption = 'Hr Calendar';
                    RunObject = Page "Base Calendar List";
                }
                action(" Email Parameters List")
                {
                    Visible = false;
                    ApplicationArea = all;
                    Caption = ' Email Parameters List';
                    // RunObject = Page "HRM-Email Parameters List";
                }
                action("No.Series")
                {
                    ApplicationArea = all;
                    Caption = 'No.Series';
                    RunObject = Page "No. Series";
                }
                action("Salary Steps")
                {
                    Visible = false;
                    ApplicationArea = all;
                    Caption = 'Salary Steps';
                    RunObject = Page "HRM-Job_Salary Grade/Steps";
                }
            }



            group(Approvals)
            {
                Visible = false;
                Caption = 'Approvals';
                Image = Alerts;

                action("Pending Approval")
                {
                    ApplicationArea = all;
                    Caption = 'Requests to Approval';
                    RunObject = Page "Requests to Approve";
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
            group(exitInterview)
            {
                Caption = 'Staff Separation';

                action("Separation")
                {
                    ApplicationArea = all;
                    RunObject = page "HRM-Interview Details List";

                }
                action(" Exit Interview")
                {
                    ApplicationArea = all;
                    Caption = ' Separation';
                    RunObject = Page "HRM-Exit Interview List";
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

        }
    }
}



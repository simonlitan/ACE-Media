page 52178981 "FLT-Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {


            part(Control8; "FLT-Cue")
            {
                Caption = 'Fleet Management';
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
            part("Approvals14"; "Approvals Activities Twelve")
            {
                ApplicationArea = Suite;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Reports)
            {
                Caption = 'FLT Reports';
                Image = SNInfo;
            }
            action(Vehicles)
            {
                Caption = 'Vehicle List';
                Image = "Report";

                RunObject = Report "FLT Vehicle List";
                ApplicationArea = All;
            }
            action(Drivers)
            {
                Caption = 'Driver List';
                Image = "Report";

                RunObject = Report "FLT Driver List";
                ApplicationArea = All;
            }
            action(WT)
            {
                Caption = 'Work Ticket';
                Image = "Report";


                RunObject = Report "FLT Daily Work Ticket";
                ApplicationArea = All;
            }
        }
        area(sections)
        {
            group(Vehicle_Man)
            {
                Caption = 'Vehicle Management';
                Image = AnalysisView;
                action("Vehicle Card")
                {
                    Caption = 'Vehicle Card';
                    Image = Register;

                    RunObject = Page "FLT-Vehicle Card List";
                    ApplicationArea = All;
                }
                action("Driver Card")
                {
                    Caption = 'Driver Card';
                    Image = History;

                    RunObject = Page "FLT-Driver List";
                    ApplicationArea = All;
                }
            }
            group(Transport_re)
            {
                Caption = 'Transport Requisitions';
                Image = Travel;
                action("Transport Requisition")
                {
                    Caption = 'Transport Requisition';
                    RunObject = Page "FLT-Transport Req. List";
                    ApplicationArea = All;
                }

                action("Approved Transport Requisition")
                {
                    Caption = 'Approved Transport Requisition';
                    RunObject = Page "FLT-Approved transport Req";
                    ApplicationArea = All;
                }

            }
            group(Safari_Notices)
            {
                Caption = 'Travel Notices';
                Image = ResourcePlanning;
                action(Travel_Notices)
                {
                    Caption = 'Travel Notice';
                    Image = Register;



                    RunObject = Page "FLT-Safari Notices List";
                    ApplicationArea = All;
                }
                action("Approved Travel Notices")
                {
                    Caption = 'Approved Travel Notices';
                    Image = History;

                    RunObject = Page "FLT-Posted Safari Notices List";
                    ApplicationArea = All;
                }
            }
            group(Fuel_reqs)
            {
                Caption = 'Fuel Requisitions';
                Image = Intrastat;
                action(Fuel_Req)
                {
                    Caption = 'Fuel Requisitions';
                    Image = Register;



                    RunObject = Page "FLT-Fuel Req. List";
                    ApplicationArea = All;
                }
                action(sub_Fuel_Req)
                {
                    Caption = 'Submitted Fuel Requisitions';
                    Image = History;

                    RunObject = Page "FLT-Fuel Req. Submitted List";
                    ApplicationArea = All;
                }
                action(Unpaid_Fuel_Req)
                {
                    Caption = 'Unpaid Fuel Requisitions';
                    Image = History;

                    RunObject = Page "FLT-Fuel Req. Unpaid";
                    ApplicationArea = All;
                }
                action(Closed_Fuel_Req)
                {
                    Caption = 'Closed/Paid Fuel Requisitions';
                    Image = History;

                    RunObject = Page "FLT-Fuel Req. Closed List";
                    ApplicationArea = All;
                }
                action(Batch_fuel_Pay)
                {
                    Caption = 'Batch Fuel Payments';
                    Image = History;

                    RunObject = Page "FLT-Fuel Pymnt Batch List";
                    ApplicationArea = All;
                }
            }
            group("Work Tickets")
            {
                Caption = 'Work Tickets';
                Image = Marketing;
                action(workTick)
                {
                    Caption = 'Daily Work Tickets';
                    Image = Register;



                    RunObject = Page "FLT-Daily Work Ticket List";
                    ApplicationArea = All;
                }
                action(Closed_Work_Tick)
                {
                    Caption = 'Closed Daily Work Tickets';
                    Image = History;

                    RunObject = Page "FLT-Closed Work Ticket List";
                    ApplicationArea = All;
                }
            }
            group(Maint_Req)
            {
                Caption = 'Maintenance Request';
                Image = Receivables;
                action(main_Req)
                {
                    Caption = 'Maintenance Request';
                    Image = Register;



                    RunObject = Page "FLT-Maint. Req. List";
                    ApplicationArea = All;
                }
                action(subMmain_Req)
                {
                    Caption = 'Submitted Maintenance Request';
                    Image = History;

                    RunObject = Page "FLT-Maint. Req. Sub. List";
                    ApplicationArea = All;
                }
                action(Appr_main_Req)
                {
                    Caption = 'Approved Maintenance Request';
                    Image = Register;



                    RunObject = Page "FLT-Approved  Maintenance Req";
                    ApplicationArea = All;
                }
                action(Closed_main_Req)
                {
                    Caption = 'Closed Maintenance Request';
                    Image = History;

                    RunObject = Page "FLT-Closed Maint. Req. List";
                    ApplicationArea = All;
                }
            }
            group(Setup)
            {
                Caption = 'Setups';
                Image = Setup;
                action(FleetMan_setup)
                {
                    Caption = 'Fleet Mgt Setup';
                    Image = Register;



                    RunObject = Page "FLT-Setup";
                    ApplicationArea = All;
                }
                action(flet_man_app_setup)
                {
                    Caption = 'Fleet Mgt Approval Setup';
                    Image = History;

                    RunObject = Page "FLT-Approval Setup";
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

        }
    }
}


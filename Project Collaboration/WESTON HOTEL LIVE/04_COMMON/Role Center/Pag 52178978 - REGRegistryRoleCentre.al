/* /// <summary>
/// Page REG-Registry Role Centre (ID 52178640).
/// </summary>
page 52178978 "REG-Registry Role Centre"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
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
            part(Control102; "Headline RC Project Manager")
            {
                ApplicationArea = Jobs;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Outbound)
            {
                Caption = 'Outbound Mails';
                Image = "Report";

                RunObject = Report "Out-bound Mails";
                ApplicationArea = All;
            }
            action(Inbound_Rep)
            {
                Caption = 'Inbound Mails';
                Image = Report2;

                RunObject = Report "In-bound Mails";
                ApplicationArea = All;
            }
            action(Reg_Files)
            {
                Caption = 'Registry Files';
                Image = "Report";

                RunObject = Report "Registry Files";
                ApplicationArea = All;
            }
        }
        area(sections)
        {
            group("Security Management")
            {
                Caption = 'Security Management';
                Image = Travel;
                action("Visits Ledger")
                {
                    Caption = 'Visits Ledger';
                    Image = ValueLedger;

                    RunObject = Page "Visitors Ledger List";
                    ApplicationArea = All;
                }
                action("Visitors Card")
                {
                    Caption = 'Visitors Card';
                    RunObject = Page "Visitors List";
                    ApplicationArea = All;
                }
                action("Visits History")
                {
                    Caption = 'Visits History';
                    RunObject = Page "Visitors Ledger History";
                    ApplicationArea = All;
                }
                action("Staff Register")
                {
                    Caption = 'Staff Register';
                    RunObject = Page "Staff Reg.Ledger List";
                    ApplicationArea = All;
                }
                action("Staff Register History")
                {
                    Caption = 'Staff Register History';
                    RunObject = Page "Staff Ledger History";
                    ApplicationArea = All;
                }
            }
            group(Inbound)
            {
                Caption = 'Out-bound Mails';
                Image = Reconcile;
                action("New (Outbound)")
                {
                    Caption = 'New (Outbound)';
                    RunObject = Page "REG-New Outbound Mails List";
                    ApplicationArea = All;
                }
                action(Dispatch)
                {
                    Caption = 'Dispatch';
                    RunObject = Page "REG-Outbound Mail (Disp.) List";
                    ApplicationArea = All;
                }
                action(Released)
                {
                    Caption = 'Released';
                    RunObject = Page "REG-Released Outbnd Mails List";
                    ApplicationArea = All;
                }
            }
            group(In_bound)
            {
                Caption = 'In-bound Mails';
                Image = Capacities;
                action("New Inbound Mails")
                {
                    Caption = 'New Inbound Mails';
                    RunObject = Page "REG-New Inbound Mails List";
                    ApplicationArea = All;
                }
                action("Inbound (Sorting)")
                {
                    Caption = 'Inbound (Sorting)';
                    RunObject = Page "REG-Inbound Mails (Sort.) List";
                    ApplicationArea = All;
                }
                action(Sorted)
                {
                    Caption = 'Sorted';
                    RunObject = Page "REG-Sorted Inbound Mails List";
                    ApplicationArea = All;
                }
            }
            group(File_Movement)
            {
                Caption = 'File Movement';
                Image = ResourcePlanning;
                action("New Reg. Files")
                {
                    Caption = 'New Reg. Files';
                    RunObject = Page "REG-Registry Files List";
                    ApplicationArea = All;
                }
                action("Active Reg. Files")
                {
                    Caption = 'Active Reg. Files';
                    RunObject = Page "REG-Active Files List";
                    ApplicationArea = All;
                }
                action("Partially Active Files")
                {
                    Caption = 'Partially Active Files';
                    RunObject = Page "REG-Partially Active Files Lst";
                    ApplicationArea = All;
                }
                action("Bring-up Reg. Files")
                {
                    Caption = 'Bring-up Reg. Files';
                    RunObject = Page "REG-Bringup Files List";
                    ApplicationArea = All;
                }
                action("Archived Reg. Files")
                {
                    Caption = 'Archived Reg. Files';
                    RunObject = Page "REG-Arch. Registry Files List";
                    ApplicationArea = All;
                }
            }
            group(Approvals)
            {
                Caption = 'Approvals';
                Image = Alerts;
                action("Pending My Approval")
                {
                    Caption = 'Pending My Approval';
                    RunObject = Page "Requests to Approve";
                    ApplicationArea = All;
                }
                action("My Approval requests")
                {
                    Caption = 'My Approval requests';
                    RunObject = Page "Approval Request Entries";
                    ApplicationArea = All;
                }
                // action("Clearance Requests")
                // {
                //     Caption = 'Clearance Requests';
                //     RunObject = Page 68970;
                // }
            }
            group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = LotInfo;

                action("Stores Requisitions")
                {
                    Caption = 'Stores Requisitions';
                    ApplicationArea = All;
                    RunObject = Page "PROC-Store Requisition";
                }
                action("Imprest Requisitions")
                {
                    Caption = 'Imprest Requisitions';
                    ApplicationArea = All;
                    RunObject = Page "FIN-Imprest List UP";
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
                action("My Approved Leaves")
                {
                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }

                action("File Requisitions")
                {
                    Image = Register;

                    RunObject = Page "REG-File Requisition List";
                    ApplicationArea = All;
                }

            }
        }
    }
}

 */
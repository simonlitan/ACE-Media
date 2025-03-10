/// <summary>
/// PageExtension ExtAdministrator Role Center (ID 52178863) extends Record Administrator Role Center;.
/// </summary>
pageextension 52178863 "IT Manager" extends "Administrator Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("User Setup")
        {
            action("User Settings")
            {
                ApplicationArea = all;
                RunObject = page "User Settings List";
            }
            action(Users)
            {
                ApplicationArea = all;
                RunObject = page Users;
            }

        }
        addafter("Data Privacy")
        {
            group(Common_req)
            {
                Caption = 'Requisitions';
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
                action(Appraisal)
                {
                    ApplicationArea = all;
                    RunObject = page "Employee Perf AppraisalsL";
                }
                action("My Approved Leaves")
                {

                    Caption = 'My Approved Leaves';

                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }

            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
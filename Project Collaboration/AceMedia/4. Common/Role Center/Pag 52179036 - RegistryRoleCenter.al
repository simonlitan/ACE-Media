page 52179036 "Registry Role Center"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Headline; "Headline RC Administrator")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Approval; "Approvals Activities")
            {
                ApplicationArea = All;
                Caption = 'Registry Approvals';
            }
            part(RegCues; "Registry Cues")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(sections)
        {
            group("FileIndex")
            {
                action("File Index")
                {
                    ApplicationArea = all;
                    RunObject = page "File Index";
                }
            }
            group("In-Bound Mails")
            {
                action("Receive In-Mails")
                {
                    ApplicationArea = All;
                    RunObject = page "Received Mails";
                }
                action("Inward Register")
                {
                    ApplicationArea = All;

                    RunObject = Page "Inward Register";
                }
                action("Official Mails")
                {
                    ApplicationArea = All;
                    RunObject = page "Departmental Files";
                }
                action("My Assigned Mails1")
                {
                    ApplicationArea = all;
                    Caption = 'My Assigned Mails';
                    Image = History;
                    RunObject = Page "My assigned mails List";
                }
                action("Personal Mails")
                {
                    ApplicationArea = All;
                    Visible = false;
                    RunObject = page "Personal Mails List";
                }
                action("Brought-Up Mails")
                {
                    ApplicationArea = All;
                    RunObject = page "Brought-Up Mails";
                    Visible = false;
                }
                action("Returned Mails")
                {
                    ApplicationArea = All;
                    RunObject = page "Returned Mails";
                }

                // action("Secret Registry")
                // {
                //     ApplicationArea = all;

                //     RunObject = page "Confidential Departmental File";
                // }
                action("File Movement History")
                {
                    ApplicationArea = All;
                    RunObject = page "File Movement List";
                }


            }
            group("Outbound Mails")
            {
                action("Receive Outbound Mail")
                {
                    ApplicationArea = All;
                    RunObject = page "Outbound Mails";
                }

                action("Completed Outbound Mails")
                {
                    ApplicationArea = All;
                    RunObject = page "Completed Mails";
                }
                action("Mails under Correction")
                {
                    ApplicationArea = All;
                    RunObject = page "Correction Outbound Mail";
                }
                action("Dispatched Mails")
                {
                    ApplicationArea = All;
                    RunObject = page "Dispatched Mails";
                }
            }
            group("Pegion Holes")
            {
                Visible = false;
                action("Pigeon Holes")
                {
                    ApplicationArea = All;
                    RunObject = page "Pigeon Holes";
                }
                action("Closed Pigeon Holes")
                {
                    ApplicationArea = All;
                    RunObject = page "Closed Pigeon Holes";
                }
            }
            // group("Archives Register")
            // {
            //     action("File Movement Register")
            //     {
            //         ApplicationArea = All;
            //         RunObject = page "File Movement List";
            //     }
            // }
            group("Archives Register")
            {
                action("File Appraisal Reqests")
                {
                    ApplicationArea = All;

                    RunObject = Page "REG-File Appraisal Req";
                }
                action("Archives")
                {
                    ApplicationArea = All;

                    RunObject = Page "REG-Archive Register";
                }
                action("Destroy File(s)")
                {
                    ApplicationArea = All;

                    RunObject = Page "REG-MarkedforDest";
                }
                action("Destruction History")
                {
                    ApplicationArea = All;

                    RunObject = Page "REG-FileDestruction History";
                }

                // action("Mail Register")
                // {
                //     ApplicationArea = All;
                //    
                //     RunObject = Page "REG-Mail Register List";
                // }
                action("Registry Files List")
                {
                    ApplicationArea = All;

                    RunObject = Page "REG-Registry Files List1";
                }
                action("File Requisition List")
                {
                    ApplicationArea = All;

                    RunObject = Page "REG-File Requisition List1";
                }
                action("File Request Reasons")
                {
                    //   RunObject = Page "REG-File Request Reasons";
                    Visible = false;
                }
            }

            group("Registry Reports")
            {
                group("Inward Register Reports")
                {
                    action("Official Inward Register")
                    {
                        ApplicationArea = All;
                        RunObject = report "Official Inward Mail Register";
                    }
                    action("Personal Inward Register")
                    {
                        ApplicationArea = All;
                        RunObject = report "Personal Inbound Mail";
                    }
                }
                action("Outward Mail Register")
                {
                    ApplicationArea = All;
                    RunObject = report "Outbound Mail";
                }
                action("File Movement Register Report")
                {
                    ApplicationArea = All;
                    RunObject = report "File Movement Register";
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
                group("Memo Application.")
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
                        ApplicationArea = Suite;
                        Caption = 'Approved Memo Application';

                        RunObject = Page "FIN-Memo List All";
                        ToolTip = 'Create Memo application from departments.';
                    }



                }
                group("Imprest Application")
                {
                    action("Imprest Requisitions")
                    {

                        Caption = 'Imprest Requisitions';
                        ApplicationArea = all;
                        RunObject = page "FIN-Imprests List";

                    }
                    action("My Approved Imprest")
                    {
                        ApplicationArea = all;
                        RunObject = Page "FIN-Imprest List UP";

                    }
                    action("My Posted Imprests")
                    {
                        RunObject = page "FIN-Posted imprest list";
                        ApplicationArea = all;
                    }

                }
                group("Imprest Accounting.")
                {

                    action("ImprestAccounting")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Imprest Accounting';
                        Image = Journal;
                        RunObject = Page "FIN-Imprest Accounting";
                        ToolTip = 'Imprest Accounting';
                    }
                    action("ImprestAccounting.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'My Approved Imprest Accounting';
                        Image = Journal;
                        RunObject = Page "Approved Imprest Surrender";
                        ToolTip = 'Imprest Accounting';
                    }
                    action("ImprestAccounting1")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'My Posted Imprest Accounting';
                        Image = Journal;
                        RunObject = Page "Posted Imprest Surrender";
                        ToolTip = 'Imprest Accounting';
                    }

                }
                group("Leave Application")
                {
                    action("Leave Applications")
                    {

                        Caption = 'Leave Applications';
                        RunObject = Page "HRM-All Leave Requisitions";
                        ApplicationArea = All;
                    }
                    action("Approved Leave Applications")
                    {

                        Caption = 'My Approved Leave Applications';
                        RunObject = Page "HRM-My Approved Leaves List";
                        ApplicationArea = All;
                    }
                    action("Posted Leave Applications")
                    {

                        Caption = 'My Posted Leave Applications';
                        RunObject = Page "HRM-Leave Requisition List";
                        ApplicationArea = All;
                    }

                }
                group("Purchase Requisition")
                {
                    action("Purchase  Requisitions")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Purchase Requisitions';

                        RunObject = Page "FIN-Purchase Requisition";
                        ToolTip = 'Create purchase requisition from departments.';
                    }
                    action("Approved Purchase  Requisitions")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Approved Purchase Requisitions';

                        RunObject = Page "FIN-Purchase Requisition";
                        ToolTip = 'Create purchase requisition from departments.';
                    }
                    action("Posted Purchase  Requisitions")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Posted Purchase Requisitions';

                        RunObject = Page "FIN-Purchase Requisition";
                        ToolTip = 'Create purchase requisition from departments.';
                    }

                }
                group("Store Requisitions")
                {
                    action("Stores Requisitions")
                    {

                        Caption = 'Stores Requisitions';
                        RunObject = Page "PROC-Store Requisition";
                        ApplicationArea = All;
                    }
                    action("Approved Stores Requisitions")
                    {

                        Caption = 'Approved Stores Requisitions';
                        RunObject = Page "PROC-Store Requisition2";
                        ApplicationArea = All;

                    }
                    action("Posted Stores Requisitions")
                    {

                        Caption = 'Posted Stores Requisitions';
                        RunObject = Page "PROC-Posted Store Req List";
                        ApplicationArea = All;
                    }

                }
            }
            group("Setups")
            {
                action("Registry Setup")
                {
                    ApplicationArea = All;
                    RunObject = page "Registry Setup";
                }
            }

        }
        area(embedding)
        {
            action("Received Mails")
            {
                ApplicationArea = All;
                RunObject = page "Received Mails";
            }
            action("Pigeon &Holes")
            {
                ApplicationArea = All;
                RunObject = page "Pigeon Holes";
                Visible = false;
            }
            action("File Movement Report")
            {
                ApplicationArea = All;
                RunObject = report "File Movement register";
            }
            action("Registry Setups")
            {
                ApplicationArea = All;

                RunObject = Page "Registry Setup";
            }
        }
    }


}





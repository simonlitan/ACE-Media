query 52178877 "Approval Tracking"
{
    Caption = 'Approval Tracking';
    QueryType = Normal;

    elements
    {
        dataitem(ApprovalEntry; "Approval Entry")
        {
            column(DocumentNo; "Document No.")
            {
            }
            column(ApprovalCode; "Approval Code")
            {
            }
            column(ApproverID; "Approver ID")
            {
            }
            column(SequenceNo; "Sequence No.")
            {
            }
            column(Status; Status)
            {
            }

            dataitem(approvalCline; "Approval Comment Line")
            {
                DataItemLink = "Document No." = ApprovalEntry."Document No.",
                "User ID" = ApprovalEntry."Approver ID";
                column(CommentDocumentNo; "Document No.")
                {
                }
                column(RecordIDtoApprove; "Record ID to Approve")
                {
                }
                column(Comment; Comment)
                {
                }
                column(DateandTime; "Date and Time")
                {
                }
                column(WorkflowStepInstanceID; "Workflow Step Instance ID")
                {
                }

                dataitem(User; User)
                {
                    DataItemLink = "User Name" = ApprovalEntry."Approver ID";
                    column(FirstName; "Full Name")
                    {

                    }
                }

                /* dataitem(HRM_EmployeeD; "HRM-Employee (D)")
                {
                    DataItemLink = "No." = ApprovalEntry."Approver ID";
                    column(No; "No.")
                    {
                    }
                    column(FirstName; "First Name")
                    {
                    }
                    column(MiddleName; "Middle Name")
                    {
                    }
                    column(LastName; "Last Name")
                    {
                    }

                } */
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;

    var
        fullnames: Text;
}

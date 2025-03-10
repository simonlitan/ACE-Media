pageextension 52178436 "ExtRequests to Approve" extends "Requests to Approve"
{
    //Editable = true;
    layout
    {
      

    }
    actions
    {
        modify(Reject)
        {
            trigger OnBeforeAction()
            var
                ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                RecRef: RecordRef;
            begin
              
                IF CONFIRM('Are You sure you want to reject this document ?', TRUE) = FALSE THEN Error('Exited');
                RecRef.Get(Rec."Record ID to Approve");
                Clear(ApprovalsMgmt);
                ApprovalsMgmt.GetApprovalCommentForWorkflowStepInstanceID(RecRef, Rec."Workflow Step Instance ID");
            end;

            trigger OnAfterAction()
            begin
                Message('Successfully Rejected ');
            end;
        }
        modify(Approve)
        {
            trigger OnBeforeAction()
            begin
                IF CONFIRM('Are You sure you want to Approve this document ?', TRUE) = FALSE THEN Error('Exited');
            end;

            trigger OnAfterAction()
            begin
                Message('Successfully Approved ');
            end;
        }
    }
}
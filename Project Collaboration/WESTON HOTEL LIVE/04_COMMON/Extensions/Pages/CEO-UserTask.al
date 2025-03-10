pageextension 52178866 "User Task Ext" extends "User Task Card"
{
    layout
    {


        addafter(MultiLineTextControl)
        {

            field("Comments"; Rec."Comments")
            {
                Caption = 'Feedback';
                ApplicationArea = All;
                ToolTip = 'Comments on the progress';
                MultiLine = True;
            }
        }
        modify("Task Item")
        {
            Visible = false;
        }

    }
    actions
    {
        modify("Go To Task Item")
        {
            Visible = false;
        }
        modify("Recurrence")
        {
            Visible = false;
        }

        addbefore("Mark Completed")
        {
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Document Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                RunObject = Page "Document Attachment Details";
                RunPageLink = "No." = field("No.");

            }
        }



    }
}

/// <summary>
/// PageExtension "ExtRequests to Approve" (ID 52178865) extends Record Requests to Approve.
/// </summary>
pageextension 52178865 "ExtRequests to Approve" extends "Requests to Approve"
{
    layout
    {
        addafter(Amount)
        {




        }
        // Add changes to page layout here


    }

    actions
    {
        // Add changes to page actions here
        addbefore(Approve)
        {
            action("Open Record")
            {
                Visible = false;
                ApplicationArea = Suite;
                Caption = 'Open Record';
                Enabled = ShowRecCommentsEnabled;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Open the document, journal line, or card that the approval is requested for.';

                trigger OnAction()
                var

                begin
                    //  ShowRecord 
                end;
            }

        }
        modify(Comments)
        {
            Visible = true;

        }

    }

    trigger OnAfterGetCurrRecord()
    var
        RecRef: RecordRef;
    begin
        ShowChangeFactBox := CurrPage.Change.PAGE.SetFilterFromApprovalEntry(Rec);
        ShowCommentFactbox := CurrPage.CommentsFactBox.PAGE.SetFilterFromApprovalEntry(Rec);
        // ShowRecCommentsEnabled := RecRef.Get("Record ID to Approve");
    end;

    trigger OnAfterGetRecord()
    begin
        // SetDateStyle;
    end;

    trigger OnOpenPage()
    begin
        // FilterGroup(2);
        // SetRange("Approver ID", UserId);
        // OnOpenPageOnAfterSetUserIdFilter(Rec);
        // FilterGroup(0);
        // SetRange(Status, Status::Open);
    end;

    var
        DateStyle: Text;
        ShowAllEntries: Boolean;
        ShowChangeFactBox: Boolean;
        ShowRecCommentsEnabled: Boolean;
        ShowCommentFactbox: Boolean;


}
page 52178932 "Approvals Tracker"
{
    ApplicationArea = All;
    Caption = 'Approvals Tracker';
    PageType = List;
    SourceTable = "Approval Entry";
    UsageCategory = Lists;
    SourceTableView = sorting("Entry No.") order(descending);
    // DeleteAllowed = false;
    // InsertAllowed = false;
    // ModifyAllowed = false;
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document number copied from the relevant sales or purchase document, such as a purchase order or a sales quote.';
                }
                field("Sequence No."; Rec."Sequence No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the order of approvers when an approval workflow involves more than one approver.';
                }
                field("Approval Code"; Rec."Approval Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Code field.';
                }
                field("Sender ID"; Rec."Sender ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the user who sent the approval request for the document to be approved.';
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the user who must approve the document.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the approval status for the entry:';
                }
                field("Date-Time Sent for Approval"; Rec."Date-Time Sent for Approval")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date and the time that the document was sent for approval.';
                }
                field("Last Date-Time Modified"; Rec."Last Date-Time Modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the approval entry was last modified. If, for example, the document approval is canceled, this field will be updated accordingly.';
                }
                field("Last Modified By User ID"; Rec."Last Modified By User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the user who last modified the approval entry. If, for example, the document approval is canceled, this field will be updated accordingly.';
                }
                field("Approval Type"; Rec."Approval Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies which approvers apply to this approval template:';
                }
                field("Pending Approvals"; Rec."Pending Approvals")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pending Approvals field.';
                }
                field("Delegation Date Formula"; Rec."Delegation Date Formula")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delegation Date Formula field.';
                }
                field("Number of Approved Requests"; Rec."Number of Approved Requests")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Number of Approved Requests field.';
                }
                field("Number of Rejected Requests"; Rec."Number of Rejected Requests")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Number of Rejected Requests field.';
                }
            }
            
        }
    }
    actions
    {
        area(Navigation)
        {
            action("Record")
                {
                    ApplicationArea = Suite;
                    Caption = 'Record';
                    //Enabled = rec.ShowRecCommentsEnabled;
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Open the document, journal line, or card that the approval request is for.';

                    trigger OnAction()

                    begin
                        rec.ShowRecord();
                    end;
                }
        }
    }
    
}

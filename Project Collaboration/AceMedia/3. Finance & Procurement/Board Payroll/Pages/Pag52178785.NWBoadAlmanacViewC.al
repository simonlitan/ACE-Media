page 52178785 "NW-Boad Almanac ViewC"
{
    PageType = Card;
    SourceTable = "NW-Boad Almanac View";
    layout
    {
        area(Content)
        {
            group(general)
            {

                field("Board Period"; Rec."Board Period")
                {
                    ToolTip = 'Specifies the value of the Board Period field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            part(AL; "Board Almanac ListPart")
            {
                SubPageLink = "Budget Period" = field("Board Period");
                ApplicationArea = All;
            }
        }
    }


    actions
    {
        area(Creation)
        {
            action(RequestApp)
            {
                Caption = 'Request Approval';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Init Code";
                begin
                    if ApprovalMgt.IsBALCEnabled(Rec) = true then
                        ApprovalMgt.OnSendBALCforApproval(Rec)
                    else
                        Message('No Workflow is enabled');
                end;
            }
            action(RequestAppCan)
            {
                Caption = 'Cancel Approval Request';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Init Code";
                begin
                    if ApprovalMgt.IsBALCEnabled(Rec) = true then
                        ApprovalMgt.OnCancelBALCforApproval(Rec)
                    else
                        Message('No Workflow is enabled');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("Board Period");
            }
        }
    }

}
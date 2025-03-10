page 52179073 "Alternative DisputeCard"
{
    Caption = 'Alternative Dispute Card';
    SaveValues = true;
    PageType = Card;
    SourceTable = "HRM-Alternative Dispute R";
    DeleteAllowed = false;
    PromotedActionCategories = 'New,Process,Report,Assets,Attachments,Approvals';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Case No"; Rec."Case No")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Investigating Officer No"; Rec."Investigating Officer No")
                {
                    ApplicationArea = All;
                }
                field("Investigating Officer Name"; Rec."Investigating Officer Name")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Status 2"; Rec."Status 2")
                {
                    ApplicationArea = All;
                }
            }
            part("Alternative Dispute Lines"; "Alternative Dispute Lines")
            {
                ApplicationArea = all;
                SubPageLink = "Case No" = field("Case No");
            }
            group("Suspect(s)")
            {
                ShowCaption = false;
                part("Parties Involved"; "Case Parties List")
                {
                    Caption = 'Parties Involved';
                    ApplicationArea = all;
                    SubPageLink = "Case No" = field("Case No");
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Attachments)
            {
                ApplicationArea = all;
                Image = Attachments;
                Promoted = true;
                PromotedCategory = Category5;
                trigger OnAction()
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.Run();
                end;
            }
            /* action("Associated Assets")
            {
                ApplicationArea = all;
                Image = AssemblyOrder;
                Promoted = true;
                PromotedCategory = category4;
                trigger OnAction()
                var
                    CaseAssets: Record "Reported Case Assets";
                begin
                    CaseAssets.Reset();
                    CaseAssets.SetRange("Case No", rec."Case No");
                    page.Run(page::"Case Assets List", CaseAssets);

                end;
 
            }*/
            action("Send Approval Request")
            {
                ApplicationArea = all;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = category6;
                trigger OnAction()
                begin
                    if approvalmgt.IsDisputeHrEnabled(Rec) = true then
                        Approvalmgt.OnSendDisputeHrforApproval(Rec);
                end;
            }
            action("Approvals")
            {
                ApplicationArea = all;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = category6;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("Case No");

            }
            action("Cancel Approval Request")
            {
                ApplicationArea = all;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = category6;
                trigger OnAction()
                begin
                    if approvalmgt.IsDisputeHrEnabled(Rec) = true then
                        Approvalmgt.OnCancelSendDisputeHrforApproval(Rec);
                end;
            }
        }

    }
    var
        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";
        Approvalmgt: codeunit IntCodeunit2;
}

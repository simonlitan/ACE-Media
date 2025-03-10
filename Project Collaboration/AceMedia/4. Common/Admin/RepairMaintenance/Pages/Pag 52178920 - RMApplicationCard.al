page 52178920 "RM Application Card"
{
    Caption = 'Application Card';
    PageType = Card;
    SourceTable = RepairMaintenance;
    SourceTableView = where("Repair Status" = filter(Open));
    PromotedActionCategories = 'New,Process,Report,Approvals';
    SaveValues = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }



                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }


            }
            group("Request Description")
            {
                field("Request Description "; Rec."Request Description")
                {
                    ShowCaption = false;
                    MultiLine = true;
                    ShowMandatory = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }

            }

        }
    }
    actions
    {
        area(Processing)
        {

            action(sendApproval)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;

                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;
                trigger OnAction()
                var
                    ApprovalMgnt: Codeunit MaintenanceIntCodeunit;
                begin
                    if ApprovalMgnt.IsRepairEnabled(Rec) = true then
                        ApprovalMgnt.OnSendRepairforApproval(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';

                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("No");
            }
            action(cancellsApproval)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;

                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;


                trigger OnAction()
                var

                    ApprovalMgnt: Codeunit MaintenanceIntCodeunit;
                begin
                    if ApprovalMgnt.IsRepairEnabled(Rec) = true then
                        ApprovalMgnt.OnCancelSendRepairforApproval(Rec);
                end;
                //ApprovalMgt: Codeunit "Approvals Management";


            }
        }
    }
}

page 52179338 "Training Projection Card"
{
    DeleteAllowed = false;
    Caption = 'Training Projection Card';
    PageType = Card;
    SourceTable = "HRM-Training Projection Header";
    PromotedActionCategories = 'New,Process,Report,Approvals';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Document No"; Rec."Document No")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(period; Rec.period)
                {
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                }
                field("Job Group"; Rec."Job Group")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }

                field("Last Course Start Date"; Rec."Last Course Start Date")
                {
                    ApplicationArea = All;
                }
                field("Last Course End Date"; Rec."Last Course End Date")
                {
                    ApplicationArea = All;
                }
                field("Course Last Two Years"; Rec."Course Last Two Years")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part("Projection Lines"; "Projection Lines")
            {
                ApplicationArea = all;
                SubPageLink = Period = field(period), "Employee No" = field("Employee No");
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
                    ApprovalMgnt: Codeunit IntCodeunit2;
                begin
                    if ApprovalMgnt.IsTrainingProjectionTxtEnabled(Rec) = true then
                        ApprovalMgnt.OnSendTrainingProjectionTxtforApproval(Rec);
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
                RunPageLink = "Document No." = field("Document No");
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
                    ApprovalMgnt: Codeunit IntCodeunit2;
                begin
                    if ApprovalMgnt.IsTrainingProjectionTxtEnabled(Rec) = true then
                        ApprovalMgnt.OnCancelSendTrainingProjectionTxtforApproval(Rec);
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        rec."Created On" := Today;
        rec."Created By" := UserId;
        usersetup.get(rec."Created By");
        if usersetup.Find('-') then begin
            rec."Employee No" := usersetup."Employee No.";
            Empc.Reset();
            Empc.SetRange("No.", rec."Employee No");
            if Empc.Find('-') then begin
                rec."Employee Name" := Empc."First Name" + ' ' + empc."Middle Name" + ' ' + Empc."Last Name";
            end;
        end;

        // rec."Document No" := rec.period + rec."Employee No";
    end;






    var
        Leaveperiods: record "HRM-Leave Periods";
        Empc: Record "HRM-Employee C";
        usersetup: record "User Setup";
}

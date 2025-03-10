page 52179351 "HRM-Leave Recall Card"
{
    DeleteAllowed = false;
    Caption = 'HRM-Leave Recall Card';
    PageType = Card;
    SourceTable = "HRM-Leave Recall";
    PromotedActionCategories = 'New,Process,Reports,Approvals';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(No; Rec.No)
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    Editable = Fieldeditable;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave Period field.';
                }
                field("Leave No"; Rec."Leave No")
                {
                    Editable = Fieldeditable;
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

                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                }
                field("Applied Days"; Rec."Applied Days")
                {
                    ApplicationArea = All;
                }
                field("Utilized Days"; Rec."Utilized Days")
                {
                    ApplicationArea = All;
                }
                field("Days Recalled"; Rec."Days Recalled")
                {
                    ApplicationArea = All;
                }
                field("Type of leave"; Rec."Type of leave")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                group("Reason for Recall")
                {
                    field("Reason for Recalll"; Rec."Reason for Recall")
                    {
                        ShowCaption = false;
                        MultiLine = true;
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Post Leave Application")
            {
                ApplicationArea = all;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then Error('The Document Approval is not Complete');
                    Rec.TestField("Employee No");
                    Rec.TestField("Days Recalled");
                    LeaveEntry.Init;
                    LeaveEntry."Document No" := Rec."No";
                    LeaveEntry."Leave Period" := Date2DWY(Today, 3);
                    //LeaveEntry."Leave Period" := rec."Leave Period";
                    LeaveEntry."Transaction Date" := Rec.Date;
                    LeaveEntry."Employee No" := Rec."Employee No";
                    LeaveEntry."Leave Type" := Rec."Type of leave";
                    LeaveEntry."No. of Days" := Rec."Days Recalled";
                    LeaveEntry."Transaction Description" := Rec."Reason for Recall";
                    LeaveEntry."Entry Type" := LeaveEntry."Entry Type"::Allocation;
                    LeaveEntry."Created By" := UserId;
                    LeaveEntry."Transaction Type" := LeaveEntry."Transaction Type"::"Positive Adjustment";
                    LeaveEntry.Insert();
                    Rec."Posted By" := UserId;
                    Rec."Date Posted" := Today;
                    Rec.Modify();

                    hremp.reset();
                    hremp.SetRange("No.", rec."Employee No");
                    if HREmp.Find('-') then begin
                        HREmp."On Leave" := false;
                        HREmp.Modify();
                    end;
                    Leavereq.Reset();
                    Leavereq.SetRange("No.", rec."Leave No");
                    if Leavereq.Find('-') then begin
                        // Leavereq.Recalled := true;
                        Leavereq.Modify();
                    end;
                    Message('Successfully Posted');
                end;
            }
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
                    if ApprovalMgnt.IsLeaveRecallTxtEnabled(Rec) = true then
                        ApprovalMgnt.OnSendLeaveRecallTxtforApproval(Rec) else
                        Error('No workflow enabled!');
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
                    ApprovalMgnt: Codeunit IntCodeunit2;
                begin
                    if ApprovalMgnt.IsLeaveRecallTxtEnabled(Rec) = true then
                        ApprovalMgnt.OnCancelSendLeaveRecallTxtforApproval(Rec) else
                        Error('No workflow enabled!');
                end;
                //ApprovalMgt: Codeunit "Approvals Management";


            }
            action("Recall Report")
            {
                ApplicationArea = all;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                RunObject = report "Leave Recall Report";
                trigger OnAction()
                begin
                    rec.Reset();
                    rec.SetRange(No, rec.No);
                    if rec.Find('-') then
                        report.run(report::"Leave Recall Report", true, true, rec)
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if rec."No" = '' then begin
            Hrsetup.Get();
            Hrsetup.TestField(Hrsetup."Leave Recall Nos");
            NoSeriesMgt.InitSeries(Hrsetup."Leave Recall Nos", xRec."No. Series", 0D, rec."No", rec."No. Series");
        end;
        rec."Created By" := UserId;
        rec.Date := Today;
        Leaveperiods.Reset();
        Leaveperiods.SetRange(Closed, false);
        if Leaveperiods.Find('-') then begin
            rec."Leave Period" := Leaveperiods.Year;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if rec.Status <> rec.Status::New then Fieldeditable := false else Fieldeditable := true;
    end;

    var
        Hrsetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Fieldeditable: Boolean;
        Leaveperiods: Record "HRM-Leave Periods";
        LeaveEntry: Record "HRM-Leave Ledger";
        hremp: Record "HRM-Employee C";
        Leavereq: Record "HRM-Leave Requisition";

}

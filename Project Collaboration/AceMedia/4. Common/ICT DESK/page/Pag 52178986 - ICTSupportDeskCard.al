page 52178986 "ICT Support Desk Card"
{
    PageType = Card;
    SourceTable = "ICT Support Desk";
    PromotedActionCategories = 'New, Process, Report, Support Actions,Attachments';

    layout
    {
        area(content)
        {
            group("Issue Details")
            {
                Editable = not IsClosed;
                field("No."; Rec."No.")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Support Area"; Rec."Issue Area")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Support Area Description"; Rec."Area Description")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Support type"; Rec."Support type")
                {

                }
                field("Requesting User"; Rec."Requesting User")
                {
                    ApplicationArea = All;
                }
                field("Raised Date"; Rec."Raised Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec."Issue Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Resolved Date"; Rec."Resolved Date")
                {
                    ApplicationArea = All;
                    Visible = IsResolved;
                }
                field("Escallation Date"; Rec."Escallation Date")
                {
                    ApplicationArea = All;
                    Visible = IsEscalated;
                }
                field("Closing Consultant"; Rec."Closing Consultant")
                {
                    ApplicationArea = All;
                    Visible = IsClosed;
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = All;
                    Visible = IsClosed;
                }
            }

            group("Issue Areas")
            {
                part(ICTSupportArea; "ICT Support Area")
                {
                    SubPageLink = "No." = field("No.");
                }
            }
            label("Please Describe your issue below")
            {
                ApplicationArea = All;
                Style = StandardAccent;
            }

            group(ID)
            {
                Editable = not IsTechnician or not IsClosed;
                ShowCaption = false;
                field("Issue Description"; Rec."Issue Description")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                    MultiLine = true;
                }

            }
            label("Solution Details")
            {
                ApplicationArea = All;
                Style = Strong;
            }
            group(RD)
            {
                Editable = IsTechnician;
                ShowCaption = false;
                field("Solution Description"; Rec."Solution Description")
                {
                    Editable = not IsClosed;
                    ShowCaption = false;
                    ApplicationArea = All;
                    MultiLine = true;
                    trigger OnValidate()
                    begin
                        Rec."Assigned Technician" := UserId;
                        Rec.Modify();
                    end;
                }
            }
            field("Assigned Technician"; Rec."Assigned Technician")
            {
                ApplicationArea = All;
                Editable = IsHoD;
            }
            group("Resolving Desk Details")
            {
                Editable = not IsClosed;
                Visible = IsTechnician;
                field("Escalation Levels"; Rec."Escalation Levels")
                {
                    ApplicationArea = All;
                }
                field("Assignining Adminstrator"; Rec."Assignining Adminstrator")
                {
                    ApplicationArea = All;
                }
                field("Level 2 USERID"; Rec."Level 2 USERID")
                {
                    ApplicationArea = All;
                }
                field("Level 3 USERID"; Rec."Level 3 USERID")
                {
                    ApplicationArea = All;
                }
                field("Consultant Resolving"; Rec."Consultant Resolving")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {


            action(Submit)
            {
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                PromotedIsBig = true;
                Enabled = IsNew;
                trigger OnAction()
                var
                    SuccessLbl: Label 'Support desk request %1 submitted to ICT Support Team, Kindly be patient as they sort you out';
                    ApprovalMgnt: Codeunit MaintenanceIntCodeunit;
                begin
                    if ApprovalMgnt.IsICTDocEnabled(rec) = true then
                        ApprovalMgnt.OnSendICTDocforApproval(Rec);


                    if rec."No." <> '' then begin
                        if Rec."Issue Status" = Rec."Issue Status"::New then begin
                            Rec."Issue Status" := Rec."Issue Status"::Submitted;

                            Rec.Modify();
                        end
                        else begin
                            Message('The requests sent are not new');
                        end;
                        // CommonAppMgnt.AlertSupportTeam(Rec);
                        Message(SuccessLbl, Rec."No.");
                        CurrPage.Close();
                    end
                    //  else
                    //  Error(DescribeIssueErr, Rec."No.");
                end;



            }
            action(Approvals)
            {
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = Basic, Suite;
                RunObject = page "Approval Entries";
                RunPageLink = "Document No." = field("No.");
                Visible = not (Rec.Status = Rec.Status::Pending);
            }
            action(Resolve)
            {
                Image = Reserve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Visible = IsSubmitted or IsEscalated;
                trigger OnAction()
                var
                    SuccessLbl: Label 'The Support request %1 has been marked as Resolved';
                begin
                    if Rec."Solution Description" <> '' then begin
                        Rec."Issue Status" := Rec."Issue Status"::Resolved;
                        Rec."Consultant Resolving" := UserId;
                        Rec."Resolved Date" := CurrentDateTime;
                        Rec.Modify();
                        Message(SuccessLbl, Rec."No.");
                        CurrPage.Close();
                    end
                    else
                        Error(DescribeIssueErr, Rec."No.");
                end;
            }
            action(Close)
            {
                Image = Reserve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Visible = IsResolved;
                trigger OnAction()
                var
                    SuccessLbl: Label 'The Support request %1 has been marked as closed';
                begin

                    Rec."Issue Status" := Rec."Issue Status"::Closed;
                    Rec."Closing Consultant" := UserId;
                    Rec."Resolved Date" := CurrentDateTime;
                    Rec.Modify();
                    Message(SuccessLbl, Rec."No.");
                    CurrPage.Close();
                end;
            }
            action("Cancel Approval")
            {
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Process;
                Image = CancelApprovalRequest;
                Visible = Rec.Status = Rec.Status::Pending;

                trigger OnAction()
                var
                    ApprovalMgnt: Codeunit MaintenanceIntCodeunit;
                begin
                    ApprovalMgnt.OnCancelSendICTDocforApproval(Rec);
                end;
            }
            action("Re-Open")
            {
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Process;
                Image = ReOpen;
                Visible = (Rec.Status = Rec.Status::Closed) or (Rec.Status = Rec.Status::Rejected);

                trigger OnAction()
                var
                    SuccessMsg: Label 'The Document has been re-openned successfully';
                begin
                    Rec.Status := Rec.Status::Pending;
                    Rec.Modify();
                    Message(SuccessMsg);
                    CurrPage.Update();
                end;
            }
            action("Escalate")
            {
                Image = InsertFromCheckJournal;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                // Visible = IsResolved;
                trigger OnAction()
                var
                    SuccessLbl: Label 'The Support request %1 has been escalated';
                begin
                    Rec."Issue Status" := Rec."Issue Status"::Escalated;
                    Rec."Escallation Date" := CurrentDateTime;
                    Rec.Modify();
                    Message(SuccessLbl, Rec."No.");
                    CurrPage.Close();
                end;
            }
            action(Attachments)
            {
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = Attach;
                ToolTip = 'Attach a file such a screenshot describing the issues you have';
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
        }
    }

    procedure SetPageControl()
    begin
        if Rec."Issue Status" <> Rec."Issue Status"::New then
            IsToSubmit := true;
        if Rec."Issue Status" = Rec."Issue Status"::Resolved then
            IsResolved := true;
        if Rec."Issue Status" = Rec."Issue Status"::New then
            IsNew := true
        else
            IsNew := false;
        if Rec."Issue Status" = Rec."Issue Status"::Submitted then
            IsSubmitted := true
        else
            IsSubmitted := false;
        if Rec."Issue Status" = Rec."Issue Status"::Escalated then
            IsEscalated := true
        else
            IsEscalated := false;
        if Rec."Issue Status" = Rec."Issue Status"::Closed then
            IsClosed := true
        else
            IsClosed := false;

        UserSetup.Reset();
        UserSetup.SetFilter("User ID", UserId);
        UserSetup.SetRange("Global Dimension 2 Code", 'ICT');
        if UserSetup.Find('-') then
            IsTechnician := true
        else
            IsTechnician := false;

        if UserSetup.HOD
        then
            IsHoD := true
        else
            IsHoD := false;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        SetPageControl();
    end;

    trigger OnOpenPage()
    begin
        SetPageControl();
    end;

    trigger OnClosePage()
    begin
        SetPageControl();
    end;

    trigger OnInit()
    begin
        SetPageControl();
    end;

    var
        UserSetup: Record "User Setup";
        IsToSubmit, IsSubmitted, IsResolved, IsNew, IsTechnician, IsHoD, IsEscalated, IsClosed : Boolean;
        DescribeIssueErr: Label 'Please provide some detailed description of %1 support ticket';
        CommonAppMgnt: Codeunit "Common App Management";
        ApprovalsMgmt: Codeunit "Approval Management";


}
page 52178537 "Casual Requisition Card"
{
    PageType = Card;
    SourceTable = "Casual Requisition";
    PromotedActionCategories = 'New,Process,Report,Approvals,Posting';
    //Editable = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = IsOpen or IsPending;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                }
                field("Date From"; Rec."Date From")
                {
                    Caption = 'Start Date';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Date To"; Rec."Date To")
                {
                    Caption = 'End Date';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = All;
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Cost Center"; Rec."Cost Center")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Cost Center Name"; Rec."Cost Center Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Packs; Rec.Packs)
                {
                    ApplicationArea = all;
                    Editable = PacksEditable;
                }
                field(Staff; Rec.Staff)
                {
                    ApplicationArea = all;
                    Editable = StaffEditable;
                }
                field("Casual Required"; Rec."Casual Required")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                
                field(Position; Rec.Position)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Responsibilities; Rec.Responsibilities)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Narration; Rec.Narration)
                {
                    Caption = 'Explanation';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                    //Editable = true;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }

            group(Posting)
            {
                Editable = IsApproved;
                field("Confirmed Amount"; Rec."Confirmed Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Confirmed Amount field.';
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
         
            }
            part(Lines; "Casual Requisition Lines")
            {
                SubPageLink = No = FIELD("No.");
                ApplicationArea = All;
                Editable = true;            //IsOpen;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send Approval Request")
            {
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Enabled = true;//IsOpen;
                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Export F/O Consolidation";
                    RecRef: RecordRef;
                begin
                    IF CONFIRM('Do you really want to send the request?', TRUE) = FALSE THEN EXIT;

                    Rec.TESTFIELD(Rec.Branch);
                    Rec.TESTFIELD(Rec."Cost Center");
                    Rec.TESTFIELD(Rec."Date From");
                    Rec.TESTFIELD(Rec."Date To");
                    Rec.TESTFIELD(Rec.Responsibilities);
                    Rec.TESTFIELD(Rec.Position);//

                    CasualLine.RESET;
                    CasualLine.SETRANGE(CasualLine.No, Rec."No.");
                    IF CasualLine.FIND('-') THEN BEGIN
                        REPEAT
                            IF CasualLine."No of Days" = 0 THEN ERROR('Insert no. of days');
                            IF CasualLine.Rate = 0 THEN ERROR('Insert Daily Rate');
                           if CasualLine."First Name" = '' then Error('Insert First Name');
                           if CasualLine."Middle Name" = '' then Error('Insert Middle Name');

                        UNTIL CasualLine.NEXT = 0;
                    END;
                    // RecRef.GetTable(Rec);

                    If ApprovalsMgmt.CheckCasualRequisitionApprovalsWorkflowEnable(Rec) = true then
                        ApprovalsMgmt.OnSendCasualRequisitionForApproval(Rec);

                end;
            }
            action("Cancel Approval Request")
            {
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                ApplicationArea = All;
                Enabled = IsPending;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ApprovalsMgmt.OnCancelCasualRequisitionForApproval(Rec);
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("No.");

            }
             action("Print/Preview")
                {
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                       // IF Rec.Status <> Rec.Status::Approved THEN ERROR('You can only print after the document is Approved');
                        Rec.RESET;
                        Rec.SETFILTER("No.", Rec."No.");
                        REPORT.RUN(52178537, TRUE, TRUE, Rec);
                        Rec.RESET;
                    end;
                }
            action("Re-Open")
            {
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Process;
                Image = ReOpen;
                //Visible = IsRejected or IsApproved;
                Visible = false;

                trigger OnAction()
                var
                    SuccessMsg: Label 'The Document has been re-openned successfully';
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify();
                    Message(SuccessMsg);
                    CurrPage.Update();
                end;
            }

            action(Post)
            {
                ApplicationArea = All;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category5;
                trigger OnAction()
                begin
                    Rec.PostCasual(Rec);
                    CurrPage.Close();
                end;
            }
            action(Test)
            {
                Visible = true;

                trigger OnAction()
                begin
                    CasualLine.RESET;
                    CasualLine.SETRANGE(CasualLine.No, Rec."No.");
                    IF CasualLine.FIND('-') THEN BEGIN
                        //  CasualLine.createCasualEmployees(Rec."No.");

                    END;
                end;
            }
        }
    }
    trigger OnInit()
    begin
        SetPageCtrl();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        SetPageCtrl();
    end;

    trigger OnOpenPage()
    begin
        SetPageCtrl();
    end;

    procedure SetPageCtrl()
    begin
        IsPosted := false;
        if Rec.Status = Rec.Status::Open then
            IsOpen := true else begin
            IsOpen := false;
            if Rec.Status = Rec.Status::"Pending Approval" then
                IsPending := true else begin
                IsPending := false;
                if Rec.Status = Rec.Status::Approved then
                    IsApproved := true else begin
                    IsApproved := false;
                    if Rec.Status = Rec.Status::Rejected then
                        IsRejected := true else begin
                        IsRejected := false;
                    end;
                end;
            end;
        end;
        if Rec.Status <> Rec.Status::Approved then
            IsPosted := false;
    end;
     procedure UpdateControls()
    begin
        IF Rec.Status <> Rec.Status::Approved THEN BEGIN
            PacksEditable := FALSE;
            //CurrForm."Paying Bank Account".EDITABLE:=FALSE;
            StaffEditable := FALSE;
            
            //CurrPage.UpdateControls();
        END ELSE BEGIN
            PacksEditable := TRUE;
            //CurrForm."Paying Bank Account".EDITABLE:=TRUE;
            StaffEditable := TRUE;
           
        END;

        IF Rec.Status = Rec.Status::Open THEN BEGIN
            StaffEditable := TRUE;
            PacksEditable := TRUE;
        
           
            //CurrPage.UpdateControls();
        END ELSE BEGIN
            PacksEditable := FALSE;
            StaffEditable := FALSE;
           
            //CurrPage.UpdateControls();
        END
    end;

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        UpdateControls();
    end;



    var
        CasualLine: Record "Casual Requisition Lines";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition;
        ApprovalEntries: Page "Approval Entries";
        ApprovalsMgmt: Codeunit "Approval Management";
        IsOpen, IsApproved, IsPending, IsRejected, IsPosted : Boolean;
        PacksEditable : Boolean;
        StaffEditable : Boolean;
}



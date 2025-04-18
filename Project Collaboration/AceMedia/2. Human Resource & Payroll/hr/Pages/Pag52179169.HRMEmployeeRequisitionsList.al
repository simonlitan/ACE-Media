page 52179169 "HRM-Employee Requisitions List"
{
    CardPageID = "HRM-Employee Requisition Card";
    DelayedInsert = false;
    DeleteAllowed = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Job,Functions,Employee';
    ShowFilter = true;
    SourceTable = "HRM-Employee Requisitions";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                ShowCaption = false;
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = all;
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ApplicationArea = all;
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    ApplicationArea = all;
                }
                field("Type of Contract Required"; Rec."Type of Contract Required")
                {
                    ApplicationArea = all;
                    Caption = 'Contract';
                    Editable = false;
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = all;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
            }
        }
        area(factboxes)
        {

            systempart(Control1102755008; Outlook)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Job)
            {
                Caption = 'Job';
                action(Requirements)
                {
                    ApplicationArea = all;
                    Caption = 'Requirements';
                    Image = JobListSetup;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "HRM-Job Requirement Lines";
                    RunPageLink = "Job Id" = FIELD("Job ID");
                }
                action(Responsibilities)
                {
                    ApplicationArea = all;
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "HRM-Job Resp. Lines";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
            }
            group("Fu&nctions")
            {
                Caption = 'Fu&nctions';
                action(Advertise)
                {
                    ApplicationArea = all;
                    Caption = 'Advertise';
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        /*
                        HREmp.RESET;
                        REPEAT
                        HREmp.TESTFIELD(HREmp."Company E-Mail");
                        SMTP.CreateMessage('Job Advertisement','dgithahu@AppKings.co.ke',HREmp."Company E-Mail",
                        'URAIA Job Vacancy','A vacancy with the job description' +"Job Description"+'is open for applications',TRUE);
                        SMTP.Send();
                        UNTIL HREmp.NEXT=0;
                        */
                        Rec.TestField("Requisition Type", Rec."Requisition Type"::Internal);
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        if HREmp.Find('-') then

                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                            HREmailParameters.Reset;
                        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Vacancy Advertisements");
                        if HREmailParameters.Find('-') then begin
                            repeat
                                HREmp.TestField(HREmp."Company E-Mail");
                            //todo SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HREmp."Company E-Mail",
                            //todo   HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
                            //todo  HREmailParameters.Body + ' ' + Rec."Job Description" + ' ' + HREmailParameters."Body 2" + ' ' + Format(Rec."Closing Date") + '. ' +
                            //todo  HREmailParameters."Body 3", true);
                            //todo   SMTP.Send();
                            until HREmp.Next = 0;

                            Message('All Employees have been notified about this vacancy');
                        end;

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
                    RunPageLink = "Document No." = field("Requisition No.");
                }
                action("&Send Approval Request")
                {

                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if Confirm('Send this Requisition for Approval?', true) = false then exit;

                        TESTFIELDS;

                        //ApprovalMgt.SendEmpRequisitionAppReq(Rec);
                    end;
                }
                action("&Cancel Approval Request")
                {

                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if Confirm('Cancel Approval Request?', true) = false then exit;

                        //ApprovalMgt.CancelEmpRequisitionAppRequest(Rec,TRUE,TRUE);
                    end;
                }
                action("Mark as Closed/Open")
                {
                    ApplicationArea = all;
                    Caption = 'Mark as Closed/Open';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        if Rec.Closed then begin
                            if not Confirm('Are you sure you want to Re-Open this Document', false) then exit;
                            Rec.Closed := false;
                            Rec.Modify;
                            Message('Employee Requisition %1 has been Re-Opened', Rec."Requisition No.");

                        end else begin
                            if not Confirm('Are you sure you want to close this Document', false) then exit;
                            Rec.Closed := true;
                            Rec.Modify;
                            Message('Employee Requisition %1 has been marked as Closed', Rec."Requisition No.");
                        end;
                    end;
                }
                action("&Print")
                {
                    ApplicationArea = all;
                    Caption = '&Print';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        HREmpReq.Reset;
                        HREmpReq.SetRange(HREmpReq."Requisition No.", Rec."Requisition No.");
                        if HREmpReq.Find('-') then
                            REPORT.Run(39005559, true, true, HREmpReq);
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = all;
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::New;
                        Rec.Modify;
                    end;
                }
            }
            group(Employee)
            {
                Caption = 'Employee';
            }
        }
    }

    var
        HREmp: Record "HRM-Employee C";
        HREmailParameters: Record "HRM-EMail Parameters";
        SMTP: Codeunit "Email Message";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition";
        ApprovalEntries: Page "Fin-Approval Entries";
        //todo ApprovalMgt: Codeunit "Approvals Management";
        HREmpReq: Record "HRM-Employee Requisitions";

    procedure TESTFIELDS()
    begin
        Rec.TestField("Job ID");
        Rec.TestField("Closing Date");
        Rec.TestField("Type of Contract Required");
        Rec.TestField("Requisition Type");
        Rec.TestField("Required Positions");
        if Rec."Reason For Request" = Rec."Reason For Request"::Other then
            Rec.TestField("Reason for Request(Other)");
    end;
}


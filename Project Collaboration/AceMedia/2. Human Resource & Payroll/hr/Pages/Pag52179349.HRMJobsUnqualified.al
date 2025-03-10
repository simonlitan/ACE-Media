page 52179349 "HRM-Jobs Unqualified"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    Caption = 'HRM-Jobs Unqualified';
    PageType = Card;
    SourceTable = "HRM-Employee Requisitions";

    PromotedActionCategories = 'New,Process,Reports,Send Regret Alert';
    layout
    {
        area(content)
        {
            group("Job Details")
            {
                Caption = 'Job Details';
                Editable = false;
                field("Requisition No."; Rec."Requisition No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }

                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = all;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = all;
                    Editable = "Requisition DateEditable";
                    Enabled = false;
                    Importance = Promoted;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = all;
                    Editable = PriorityEditable;
                    Enabled = false;
                    Importance = Promoted;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
            }
            part(Shortlisted; "HRM-Shortlisting Lines")
            {
                Editable = false;
                ApplicationArea = all;
                //Editable = ShortlistedEditable;
                SubPageLink = "Employee Requisition No" = FIELD("Requisition No.");
                SubPageView = where(Qualified = const(false));
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action("Send Regret Alert")
            {
                ApplicationArea = all;
                Caption = 'Send Regret Alert';
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    //IF CONFIRM('Send this Requisition for Approval?',TRUE)=FALSE THEN EXIT;

                    if Confirm('Are you sure you want to send regret alert?', false) = true then begin
                        HRJobApplications.Reset();
                        HRJobApplications.SetRange("Employee Requisition No", rec."Requisition No.");
                        HRJobApplications.SetRange(Qualified, false);
                        HRJobApplications.SetRange(Qualified2, HRJobApplications.Qualified2::No);
                        if HRJobApplications.Find('-') then begin
                            repeat
                                Recipients.add(HRJobApplications."E-Mail");
                            until HRJobApplications.Next = 0;
                            Message('Successfully Sent');
                        end;
                        Subject := StrSubstNo(TaskMessage);
                        Body := StrSubstNo(TaskSubject, HRJobApplications."First Name" + ' ' + HRJobApplications."Middle Name" + ' ' + HRJobApplications."Last Name", HRJobApplications."Job Applied for Description");
                        SMTP.Create(Recipients, Subject, Body, true);
                        Email.Send(SMTP, Enum::"Email Scenario"::Default);
                        //email.OpenInEditor(SMTP);
                    end;
                end;
            }
        }
    }





    trigger OnInit()
    begin
        "Required PositionsEditable" := true;
        PriorityEditable := true;
        ShortlistedEditable := true;
        "Requisition DateEditable" := true;
        "Job IDEditable" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // OnAfterGetCurrRecord;
    end;

    var
        HRJobRequirements: Record "HRM-Job Requirements";
        AppQualifications: Record "HRM-Applicant Qualifications";
        HRJobApplications: Record "HRM-Job Applications (B)";
        Qualified: Boolean;
        StageScore: Decimal;
        HRShortlistedApplicants: Record "HRM-Shortlisted Applicants";
        MyCount: Integer;
        RecCount: Integer;
        HREmpReq: Record "HRM-Employee Requisitions";
        [InDataSet]
        "Job IDEditable": Boolean;
        [InDataSet]
        "Requisition DateEditable": Boolean;
        [InDataSet]
        ShortlistedEditable: Boolean;
        [InDataSet]
        PriorityEditable: Boolean;
        [InDataSet]
        "Required PositionsEditable": Boolean;
        Text19057439: Label 'Short Listed Candidates';
        "HRJobShortList Criteria": Record "HRM-ShortList Requirements";
        "Applicant Criteria Score": Text;
        ecipients: List of [Text];
        Email: Codeunit Email;
        Subject: Text;
        Recipients: List of [Text];
        Body: Text;
        TaskMessage: Label 'REGRET LETTER';
        TaskSubject: Label 'Dear %1 <br> <br> We are sorry to inform you that your application for the position of: <b> %2 </b> is unsuccessful.We appreciate your willingness to work with us, keep checking our website for more job vacancies.';
        SMTP: Codeunit "Email Message";

}

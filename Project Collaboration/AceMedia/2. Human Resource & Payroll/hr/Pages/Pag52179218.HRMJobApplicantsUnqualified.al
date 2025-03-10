page 52179218 "HRM-Job Applicants Unqualified"
{
    CardPageID = "HRM-Jobs Unqualified";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HRM-Employee Requisitions";
    // SourceTableView = WHERE(Shortlisted = const(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = all;
                }
                field("Job Description"; Rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field("Requisition Date"; Rec."Requisition Date")
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
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = all;
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = all;
                }
            }
        }

    }

    actions
    {
    }
}
// {
//     CardPageID = "HRM-Job Apps. Qualified";
//     PageType = List;
//     SourceTable = "HRM-Job Applications (B)";
//     SourceTableView = WHERE(Qualified2 = const(No));

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Application No"; Rec."Application No")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("First Name"; Rec."First Name")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Middle Name"; Rec."Middle Name")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Last Name"; Rec."Last Name")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Job Applied For"; Rec."Job Applied For")
//                 {
//                     ApplicationArea = all;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             group(Applicant)
//             {
//                 Caption = 'Applicant';
//                 action("Send Regret Alert")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Send Regret Alert';
//                     Image = SendMail;
//                     Promoted = true;
//                     PromotedCategory = Category4;

//                     trigger OnAction()
//                     begin

//                         //IF CONFIRM('Send this Requisition for Approval?',TRUE)=FALSE THEN EXIT;
//                         if not Confirm(Text002, false) then exit;
//                         HRJobApplications.Reset();
//                         HRJobApplications.SetRange(Qualified, false);
//                         HRJobApplications.SetRange(Qualified2, HRJobApplications.Qualified2::No);
//                         CurrPage.SetSelectionFilter(HRJobApplications);
//                         HRJobApplications.SetRange(Qualified, false);
//                         if HRJobApplications.Find('-') then begin
//                             repeat
//                                 Recipients.add(HRJobApplications."E-Mail");
//                             until HRJobApplications.Next = 0;
//                         end;
//                         Subject := StrSubstNo(TaskMessage);
//                         Body := StrSubstNo(TaskSubject, HRJobApplications."First Name" + ' ' + HRJobApplications."Middle Name" + ' ' + HRJobApplications."Last Name", HRJobApplications."Job Applied for Description");
//                         SMTP.Create(Recipients, Subject, Body, true);
//                         // Email.Send(SMTP, Enum::"Email Scenario"::Default);
//                         email.OpenInEditor(SMTP);
//                     end;
//                 }
//                 action(Card)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Card';
//                     Image = Card;
//                     Promoted = false;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = "Report";
//                     RunObject = Page "HRM-Job Applications Card";
//                     RunPageLink = "Application No" = FIELD("Application No");
//                 }
//                 action(Qualifications)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Qualifications';
//                     Image = QualificationOverview;
//                     Promoted = false;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = "Report";

//                 }
//                 action(Referees)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Referees';
//                     Image = ContactReference;
//                     Promoted = false;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = "Report";
//                     RunObject = Page "HRM-Applicant Referees";
//                     RunPageLink = "Job Application No" = FIELD("Application No");
//                 }
//                 action(Hobbies)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Hobbies';
//                     Image = Holiday;
//                     Promoted = false;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = "Report";
//                     RunObject = Page "HRM-Applicant Hobbies";
//                     RunPageLink = "Job Application No" = FIELD("Application No");
//                 }
//             }
//             group(Print)
//             {
//                 Caption = 'Print';
//                 action("&Print")
//                 {
//                     ApplicationArea = all;
//                     Caption = '&Print';
//                     Image = PrintReport;
//                     Promoted = true;
//                     PromotedCategory = Category6;

//                     trigger OnAction()
//                     begin
//                         HRJobApplications.Reset;
//                         HRJobApplications.SetRange(HRJobApplications."Application No", Rec."Application No");
//                         if HRJobApplications.Find('-') then;
//                         //REPORT.RUN(39003925,TRUE,TRUE,HRJobApplications);
//                     end;
//                 }
//             }
//         }
//     }

//     var
//         HRJobApplications: Record "HRM-Job Applications (B)";
//         //ApprovalmailMgt: Codeunit "Approvals Mgt Notification";
//         SMTP: Codeunit "Email Message";
//         CTEXTURL: Text[30];
//         HREmailParameters: Record "HRM-EMail Parameters";
//         Text001: Label 'Are you sure you want to Upload Applicants Details to the Employee Card?';
//         Text002: Label 'Are you sure you want to Send this Interview invitation?';
//         Recipients: List of [Text];
//         Email: Codeunit Email;
//         Subject: Text;

//         Body: Text;
//         TaskMessage: Label 'REGRET LETTER';
//         TaskSubject: Label 'Dear %1 <br> <br> We are sorry to inform you that your application for the position of: <b> %2 </b> is unsuccessful.We appreciate your willingness to work with us, keep checking our website for more job vacancies.';
// }


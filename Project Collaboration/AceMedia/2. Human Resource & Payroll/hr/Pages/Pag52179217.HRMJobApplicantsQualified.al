page 52179217 "HRM-Job Applicants Qualified"
{
    CardPageID = "HRM-Job Apps. Qualified";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "HRM-Employee Requisitions";
    // SourceTableView = where(Shortlisted = const(True));

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
//     DeleteAllowed = false;
//     Editable = false;
//     InsertAllowed = false;
//     ModifyAllowed = false;
//     PageType = List;
//     SourceTable = "HRM-Job Applications (B)";
//     SourceTableView = WHERE(Qualified2 = const(Yes));

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
//                 field("Date of Interview"; Rec."Date of Interview")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("From Time"; Rec."From Time")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("To Time"; Rec."To Time")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Venue; Rec.Venue)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Floor; Rec.Floor)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Room No"; Rec."Room No")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Interview Type"; Rec."Interview Type")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Qualified; Rec.Qualified)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
//                 {
//                     ApplicationArea = all;
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

//             action("Send Interview Invitation")
//             {
//                 ApplicationArea = all;
//                 Caption = 'Send Interview Invitation';
//                 Image = SendMail;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin

//                     if Confirm('Do you want to send an interview invitation alert?', false) = true then begin
//                         HRJobApplications.Reset();
//                         HRJobApplications.SetRange(Qualified, true);
//                         HRJobApplications.SetRange(Qualified2, HRJobApplications.Qualified2::Yes);
//                         // CurrPage.SetSelectionFilter(HRJobApplications);
//                         if HRJobApplications.Find('-') then
//                             repeat
//                                 Recipients.add(HRJobApplications."E-Mail");
//                             until HRJobApplications.Next = 0;
//                     end;
//                     Subject := StrSubstNo(TaskMessage);
//                     Body := StrSubstNo(TaskSubject, HRJobApplications."First Name" + ' ' + HRJobApplications."Middle Name" + ' ' + HRJobApplications."Last Name", HRJobApplications."Job Applied for Description", HRJobApplications."Date of Interview", HRJobApplications."From Time");
//                     SMTP.Create(Recipients, Subject, Body, true);
//                     Email.Send(SMTP, Enum::"Email Scenario"::Default);
//                     //email.OpenInEditor(SMTP);
//                 end;
//             }
//             action("Job Interview details")
//             {
//                 ApplicationArea = all;
//                 Caption = 'Job Interview details';
//                 Image = ApplicationWorksheet;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 RunObject = Page "HRM-Job Interview";
//                 RunPageLink = "Applicant No" = FIELD("Application No");
//             }

//             action("&Upload to Employee Card")
//             {
//                 ApplicationArea = all;
//                 Caption = '&Upload to Employee Card';
//                 Image = SendTo;
//                 Promoted = true;
//                 PromotedCategory = Process;

//                 trigger OnAction()
//                 begin
//                     //TESTFIELDS;
//                     Interview.Reset;
//                     Interview.SetRange(Interview."Applicant No", Rec."Application No");
//                     if Interview.Find('-') then begin
//                         if Interview."Total Score" < 0 then begin
//                             Error('Applicants interview details must be entered before hiring');
//                         end;
//                         if not Confirm(Text001, false) then exit;
//                         if Rec."Employee No" = '' then begin

//                             IF NOT CONFIRM('Are you sure you want to Upload Applications Information to the Employee Card', FALSE) THEN EXIT;
//                             HRJobApplications.SetFilter(HRJobApplications."Application No", Rec."Application No");
//                             REPORT.Run(Report::"HR Applicant to Employee", true, false, HRJobApplications);
//                         end else begin
//                             Message('This applicants information already exists in the employee card');
//                         end;
//                     end;
//                 end;
//             }
//             action(Qualifications)
//             {
//                 ApplicationArea = all;
//                 Caption = 'Qualifications';
//                 Image = QualificationOverview;
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";

//             }
//             action(Referees)
//             {
//                 ApplicationArea = all;
//                 Caption = 'Referees';
//                 Image = ContactReference;
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Page "HRM-Applicant Referees";
//                 RunPageLink = "Job Application No" = FIELD("Application No");
//             }
//             action(Hobbies)
//             {
//                 ApplicationArea = all;
//                 Caption = 'Hobbies';
//                 Image = Holiday;
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 RunObject = Page "HRM-Applicant Hobbies";
//                 RunPageLink = "Job Application No" = FIELD("Application No");
//             }


//             action("&Print")
//             {
//                 ApplicationArea = all;
//                 Caption = '&Print';
//                 Image = PrintReport;
//                 Promoted = true;
//                 PromotedCategory = Report;

//                 trigger OnAction()
//                 begin
//                     HRJobApplications.Reset;
//                     HRJobApplications.SetRange(HRJobApplications."Application No", Rec."Application No");
//                     if HRJobApplications.Find('-') then
//                         REPORT.Run(39003925, true, true, HRJobApplications);
//                 end;
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
//         Interview: Record "HRM-Job Interview";
//         ecipients: List of [Text];
//         Email: Codeunit Email;
//         Subject: Text;
//         Recipients: List of [Text];
//         Body: Text;
//         TaskMessage: Label 'INVITATION FOR AN INTERVIEW';
//         TaskSubject: Label 'Dear %1 <br> <br> We are happy to inform you that your application for the position of: <b> %2 </b> is successful. You are therefore invited for an interview scheduled on <b> %3 </b>, from <b> %4 </b>.We appreciate your willingness to work with us.';

//     procedure TESTFIELDS()
//     begin
//         // Rec.TestField("Total Score");
//     end;
// } 


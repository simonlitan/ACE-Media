page 52179219 "HRM-Job Apps. Qualified"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    // ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Send Invitation Alert';
    SourceTable = "HRM-Employee Requisitions";


    layout
    {
        area(content)
        {
            group("Job Details")
            {
                Caption = 'Job Details';

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

                    Editable = false;
                    Importance = Promoted;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = all;
                    Editable = PriorityEditable;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Date of Interview"; Rec."Date of Interview")
                {
                    ApplicationArea = all;
                }
                field("From Time"; Rec."From Time")
                {
                    ApplicationArea = all;
                }
                field("To Time"; Rec."To Time")
                {
                    ApplicationArea = all;
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = all;
                }
                field(Floor; Rec.Floor)
                {
                    ApplicationArea = all;
                }
                field("Room No"; Rec."Room No")
                {
                    ApplicationArea = all;
                }
                field("Interview Type"; Rec."Interview Type")
                {
                    ApplicationArea = all;
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

                // Editable = false;
                ApplicationArea = all;
                //Editable = ShortlistedEditable;
                SubPageLink = "Employee Requisition No" = FIELD("Requisition No.");
                SubPageView = where(Qualified = const(true));
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action("Send Interview Invitation")
            {
                ApplicationArea = all;
                Caption = 'Send Interview Invitation';
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to send an interview invitation alert?', false) = true then begin
                        HRJobApplications.Reset();
                        HRJobApplications.SetRange("Employee Requisition No", rec."Requisition No.");
                        HRJobApplications.SetRange(Qualified, true);
                        HRJobApplications.SetRange(Qualified2, HRJobApplications.Qualified2::Yes);
                        // CurrPage.SetSelectionFilter(HRJobApplications);
                        if HRJobApplications.Find('-') then begin
                            repeat
                                Recipients.add('jeffhaddy7@gmail.com');
                            until HRJobApplications.Next = 0;
                        end;
                        Message('Successfully Sent');
                    end;

                    Subject := StrSubstNo(TaskMessage);
                    Body := StrSubstNo(TaskSubject, HRJobApplications."First Name" + ' ' + HRJobApplications."Middle Name" + ' ' + HRJobApplications."Last Name", HRJobApplications."Job Applied for Description", HRJobApplications."Date of Interview", HRJobApplications."From Time");
                    SMTP.Create(Recipients, Subject, Body, true);
                    Email.Send(SMTP, Enum::"Email Scenario"::Default);
                    //email.OpenInEditor(SMTP);
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
        TaskMessage: Label 'INVITATION FOR AN INTERVIEW';
        TaskSubject: Label 'Dear %1 <br> <br> We are happy to inform you that your application for the position of: <b> %2 </b> is successful. You are therefore invited for an interview scheduled on <b> %3 </b>, from <b> %4 </b>.We appreciate your willingness to work with us.';
        SMTP: Codeunit "Email Message";

    procedure UpdateControls()
    begin

        if Rec.Status = Rec.Status::New then begin
            "Job IDEditable" := true;
            "Requisition DateEditable" := true;
            ShortlistedEditable := true;
            PriorityEditable := true;
            "Required PositionsEditable" := true;
        end else begin
            "Job IDEditable" := false;
            "Requisition DateEditable" := false;
            ShortlistedEditable := false;
            PriorityEditable := false;
            "Required PositionsEditable" := false;

        end;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;

        //  UpdateControls;
    end;
}

// {
//     PageType = Card;

//     PromotedActionCategories = 'New,Process,Reports,Functions,Show';
//     SourceTable = "HRM-Job Applications (B)";

//     layout
//     {

//         area(content)
//         {
//             group(General)
//             {
//                 field("Employee Requisition No"; Rec."Employee Requisition No")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Employee Requisition No field.';
//                 }
//                 field("Application No"; Rec."Application No")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("First Name"; Rec."First Name")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Middle Name"; Rec."Middle Name")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Last Name"; Rec."Last Name")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Job Applied For"; Rec."Job Applied For")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field(Qualified; Rec.Qualified)
//                 {
//                     ApplicationArea = all;
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
//                 field("E-Mail"; Rec."E-Mail")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Interview Type"; Rec."Interview Type")
//                 {
//                     ApplicationArea = all;
//                 }
//             }
//             part(Shortlisted; "HRM-Shortlisting Lines")
//             {
//                 ApplicationArea = all;
//                 //Editable = ShortlistedEditable;
//                 SubPageLink = "Employee Requisition No" = FIELD("Employee Requisition No");
//                 SubPageView = where(Qualified = const(true));
//             }
//         }
//     }

//     actions
//     {
//     }
// }


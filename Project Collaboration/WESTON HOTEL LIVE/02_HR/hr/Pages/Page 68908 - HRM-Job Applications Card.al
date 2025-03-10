page 68908 "HRM-Job Applications Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Other Details';
    SourceTable = "HRM-Job Applications (B)";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                // field(Initials; Rec.Initials)
                // {
                //     ApplicationArea = all;
                // }
                // field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                // {
                //     ApplicationArea = all;
                //     Caption = '1st Language (R/W/S)';
                //     Importance = Promoted;
                // }
                // field("First Language Read"; Rec."First Language Read")
                // {
                //     ApplicationArea = all;
                //     Caption = '1st Language Read';
                // }
                // field("First Language Write"; Rec."First Language Write")
                // {
                //     ApplicationArea = all;
                //     Caption = '1st Language Write';
                // }
                // field("First Language Speak"; Rec."First Language Speak")
                // {
                //     ApplicationArea = all;
                //     Caption = '1st Language Speak';
                // }
                // field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                // {
                //     ApplicationArea = all;
                //     Caption = '2nd Language (R/W/S)';
                //     Importance = Promoted;
                // }
                // field("Second Language Read"; Rec."Second Language Read")
                // {
                //     ApplicationArea = all;
                // }
                // field("Second Language Write"; Rec."Second Language Write")
                // {
                //     ApplicationArea = all;
                // }
                // field("Second Language Speak"; Rec."Second Language Speak")
                // {
                //     ApplicationArea = all;
                // }
                // field("Additional Language"; Rec."Additional Language")
                // {
                //     ApplicationArea = all;
                // }
                // field("Applicant Type"; Rec."Applicant Type")
                // {
                //     ApplicationArea = all;
                //     Enabled = false;
                //     Style = Strong;
                //     StyleExpr = TRUE;
                // }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                    Caption = 'Internal Staff?';
                    Editable = true;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = all;
                }
                // field("Country Details"; Rec."Citizenship Details")
                // {
                //     ApplicationArea = all;
                //     Editable = false;
                // }
                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    ApplicationArea = all;
                    Caption = 'Application Reff No.';
                    Importance = Promoted;
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = all;
                    Caption = 'Position Applied For';
                    Enabled = true;
                    Importance = Promoted;
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    ApplicationArea = all;
                    Caption = 'Job Description';
                }
                field("Shortlisting Summary"; '')
                {
                    ApplicationArea = all;
                    CaptionClass = Text19064672;
                    Caption = 'Shortlisting Summary';
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = all;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
                {
                    ApplicationArea = all;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
            }
            group(Personal)
            {
                Caption = 'Personal';
                // field(Status; Rec.Status)
                // {
                //     ApplicationArea = all;
                //     Importance = Promoted;
                // }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = all;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = all;
                    Caption = 'P.W.D';
                }
                field("P.W.D Description"; Rec."P.W.D")
                {
                    ApplicationArea = all;
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    ApplicationArea = all;
                }
                // field("Health Assesment Date"; Rec."Health Assesment Date")
                // {
                //     ApplicationArea = all;
                // }
                // field("Date Of Birth"; Rec."Date Of Birth")
                // {
                //     ApplicationArea = all;
                // }
                field(Age; Rec.Age)
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    Caption = 'Phone No.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                // field("Postal Address2"; Rec."Postal Address2")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Postal Address 2';
                // }
                // field("Postal Address3"; Rec."Postal Address3")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Postal Address 3';
                // }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = all;
                }
                // field("Residential Address2"; Rec."Residential Address2")
                // {
                //     ApplicationArea = all;
                // }
                // field("Residential Address3"; Rec."Residential Address3")
                // {
                //     ApplicationArea = all;
                // }
                // field("Post Code2"; Rec."Post Code2")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Post Code 2';
                // }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    Caption = 'Alternative Phone No.';
                }
                // field("Work Phone Number"; Rec."Work Phone Number")
                // {
                //     ApplicationArea = all;
                // }
                // field("Ext."; Rec."Ext.")
                // {
                //     ApplicationArea = all;
                // }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                // field("Fax Number"; Rec."Fax Number")
                // {
                //     ApplicationArea = all;
                // }
            }
        }
        area(factboxes)
        {
            part(Control1102755009; "HRM-Job Applications Factbox")
            {
                ApplicationArea = all;
                SubPageLink = "Application No" = FIELD("Application No");
            }
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
            group("&Functions")
            {
                Caption = '&Functions';
                action("&Upload to Employee Card")
                {
                    ApplicationArea = all;
                    Caption = '&Upload to Employee Card';
                    Image = ImportDatabase;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Rec."Employee No" = '' then begin
                            //IF NOT CONFIRM('Are you sure you want to Upload Applicants information to the Employee Card',FALSE) THEN EXIT;
                            HRJobApplications.SetFilter(HRJobApplications."Application No", Rec."Application No");
                            REPORT.Run(Report::"HR Applicant to Employee", true, false, HRJobApplications);
                            //MESSAGE('Requires a setup of the number series for it to work!');
                        end else begin
                            Message('This applicants information already exists in the employee card');
                        end;
                    end;
                }
                action(Qualifications)
                {
                    ApplicationArea = all;
                    Caption = 'Academic Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "ACA-Applicant Qualifications";
                    RunPageLink = "Application No"=FIELD("Application No");
                }
                action(profQual)
                {
                    ApplicationArea = all;
                    Caption = 'Proffesional Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "App Prof Qualifications";
                    RunPageLink = "Application No"=FIELD("Application No");
                }
                // action(Qualifications)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Qualifications';
                //     Image = QualificationOverview;
                //     Promoted = true;
                //     PromotedCategory = Category5;
                //     RunObject = Page "ACA-Applicant Qualifications";
                //     RunPageLink = "Application No" = FIELD("Application No");
                // }
                action(Referees)
                {
                    ApplicationArea = all;
                    Caption = 'Referees';
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HRM-Applicant Referees";
                    RunPageLink = "Job Application No" = FIELD("Application No");
                }
                action(workEXP)
                {
                    ApplicationArea = All;
                    Caption = 'Work Experience';
                    Image = Timeline;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HRM Work Experience";
                    RunPageLink = "Application No"=FIELD("Application No");
                }
                action("Next of Keen")
                {
                    ApplicationArea = all;
                    Caption = 'Next Of Kin';
                    Image = Simulate;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HRM-Employees Kin";
                    RunPageLink = "Employee Code" = FIELD("Application No");
                }
                action(Hobbies)
                {
                    ApplicationArea = all;
                    Caption = 'Hobbies';
                    Image = Holiday;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HRM-Applicant Hobbies";
                    RunPageLink = "Job Application No" = FIELD("Application No");
                }
                action("&Print")
                {
                    ApplicationArea = all;
                    Caption = '&Print';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", Rec."Application No");
                        if HRJobApplications.Find('-') then
                            REPORT.Run(51153, true, true, HRJobApplications);
                    end;
                }
                 action(EDMS)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    //RunObject = Page "Document Attachment Details";
                    //RunPageLink = "No." = field("Application No");
                    trigger OnAction()var DocumentAttachmentDetails: Page 1173;
                    RecRef: RecordRef;
                    begin
                        RecRef.GETTABLE(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RUNMODAL;
                    end;
                }
            }
        }
    }

    var
        HRJobApplications: Record "HRM-Job Applications (B)";
        SMTP: Codeunit "Email Message";
        HREmailParameters: Record "HRM-EMail Parameters";
        Employee: Record "HRM-Employee C";
        Text19064672: Label 'Shortlisting Summary';
}


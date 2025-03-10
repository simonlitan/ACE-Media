page 52179193 "HRM-Job Applications List"
{
    Editable = false;
    InsertAllowed = false;
    CardPageID = "HRM-Job Applications Card";
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Applicant,Functions,Print';
    SourceTable = "HRM-Job Applications (B)";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                ShowCaption = false;
                field("Applicant Type"; Rec."Applicant Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Applicant Type field.';
                }
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = all;
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
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = all;
                }
                field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
                {
                    ApplicationArea = all;
                }

            }
        }
        /*    area(factboxes)
           {
               part(Control1102755009; "HRM-Job Applications Factbox")
               {
                   ApplicationArea = all;
                   SubPageLink = "Application No" = FIELD("Application No");
               }
           } */
    }

    actions
    {
        area(navigation)
        {
            group(Applicant)
            {
                Caption = 'Applicant';

                action(Qualifications)
                {
                    ApplicationArea = all;
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;

                }
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
            }
            group(Print)
            {
                Caption = '';
                action("&Print")
                {
                    ApplicationArea = all;
                    Caption = 'Job Application Report';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = report "HR Job Applications";


                }
            }
        }
    }

    var
        HRJobApplications: Record "HRM-Job Applications (B)";
        Text001: Label 'Are you sure you want to Upload Applicants Details to the Employee Card?';
        Text002: Label 'Are you sure you want to Send this Interview invitation?';
        //ApprovalmailMgt: Codeunit "Approvals Mgt Notification";
        SMTP: Codeunit "Email Message";
        CTEXTURL: Text[30];
        HREmailParameters: Record "HRM-EMail Parameters";
}


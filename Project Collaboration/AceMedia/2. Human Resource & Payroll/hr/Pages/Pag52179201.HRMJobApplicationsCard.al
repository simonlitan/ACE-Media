page 52179201 "HRM-Job Applications Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions,Other Details,Attachments';
    SourceTable = "HRM-Job Applications (B)";
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Application No"; Rec."Application No")
                {
                    Editable = false;
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
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = all;
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    ApplicationArea = all;
                    Caption = '1st Language (R/W/S)';
                    Importance = Promoted;
                }
                field("First Language Read"; Rec."First Language Read")
                {
                    ApplicationArea = all;
                    Caption = '1st Language Read';
                }
                field("First Language Write"; Rec."First Language Write")
                {
                    ApplicationArea = all;
                    Caption = '1st Language Write';
                }
                field("First Language Speak"; Rec."First Language Speak")
                {
                    ApplicationArea = all;
                    Caption = '1st Language Speak';
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    ApplicationArea = all;
                    Caption = '2nd Language (R/W/S)';
                    Importance = Promoted;
                }
                field("Second Language Read"; Rec."Second Language Read")
                {
                    ApplicationArea = all;
                }
                field("Second Language Write"; Rec."Second Language Write")
                {
                    ApplicationArea = all;
                }
                field("Second Language Speak"; Rec."Second Language Speak")
                {
                    ApplicationArea = all;
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = all;
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
                field("Country Details"; Rec."Citizenship Details")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    ApplicationArea = all;
                    Caption = 'Application Reff No.';
                    Importance = Promoted;
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = all;
                    Caption = 'Job Id';
                    Enabled = true;
                    Importance = Promoted;
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Caption = 'Position';
                }

                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Qualified; Rec.Qualified)
                {
                    Editable = true;
                    ApplicationArea = all;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }

            }
            group(Personal)
            {
                Caption = 'Personal';
                field(Tribe; Rec.Tribe)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tribe field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the County field.';
                }

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
                    trigger OnValidate()
                    begin
                        if rec.Disabled = rec.Disabled::Yes then Fieldeditable2 := true else Fieldeditable2 := false;
                    end;
                }
                field("P.W.D Description"; Rec."P.W.D")
                {
                    caption = 'P.W.D Number';
                    ApplicationArea = all;
                    Editable = Fieldeditable2;
                }
                field("Disabling Details"; Rec."Disabling Details")
                {
                    Editable = Fieldeditable2;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disabling Details field.';
                }

                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = all;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field("Current Workplace"; Rec."Current Workplace")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Workplace field.';
                }
                field("Current Position"; Rec."Current Position")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Position field.';
                }
                field(Expertise; Rec.Expertise)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expertise field.';
                }
                field(Experience; Rec.Experience)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Experience field.';
                }

            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Postal Address2"; Rec."Postal Address2")
                {
                    ApplicationArea = all;
                    Caption = 'Postal Address 2';
                }
                field("Postal Address3"; Rec."Postal Address3")
                {
                    ApplicationArea = all;
                    Caption = 'Postal Address 3';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = all;
                }
                field("Residential Address2"; Rec."Residential Address2")
                {
                    ApplicationArea = all;
                }
                field("Residential Address3"; Rec."Residential Address3")
                {
                    ApplicationArea = all;
                }
                field("Post Code2"; Rec."Post Code2")
                {
                    ApplicationArea = all;
                    Caption = 'Post Code 2';
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = all;
                }

                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Fax Number"; Rec."Fax Number")
                {
                    ApplicationArea = all;
                }
            }
        }
        /* area(factboxes)
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



            action(Qualifications)
            {
                ApplicationArea = all;
                Caption = 'Qualifications';
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "HRM-Applicant Qualifications";
                RunPageLink = "Application No" = FIELD("Application No");

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
            action("&Print")
            {
                ApplicationArea = all;
                Caption = 'Job Application Report';
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    HRJobApplications.Reset;
                    HRJobApplications.SetRange("Employee Requisition No", rec."Employee Requisition No");
                    HRJobApplications.SetRange(HRJobApplications."Application No", Rec."Application No");
                    HRJobApplications.SetRange("Job Applied For", rec."Job Applied For");
                    if HRJobApplications.Find('-') then
                        REPORT.Run(Report::"HR Job Applications", true, true, HRJobApplications);
                end;
            }
            action("File Attachment")
            {
                ApplicationArea = All;

                Image = Attach;
                Promoted = true;
                PromotedCategory = category6;
                trigger OnAction()

                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.Run();
                end;
                /* trigger OnAction()
                begin
                    DMS.Reset;
                    DMS.SetRange("Document Type", DMS."Document Type"::"Staff File");
                    if DMS.Find('-') then begin
                        Hyperlink(DMS."url path" + Rec."No.");
                    end else
                        Message('No Link ' + format(DMS."Document Type"::"Staff File"));
                end; */

            }

        }
    }
    trigger OnAfterGetRecord()
    begin
        if rec.Disabled = rec.Disabled::Yes then Fieldeditable2 := true else Fieldeditable2 := false;
    end;

    var
        HRJobApplications: Record "HRM-Job Applications (B)";
        SMTP: Codeunit "Email Message";
        HREmailParameters: Record "HRM-EMail Parameters";
        Employee: Record "HRM-Employee C";
        Text19064672: Label 'Shortlisting Summary';
        Fieldeditable: Boolean;
        Fieldeditable2: boolean;
        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";
}


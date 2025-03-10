page 52179204 "HRM-Training Application Card"
{

    PageType = Card;
    DeleteAllowed = false;
    PromotedActionCategories = 'New,Process,Reports,Functions,Show';
    SourceTable = "HRM-Training Applications";

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
                    Editable = "Application NoEditable";
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = all;
                }

                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = all;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = all;
                }
                field("Training Category"; Rec."Training Category")
                {
                    ApplicationArea = all;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = all;
                    Editable = "Course TitleEditable";
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }

                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = all;
                    Editable = "Course TitleEditable";
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Individual Course Code"; Rec."Individual Course Code")
                {
                    ApplicationArea = all;
                }
                field("Individual Course Description"; Rec."Individual Course Description")
                {
                    ApplicationArea = all;
                }
                field("No of Required Participants"; Rec."No of Required Participants")
                {
                    ApplicationArea = all;
                }
                field("Purpose of Training"; Rec."Purpose of Training")
                {
                    ApplicationArea = all;
                    MultiLine = false;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = all;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = all;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = all;
                }
                field("Duration Units"; Rec."Duration Units")
                {
                    ApplicationArea = all;
                }
                field(Sponsor; Rec.Sponsor)
                {
                    ApplicationArea = all;
                }
                field("Three YR Training Plan"; Rec."Three YR Training Plan")
                {
                    ApplicationArea = all;
                }
                field(Specify; Rec.Specify)
                {
                    ApplicationArea = all;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = all;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = all;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = all;
                }
                field("Cost Of Training"; Rec."Cost Of Training")
                {
                    ApplicationArea = all;
                }
                field(Trainer; Rec.Trainer)
                {
                    ApplicationArea = all;
                }
                field("Training Institution"; Rec."Training Institution")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("No of Participants"; Rec."No of Participants")
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Training Status"; Rec."Training Status")
                {
                    ApplicationArea = all;
                }
                field("Training Evaluation Results"; Rec."Training Evaluation Results")
                {
                    ApplicationArea = all;
                }
            }


        }

    }

    actions
    {
        area(navigation)
        {





            action("&Send Approval &Request")
            {
                Caption = '&Send Approval &Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    TESTFIELDS;
                    Rec.CalcFields("No of Participants");
                    if (Rec."No of Participants" < 2) then begin
                        Error('Participants should not be less than two');
                    end;
                    if (Rec."No of Participants" > Rec."No of Required Participants") then begin
                        Error('Nominated Participants cannot exceed the Number of Participants Required ');
                    end;
                    if (Rec."No of Participants" <= 0) then begin
                        Error('Nominated Participants cannot be Less Than or Equal to Zero');
                    end;

                    if Confirm('Send this Application for Approval?', true) = false then exit;
                    //ApprovalMgt.SendTrainingAppApprovalRequest(Rec);
                end;
            }
            action("A&pprovals")
            {
                ApplicationArea = All;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("Application No");
            }
            action("&Cancel Approval request")
            {
                Caption = '&Cancel Approval request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;
                    //ApprovalMgt.CancelTrainingAppApprovalReq(Rec,TRUE,TRUE);
                end;
            }
            action("&Print")
            {
                ApplicationArea = all;
                Caption = '&Print';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = report;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Approved);

                    HRTrainingApplications.SetRange(HRTrainingApplications."Application No", Rec."Application No");
                    if HRTrainingApplications.Find('-') then
                        REPORT.Run(39005484, true, true, HRTrainingApplications);
                end;
            }
            action("<A ction1102755042>")
            {
                ApplicationArea = all;
                Caption = 'Re-Open';
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::New;
                    Rec.Modify;
                end;
            }

        }
    }

    trigger OnAfterGetRecord()
    begin

        if Rec.Status = Rec.Status::New then begin
            "Responsibility CenterEditable" := true;
            "Application NoEditable" := true;
            "Employee No.Editable" := true;
            "Employee NameEditable" := true;
            "Employee DepartmentEditable" := true;
            "Purpose of TrainingEditable" := true;
            "Course TitleEditable" := true;
        end else begin
            "Responsibility CenterEditable" := false;
            "Application NoEditable" := false;
            "Employee No.Editable" := false;
            "Employee NameEditable" := false;
            "Employee DepartmentEditable" := false;
            "Purpose of TrainingEditable" := false;
            "Course TitleEditable" := false;
        end;

        if Rec."Training Category" = Rec."Training Category"::Group then
            "Course TitleEditable" := true
        else
            "Course TitleEditable" := false;

    end;

    trigger OnInit()
    begin
        "Course TitleEditable" := true;
        "Purpose of TrainingEditable" := true;
        "Employee DepartmentEditable" := true;
        "Employee NameEditable" := true;
        "Employee No.Editable" := true;
        "Application NoEditable" := true;
        "Responsibility CenterEditable" := true;
        "Course DescriptionEditable" := true;
        "Course TitleEditable" := true;
    end;

    var
        HREmp: Record "HRM-Employee C";
        EmpNames: Text[40];
        sDate: Date;
        HRTrainingApplications: Record "HRM-Training Applications";
        //  ApprovalMgt: Codeunit "Approvals Management";
        ApprovalComments: Page "Approval Comments";
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Application NoEditable": Boolean;
        [InDataSet]
        "Employee No.Editable": Boolean;
        [InDataSet]
        "Employee NameEditable": Boolean;
        [InDataSet]
        "Employee DepartmentEditable": Boolean;
        [InDataSet]
        "Purpose of TrainingEditable": Boolean;
        [InDataSet]
        "Course TitleEditable": Boolean;
        "Course DescriptionEditable": Boolean;

    procedure TESTFIELDS()
    begin
        Rec.TestField("Course Title");
        Rec.TestField("From Date");
        Rec.TestField("To Date");
        Rec.TestField("Duration Units");
        Rec.TestField(Duration);
        Rec.TestField("Cost Of Training");
        Rec.TestField(Location);
        Rec.TestField(Trainer);
        Rec.TestField("Purpose of Training");
        Rec.TestField(Description)
    end;

    procedure UpdateControls()
    begin

        /*IF "Training category"="Training category"::Group THEN BEGIN
        CurrPage.Description.EDITABLE:=TRUE;
        END ELSE BEGIN
        CurrPage.Description.EDITABLE:=FALSE;
        END;
   */

    end;
}


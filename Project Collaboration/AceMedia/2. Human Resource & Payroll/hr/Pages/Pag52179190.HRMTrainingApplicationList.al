page 52179190 "HRM-Training Application List"
{
    CardPageID = "HRM-Training Application Card";
    Editable = false;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HRM-Training Applications";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = all;
                }
                field("Training Category"; Rec."Training Category")
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = all;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Purpose of Training"; Rec."Purpose of Training")
                {
                    ApplicationArea = all;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = all;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = all;
                }
                field("Cost Of Training"; Rec."Cost Of Training")
                {
                    ApplicationArea = all;
                }
                field(Provider; Rec."Training Institution")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
            }
        }

    }

    actions
    {
        area(navigation)
        {




            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("Application No");
            }

            action("&Print")
            {
                ApplicationArea = all;
                Caption = '&Print';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Report;

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
        // rec.SetFilter("User ID", UserId);
    end;

    trigger OnOpenPage()
    begin
        // rec.SetFilter("User ID", UserId);
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


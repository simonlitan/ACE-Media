page 52179144 "HRM-Jobs Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions,Job';
    SourceTable = "HRM-Jobs";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }

                field("Job Description"; Rec."Job Title")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade field.';
                }



                field("No of Posts"; Rec."No of Posts")
                {
                    ApplicationArea = all;
                }
                field("Occupied Positions"; Rec."Occupied Positions")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = all;
                }

                field("Employee Requisitions"; Rec."Employee Requisitions")
                {
                    ApplicationArea = all;
                }
                field("Key Position"; Rec."Key Position")
                {
                    ApplicationArea = all;
                }

                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Editable = true;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }

            }
        }

    }

    actions
    {
        area(processing)
        {

            group(Job)
            {
                Caption = 'Job';
                action("Raise Requisition")
                {
                    ApplicationArea = all;
                    Caption = 'Raise Requisition';
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HRM-Employee Requisitions List";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                    RunPageOnRec = false;

                    trigger OnAction()
                    begin
                        CurrPage.Close;
                    end;
                }
                action(Requirements)
                {
                    ApplicationArea = all;
                    Caption = 'Job Requirements';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HRM-Job Requirement Lines";
                    RunPageLink = "Job Id" = FIELD("Job ID");
                }
                action(Responsibilities)
                {
                    ApplicationArea = all;
                    Caption = 'Job Description';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HRM-Job Resp. Lines";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }

                action("ShortListing Criteria")
                {
                    ApplicationArea = all;
                    Caption = 'ShortListing Criteria';
                    Image = Category;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "HRM-Job Shortlist Qualif.";
                    Visible = true;
                }
                action("Staff Establishment")
                {
                    ApplicationArea = all;
                    Image = Report;
                    Promoted = true;
                    PromotedCategory = Report;

                    trigger OnAction()
                    begin
                        rec.Reset();
                        rec.SetRange("Job ID", rec."Job ID");
                        if rec.Find('-') then
                            report.run(report::"Staff Establishment", true, true, rec)
                    end;
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if rec."Job ID" = '' then begin

            hrmsetup.Get;
            hrmsetup.TestField(hrmsetup."Job ID");
            NoSeriesMgt.InitSeries(hrmsetup."Job ID", xRec."No Series", 0D, rec."Job ID", rec."No Series");
            //"Requisition No":=requisitionno;
        end;
    end;

    trigger OnOpenPage()
    begin
        if rec."No of Posts" <> Rec."No of Posts" then
            Rec."Vacant Positions" := Rec."No of Posts" - Rec."Occupied Positions";
        rec.Supernumerary := rec."No of Posts" - rec."Occupied Positions";
        if rec."Vacant Positions" < 0 then
            Rec."Vacant Positions" := 0;
        Rec.Validate("No of Posts");



    end;

    trigger OnAfterGetRecord()
    begin
        Rec.Validate("Vacant Positions");
        Rec.Validate("No of Posts");
    end;

    var
        hrmsetup: record "HRM-Setup";
        HREmployees: Record "HRM-Employee C";
        NoSeriesMgt: Codeunit NoSeriesManagement;

        Jobreq: Record "HRM-Job Requirements";
}


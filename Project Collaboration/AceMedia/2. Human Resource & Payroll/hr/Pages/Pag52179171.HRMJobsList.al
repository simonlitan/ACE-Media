page 52179171 "HRM-Jobs List"
{

    CardPageId = "HRM-Jobs Card";
    DelayedInsert = false;
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Functions,Job';
    RefreshOnActivate = true;
    SourceTable = "HRM-Jobs";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = all;
                    Editable = false;

                }
                field("Job Description"; Rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    ApplicationArea = all;
                }

                field("Occupied Positions"; Rec."Occupied Positions")
                {
                    ApplicationArea = all;
                }

                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = all;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }

            }
        }
        /*  area(factboxes)
         {
             part(Control1102755002; "HRM-Jobs Factbox")
             {
                 ApplicationArea = all;
                 SubPageLink = "Job ID" = FIELD("Job ID");
             }
             systempart(Control1102755004; Outlook)
             {
                 ApplicationArea = All;
             }
         } */
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
                    Caption = 'Requirements';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HRM-Job Requirement Lines";
                    RunPageLink = "Job Id" = FIELD("Job ID");
                }
                action(Responsibilities)
                {
                    ApplicationArea = all;
                    Caption = 'Responsibilities';
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
                    PromotedCategory = Category5;
                    RunObject = Page "HRM-Job Shortlist Qualif.";
                    Visible = true;
                }
                action("Staff Establishment")
                {
                    ApplicationArea = all;
                    Image = Report;
                    Promoted = true;
                    PromotedCategory = Report;
                    RunObject = report "Staff Establishment";


                }
            }
        }
    }
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


}


page 68438 "HRM-Appraisal Types"
{
    PageType = ListPart;
    SourceTable = "HRM-Appraisal Types";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Max. Weighting"; Rec."Max. Weighting")
                {
                    ApplicationArea = All;
                }
                field("Max. Score"; Rec."Max. Score")
                {
                    ApplicationArea = All;
                }
                field("Use Template"; Rec."Use Template")
                {
                    ApplicationArea = All;
                }
                field("Template Link"; Rec."Template Link")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Appraisal)
            {
                Caption = 'Appraisal';
                action("Appraisal Format")
                {
                    Caption = 'Appraisal Format';
                    ApplicationArea = All;
                    //todo    RunObject = Page "HRM-Appraisal Formats";
                    //todo    RunPageLink = "Appraisal Code" = FIELD(Code);
                }
            }
        }
    }
}


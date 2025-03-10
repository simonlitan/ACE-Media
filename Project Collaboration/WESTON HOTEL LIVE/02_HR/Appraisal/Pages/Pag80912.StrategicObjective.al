page 50218 "Strategic Objective"
{
    Caption = 'Strategic Objective';
    PageType = ListPart;
    SourceTable = "Strategic Objective";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategic Objective field.';
                }
                field(Activities; Rec.Activities)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activities field.';
                }
                field("Means of Verification"; Rec."Means of Verification")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Means of Verification field.';
                }
                field("Self Rating"; Rec."Self Rating")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Self Rating field.';
                }
                field("Supervisor  Rating"; Rec."Supervisor  Rating")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisor  Rating field.';
                }
                field("Reasons for variance"; Rec."Reasons for variance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reasons for variance field.';
                }
                field(variance; Rec.variance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the variance field.';
                }
                field("Agreed final Score"; Rec."Agreed final Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Agreed final Score field.';
                }
            }
        }
    }
    var
        SelfAppraisal: Record "Self Appraisal";
        SelflineEditablity: Boolean;
        SupEditability: Boolean;
}

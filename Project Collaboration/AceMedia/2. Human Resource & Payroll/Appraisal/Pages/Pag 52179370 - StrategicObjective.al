page 52179370 "Strategic Objective"
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
                field("Staff Activities"; Rec."Staff Activities")
                {

                }
                field("Staff Means of Verification"; Rec."Staff Means of Verification")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Means of Verification field.';
                }
                field("Staff expected output"; Rec."Staff expected output")
                {
                    ApplicationArea = all;
                }
                field("Targets for Year"; Rec."Targets for Year")
                {
                    ApplicationArea = all;
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

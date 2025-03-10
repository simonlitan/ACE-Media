page 52179339 "Projection Line Card"
{
    Caption = 'Projection Line Card';
    PageType = Card;
    SourceTable = "HRM-Training Projection Lines";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("S/No"; Rec."S/No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the S/No field.';
                }
                field("Course Projected"; Rec."Course Projected")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Projected field.';
                }
                field("Course Duration"; Rec."Course Duration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Duration field.';
                }

                field("Training Institution"; Rec."Training Institution")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Institution field.';
                }
                field("Proposed Sponsor"; Rec."Proposed Sponsor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Proposed Sponsor field.';
                }
                field("Estimated Cost"; Rec."Estimated Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Estimated Cost field.';
                }
                field(Reason; Rec.Reason)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason field.';
                }

            }
        }
    }
}

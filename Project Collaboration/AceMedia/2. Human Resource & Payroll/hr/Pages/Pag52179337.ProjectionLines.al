page 52179337 "Projection Lines"
{
    CardPageId = "Projection Line Card";
    Caption = 'Projection Lines';
    PageType = ListPart;
    SourceTable = "HRM-Training Projection Lines";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                
                field("S/No"; Rec."S/No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the S/No field.';
                }
                field(Type;Rec.Type)
                {
                    ApplicationArea = all;
                }
                field("Course Projected"; Rec."Course Projected")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Projected field.';
                }
                field("Course Duration"; Rec."Course Duration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Duration field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason field.';
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
            }
        }
    }
}

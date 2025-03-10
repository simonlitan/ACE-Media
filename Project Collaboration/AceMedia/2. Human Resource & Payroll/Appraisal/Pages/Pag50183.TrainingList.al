page 52179353 "Training List"
{
    Caption = 'Training List';
    PageType = List;
    SourceTable = "Training Lines";
    ApplicationArea = all;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Training Identification"; Rec."Training Identification")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Identification field.';
                }
                field("Name of Training"; Rec."Name of Training")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name of Training field.';
                }
                field(Trainer; Rec.Trainer)
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trainer field.';
                }
                field(Venue; Rec.Venue)
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field(Cost; Rec.Cost)
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field("Implematation Date"; Rec."Implematation Date")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implematation Date field.';
                }
                field("Supervisor Comment"; Rec."Supervisor Comment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisor Comment field.';

                }
            }
        }
    }


    var
        SelfAppraisal: Record "Self Appraisal";
        SelflineEditablity: Boolean;
        SupEditability: Boolean;
}

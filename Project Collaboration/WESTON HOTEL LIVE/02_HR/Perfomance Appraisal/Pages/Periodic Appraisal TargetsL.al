page 50018 "Periodic Appraisal TargetsL"
{
    PageType = ListPart;
    SourceTable = "Periodic Appraisal Targets";
    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }


                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                    ApplicationArea = All;
                }
                field("Institution Code"; Rec."Institution Code")
                {
                    ToolTip = 'Specifies the value of the Institution Code field.';
                    ApplicationArea = All;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Department Code field.';
                    ApplicationArea = All;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ToolTip = 'Specifies the value of the Supervisor field.';
                    ApplicationArea = All;
                }
                field("Target Description"; Rec."Target Description")
                {
                    ToolTip = 'Specifies the value of the Target Description field.';
                    ApplicationArea = All;
                }

            }
        }
    }

}
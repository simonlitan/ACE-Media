page 50025 "Employee Joint Appraisal"
{
    PageType = List;
    InsertAllowed = false;
    ModifyAllowed = true;
    SourceTable = "Employee Perfomance Appraisals";
    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Supervisor; Rec.Supervisor)
                {
                    ToolTip = 'Specifies the value of the Supervisor field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Target Description"; Rec."Target Description")
                {
                    ToolTip = 'Specifies the value of the Target Description field.';
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Mid Year Employee Evaluation"; Rec."Mid Year Employee Evaluation")
                {
                    ToolTip = 'Specifies the value of the Mid Year Employee Evaluation field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Mid Year Supervisor Evaluation"; Rec."Mid Year Supervisor Evaluation")
                {
                    ToolTip = 'Specifies the value of the Mid Year Supervisor Evaluation field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("End Year Employee Evaluation"; Rec."End Year Employee Evaluation")
                {
                    ToolTip = 'Specifies the value of the End Year Employee Evaluation field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("End Year Supervisor Evaluation"; Rec."End Year Supervisor Evaluation")
                {
                    ToolTip = 'Specifies the value of the End Year Supervisor Evaluation field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Joint SupervisorEmployee Score"; Rec."Joint SupervisorEmployee Score")
                {
                    ToolTip = 'Specifies the value of the Joint SupervisorEmployee Score field.';
                    ApplicationArea = All;
                }
                /* field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                    ApplicationArea = All;
                    Visible = false;
                } */

            }
        }
    }
}
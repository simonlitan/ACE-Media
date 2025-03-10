page 50023 "Employee Perfomance Appraisals"
{
    PageType = List;
    SourceTable = "Employee Perfomance Appraisals";
    DeleteAllowed = true;

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
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.';
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
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
                field("Target Description"; Rec."Target Description")
                {
                    ToolTip = 'Specifies the value of the Target Description field.';
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                    ApplicationArea = All;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ToolTip = 'Specifies the value of the Supervisor field.';
                    ApplicationArea = All;
                }
                field("Mid Year Employee Evaluation"; Rec."Mid Year Employee Evaluation")
                {
                    ToolTip = 'Specifies the value of the Mid Year Employee Evaluation field.';
                    ApplicationArea = All;
                }
                field("Mid Year Supervisor Evaluation"; Rec."Mid Year Supervisor Evaluation")
                {
                    ToolTip = 'Specifies the value of the Mid Year Supervisor Evaluation field.';
                    ApplicationArea = All;
                }
                field("End Year Employee Evaluation"; Rec."End Year Employee Evaluation")
                {
                    ToolTip = 'Specifies the value of the End Year Employee Evaluation field.';
                    ApplicationArea = All;
                }
                field("End Year Supervisor Evaluation"; Rec."End Year Supervisor Evaluation")
                {
                    ToolTip = 'Specifies the value of the End Year Supervisor Evaluation field.';
                    ApplicationArea = All;
                }
                field("Joint SupervisorEmployee Score"; Rec."Joint SupervisorEmployee Score")
                {
                    ToolTip = 'Specifies the value of the Joint SupervisorEmployee Score field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
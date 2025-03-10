page 52179242 "Human Resource Setup"
{
    SourceTable = "HRM-Human Resources Setup.";
    PageType = Card;
    Caption = 'Human Resource SetUps';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.';
                    ApplicationArea = All;
                }
                field("Applicants Nos."; Rec."Applicants Nos.")
                {
                    ToolTip = 'Specifies the value of the Applicants Nos. field.';
                    ApplicationArea = All;
                }
                field("Disciplinary Cases Nos."; Rec."Disciplinary Cases Nos.")
                {
                    ToolTip = 'Specifies the value of the Disciplinary Cases Nos. field.';
                    ApplicationArea = All;
                }
                field("Employee Nos."; Rec."Employee Nos.")
                {
                    ToolTip = 'Specifies the value of the Employee Nos. field.';
                    ApplicationArea = All;
                }
                field("Leave Application Nos."; Rec."Leave Application Nos.")
                {
                    ToolTip = 'Specifies the value of the Leave Application Nos. field.';
                    ApplicationArea = All;
                }

                field("Recruitment Needs Nos."; Rec."Recruitment Needs Nos.")
                {
                    ToolTip = 'Specifies the value of the Recruitment Needs Nos. field.';
                    ApplicationArea = All;
                }
                field("Ministry Employee Nos."; Rec."Ministry Employee Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ministry Employee Nos. field.';
                }




            }
        }
    }
}
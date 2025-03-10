page 52179127 "PC Quaterly Periods"
{
    PageType = List;
    SourceTable = "PC Quaterly Periods";
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("PC Period"; Rec."PC Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PC Period field.';
                }
                field(Quater; Rec.Quater)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quater field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Submission Start Date"; Rec."Submission Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Submission Start Date field.';
                }
                field("Submission End Date"; Rec."Submission End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Submission End Date field.';
                }
            }

        }
    }

}
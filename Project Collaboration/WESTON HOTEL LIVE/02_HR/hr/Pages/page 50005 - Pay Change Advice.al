/// <summary>
/// Page Pay Change Advice (ID 50005).
/// </summary>
page 50005 "Pay Change Advice"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Pay Change Advice";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("Authority Number"; Rec."Authority Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Authority Number field.';
                }
                field("P/F No"; Rec."P/F No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the P/F No field.';
                }
                field("Other names"; Rec."Other names")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Other names field.';
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Surname field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Present Grade"; Rec."Present Grade")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Present Grade field.';
                }
                field("New Grade"; Rec."New Grade")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Grade field.';
                }
                field("Incremental date"; Rec."Incremental date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incremental date field.';
                }
                field("Effective Date for action"; Rec."Effective Date for action")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Effective Date for action field.';
                }
                field("Terms of new grade"; Rec."Terms of new grade")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Terms of new grade field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Print")
            {
                Caption = 'Print';
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetFilter("Authority Number", Rec."Authority Number");
                    REPORT.Run(report::"Pay Change Advice", true, true, Rec);
                    Rec.Reset;
                end;
            }
        }
    }

    var
        myInt: Integer;
}
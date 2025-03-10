/// <summary>
/// Page Pay Change Advice (ID 50002).
/// </summary>
page 50004 "Pay Change Advice List"
{
    PageType = list;
    CardPageId = "Pay Change Advice";
    ApplicationArea = All;
    Editable = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    SourceTable = "Pay Change Advice";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
                field("New Grade"; Rec."New Grade")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Grade field.';
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
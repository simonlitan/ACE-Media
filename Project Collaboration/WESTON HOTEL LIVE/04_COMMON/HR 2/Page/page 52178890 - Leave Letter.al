/// <summary>
/// Page Leave Letter (ID 52178890).
/// </summary>
page 52178890 "Leave Letter"
{
    PageType = Card;
    Editable = true;
    SourceTable = "Leave Letter";

    layout
    {
        area(Content)
        {
            group(Details)
            {

                field(salutation; Rec.salutation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the salutation field.';
                }
                field("Current Financial Year"; Rec."Current Financial Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Financial Year field.';
                }
                field("Previous Financial year"; Rec."Previous Financial year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Previous Financial year field.';
                }
                field("date"; Rec."date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the date field.';
                }
                field("Job title"; Rec."Job title")
                {
                    Caption = 'Through';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job title field.';
                }
                field("Days Carried forward"; Rec."Days Carried forward")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Days Carried forward field.';
                }
                field("Annual Leave Days"; Rec."Annual Leave Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Annual Leave Days field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Print)
            {
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                trigger OnAction()
                begin

                    begin
                        Rec.Reset;
                        Rec.SetFilter(No, Rec.No);
                        REPORT.Run(report::"Leave letter", true, true, Rec);
                        Rec.Reset;
                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
}
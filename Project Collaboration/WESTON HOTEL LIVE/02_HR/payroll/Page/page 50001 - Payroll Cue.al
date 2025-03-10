/// <summary>
/// Page Payroll Cue (ID 50001).
/// </summary>
page 50001 "Payroll Cue"
{
    PageType = CardPart;

    SourceTable = "HRM-Cue";


    layout
    {
        area(Content)
        {
            cuegroup(Employee)
            {



                field("Employee-Active (PR)"; Rec."Employee-Active")
                {
                    Caption = 'Active Employees';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee-Active (PR) field.';

                }

                field("Employee-InActive"; Rec."Employee-InActive")
                {
                    Caption = 'Inactive Employees';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee-InActive field.';
                }

                field("Active Casuals"; Rec."Active Casuals (PR)")
                {
                    ApplicationArea = All;
                    Caption = 'Active Casuals';
                    ToolTip = 'Specifies the value of the Active Casuals.';
                }


                // field(Interns; Rec.Interns)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Interns field.';
                // }
                field("Active Interns"; Rec."Active Interns")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Active Interns field.';
                }
                // field("Inactive Interns"; Rec."Inactive Interns")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Inactive Interns field.';
                // }


            }
        }
    }

    actions
    {
        area(Processing)
        {

        }
    }
    trigger OnOpenPage()
    begin
        if not rec.get then begin
            rec.INIT;
            rec.INSERT;
        end;
    end;

    var
        myInt: Integer;
}
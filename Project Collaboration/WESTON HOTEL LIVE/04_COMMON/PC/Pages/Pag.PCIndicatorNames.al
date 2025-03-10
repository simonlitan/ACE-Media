page 52179122 "PC Indicator Names"
{
    PageType = List;
    SourceTable = "PC Indicator Name";
    // DeleteAllowed = false;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("PC Period"; Rec."PC Period")
                {
                    //  Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PC Period field.';
                }
                field("Indicator Code"; Rec."Indicator Code")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Indicator Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Department Code"; Rec."Department Code")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Head of Department"; Rec."Head of Department")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Head of Department field.';
                }
                field("Indicator Total weight"; Rec."Indicator Total weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Indicator Total weight field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Indicators Parameters")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;
                RunObject = Page "PC Indicator Params";
                RunPageLink = "PC Period" = field("PC Period"), "Indicator Code" = field("Indicator Code"), Department = field("Department Code"),
                "Head of Department" = field("Head of Department");

            }

            action("Preview")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    pcperid: Record "PC Indicator Name";
                begin
                    pcperid.Reset();
                    pcperid.SetRange("PC Period", rec."PC Period");
                    if pcperid.Find('-') then begin
                        Report.Run(52178890, true, false, pcperid);
                    end;

                end;
            }
        }
    }

}
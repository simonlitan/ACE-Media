page 52178909 "CEO Calendar Names"
{
    ApplicationArea = Planning;
    Caption = 'CEO-Calendar';
    PageType = List;
    SourceTable = "CEO-Production Forecast Name";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(rep)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the name of the production forecast.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies a brief description of the production forecast.';
                }
            }
        }
        // area(factboxes)
        // {
        //     systempart(part1; Links)
        //     {
        //         Visible = false;
        //     }
        //     systempart(part2; Notes)
        //     {
        //         Visible = false;
        //     }
        // }
    }

    actions
    {
        area(processing)
        {
            action("Edit Calendar")
            {
                ApplicationArea = Planning;
                Caption = 'Edit Calendar';
                Image = EditForecast;
                Promoted = true;
                PromotedCategory = Process;
                ShortCutKey = 'Return';
                ToolTip = 'Open the related Calandar setup.';

                trigger OnAction()
                var
                    DemandForecast: Page "CEO-Demand Forecast";
                begin
                    DemandForecast.SetProductionForecastName(Rec.Name);
                    DemandForecast.RUN;
                end;
            }
        }
    }
}


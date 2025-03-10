page 52178725 "NW-Mileage Allowance Rates"
{
    PageType = List;

    SourceTable = "NW-Mileage Allowance Rates";
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
                field("Mileage Rate Code"; Rec."Mileage Rate Code")
                {
                    ToolTip = 'Specifies the value of the Mileage Rate Code field.';
                    ApplicationArea = All;
                }
                field("Rate Value"; Rec."Rate Value")
                {
                    ToolTip = 'Specifies the value of the Rate Value field.';
                    ApplicationArea = All;
                }
                field("Ceiling Amount"; Rec."Ceiling Amount")
                {
                    ToolTip = 'Specifies the value of the Ceiling Amount field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                    ApplicationArea = All;
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
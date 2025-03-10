page 52178898 "TR Vehicle Card"
{
    Caption = 'TR Vehicle Card';
    PageType = Card;
    SourceTable = "TR Vehicles";
    SaveValues = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("FA No"; Rec."FA No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the FA No field.';
                }
                field("Registration No"; Rec."Registration No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration No field.';
                }
                field("Civilian No"; Rec."Civilian No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Civilian No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("No of passengers"; Rec."No of passengers")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of passengers field.';
                }

                field("Fuel Consumption"; Rec."Fuel Consumption")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fuel Consumption field.';
                }
                field(Available; Rec.Available)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Available field.';
                }
            }
            group("Driver Allocation")
            {
                part("Driver Allocation "; "TR Driver Allocation")
                {
                    ApplicationArea = all;
                    SubPageLink = "Registration No" = field("Registration No");
                }
            }
            group("Insurance Details")
            {

                field("Insurance Start Date"; Rec."Insurance Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Insurance Start Date field.';
                }
                field("Renewal Interval"; Rec."Renewal Interval")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Renewal Interval field.';
                }
                field("Renewal Interval Value"; Rec."Renewal Interval Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Renewal Interval Value field.';
                }
                field("Insurance Ending Date"; Rec."Insurance Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Insurance Ending Date field.';
                }
                field("Insurance Provider"; Rec."Insurance Provider")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Insurance Provider field.';
                }
            }
            group("Drive Train")
            {

                field("Chasis No"; Rec."Chasis No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Chasis No field.';
                }
                field("Engine No"; Rec."Engine No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Engine No field.';
                }

            }
        }
    }
}

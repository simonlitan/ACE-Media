page 52178908 "CEO-Calendar Entries"
{
    //ApplicationArea = Planning;
    Caption = 'Calendar Entries';
    //DelayedInsert = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "CEO-Production Forecast Entry";

    layout
    {
        area(content)
        {
            repeater(" ")
            {
                field("Forecast Date"; Rec."Calendar Date")
                {
                    ApplicationArea = Planning;
                    //Editable = false;
                    Caption = 'Planning Date';
                    ToolTip = 'Specifies the date of the production forecast to which the entry belongs.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Planning;
                    //Editable = false;
                    Caption = 'Calendar No. Identity';
                    ToolTip = 'Specifies the item identification number of the entry.';
                }
                field("Calendar Name"; Rec."Calendar Name")
                {
                    ApplicationArea = Planning;
                    //Editable = false;
                    ToolTip = 'Specifies the name of the calendar to which the entry belongs.';
                }

                field("Attendant Name"; Rec."Attendant Name")
                {
                    Caption = 'Attendant Name';
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies a brief description of your forecast.';
                    Caption = 'Responsibility';
                }


                /* field("Forecast Quantity (Base)"; "Forecast Quantity (Base)")
                {
                    ApplicationArea = Planning;
                    Editable = false;
                    ToolTip = 'Specifies the quantity of the entry stated, in base units of measure.';
                } */

                /*  field("Forecast Quantity"; "Forecast Quantity")
                 {
                     ApplicationArea = Planning;
                     Editable = false;
                     ToolTip = 'Specifies the quantities you have entered in the production forecast within the selected time interval.';
                 } */
                /*  field("Unit of Measure Code"; "Unit of Measure Code")
                 {
                     ApplicationArea = Planning;
                     Editable = false;
                     ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                 } */
                /* field("Qty. per Unit of Measure"; "Qty. per Unit of Measure")
                {
                    ApplicationArea = Planning;
                    Editable = false;
                    ToolTip = 'Specifies the valid number of units that the unit of measure code represents for the production forecast entry.';
                } */
                // field("Location Code"; Rec."Location Code")
                // {
                //     ApplicationArea = Planning;
                //     //Editable = false;
                //     ToolTip = 'Specifies the code for the location that is linked to the entry.';
                // }
                /* field("Component Forecast"; "Component Forecast")
                {
                    ApplicationArea = Planning;
                    Editable = false;
                    ToolTip = 'Specifies that the forecast entry is for a component item.';
                } */
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Planning;
                    Editable = false;
                    //Editable = false;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                    //Visible = false;
                }
                field("Number of People"; Rec."Number of People")
                {
                    ApplicationArea = All;

                }
            }
        }
        area(factboxes)
        {
            systempart(part1; Links)
            {
                Visible = false;
                ApplicationArea = All;
            }
            systempart(part2; Notes)
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }

    //     trigger OnNewRecord(BelowxRec: Boolean)
    //     begin
    //         Rec."Calendar Name" := xRec."Calendar Name";
    //         Rec."Entry No." := xRec."Entry No.";
    //         Rec."Calendar Date" := xRec."Calendar Date";
    //     end;
}


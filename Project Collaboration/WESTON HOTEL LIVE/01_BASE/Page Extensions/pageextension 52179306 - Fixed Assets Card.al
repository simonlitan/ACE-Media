pageextension 52179306 "Fixed Assets Ext" extends "Fixed Asset Card"
{
    layout
    {
        modify("No.")
        {
            Visible = true;
            ApplicationArea = all;
        }

        addafter(Insured)
        {
            group(ConsumptionDetails)
            {
                field("Is Vehicle"; Rec."Is Vehicle")
                {
                    ApplicationArea = All;

                }
                field("Fuel Rate"; Rec."Fuel Rate")
                {
                    ApplicationArea = All;

                }
                field("Fuel consumption Rate"; Rec."Fuel consumption Rate")
                {
                    ApplicationArea = All;

                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    ApplicationArea = All;

                }

            }
        }
        addlast(General)
        {
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Model field.';
            }
            field(Condition; Rec.Condition)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Condition field.';
            }
            field("Tag No."; Rec."Tag No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Tag No. field.';
            }
            field("FIxed Asset Location"; Rec."FIxed Asset Location")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the FIxed Asset Location field.';
            }
            field("Title Status"; Rec."Title Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Title Status field.';
            }
            field("Title NO."; Rec."Title NO.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Title NO. field.';
            }
            field("Land Size "; Rec."Land Size ")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Land Size  field.';
            }
            field("Google Coordinates"; Rec."Google Coordinates")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Google Coordinates field.';
            }
            field("Water Tanks"; Rec."Water Tanks")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Water Tanks field.';
            }
            field(Reserviors; Rec.Reserviors)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Reserviors field.';
            }
            field(County; Rec.County)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the County field.';
            }
            field("Location/Region"; Rec."Location/Region")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Location/Region field.';
            }
            field(Name; Rec.Name)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Name field.';
            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Remarks field.';
            }

        }
        addafter(Description)
        {

            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description 2 field.';
            }
        }

    }
}
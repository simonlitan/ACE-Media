page 52178896 "TR Vehicle List"
{
    Caption = 'TR Vehicle List';
    CardPageId = "TR Vehicle Card";
    Editable = false;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "TR Vehicles";

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                field(Available; Rec.Available)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Available field.';
                }
                field("Chasis No"; Rec."Chasis No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Chasis No field.';
                }

            }
        }
    }
}

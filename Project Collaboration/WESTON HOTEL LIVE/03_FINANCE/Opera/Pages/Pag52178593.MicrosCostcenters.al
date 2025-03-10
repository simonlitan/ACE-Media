page 52178593 "Micros Cost centers"
{
    PageType = List;
    SourceTable = "Micros Cost Centers";

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Opera Code"; Rec."Opera Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Opera Code field.';
                }
                field("Navision Code"; Rec."Navision Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Navision Code field.';
                }
            }
        }
    }
}
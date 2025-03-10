page 52178594 "Micros G/L Accounts"
{
    PageType = List;
    SourceTable = "Micros G/L Accounts";
    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Navision Code"; Rec."Navision Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Navision Code field.';
                }
                field("Opera Code"; Rec."Opera Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Opera Code field.';
                }
            }
        }
    }
}
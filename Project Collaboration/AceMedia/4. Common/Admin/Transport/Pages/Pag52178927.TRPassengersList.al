page 52178900 "TR Passengers List"
{
    Caption = 'TR Passengers List';
    PageType = ListPart;
    SourceTable = "TR Passengers";
    DeleteAllowed = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Passenger No"; Rec."Passenger No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Passenger No field.';
                }
                field("Passenger Name"; Rec."Passenger Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Passenger Name field.';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone No field.';
                }
            }
        }
    }
}

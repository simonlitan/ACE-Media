/// <summary>
/// PageExtension ExtResponsibility Center Card (ID 52179309) extends Record Responsibility Center Card.
/// </summary>
pageextension 52178425 "responsibilty centr card" extends "Responsibility Center Card"
{
    layout
    {
        addafter("Location Code")
        {

            field(Grouping; Rec.Grouping)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Grouping field.';
            }
        }
    }
}

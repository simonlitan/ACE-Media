pageextension 52179309 "responsibilty centr card" extends "Responsibility Center Card"
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

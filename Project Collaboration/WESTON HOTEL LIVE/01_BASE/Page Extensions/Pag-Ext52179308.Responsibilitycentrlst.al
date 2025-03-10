pageextension 52179308 "Responsibility centr lst" extends "Responsibility Center List"
{
    Editable = true;
    layout
    {

        addafter(Name)
        {

            field(Grouping; Rec.Grouping)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Grouping field.';
            }
        }
    }
}

/// <summary>
/// PageExtension ExtResponsibility Center List (ID 52179308) extends Record Responsibility Center List.
/// </summary>
pageextension 52178424 "ExtResponsibility Center List" extends "Responsibility Center List"
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

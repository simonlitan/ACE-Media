pageextension 52179304 "Workflow User Groups" extends "Workflow User Groups"
{
    layout
    {
        addafter(Description)
        {

            field("Groups"; Rec."Group")
            {
                Caption = 'Grouping';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Group field.';
            }
        }
    }
}

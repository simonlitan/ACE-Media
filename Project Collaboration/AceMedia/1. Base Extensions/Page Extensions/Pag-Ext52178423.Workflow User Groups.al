/// <summary>
/// PageExtension ExtExtWorkflow User Groups (ID 52179304) extends Record Workflow User Groups.
/// </summary>
pageextension 52178423 "Workflow User Groups" extends "Workflow User Groups"
{
    Editable = true;
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

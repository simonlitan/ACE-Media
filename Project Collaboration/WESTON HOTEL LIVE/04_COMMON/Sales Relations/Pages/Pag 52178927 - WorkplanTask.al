page 52178927 "Workplan  Task"
{
    Caption = 'My WorkPlan';
    PageType = ListPart;
    SourceTable = "WorkPlan Task";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Task ID"; Rec."Task ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Task ID field.';
                }
                field("Contact No"; Rec."Contact No")
                {
                    ApplicationArea = all;
                    Caption = 'Client No';

                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Caption = 'Client Name';
                }
                field("Task Description"; Rec."Task Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Task Description field.';
                    MultiLine = true;
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = all;
                    MultiLine = true;
                    Caption = 'Activities';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = all;
                }
                field("Contact Person Number"; Rec."Contact Person Number")
                {
                    ApplicationArea = all;
                }
                field("Contact Person Email"; Rec."Contact Person Email")
                {
                    ApplicationArea = all;
                }
                field("Time"; Rec."Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("Estimated Amount"; Rec."Estimated Amount")
                {
                    ApplicationArea = all;
                    ShowMandatory = true;
                }
                field(Feedback; Rec.Feedback)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}


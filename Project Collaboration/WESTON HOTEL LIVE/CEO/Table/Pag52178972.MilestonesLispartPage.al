page 52178972 "Milestones Lispart Page"
{
    Caption = 'Milestones';
    PageType = ListPart;
    SourceTable = "Milestones Lispart Table";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                    Visible = false;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                    MultiLine = true;
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Modified By field.';
                    Editable = false;
                }

                // field("No."; Rec."No.")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the No. field.';
                // }

                // field(Status; Rec.Status)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Status field.';
                // }
                // field(SystemCreatedAt; Rec.SystemCreatedAt)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                // }
                // field(SystemCreatedBy; Rec.SystemCreatedBy)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                // }
                // field(SystemId; Rec.SystemId)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the SystemId field.';
                // }
                // field(SystemModifiedAt; Rec.SystemModifiedAt)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                // }
                // field(SystemModifiedBy; Rec.SystemModifiedBy)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                // }
                // field("Time"; Rec."Time")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Time field.';
                // }
            }
        }
    }
}

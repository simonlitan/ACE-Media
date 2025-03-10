page 52179060 "Clearance List All"
{
    Caption = 'Clearance List All';
    CardPageId = "Clearance Card";
    PageType = List;
    SourceTable = "Clearance Header";
    DeleteAllowed = false;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Nature of Leaving"; Rec."Nature of Leaving")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nature of Leaving field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field("Date of Leaving"; Rec."Date of Leaving")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Leaving field.';
                }

            }
        }
    }
}

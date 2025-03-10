page 52178933 "RM-Maintenance Complete"
{
    Caption = 'RM-Maintenance Complete';
    PageType = List;
    SourceTable = RepairMaintenance;
    SourceTableView = where(Status = const(Approved), "Repair Status" = const("Maintenance Completed"));
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Repair Status"; Rec."Repair Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Repair Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }


            }
        }
    }
}

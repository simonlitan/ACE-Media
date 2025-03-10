page 52179316 "Staff Workplan"
{
    ApplicationArea = All;
    Caption = 'Staff Workplan';
    PageType = List;
    CardPageId = WorplanCard;
    SourceTable = "Self Appraisal";
    UsageCategory = Lists;
    Editable = false;
    SourceTableView = where(Status = filter(Open | "Pending Approval" | Released));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Review Status"; Rec."Review Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Review Status field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Review Status" := Rec."Review Status"::Employee
    end;

    trigger OnOpenPage()
    var
        Empl: Record "HRM-Employee C";
        User: Text;
    begin
        Rec.SetFilter("User ID", UserId);
    end;
}

page 50231 "Self Appraisal List2"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    InsertAllowed = false;
    ApplicationArea = All;
    Editable = false;
    Caption = 'Self Appraisal List';
    PageType = List;
    SourceTable = "Employee Self-Appraisal";
    UsageCategory = Lists;
    CardPageId = "Self Appraisal Card";
    SourceTableView = where(Status = filter(Open | "Pending Approval"));
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
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Period Under Review"; Rec."Period Under Review")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Under Review field.';
                }
                field("Supervisor’s Name:"; Rec."Supervisor’s Name:")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisor’s Name: field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(Appraisal)
            {

            }
        }
        area(Creation)
        {
            group(GROUP2)
            {

            }
        }
        area(Reporting)
        {
            group(GROUP3)
            {

            }
        }
        area(Navigation)
        {
            group(GROUP4)
            {

            }
        }
    }

    trigger OnOpenPage()
    var
        Empl: Record "HRM-Employee C";
        User: Text;
    begin
        Rec.SetFilter("User ID", UserId);
    end;
}

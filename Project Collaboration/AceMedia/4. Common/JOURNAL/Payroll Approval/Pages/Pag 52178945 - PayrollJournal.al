page 52178945 "Payroll Journal"
{
    Caption = 'Payroll Journal';
    CardPageId = "Payroll Journals";
    PageType = List;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTable = "Prl-Journal Header";
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Period field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
            }
        }
    }
}

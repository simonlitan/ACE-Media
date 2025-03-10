page 52178935 "REG-AppraisalFiles ListPart"
{
    Caption = 'REG-AppraisalFiles ListPart';
    PageType = ListPart;
    SourceTable = "REG-File Requisition1";

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
                field("File No"; Rec."File No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File No field.';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requesting Officer field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Authorized By"; Rec."Authorized By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Authorized By field.';
                }
                field("Collecting Officer"; Rec."Collecting Officer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Collecting Officer field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Served By"; Rec."Served By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Served By field.';
                }
            }
        }
    }
}

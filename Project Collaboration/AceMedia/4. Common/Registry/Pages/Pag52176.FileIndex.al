page 52179030 "File Index"
{
    Caption = 'File Index';
    PageType = List;
    SourceTable = "File Indexes";
    Editable = true;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("File Index code"; Rec."File Index code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Index code field.';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("Dimension type value"; Rec."Dimension type value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dimension type value field.';
                }
            }
        }
    }
}

page 52179071 "File Movement History"
{
    Caption = 'File Movement History';
    PageType = ListPart;
    SourceTable = "File Movement Register";
    Editable = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("File Description"; Rec."File Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Description field.';
                }
                field("Movement Type"; Rec."Movement Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Movement Type field.';
                }
                field("Movement Date"; Rec."Movement Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Movement Date field.';
                }
                field(Officer; Rec.Officer)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Officer field.';
                }
            }
        }
    }
}

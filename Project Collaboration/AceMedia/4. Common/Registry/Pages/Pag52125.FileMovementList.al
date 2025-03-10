page 52178925 "File Movement List"
{
    ApplicationArea = All;
    Caption = 'File Movement List';
    PageType = List;
    SourceTable = "File Movement Register";
    UsageCategory = History;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTableView = sorting("Movement Date") order(descending);

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("File ID"; Rec."File ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File ID field.';
                }
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
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Type field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
            }
        }
    }
    actions
    {
        area(Reporting)
        {
            action("File Movement Register")
            {
                ApplicationArea = All;
                RunObject = report "File Movement Register";
                Image = TestReport;
                Promoted = true;
                PromotedCategory = Report;
            }
        }
    }
}

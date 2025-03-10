page 52178935 "Legal-MoU ListPage"
{
    Caption = 'Legal-MoU ListPage';
    PageType = List;
    SourceTable = "Legal-MoU Table";
    CardPageId = "Legal-MoU CardPage";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                    ApplicationArea = All;
                }
                field("Collaboration Areas"; Rec."Collaboration Areas")
                {
                    ToolTip = 'Specifies the value of the Collaboration Areas field.';
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}

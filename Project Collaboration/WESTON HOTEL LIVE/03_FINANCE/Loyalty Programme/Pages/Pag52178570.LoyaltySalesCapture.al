page 52178570 "Loyalty Sales Capture"
{
    PageType = List;
    SourceTable = "Loyalty Sales Capture";
    DeleteAllowed = false;
    CardPageId = "Loyalty Sales card";
    SourceTableView = where("Programme Type" = filter(Points));
    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(description; Rec.description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the description field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Programme Type"; Rec."Programme Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Programme Type field.';
                }
                field("Active Period"; Rec."Active Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Active Period field.';
                }
                field("Dimension 1"; Rec."Dimension 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Dimension 2"; Rec."Dimension 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
    }
}
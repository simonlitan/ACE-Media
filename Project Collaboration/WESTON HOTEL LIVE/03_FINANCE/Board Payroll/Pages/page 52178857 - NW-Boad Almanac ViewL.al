page 52178857 "NW-Boad Almanac ViewL"
{
    PageType = List;
    SourceTable = "NW-Boad Almanac View";
    CardPageId = "NW-Boad Almanac ViewC";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field("Board Period"; Rec."Board Period")
                {
                    ToolTip = 'Specifies the value of the Board Period field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}
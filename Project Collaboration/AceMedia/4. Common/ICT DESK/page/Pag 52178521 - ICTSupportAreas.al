page 52178984 "ICT Support Areas"
{
    PageType = List;
    SourceTable = "ICT Support Areas";

    layout
    {
        area(content)
        {
            repeater(rep)
            {
                field("Support Area No."; Rec."Support Area No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Description; Rec."Area Description")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

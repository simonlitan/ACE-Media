page 52178959 "ICT Support Area"
{
    Caption = 'ICT Support Areas';
    PageType = ListPart;
    SourceTable = "ICT Issues Desc";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    Visible = false;
                }
                field("Issue Area"; Rec."Issue Area")
                {

                }
                field("Area Description"; Rec."Area Description")
                {

                }
                field("Issue Priority"; Rec."Issue Priority")
                {

                }
            }
        }
    }
}

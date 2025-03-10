page 52178784 "PR Sales Setup"
{
    Caption = 'PR Sales Setup';
    PageType = List;
    SourceTable = "PR Sales Setup";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Service Code";Rec."Service Code")
                {
                    ApplicationArea = all;
                }
                field("Service Name";Rec."Service Name")
                {
                    
                }
            }
        }
    }
}

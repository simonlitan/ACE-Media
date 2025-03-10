page 52178556 "Store req page1"
{
    Caption = 'Store req page';
    PageType = Card;
    SourceTable = "PROC-Store Requistion Lines";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Requistion No";Rec."Requistion No")
                {
                    ApplicationArea = all;

                }
                field("Issuing Store";Rec."Issuing Store")
                {
                    ApplicationArea = all;

                }
                field("Quantity Requested";Rec."Quantity Requested")
                {
                    ApplicationArea = all;

                }
                field("Line Amount";Rec."Line Amount")
                {
                    ApplicationArea =all;
                }
                field("Posting Date";Rec."Posting Date")
                {

                }
                
            }
        }
    }
}

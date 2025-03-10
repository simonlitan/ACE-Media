page 52178555 "Store Req Page"
{
    Caption = 'Store Req Page';
    PageType = List;
    SourceTable = "PROC-Store Requistion Lines";
    CardPageId = "Store req page1";
     UsageCategory = Administration;
    ApplicationArea = all;

    
    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                     ApplicationArea =all;

                }
                field("Request Status";Rec."Request Status")
                {
                     ApplicationArea =all;

                }
            
            }
        }
    }
}

pageextension 52178534 "ExtSales Invoice" extends "Sales Invoice"
{
    layout
    {
        addafter("Sell-to Country/Region Code")
        {

            field("HS Codes"; Rec."HS Codes")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HS Codes field.';
                trigger OnValidate()
                var
                    Cust: Record Customer;
                begin
                    if rec.get(Rec."Sell-to Customer No.") then begin
                        rec."HS Codes" := Cust."HS Code";
                    end;
                end;
            }
        }
        
    }
    actions
    {
        addafter(Post)
        {
            action("POS Report")
            {
                ApplicationArea = all;
                RunObject = report "Sales Invoice 2";
            }
        }
    }
}

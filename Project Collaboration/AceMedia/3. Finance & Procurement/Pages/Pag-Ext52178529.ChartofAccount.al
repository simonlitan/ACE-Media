pageextension 52178529 "Chart of Account" extends "chart of accounts"
{
    actions
    {
        addbefore("A&ccount")
        {
            action("Detailed Revised Trial Balance")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Report;
                RunObject = report "Trial Balance Detail/Summary2";
            }
        }
    }
}

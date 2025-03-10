pageextension 52178537 "ExtFixed Asset List" extends "Fixed Asset List"
{
    actions
    {
        addbefore("Fixed Assets List")
        {
            action("Fixed Assets Register")
            {
                ApplicationArea = FixedAssets;

                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "FA Register";
                ToolTip = 'View the list of fixed assets that exist in the system .';
            }
            action("Fixed Assets Register 2")
            {
                ApplicationArea = FixedAssets;

                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "FA Register 2";
                ToolTip = 'View the list of fixed assets that exist in the system .';
            }
        }
    }
}

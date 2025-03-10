pageextension 52178518 "ExtPhys. Inventory Journal" extends "Phys. Inventory Journal"
{
    actions
    {
        addafter("P&ost")
        {
            action("Inventory Report")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Report;
                RunObject = report "Phys Inventory Journal";
            }
        }
    }
}

pageextension 52178871 "ExtUpdate Opportunity" extends "Update Opportunity"
{
    layout
    {
        modify("Estimated Value (LCY)")
        {
            ShowMandatory = false;
            Visible = true;
        }
    }
}

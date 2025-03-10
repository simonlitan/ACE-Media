pageextension 52178511 "ExtPurchase Order Subform" extends "Purchase Order Subform"
{
    layout
    {
        modify("Location Code")
        {
            ShowMandatory = true;
            Editable = true;
        }
        
        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
            begin
                Item.Reset();
                if Item.Get(Rec."No.") then
                    Rec."Location Code" := Item."Location code";

                LPO.Reset();
                LPO.SetRange("No.", Rec."Document No.");
                if LPO.FindFirst() then
                    Rec."Shortcut Dimension 1 Code" := LPO."Shortcut Dimension 1 Code";
            end;
        }
        modify("Item Reference No.")
        {
            Visible = false;
        }
        modify("Bin Code")
        {
            Visible = false;
        }
        modify("Reserved Quantity")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
    }

    //     trigger OnModifyRecord(): Boolean
    //     var
    //         ModifErr: Label 'Document MUST be open to be modified';
    //     begin
    //         Rec.SetRange("Document Type", Rec."Document Type"::Order);
    //         Rec.SetRange("Document No.", Rec."Document No.");
    //         if Rec.FindFirst() then
    //             if Rec.Status <> Rec.Status::Open then
    //                 if not (UserId = 'APPKINGS') then
    //                     Error(ModifErr);

    //     end;

    var
        LPO: Record "Purchase Header";

}
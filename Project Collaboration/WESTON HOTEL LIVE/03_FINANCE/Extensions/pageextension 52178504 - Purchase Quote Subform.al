pageextension 52178504 "PurchaseQuoteSubform Ext" extends "Purchase Quote Subform"
{
    layout
    {
        // Add changes to page layout here
        modify("Location Code")
        {
            ShowMandatory = true;
        }
        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
                Branch: Record "Dimension Value";
                Err: Label 'Please specify the main branch.';
            begin
                Item.Reset();
                if Item.Get(Rec."No.") then begin
                    Rec."Location Code" := Item."Location code";
                    Branch.Reset();
                    Branch.SetRange("Global Dimension No.", 1);
                   Branch.SetRange(Main, true);
                    // if Branch.FindFirst() then
                    //     Rec."Shortcut Dimension 1 Code" := Branch.Code else
                    //     Error(Err);
                end;
            end;
        }

        addafter(Description)
        {
            field(Comments; Rec.Comments)
            {
                ApplicationArea = All;
                ToolTip = 'Detailed description about item specifications';
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
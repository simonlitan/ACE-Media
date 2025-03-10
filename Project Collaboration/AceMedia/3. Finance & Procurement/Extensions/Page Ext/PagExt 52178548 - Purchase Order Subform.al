pageextension 52178548 "ExtPurchase Order Subform" extends "Purchase Order Subform"
{

    layout
    {
        modify(Type)
        {
            Editable = true;


        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                Item: Record Item;
                FA: Record "Fixed Asset";
            begin
                // Item.Reset();
                // Item.SetRange("No.", rec."No.");
                // if Item.Find('-') then

                //     // if rec.Type = rec.Type::Item then begin
                //     Rec."Budgeted Account" := Item."Item G/L Budget Account";
                // rec.Validate("Budgeted Account");


                //  end;
            end;


            // if rec.type = Rec.Type::Item then
            // begin

            // end;

        }

        addafter("Location Code")
        {
            field("GenProd. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = all;
            }
        }
        addafter("No.")
        {
            field("Budgeted Account"; Rec."Budgeted Account")
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("Budget Balance"; Rec."Budget Balance")
            {
                Editable = false;
            }
            field("Budget Name"; Rec."Budget Name")
            {
                ApplicationArea = all;
                Editable = true;
            }
        }
    }

}

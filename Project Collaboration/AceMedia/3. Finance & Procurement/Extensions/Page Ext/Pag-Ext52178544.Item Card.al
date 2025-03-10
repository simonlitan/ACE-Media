pageextension 52178544 "ExtItem Card" extends "Item Card"
{
    layout
    {
        addafter("Base Unit of Measure")
        {
            field("Purch Unit of Measure"; Rec."Purch. Unit of Measure")
            {
                ApplicationArea = All;
            }
        }
        modify("VAT Prod. Posting Group")
        {
            ShowMandatory = true;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        addafter("Item Category Code")
        {
            field("Is Controlled"; Rec."Is Controlled")
            {
                ApplicationArea = All;
            }
            field("Place of Manufacture"; Rec."Place of Manufacture")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Place of Manufacture field.';
            }
        }
        addafter("Item Category Code")
        {

            field("Item G/L Budget Account"; Rec."Item G/L Budget Account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item G/L Budget Account field.';
            }
        }
    }

    actions
    {
        addafter(AdjustInventory)
        {
            action("Import Unit of Measure")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Unit of Measure';
                Image = Journal;
                RunObject = xmlport "Item Unit of measure";
                ToolTip = 'Item Unit of Measure';
            }
        }

    }


    var
        myInt: Integer;

}
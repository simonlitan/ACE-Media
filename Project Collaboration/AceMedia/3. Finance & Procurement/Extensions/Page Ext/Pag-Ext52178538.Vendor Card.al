/// <summary>
/// PageExtension ExtExtExtExtExtExtExtExtExtExtExtExtExtVendor Card (ID 52179303) extends Record Vendor Card.
/// </summary>
pageextension 52178538 "Vendor Card" extends "Vendor Card"
{
    layout
    {
        modify("No.")
        {
            Visible = true;
            Editable = false;
        }
        modify("E-Mail")
        {
            ShowMandatory = true;


        }
        modify("Phone No.")
        {
            ShowMandatory = true;
        }
        modify("Gen. Bus. Posting Group")
        {
            ShowMandatory = true;

        }
        modify("VAT Bus. Posting Group")
        {
            ShowMandatory = true;
        }
        modify("Vendor Posting Group")
        {
            ShowMandatory = true;
        }
        modify("VAT Registration No.")
        {
            ShowMandatory = true;

        }
        addafter("Privacy Blocked")
        {

            field("Vendor Categorization"; Rec."Vendor Categorization")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vendor Categorization field.';
            }
            field("Goods to supply"; Rec."Goods to supply")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Goods/Services Supplied field.';
            }
        }
        addafter(Priority)
        {

            field("Main Bank code"; Rec."Main Bank code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Main Bank code field.';
            }
            field("Main Bank Name"; Rec."Main Bank Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Main Bank Name field.';
            }
            field("Branch Bank"; Rec."Branch Bank")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Branch Bank field.';
            }
            field("Branch Bank Name"; Rec."Branch Bank Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Branch Bank Name field.';
            }
        }
        addafter("Post Code")
        {

            field("Email 1"; Rec."Email 1")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Email 1 field.';
            }
            field("Email 2"; Rec."Email 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Email 2 field.';
            }
            field("Telephone 1"; Rec."Telephone 1")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Telephone 1 field.';
            }
            field("Telephone 2"; Rec."Telephone 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Telephone 2 field.';
            }
            field(Password; Rec.Password)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Password field.';
            }
        }

    }
    // Add changes to page layout here



}






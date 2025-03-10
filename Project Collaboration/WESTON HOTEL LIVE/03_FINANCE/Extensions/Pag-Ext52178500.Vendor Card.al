/// <summary>
/// PageExtension ExtVendor Card (ID 52179303) extends Record Vendor Card.
/// </summary>
pageextension 52178500 "Vendor Card" extends "Vendor Card"
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
        modify("Our Account No.")
        {
            Visible = true;
            Caption = 'Supplier Bank Account No.';
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
        addafter(Name)
        {

            field("PIN No."; Rec."PIN No.")
            {
                ShowMandatory = true;
                NotBlank = true;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the PIN No. field.';
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

    }
    // Add changes to page layout here
    actions
    {
        addafter("Co&mments")
        {
            action(xmlimport)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    Xmlport.Run(52178509, false, true);
                end;
            }
            action(Attachment)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Attachments;
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
        }

    }
}






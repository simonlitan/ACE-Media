
pageextension 52178428 "ExtPurchases & Payables Setup" extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Allow Document Deletion Before")
        {

            field("Internal Requisition No."; Rec."Internal Requisition No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Internal Requisition No. field.';
            }
            field("Quotation Request No"; Rec."Quotation Request No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Quotation Request No field.';
            }
            field("Requisition Default Vendor"; Rec."Requisition Default Vendor")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Requisition Default Vendor field.';
            }
            field("Requisition No"; Rec."Requisition No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Requisition No field.';
            }
            field("Direct Procurement"; Rec."Direct Procurement")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Direct Procurement field.';
            }
            field("Restricted tendering"; Rec."Restricted tendering")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Restricted tendering field.';
            }
            field("Two stage Tender"; Rec."Two stage Tender")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Two stage Tender field.';
            }
            field(Tender; Rec.Tender)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Tender field.';
            }
            field("Tender Submission"; Rec."Tender Submission")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Tender Submission field.';
            }
            field("Stores Requisition No"; Rec."Stores Requisition No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Stores Requisition No field.';
            }
            field("LSO Nos"; Rec."LSO Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LSO Nos field.';
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
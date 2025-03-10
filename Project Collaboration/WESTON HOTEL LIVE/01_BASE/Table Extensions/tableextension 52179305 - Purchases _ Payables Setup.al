tableextension 52179305 "Purchases & Payables Setup" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50010; "Stores Requisition No"; code[10])
        {
            Caption = 'Stores Requisition No';
            TableRelation = "No. Series";

        }
        field(50003; "Quotation Request No"; code[10])
        {
            Caption = 'Quotation Request No';
            TableRelation = "No. Series";
        }
        field(50004; "Internal Requisition No."; code[20])
        {
            TableRelation = "No. Series";
        }
        field(50005; "Requisition Default Vendor"; code[20])
        {
            TableRelation = Vendor;
        }
        field(50006; "Requisition No"; code[30])
        {
            Caption = 'Requisition No';
            TableRelation = "No. Series";
        }
        field(50007; "LSO Nos"; code[30])
        {
            TableRelation = "No. Series".CODE;
        }
    }
}
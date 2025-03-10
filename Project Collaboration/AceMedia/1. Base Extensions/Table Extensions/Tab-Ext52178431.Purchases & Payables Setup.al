/// <summary>
/// TableExtension Purchases  Payables Setup (ID 52179305) extends Record Purchases  Payables Setup.
/// </summary>
tableextension 52178431 "ExtPurchases & Payables Setup" extends "Purchases & Payables Setup"
{
    fields
    {
        field(6007; "Stores Requisition No"; code[10])
        {
            Caption = 'Stores Requisition No';
            TableRelation = "No. Series";

        }
        field(6000; "Quotation Request No"; code[10])
        {
            Caption = 'Quotation Request No';
            TableRelation = "No. Series";
        }
        field(6001; "Internal Requisition No."; code[20])
        {
            TableRelation = "No. Series";
        }
        field(6002; "Requisition Default Vendor"; code[20])
        {
            TableRelation = Vendor;
        }
        field(6003; "Requisition No"; code[30])
        {
            Caption = 'Requisition No';
            TableRelation = "No. Series";
        }
        field(6004; "LSO Nos"; code[30])
        {
            TableRelation = "No. Series".CODE;
        }
        field(6005; "Direct Procurement"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(6006; "Restricted tendering"; code[30])
        {
            TableRelation = "No. Series";
        }
        field(6008; "Two stage Tender"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(6009; "Tender"; code[30])
        {
            TableRelation = "No. Series";
        }
        field(6010; "Tender Submission"; code[30])
        {
            TableRelation = "No. Series";
        }
    }
}
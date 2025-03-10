tableextension 52179301 "General Ledger Setup" extends "General Ledger Setup"
{
    fields
    {

        field(60011; "Casuals  Register Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(600012; "Current Budget"; Text[100])
        {

            TableRelation = "No. Series".Code;
        }
        field(600013; "Current Budget Start Date"; Date)
        {

            TableRelation = "No. Series".Code;
        }
        field(600014; "Imprest No"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(600015; "Normal Payments No"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(600016; "Petty Cash Payments No"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(600017; "Claims No"; Text[30])
        {

            TableRelation = "No. Series".Code;
        }
        field(600018; "Salary PV No"; Text[30])
        {

            TableRelation = "No. Series".Code;
        }
        field(600019; "Current Budget End Date"; Date)
        {

            TableRelation = "No. Series".Code;
        }
        field(600020; "Meals Booking No."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(600021; "Cash Sale"; Code[20])
        {
            TableRelation = "No. Series".Code;
            // ObsoleteState = Removed;
            // ObsoleteReason = 'modified';
        }
        field(600022; "Cafeteria Sales Account"; Text[100])
        {
            TableRelation = "No. Series".Code;
        }
        field(600023; "Cafeteria Credit Sales Account"; Text[100])
        {
            TableRelation = "No. Series".Code;
        }
        field(600024; "Item Template"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(600025; "Item Batch"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(600026; "Cash Template"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(600027; "Cash Batch"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(600028; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(600029; "Cheque Bank"; Text[250])
        {
            TableRelation = "No. Series".Code;
        }
        field(600030; "Staff Register Nos"; Text[250])
        {
            TableRelation = "No. Series".Code;
        }
        field(600031; "Visitor No."; Code[30])
        {
            TableRelation = "No. Series".Code;
        }
        field(52179300; "Service Nos"; code[50])
        {
            Tablerelation = "No. Series".code;
        }
        field(52179301; "LSO Nos."; code[50])
        {
            TableRelation = "No. Series".code;
        }


    }
}
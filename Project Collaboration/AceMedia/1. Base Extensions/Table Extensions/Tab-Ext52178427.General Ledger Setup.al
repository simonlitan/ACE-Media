/// <summary>
/// TableExtension ExtGeneral Ledger Setup (ID 52179301) extends Record General Ledger Setup.
/// </summary>
tableextension 52178427 "General Ledger Setup" extends "General Ledger Setup"
{
    fields
    {

        field(6000; "Casuals  Register Nos"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(6001; "Current Budget"; Text[100])
        {

            TableRelation = "No. Series".Code;
        }
        field(6002; "Current Budget Start Date"; Date)
        {

            TableRelation = "No. Series".Code;
        }
        field(6003; "Imprest No"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(6004; "Normal Payments No"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(6005; "Petty Cash Payments No"; Code[20])
        {

            TableRelation = "No. Series".Code;
        }
        field(6006; "Claims No"; Text[30])
        {

            TableRelation = "No. Series".Code;
        }
        field(6007; "Salary PV No"; Text[30])
        {

            TableRelation = "No. Series".Code;
        }
        field(6008; "Current Budget End Date"; Date)
        {

            TableRelation = "No. Series".Code;
        }
        field(6009; "Meals Booking No."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(6010; "Cash Sale"; Code[20])
        {
            TableRelation = "No. Series".Code;
            // ObsoleteState = Removed;
            // ObsoleteReason = 'modified';
        }
        field(6011; "Cafeteria Sales Account"; Text[100])
        {
            TableRelation = "No. Series".Code;
        }
        field(6012; "Cafeteria Credit Sales Account"; Text[100])
        {
            TableRelation = "No. Series".Code;
        }
        field(6013; "Item Template"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(6014; "Item Batch"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(6015; "Cash Template"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6016; "Cash Batch"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6017; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6018; "Cheque Bank"; Text[250])
        {
            TableRelation = "No. Series".Code;
        }
        field(6019; "Staff Register Nos"; Text[250])
        {
            TableRelation = "No. Series".Code;
        }
        field(6020; "Visitor No."; Code[30])
        {
            TableRelation = "No. Series".Code;
        }
        field(6021; "Service Nos"; code[50])
        {
            Tablerelation = "No. Series".code;
        }
        field(6022; "LSO Nos."; code[50])
        {
            TableRelation = "No. Series".code;
        }
        field(6023; JVs; code[20])
        {
            TableRelation = "No. Series".Code;
        }



    }
}
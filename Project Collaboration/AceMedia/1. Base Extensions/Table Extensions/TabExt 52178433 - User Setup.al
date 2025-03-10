tableextension 52178433 "ExtUser Setup" extends "User Setup"
{
    fields
    {
        field(50000; Leave; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Post Bank Rec"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Can Stop Reg."; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50027; "Cash Advance Staff Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(50037; "Employee No."; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "HRM-Employee C"."No.";
        }
        field(50041; "Staff No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No." WHERE("Customer Posting Group" = FILTER('IMPREST'));

            // trigger OnValidate()
            // var
            // Staff 
            // begin
            //     IF Staff.GET("Staff No")THEN BEGIN
            //     UserName:=Staff."First Name"+' '+Staff."Middle Name"+' '+Staff."Last Name";
            //     "E-Mail":=Staff."Company E-Mail";
            //     "Global Dimension 1 Code":=Staff."Department Code";
            //     "Job Tittle":=Staff."Job Title";
            //     END

            // end;
        }
        field(50100; "Edit Posted Dimensions"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50110; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template";
        }
        field(50111; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Journal Template Name"));
        }
        field(60003; "Unlimited PV Amount Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60004; "PV Amount Approval Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60005; "Unlimited PettyAmount Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60006; "Petty C Amount Approval Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60007; "Unlimited Imprest Amt Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60008; "Imprest Amount Approval Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60009; "Unlimited Store RqAmt Approval"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60010; "Store Req. Amt Approval Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60046; "Imprest Account"; code[20])
        {
            TableRelation = Customer."No." where("Customer Posting Group" = filter('Salary Advance'));
        }
        field(60002; "Global Dimension 1 Code"; code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50009; tetst; code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(60012; "Shortcut Dimension 3 Code"; code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(60013; "Shortcut Dimension 4 Code"; code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(60014; "User Signature"; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(60015; "Approval Title"; Text[500])
        {

        }
        field(60016; "Create FA"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60017; "Create Customer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60018; "Create Employee"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60019; "Create Course_Reg"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60020; "Create GL"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60021; "Create Items"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60022; "Create Salary"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60023; "Create Supplier"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60024; "Create Emp. Transactions"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60025; "Create PR Transactions"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60060; "Can Post Cust. Deposits"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60061; "Can Post Customer Refund"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60062; "Approval Role"; Text[50])
        {

        }
        field(60063; "Allow Open My Settings"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(60064; "Allow Change Role"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(60065; "Allow Change Company"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(60066; "Can View Payroll"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(60067; "Can create vendors"; boolean)
        {
            DataClassification = CustomerContent;
        }
        field(60068; HOD; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(60069; "Payroll Code"; code[30])
        {
            DataClassification = CustomerContent;
        }
        field(52179300; "Raise LPOs"; Boolean)
        {

        }
        field(6047; "Staff Advance No"; Code[50])
        {

        }
        field(6048; "Staff Claims No"; Code[50])
        {
            TableRelation = Vendor."No." where("Vendor Posting Group" = filter('S-CLAIM'));
        }
        field(6049; "Staff PettyC No"; Code[50])
        {
            Caption = 'Staff Petty Cash No';
            TableRelation = Customer."No." where("Customer Posting Group" = filter('STAFF(STD)'));
        }
        field(6050; "Global Dimension 2 Code"; code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(6051; "Memo Notification"; Boolean)
        {

        }
        field(6052; "Imprest Notification"; Boolean)
        {

        }
        field(6053; "Claim Notification"; Boolean)
        {

        }
        field(6054; "Pv Notification"; Boolean)
        {

        }
        field(6055; "PettyCash Notification"; Boolean)
        {

        }
        field(6056; "ImpSurr Notification"; Boolean)
        {

        }
        field(6057; "PcashSurr Notification"; Boolean)
        {

        }
        field(6058; "LPO Notification"; Boolean)
        {

        }
        field(6059; "Prn Notification"; Boolean)
        {

        }
        field(6045; "Delete Attachments"; Boolean)
        {

        }
        field(6046; "Proffessional OP"; Boolean)
        {

        }

        field(6060; OTP; Integer)
        {

        }
        field(6061; "Accounting Officer"; Boolean)
        {

        }
        field(6062; "Workflow Manager"; Boolean)
        {

        }




    }
}

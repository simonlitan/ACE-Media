table 52178599 "Cash Office Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(3; "Normal Payments No"; Code[10])
        {
            Caption = 'Receipts No';
            TableRelation = "No. Series";
        }
        field(4; "Cheque Reject Period"; DateFormula)
        {
        }
        field(5; "Petty Cash Payments No"; Code[10])
        {
            Caption = 'Petty Cash Payments No';
            TableRelation = "No. Series";
        }
        field(2; "Previous Budget"; code[50])
        {
            TableRelation = "G/L Budget Name".Name;

        }
        field(6; "Current Budget"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(7; "Current Budget Start Date"; Date)
        {
        }
        field(8; "Current Budget End Date"; Date)
        {
        }
        field(9; "Surrender Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(10; "Surrender  Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Surrender Template"));
        }
        field(11; "Payroll Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(12; "Payroll  Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name;
        }
        field(13; "Payroll Control A/C"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(14; "PV Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(15; "PV  Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("PV Template"));
        }
        field(16; "Contract No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(17; "Receipts No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(18; "Petty Cash Voucher  Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(19; "Petty Cash Voucher Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name;
        }
        field(20; "Max. Petty Cash Request"; Decimal)
        {
        }
        field(21; "Imprest Req No"; Code[20])
        {
            Caption = 'Receipts No';
            TableRelation = "No. Series";
        }
        field(22; "Quatation Request No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(23; "Tender Request No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(24; "Transport Pay Type"; Code[20])
        {
        }
        field(25; "Minimum Chargeable Weight"; Decimal)
        {
        }
        field(26; "Imprest Surrender No"; Code[20])
        {
            Caption = 'Imprest Surrender No';
            TableRelation = "No. Series";
        }
        field(27; "Bank Deposit No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(28; "InterBank Transfer No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(29; "PA Payment Vouchers Nos"; Code[20])
        {
            Caption = 'Farmers Payment Vouchers Nos.';
            TableRelation = "No. Series".Code;
        }
        field(30; "Cash Request Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(31; "Cash Issue Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(32; "Cash Receipt Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(33; "Cash Transfer Template"; Code[10])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(34; "Cash Transfer Batch"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Cash Transfer Template"));
        }
        field(35; "Enable AutoTeller Monitor"; Boolean)
        {
        }
        field(36; "Alert After ?(Mins)"; Integer)
        {
        }
        field(37; "Transporter Depot"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(38; "Transporter Department"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(39; "Transporter Cashier"; Code[20])
        {
            TableRelation = "Cash Office User Template";
        }
        field(40; "Transporter PayType"; Code[20])
        {
            TableRelation = "Receipts and Payment Types".Code WHERE(Type = FILTER(Payment));
        }
        field(41; "Cashier Transfer Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(42; "Interim Transfer Account"; Code[20])
        {
        }
        field(43; "Default Bank Deposit Slip A/C"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(44; "Staff Claim No"; Code[20])
        {
            Caption = 'Staff Claim No';
            TableRelation = "No. Series".Code;
        }
        field(45; "Other Staff Advance No"; Code[20])
        {
            Caption = 'Other Staff Advance No';
            TableRelation = "No. Series".Code;
        }
        field(46; "Staff Advance Surrender No"; Code[20])
        {
            Caption = 'Staff Adv. Surrender No';
            TableRelation = "No. Series".Code;
        }
        field(47; "Prompt Cash Reimbursement"; Boolean)
        {
        }
        field(48; "EFT Batch No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(49; "Memo Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50; "Advance Petty Cash"; code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(51; "Surrender Petty Cash"; code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(52; JVs; code[20])
        {
            TableRelation = "No. Series".Code;

        }
        field(53; "Salary Advance"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(55; "Casual Req. No's"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
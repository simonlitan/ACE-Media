page 52178667 "Cash Office Setup UP"
{
    PageType = Card;
    SourceTable = "Cash Office Setup";

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.';
                    ApplicationArea = All;
                }
                field("Normal Payments No"; Rec."Normal Payments No")
                {
                    ApplicationArea = All;
                    Caption = 'Payment Voucher';
                }

                field("Cheque Reject Period"; Rec."Cheque Reject Period")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash Payments No"; Rec."Petty Cash Payments No")
                {
                    ApplicationArea = All;
                }
                field("Previous Budget"; rec."Previous Budget")
                {
                    ApplicationArea = all;
                }
                field("Current Budget"; Rec."Current Budget")
                {
                    ApplicationArea = All;
                }
                field("Current Budget Start Date"; Rec."Current Budget Start Date")
                {
                    ApplicationArea = All;
                }
                field("Current Budget End Date"; Rec."Current Budget End Date")
                {
                    ApplicationArea = All;
                }
                field("Bank Deposit No."; Rec."Bank Deposit No.")
                {
                    ApplicationArea = All;
                }
                field("Staff Claim No"; Rec."Staff Claim No")
                {
                    ApplicationArea = All;
                }
                field("InterBank Transfer No."; Rec."InterBank Transfer No.")
                {
                    ApplicationArea = All;
                }
                field("Surrender Template"; Rec."Surrender Template")
                {
                    ApplicationArea = All;
                }
                field("Surrender  Batch"; Rec."Surrender  Batch")
                {
                    ApplicationArea = All;
                }
                field("Receipts No"; Rec."Receipts No")
                {
                    ApplicationArea = All;
                }
                field("Cashier Transfer Nos"; Rec."Cashier Transfer Nos")
                {
                    ApplicationArea = All;
                }
                field("Default Bank Deposit Slip A/C"; Rec."Default Bank Deposit Slip A/C")
                {
                    ApplicationArea = All;
                }
                field("Imprest Req No"; Rec."Imprest Req No")
                {
                    ApplicationArea = All;
                    Caption = 'Imprest Req No.';
                }
                field("Imprest Surrender No"; Rec."Imprest Surrender No")
                {
                    ApplicationArea = All;
                }
                field("PV Template"; Rec."PV Template")
                {
                    ApplicationArea = All;
                }
                field("PV  Batch"; Rec."PV  Batch")
                {
                    ApplicationArea = All;
                }
                field("Memo Nos"; Rec."Memo Nos.")
                {
                    ApplicationArea = All;
                }
                field("EFT Batch No"; Rec."EFT Batch No")
                {
                    ToolTip = 'Specifies the value of the EFT Batch No field.';
                    ApplicationArea = All;
                }
                field("Cash Issue Nos"; Rec."Cash Issue Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Issue Nos field.';
                }
                field("Cash Receipt Nos"; Rec."Cash Receipt Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Receipt Nos field.';
                }
                field("Cash Request Nos"; Rec."Cash Request Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Request Nos field.';
                }
                field("Cash Transfer Batch"; Rec."Cash Transfer Batch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Transfer Batch field.';
                }
                field("Cash Transfer Template"; Rec."Cash Transfer Template")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Transfer Template field.';
                }
                field("Payroll  Batch"; Rec."Payroll  Batch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll  Batch field.';
                }
                field("Tender Request No"; Rec."Tender Request No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tender Request No field.';
                }
                field("Transport Pay Type"; Rec."Transport Pay Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport Pay Type field.';
                }
                field("Petty Cash Voucher Batch"; Rec."Petty Cash Voucher Batch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Petty Cash Voucher Batch field.';
                }
                field("Payroll Template"; Rec."Payroll Template")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Template field.';
                }
                field("Quatation Request No"; Rec."Quatation Request No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quatation Request No field.';
                }
                field("Contract No"; Rec."Contract No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field("PA Payment Vouchers Nos"; Rec."PA Payment Vouchers Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Farmers Payment Vouchers Nos. field.';
                }
                field("Payroll Control A/C"; Rec."Payroll Control A/C")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Control A/C field.';
                }
                field("Petty Cash Voucher  Template"; Rec."Petty Cash Voucher  Template")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Petty Cash Voucher  Template field.';
                }
                field("Max. Petty Cash Request"; Rec."Max. Petty Cash Request")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Max. Petty Cash Request field.';
                }
                field("Staff Advance Surrender No"; Rec."Staff Advance Surrender No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff Adv. Surrender No field.';
                }
                field("Other Staff Advance No"; Rec."Other Staff Advance No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Other Staff Advance No field.';
                }
                field("Advance Petty Cash"; Rec."Advance Petty Cash")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance Petty Cash field.';
                }
                field("Surrender Petty Cash"; Rec."Surrender Petty Cash")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Surrender Petty Cash field.';
                }
                field(JVs; Rec.JVs)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the JVs field.';
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = all;
                }
                field("Casual Req. No's"; Rec."Casual Req. No's")
                {

                }
            }
        }
    }

    actions
    {
    }
}

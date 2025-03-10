/// <summary>
/// PageExtension ExtBank Acc. Reconciliation (ID 52178507) extends Record Bank Acc. Reconciliation.
/// </summary>
pageextension 52178507 "Bank Acc. Reconciliation" extends "Bank Acc. Reconciliation"
{
    layout
    {


    }
    actions
    {
        modify("&Test Report")
        {
            Visible = false;
        }
        addbefore(Post)
        {
            action("Test Report")
            {
                ApplicationArea = all;
                Image = PrintDocument;
                trigger OnAction()
                begin
                    rec.SetRange("Bank Account No.", Rec."Bank Account No.");
                    rec.SetRange("Statement No.", Rec."Statement No.");
                    report.run(report::"Bank Acc. Recon. - Manual", true, true, rec)
                end;

            }
            action("Bank Rec.Report")
            {
                ApplicationArea = all;
                Image = PrintDocument;
                trigger OnAction()
                begin
                    rec.SetRange("Bank Account No.", Rec."Bank Account No.");
                    rec.SetRange("Statement No.", Rec."Statement No.");
                    report.run(report::"Bank Acc. Recon. - Manual", true, true, rec)
                end;

            }
            action("Bank Reconcilliation Import")
            {
                ApplicationArea = all;
                Image = PrintDocument;
                RunObject = xmlport "Bank Reconcilliation";
            }
        }
    }
}

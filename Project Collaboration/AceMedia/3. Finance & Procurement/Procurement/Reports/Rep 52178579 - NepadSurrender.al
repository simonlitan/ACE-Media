report 52178579 "Nepad Surrender"
{
    Caption = 'Imprest Accounting Nepad';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/Imprest Accounting Nepad.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem("FIN-Imprest Surr. Header"; "FIN-Imprest Surr. Header")
        {
            column(CompName; compInfo.Name)
            {
            }
            column(CompPicture; compInfo.Picture)
            {
            }
            column(compInfoAddress; compInfo.Address)
            {
            }
            column(compInfoPhone; compInfo."Phone No.")
            {
            }
            column(No_DataItemName; No)
            {
            }
            column(AccountName_DataItemName; "Account Name")
            {
            }
            column(AccountNo_DataItemName; "Account No.")
            {
            }
            column(ImprestIssueDocNo_DataItemName; "Imprest Issue Doc. No")
            {
            }
            column(ImprestIssueDate_DataItemName; Format("Imprest Issue Date"))
            {
            }
            column(GlobalDimension1Code_FINImprestSurrHeader; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_FINImprestSurrHeader; "Global Dimension 2 Code")
            {
            }
            column(SurrenderDate_FINImprestSurrHeader; Format("Surrender Date"))
            {
            }
            column(purpose; IMprestHeader.Purpose)
            {
            }
            dataitem("FIN-Imprest Surrender Details"; "FIN-Imprest Surrender Details")
            {
                DataItemLink = "Surrender Doc No." = FIELD(No);

                column(AccountName_FINImprestSurrenderDetails; "Account Name")
                {
                }
                column(AccountNo_FINImprestSurrenderDetails; "Account No:")
                {
                }
                column(ActualSpent_FINImprestSurrenderDetails; "Actual Spent")
                {
                }
                column(Amount_FINImprestSurrenderDetails; Amount)
                {
                }
                column(CashReceiptNo_FINImprestSurrenderDetails; "Cash Receipt No")
                {
                }
                column(CashReceiptAmount_FINImprestSurrenderDetails; "Cash Receipt Amount")
                {
                }
                column(Budget_Balance; BudgetEntries.Balance)
                {
                }
                trigger OnAfterGetRecord()
                var
                    BudgetSetup: Record "FIN-Cash Office Setup";
                begin
                    if BudgetSetup.Get() then;
                    BudgetEntries.Reset();
                    BudgetEntries.SetFilter("Budget Name", '=%1', BudgetSetup."Current Budget");
                    BudgetEntries.SetRange("G/L Account No.", "FIN-Imprest Surrender Details"."Account No:");
                    BudgetEntries.SetRange("Global Dimension 2 Code", "FIN-Imprest Surrender Details"."Shortcut Dimension 2 Code");
                    if BudgetEntries.FindFirst() then;
                    BudgetEntries.CalcFields(Balance);
                end;
            }
            column(ApproverID_Sender; ApprovalSender1."Sender ID")
            {
            }
            column(LastDateTimeModified_Sender; ApprovalSender1."Date-Time Sent for Approval")
            {
            }
            column(Signature_sender; ApprovalSenderSetUp1."User Signature")
            {
            }
            column(ApprovalDesignation_Sender; ApprovalSenderSetUp1."Approval Title")
            {
            }
            column(ApproverID_ApprovalEntr_4; ApprovalEntry4."Approver ID")
            {
            }
            column(LastDateTimeModified_ApprovalEntry_4; ApprovalEntry4."Last Date-Time Modified")
            {
            }
            column(Signature_UserSetup_4; ApprovalUserSetUp4."User Signature")
            {
            }
            column(ApprovalDesignation_UserSetup_4; ApprovalUserSetUp4."Approval Title")
            {
            }
            column(ApproverID_ApprovalEntr_3; ApprovalEntry3."Approver ID")
            {
            }
            column(LastDateTimeModified_ApprovalEntry_3; ApprovalEntry3."Last Date-Time Modified")
            {
            }
            column(Signature_UserSetup_3; ApprovalUserSetUp3."User Signature")
            {
            }
            column(ApprovalDesignation_UserSetup_3; ApprovalUserSetUp3."Approval Title")
            {
            }
            column(ApproverID_ApprovalEntr_2; ApprovalEntry2."Approver ID")
            {
            }
            column(LastDateTimeModified_ApprovalEntry_2; ApprovalEntry2."Last Date-Time Modified")
            {
            }
            column(Signature_UserSetup_2; ApprovalUserSetUp2."User Signature")
            {
            }
            column(ApprovalDesignation_UserSetup_2; ApprovalUserSetUp2."Approval Title")
            {
            }
            column(ApproverID_ApprovalEntr_1; ApprovalEntry1."Approver ID")
            {
            }
            column(LastDateTimeModified_ApprovalEntry_1; ApprovalEntry1."Last Date-Time Modified")
            {
            }
            column(Signature_UserSetup_1; ApprovalUserSetUp1."User Signature")
            {
            }
            column(ApprovalDesignation_UserSetup_1; ApprovalUserSetUp1."Approval Title")
            {
            }
            trigger OnAfterGetRecord()
            begin
                if IMprestHeader.Get(No) then;
                //approval entry 1st approver
                ApprovalEntry1.Reset();
                ApprovalEntry1.SetRange("Document No.", "FIN-Imprest Surr. Header".No);
                ApprovalEntry1.SetRange(Status, ApprovalEntry1.Status::Approved);
                ApprovalEntry1.SetRange("Sequence No.", 1);
                if ApprovalEntry1.FindFirst() then begin
                    ApprovalUserSetUp1.SetRange("User ID", ApprovalEntry1."Approver ID");
                    if ApprovalUserSetUp1.FindFirst() then;
                    ApprovalUserSetUp1.CalcFields("User Signature");
                    //get approval username and signature
                end;
                //approval entry 2nd approver
                ApprovalEntry2.Reset();
                ApprovalEntry2.SetRange("Document No.", "FIN-Imprest Surr. Header".No);
                ApprovalEntry2.SetRange(Status, ApprovalEntry2.Status::Approved);
                ApprovalEntry2.SetRange("Sequence No.", 2);
                if ApprovalEntry2.FindFirst() then begin
                    ApprovalUserSetUp2.SetRange("User ID", ApprovalEntry2."Approver ID");
                    if ApprovalUserSetUp2.FindFirst() then;
                    ApprovalUserSetUp2.CalcFields("User Signature");
                    //get approval username and signature
                end;
                //approval entry 3rd approver
                ApprovalEntry3.Reset();
                ApprovalEntry3.SetRange("Document No.", "FIN-Imprest Surr. Header".No);
                ApprovalEntry3.SetRange(Status, ApprovalEntry3.Status::Approved);
                ApprovalEntry3.SetRange("Sequence No.", 3);
                if ApprovalEntry3.FindFirst() then begin
                    ApprovalUserSetUp3.SetRange("User ID", ApprovalEntry3."Approver ID");
                    if ApprovalUserSetUp3.FindFirst() then;
                    ApprovalUserSetUp3.CalcFields("User Signature");
                    //get approval username and signature
                end;
                //approval entry 4th approver
                ApprovalEntry4.Reset();
                ApprovalEntry4.SetRange("Document No.", "FIN-Imprest Surr. Header".No);
                ApprovalEntry4.SetRange(Status, ApprovalEntry4.Status::Approved);
                ApprovalEntry4.SetRange("Sequence No.", 4);
                if ApprovalEntry4.FindFirst() then begin
                    ApprovalUserSetUp4.SetRange("User ID", ApprovalEntry4."Approver ID");
                    if ApprovalUserSetUp4.FindFirst() then;
                    ApprovalUserSetUp4.CalcFields("User Signature");
                    //get approval username and signature
                end;
                //approval entry sender
                ApprovalSender1.Reset();
                ApprovalSender1.SetRange("Document No.", "FIN-Imprest Surr. Header".No);
                ApprovalSender1.SetRange(Status, ApprovalSender1.Status::Approved);
                ApprovalSender1.SetRange("Sequence No.", 1);
                if ApprovalSender1.FindFirst() then begin
                    ApprovalSenderSetUp1.SetRange("User ID", ApprovalSender1."Sender ID");
                    if ApprovalSenderSetUp1.FindFirst() then;
                    ApprovalSenderSetUp1.CalcFields("User Signature");
                    //get approval username and signature
                    //get approval username and signature
                    UserSetup.Reset();
                    UserSetup.SetRange("User ID", UserSetup."Approval Title");
                    if UserSetup.Find('-') then UserSetup.CalcFields("User Signature");
                    UserSetup.Validate("Approval Title");
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
    }
    trigger OnInitReport()
    begin
        if compInfo.get() then compInfo.CalcFields(Picture);
    end;

    var
        myInt: Integer;
        compInfo: Record "Company Information";
        IMprestHeader: Record "FIN-Imprest Header";
        purpose: Text[100];
        BudgetEntries: Record "FIN-Budget Entries Summary";
        Balance: Decimal;
        //approvals
        ApprovalEntry1: Record "Approval Entry";
        ApprovalUserSetUp1: Record "User Setup";
        ApprovalEntry2: Record "Approval Entry";
        ApprovalUserSetUp2: Record "User Setup";
        ApprovalEntry3: Record "Approval Entry";
        ApprovalUserSetUp3: Record "User Setup";
        ApprovalEntry4: Record "Approval Entry";
        ApprovalUserSetUp4: Record "User Setup";
        ApprovalSender1: Record "Approval Entry";
        ApprovalSenderSetUp1: Record "User Setup";
        UserSetup: Record "User Setup";
    // end of approvals
}

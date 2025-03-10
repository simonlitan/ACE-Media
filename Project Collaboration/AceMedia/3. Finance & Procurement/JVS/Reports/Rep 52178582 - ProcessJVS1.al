report 52178587 "Process JVS1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './JVS/Reports/SSR/ProcessJVS.rdl';
    ApplicationArea = ALL;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Header; "Journal Voucher Header")
        {

            column(No_Header; "No.")
            {
            }
            column(DocumentDate_Header; "Document Date")
            {
            }
            column(PostingDate_Header; "Posting Date")
            {
            }
            column(Description_Header; Description)
            {
            }
            column(UserName_Header; "User Name")
            {
            }
            column(TotalAmount_Header; "Total Amount")
            {
            }
            column(Posted_Header; Posted)
            {
            }
            column(compName; info.Name)
            {

            }
            column(CompAddress; info.Address)
            {

            }
            column(compLogo; info.Picture)
            {

            }
            column(compEmail; info."E-Mail")
            {

            }
            column(compUrl; info."Home Page")
            {

            }
            dataitem(Lines; "Journals Voucher Lines")
            {
                DataItemLink = "No." = field("No.");
                column(AccountType_Lines; "Account Type")
                {
                }
                column(AccountNo_Lines; "Account No.")
                {
                }
                column(DocumentType_Lines; "Document Type")
                {
                }
                column(DocumentNo_Lines; "Document No.")
                {
                }
                column(Amount_Lines; Amount)
                {
                }
                column(AmountLCY_Lines; "Amount LCY")
                {
                }
                column(BalAccountType_Lines; "Bal. Account Type")
                {
                }
                column(BalAccountNo_Lines; "Bal. Account No.")
                {
                }
                column(ShortcutDimension1Code_Lines; "Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_Lines; "Shortcut Dimension 2 Code")
                {
                }
                column(Description_Lines; Description)
                {
                }
                column(Currency_Code; "Currency Code")
                {

                }
            }
            trigger OnPreDataItem()
            begin
                info.get;
                info.CalcFields(Picture);
            end;

            trigger OnAfterGetRecord()
            begin
                LineNo := 0;
                sno := 0;
                OpHeader.Reset();
                OpHeader.SetRange("No.", Header."No.");
                OpHeader.SetRange(Status, OpHeader.Status::Approved);
                if OpHeader.Find('-') then begin
                    OpHeader.CalcFields("Total Amount");

                    // Delete Lines Present on the General Journal Line
                    GenJnLine.RESET;
                    GenJnLine.SETRANGE(GenJnLine."Journal Template Name", 'GENERAL');
                    GenJnLine.SETRANGE(GenJnLine."Journal Batch Name", UserId);
                    GenJnLine.DELETEALL;

                    Batch.INIT;
                    Batch."Journal Template Name" := 'GENERAL';
                    Batch.Name := UserId;
                    IF NOT Batch.GET(Batch."Journal Template Name", Batch.Name) THEN
                        Batch.INSERT;


                    OpLines.Reset();
                    OpLines.SetRange("No.", OpHeader."No.");
                    OpLines.SetRange(Processed, false);
                    if OpLines.Find('-') then begin
                        repeat
                            sno := sno + 1;

                            LineNo := LineNo + 1000;
                            GenJnLine.INIT;
                            GenJnLine."Journal Template Name" := 'GENERAL';
                            GenJnLine."Journal Batch Name" := UserId;
                            GenJnLine."Line No." := LineNo;
                            GenJnLine."Account Type" := OpLines."Account Type";
                            GenJnLine."Account No." := OpLines."Account No.";
                            GenJnLine."Posting Date" := OpLines."Creation Date";
                            //Check Posting Date
                            CKP.ValidatePostingDate(GenJnLine."Posting Date");

                            GenJnLine."Document No." := OpLines."Document No.";
                            GenJnLine.Description := OpLines.Description;
                            GenJnLine.Amount := OpLines.Amount;
                            GenJnLine."External Document No." := OpHeader."No.";
                            GenJnLine.VALIDATE(GenJnLine.Amount);
                            GenJnLine."Amount (LCY)" := OpLines."Amount LCY";
                            GenJnLine."Shortcut Dimension 1 Code" := OpLines."Shortcut Dimension 1 Code";
                            GenJnLine."Shortcut Dimension 2 Code" := OpLines."Shortcut Dimension 2 Code";
                            GenJnLine."Bal. Account Type" := OpLines."Bal. Account Type";
                            GenJnLine."Bal. Account No." := OpLines."Bal. Account No.";
                            GenJnLine."Currency Code" := OpLines."Currency Code";
                            IF GenJnLine.Amount <> 0 THEN
                                GenJnLine.INSERT;
                            OpLines.Processed := true;
                            OpLines.Modify();

                        until OpLines.Next() = 0;
                    end;

                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJnLine);
                    Batch.setrange("Journal Template Name", 'GENERAL');
                    Batch.setrange(Name, UserId);
                    Batch.Delete();

                    OpHeader.Posted := true;
                    OpHeader.Status := OpHeader.Status::Posted;
                    OpHeader.Modify();
                end else
                    Error('Document status must be approved');

            end;

        }

    }
    var
        info: Record "Company Information";
        OpHeader: Record "Journal Voucher Header";
        OpLines: Record "Journals Voucher Lines";
        GenJnLine: Record "Gen. Journal Line";
        Batch: Record "Gen. Journal Batch";
        LineNo: Integer;
        sno: Integer;
        CKP: Codeunit "Posting Check FP";
}
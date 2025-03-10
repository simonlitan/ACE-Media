report 52178545 "Post City Ledger Transactions"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(CityLedger; "City Ledger Import")
        {

            trigger OnAfterGetRecord()
            begin
                if DocNo = '' then begin
                    JVHeader.Init();
                    gensetup.Get;
                    DocNo := NoSeriesManagement.GetNextNo(gensetup.JVs, 0D, True);
                    JVHeader."No." := DocNo;
                    JVHeader."Document Date" := Today;
                    JVHeader."User Name" := UserId;
                    JVHeader.Validate("User Name");
                    JVHeader.Description := 'OPERA IMPORT';
                    JVHeader.Insert();
                end;


                NovBuffer.RESET;
                NovBuffer.SETRANGE(NovBuffer."Line No", CityLedger."Line No");
                NovBuffer.SETRANGE(NovBuffer.Date, CityLedger.Date);
                NovBuffer.SetRange(Posted, false);
                IF NovBuffer.FIND('-') THEN BEGIN

                    REPEAT


                        LineNo := LineNo + 1;
                        JVLine.INIT;
                        JVLine."Line No." := GetLastEntryNo() + LineNo;
                        JVLine."No." := DocNo;

                        JVLine."Creation Date" := NovBuffer.Date;
                        JVLine."Account Type" := JVLine."Account Type"::Customer;
                        JVLine.VALIDATE(JVLine."Account No.", CityLedger."Customer No.");
                        JVLine."Document No." := CityLedger."Invoice No.";
                        JVLine.Amount := NovBuffer.Amount;
                        JVLine."Amount LCY" := NovBuffer.Amount;
                        JVLine.VALIDATE(JVLine.Amount);
                        JVLine."Bal. Account Type" := JVLine."Bal. Account Type"::"G/L Account";
                        JVLine.VALIDATE(JVLine."Bal. Account No.", '1272');
                        JVLine.VALIDATE(JVLine."Shortcut Dimension 1 Code", '10');
                        JVLine.VALIDATE(JVLine."Shortcut Dimension 2 Code", '1031');

                        if JVLine.Amount <> 0 then begin
                            JVLine.INSERT;
                            NovBuffer.Posted := true;
                            NovBuffer.Modify();
                        end;

                    UNTIL NovBuffer.NEXT = 0
                END;

                //end posting to journals

                CityLedger.Posted := TRUE;
                CityLedger.MODIFY;

            end;

            trigger OnPostDataItem()
            begin
                //rPost();
                MESSAGE('Journals Created Successfully!');
            end;

            trigger OnPreDataItem()
            begin

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        JVLine: Record "Journals Voucher Lines";
        JVHeader: Record "Journal Voucher Header";
        NovBuffer: Record "City Ledger Import";
        LineNo: Integer;
        Revenue: Decimal;
        GenJnlLine: Record 81;
        NovData: Record "Opera Data Storage";
        GenJnlLine2: Record "Opera Data Storage";
        DocNo: Code[30];
        NoSeriesManagement: Codeunit NoSeriesManagement;
        gensetup: Record "Cash Office Setup";


    procedure GetLastEntryNo(): Integer;
    var
        mrktLedger: Record "Journals Voucher Lines";
    begin
        mrktLedger.Reset();
        if mrktLedger.FindLast() then
            exit(mrktLedger."Line No.")
        else
            exit(0);
    end;



}


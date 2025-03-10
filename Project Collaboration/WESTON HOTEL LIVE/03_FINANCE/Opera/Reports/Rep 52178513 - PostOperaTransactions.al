report 52178513 "Post Opera Transactions"
{
    ProcessingOnly = true;
    ApplicationArea = all;
    UsageCategory = Tasks;

    dataset
    {
        dataitem("Opera  Buffer Import"; "Opera  Buffer Import")
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


                LineNo := 0;
                operaD.RESET;
                operaD.SETRANGE(operaD."Line No.", "Opera  Buffer Import"."Line No.");
                operaD.SETRANGE(operaD.Date, "Opera  Buffer Import".Date);
                operaD.SetRange(Posted, false);
                IF operaD.FIND('-') THEN BEGIN


                    REPEAT
                        LineNo := LineNo + 1;
                        JVLine.INIT;
                        JVLine."Line No." := GetLastEntryNo() + LineNo;
                        JVLine."No." := DocNo;

                        //INSERT ACCONTS WHETHER G/L OR BANK
                        //G/L

                        IF MicrosGL.GET(operaD."G/L Account") THEN begin
                            IF operaD."G/L Account" = MicrosGL."Navision Code" THEN

                                //Temp Solution for Bank 1132 - Safari Float
                                IF operaD."G/L Account" = '1132' THEN BEGIN
                                    JVLine."Account Type" := JVLine."Account Type"::"Bank Account";
                                    JVLine.VALIDATE("Account No.", 'BANK_0008');

                                    //Temp Solution for Bank 1115 - Mpesa
                                END ELSE
                                    IF operaD."G/L Account" = '1115' THEN BEGIN
                                        JVLine."Account Type" := JVLine."Account Type"::"Bank Account";
                                        JVLine.VALIDATE("Account No.", 'BANK_0006');

                                        //Temp Solution for Bank 1231 - KCB Pdq
                                    END ELSE
                                        IF operaD."G/L Account" = '1231' THEN BEGIN
                                            JVLine."Account Type" := JVLine."Account Type"::"Bank Account";
                                            JVLine.VALIDATE("Account No.", 'BANK_0014');

                                            //Temp Solution for Bank 1233 - Equity Pdq
                                        END ELSE
                                            IF operaD."G/L Account" = '1233' THEN BEGIN
                                                JVLine."Account Type" := JVLine."Account Type"::"Bank Account";
                                                JVLine.VALIDATE("Account No.", 'BANK_0015');

                                            END ELSE
                                                IF operaD."G/L Account" = '1284' THEN BEGIN
                                                    JVLine."Account Type" := JVLine."Account Type"::"G/L Account";
                                                    JVLine.VALIDATE("Account No.", '1272');


                                                END ELSE BEGIN
                                                    //All other normal scenarios
                                                    JVLine."Account Type" := JVLine."Account Type"::"G/L Account";
                                                    JVLine.VALIDATE("Account No.", operaD."G/L Account");
                                                END;

                        end else begin
                            //All other normal scenarios
                            JVLine."Account Type" := JVLine."Account Type"::"G/L Account";
                            JVLine.VALIDATE("Account No.", operaD."G/L Account");
                        end;

                        JVLine."Creation Date" := operaD.Date;
                        JVLine.Description := operaD."Posting Description";
                        JVLine."Document No." := 'OPERA' + ' ' + FORMAT(operaD.Date);
                        IF operaD."G/L Account" = MicrosGL."Navision Code" THEN begin
                            JVLine.Amount := -(operaD.Amount);
                            JVLine."Amount LCY" := -(operaD.Amount);
                            JVLine.VALIDATE(JVLine.Amount);
                            JVLine.Validate(JVLine."Amount LCY");
                        end else begin
                            JVLine.Amount := -(operaD.Amount);
                            JVLine."Amount LCY" := -(operaD.Amount);
                            JVLine.VALIDATE(JVLine.Amount);
                            JVLine.Validate(JVLine."Amount LCY");
                        end;


                        IF operaD."G/L Account" = MicrosGL."Navision Code" THEN
                            JVLine.VALIDATE("Shortcut Dimension 1 Code", '10');
                        IF MicrosCost.GET(operaD."Cost Center") THEN
                            IF operaD."Cost Center" = MicrosCost."Opera Code" THEN
                                //JVLine.VALIDATE("Shortcut Dimension 2 Code", operaD."Cost Center")
                                JVLine.VALIDATE("Shortcut Dimension 2 Code", MicrosCost."Navision Code")

                            else
                                //JVLine.VALIDATE("Shortcut Dimension 2 Code", operaD."Cost Center");
                                 JVLine.VALIDATE("Shortcut Dimension 2 Code", MicrosCost."Navision Code");

                        //GenLine.VALIDATE("Account No.",NovBuffer."G/L Account");
                        // IF JVLine.Amount <> 0 THEN begin
                        JVLine.INSERT;

                        operaD.Posted := true;
                        operaD.Modify()

                    // end;

                    UNTIL operaD.NEXT = 0
                END;

                //end posting to journals

                "Opera  Buffer Import".Posted := TRUE;
               // "Opera  Buffer Import".MODIFY;
                //post journals
                //Post();
            end;

            trigger OnPostDataItem()
            begin
                //rPost();
                MESSAGE('Journals Created Successfully!');
            end;

            trigger OnPreDataItem()
            begin
                //  GenLine.SETRANGE(GenLine."Journal Template Name", 'GENERAL');
                //     GenLine.SETRANGE(GenLine."Journal Batch Name", 'OPERA');


                // "Opera  Buffer Import".SETRANGE("Opera  Buffer Import".Posted, FALSE);
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
        NoSeriesManagement: Codeunit NoSeriesManagement;
        gensetup: Record "Cash Office Setup";
        JVLine: Record "Journals Voucher Lines";

        //GenLine: Record "Gen. Journal Line";
        operaD: Record "Opera  Buffer Import";
        JVHeader: Record "Journal Voucher Header";
        // JVLines: Record "Journals Voucher Lines";
        LineNo: Integer;
        DocNo: Code[30];

        MicrosGL: Record "Micros G/L Accounts";
        MicrosCost: Record "Micros Cost Centers";


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


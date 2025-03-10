// report 52178513 "Post Opera Transactions"
// {
//     ProcessingOnly = true;
//     ApplicationArea = all;
//     UsageCategory = Tasks;

//     dataset
//     {
//         dataitem("Opera  Buffer Import"; "Opera  Buffer Import")
//         {

//             trigger OnAfterGetRecord()
//             begin

//                 NovBuffer.RESET;
//                 NovBuffer.SETRANGE(NovBuffer."Line No.", "Opera  Buffer Import"."Line No.");
//                 NovBuffer.SETRANGE(NovBuffer.Date, "Opera  Buffer Import".Date);
//                 IF NovBuffer.FIND('-') THEN BEGIN

//                     JVHeader.Init();
//                     JVHeader."No." := NoSeriesManagement.GetNextNo(gensetup.JVs, 0D, True);
//                     JVHeader."Document Date" := Today;
//                     JVHeader."User Name" := UserId;
//                     JVHeader.Validate("User Name");
//                     JVHeader.Insert();



//                     REPEAT
//                         GenLine.RESET;
//                         GenLine.SetRange("Document No.", JVHeader."No.");
//                         IF GenLine.FIND('+') THEN BEGIN
//                             LineNo := GenLine."Line No." + 1000;
//                         END
//                         ELSE BEGIN
//                             LineNo := 1000;
//                         END;
//                         LineNo := LineNo + 1;
//                         GenLine.INIT;
//                         GenLine."Line No." := LineNo;
//                         //INSERT ACCONTS WHETHER G/L OR BANK
//                         //G/L

//                         IF MicrosGL.GET(NovBuffer."G/L Account") THEN
//                             IF NovBuffer."G/L Account" = MicrosGL."Navision Code" THEN



//                                 //Temp Solution for Bank 1132 - Safari Float
//                                 IF NovBuffer."G/L Account" = '1132' THEN BEGIN
//                                     GenLine."Account Type" := GenLine."Account Type"::"Bank Account";
//                                     GenLine.VALIDATE("Account No.", 'BANK_0008');

//                                     //Temp Solution for Bank 1115 - Mpesa
//                                 END ELSE
//                                     IF NovBuffer."G/L Account" = '1115' THEN BEGIN
//                                         GenLine."Account Type" := GenLine."Account Type"::"Bank Account";
//                                         GenLine.VALIDATE("Account No.", 'BANK_0006');

//                                         //Temp Solution for Bank 1231 - KCB Pdq
//                                     END ELSE
//                                         IF NovBuffer."G/L Account" = '1231' THEN BEGIN
//                                             GenLine."Account Type" := GenLine."Account Type"::"Bank Account";
//                                             GenLine.VALIDATE("Account No.", 'BANK_0014');

//                                             //Temp Solution for Bank 1233 - Equity Pdq
//                                         END ELSE
//                                             IF NovBuffer."G/L Account" = '1233' THEN BEGIN
//                                                 GenLine."Account Type" := GenLine."Account Type"::"Bank Account";
//                                                 GenLine.VALIDATE("Account No.", 'BANK_0015');

//                                             END ELSE BEGIN
//                                                 //All other normal scenarios
//                                                 GenLine."Account Type" := GenLine."Account Type"::"G/L Account";
//                                                 GenLine.VALIDATE("Account No.", NovBuffer."G/L Account");
//                                             END;

//                         GenLine."Creation Date" := NovBuffer.Date;
//                         GenLine.Description := NovBuffer."Posting Description";
//                         GenLine."Document No." := 'OPERA' + ' ' + FORMAT(NovBuffer.Date);
//                         IF NovBuffer."G/L Account" = MicrosGL."Navision Code" THEN
//                             GenLine.Amount := -(NovBuffer.Amount);
//                         IF NovBuffer."G/L Account" = MicrosGL."Navision Code" THEN
//                             GenLine.VALIDATE(GenLine.Amount);
//                         GenLine.VALIDATE("Shortcut Dimension 1 Code", '10');
//                         IF MicrosCost.GET(NovBuffer."Cost Center") THEN
//                             IF NovBuffer."Cost Center" = MicrosCost."Opera Code" THEN
//                                 GenLine.VALIDATE("Shortcut Dimension 2 Code", MicrosCost."Navision Code");
//                         //GenLine.VALIDATE("Account No.",NovBuffer."G/L Account");
//                         //IF  GenLine.Amount<> 0 THEN
//                         GenLine.INSERT;

//                     UNTIL NovBuffer.NEXT = 0
//                 END;

//                 //end posting to journals


//                 GenLine.RESET;
//                 /*GenLine.SETRANGE(GenLine."Journal Template Name", 'GENERAL');
//                 GenLine.SETRANGE(GenLine."Journal Batch Name", 'OPERA');*/
//                 IF GenLine.FINDSET THEN BEGIN
//                     REPEAT
//                         GenLine.VALIDATE(GenLine.Amount);
//                     UNTIL GenLine.NEXT = 0;
//                 END;


//                 GenLine.RESET;
//                 /*GenLine.SETRANGE(GenLine."Journal Template Name", 'GENERAL');
//                 GenLine.SETRANGE(GenLine."Journal Batch Name", 'OPERA');*/
//                 GenLine.SETRANGE(GenLine.Amount, 0);
//                 IF GenLine.FIND('-') THEN BEGIN
//                     REPEAT
//                         GenLine.DELETE;
//                     UNTIL GenLine.NEXT = 0;
//                 END;
//                 "Opera  Buffer Import".Posted := TRUE;
//                 "Opera  Buffer Import".MODIFY;
//                 //post journals
//                 //Post();
//             end;

//             trigger OnPostDataItem()
//             begin
//                 //rPost();
//                 MESSAGE('Journals Created Successfully!');
//             end;

//             trigger OnPreDataItem()
//             begin
//                 GenLine.RESET;
//                 //  GenLine.SETRANGE(GenLine."Journal Template Name", 'GENERAL');
//                 //     GenLine.SETRANGE(GenLine."Journal Batch Name", 'OPERA');
//                 GenLine.DELETEALL;

//                 "Opera  Buffer Import".SETRANGE("Opera  Buffer Import".Posted, FALSE);
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     var
//         NoSeriesManagement: Codeunit NoSeriesManagement;
//         gensetup: Record "Cash Office Setup";
//         GenLine: Record "Journals Voucher Lines";

//         //GenLine: Record "Gen. Journal Line";
//         NovBuffer: Record "Opera  Buffer Import";
//         JVHeader: Record "Journal Voucher Header";
//         // JVLines: Record "Journals Voucher Lines";
//         LineNo: Integer;

//         MicrosGL: Record "Micros G/L Accounts";
//         MicrosCost: Record "Micros Cost Centers";

//     local procedure Post()
//     begin
//     end;
// }


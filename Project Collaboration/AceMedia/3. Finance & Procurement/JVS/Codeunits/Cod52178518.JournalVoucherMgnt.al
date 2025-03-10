// codeunit 52178551 "Journal Voucher Mgnt"
// {
//     var
//         JnlVoucher: Record "Journals Voucher Lines";

//     procedure GetLastVoucherLine(): Integer
//     begin
//         JnlVoucher.Reset();
//         if JnlVoucher.FindLast() then
//             exit(JnlVoucher."Voucher Line No.");
//     end;

//     procedure UpdateVoucherLine()
//     begin
//         JnlVoucher.Reset();
//         JnlVoucher.SetFilter("No.", '<>%1', '');
//         JnlVoucher.SetFilter("Line No.", '>%1', 0);
//         repeat
//             if JnlVoucher."No." <> '' then
//                 if JnlVoucher."Line No." > 0 then
//                     JnlVoucher."Voucher Line No." := JnlVoucher."Voucher Line No." + 1;
//             JnlVoucher.Modify();
//         until JnlVoucher.Next() = 0;
//         Message('Voucher Line No. updated successfully');
//     end;
// }

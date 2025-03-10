// /// <summary>
// /// PageExtension Import PV (ID 52178511) extends Record FIN-Payment Vouchers.
// /// </summary>
// pageextension 52178511 "Fin-Payment Vouchers" extends "FIN-Payment Vouchers"
// {
//     actions
//     {
//         addafter(Print)
//         {
//             action("Import PV")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Image = Journal;
//                 RunObject = xmlport "Import Payment Voucher";

//             }
//         }
//     }

// }

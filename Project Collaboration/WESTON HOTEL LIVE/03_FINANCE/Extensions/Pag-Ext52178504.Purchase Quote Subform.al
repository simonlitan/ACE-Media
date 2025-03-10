// pageextension 52178504 "ExtPurchase Quote Subform" extends "Purchase Quote Subform"
// {
//     layout
//     {
//         // Add changes to page layout here
//         modify("Location Code")
//         {
//             ShowMandatory = true;
//         }

//         addafter(Description)
//         {
//             /* field(Comments; Rec.Comments)
//             {
//                 ApplicationArea = All;
//             } */
//         }

//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: Integer;
// }
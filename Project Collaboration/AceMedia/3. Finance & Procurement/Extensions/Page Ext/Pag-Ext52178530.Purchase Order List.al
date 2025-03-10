// /// <summary>
// /// PageExtension ExtExtPurchase Order List(ID 52178514) extends Record Purchase Order List.
// /// </summary>
// pageextension 52178530 "ExtPurchase Order List" extends "Purchase Order List"
// {
//     layout
//     {

//         modify("Location Code")
//         {
//             Visible = false;
//         }

//         modify("Vendor Authorization No.")
//         {
//             Visible = false;
//         }
//         modify("Assigned User ID")
//         {
//             Visible = false;
//         }

//         addafter("Amount Including VAT")
//         {

//             // field("Assigned User ID 2"; Rec."Assigned User ID ")
//             // {
//             //     ApplicationArea = All;
//             //     ToolTip = 'Specifies the value of the User Id field.';
//             // }
//         }
//     }

//     actions
//     {
//         modify("Delete Invoiced")
//         {
//             Visible = false;
//         }

//     }
//     // trigger OnDeleteRecord(): Boolean
//     // begin
//     //     // CurrPage.SaveRecord;

//     //     Error('You cannot Delete this Record');

//     // end;




// }





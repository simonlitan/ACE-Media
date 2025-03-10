pageextension 52178861 CommentSheetExtension extends "Purch. Comment Sheet"
{
    Caption = 'Attendants Sheet';
    layout
    {
        // Adding a new control field 'ShoeSize' in the group 'General'


        // Modifying the caption of the field 'Address'
        modify("Comment")
        {
            Caption = 'Attendant Name';
        }
        modify("Date")
        {
            Visible = false;
        }

        // Moving the two fields 'CreditLimit' and 'CalcCreditLimitLCYExpendedPct'
        // to be the first ones in the 'Balance' group.
        //  movefirst(Balance; CreditLimit, CalcCreditLimitLCYExpendedPct)
    }
}

// tableextension 70000020 CustomerTableExtension extends Customer
// {
//     fields
//     {
//         // Adding a new table field in the 'Customer' table
//         field(50100; ShoeSize; Integer) { }
//     }
// }
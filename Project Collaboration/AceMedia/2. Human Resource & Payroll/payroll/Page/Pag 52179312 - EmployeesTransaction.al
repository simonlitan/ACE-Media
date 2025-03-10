page 52179312 "Employees Transaction"
{
    Caption = 'Employees Transaction';
    PageType = List;
    SourceTable = "PRL-Employee Transactions";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Payroll Period"; Rec."Payroll Period")
                {

                }
                field("Employee Code"; Rec."Employee Code")
                {

                }
                field("Transaction Code"; Rec."Transaction Code")
                {

                }
            }
        }
    }
}

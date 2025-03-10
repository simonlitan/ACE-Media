page 52179313 "Salary Card List"
{
    Caption = 'Salary Card List';
    PageType = List;
    SourceTable = "PRL-Salary Card";
    DeleteAllowed = true;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Payroll Period"; Rec."Payroll Period")
                {

                }
                field("Employee Code"; Rec."Employee Code") { }
            }
        }
    }
}

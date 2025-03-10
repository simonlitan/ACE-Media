query 52178880 Employees
{
    Caption = 'Employees';
    QueryType = Normal;

    elements
    {
        dataitem(HRMEmployeeC; "HRM-Employee C")
        {
            column(No; "No.")
            {
            }
            column(FirstName; "First Name")
            {
            }
            column(MiddleName; "Middle Name")
            {
            }
            column(LastName; "Last Name")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}

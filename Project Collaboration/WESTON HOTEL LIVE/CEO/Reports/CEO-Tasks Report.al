report 52178864 TasksDetails
{
    UsageCategory = Administration;
    ApplicationArea = All;
    EnableExternalImages = true;
    RDLCLayout = './CEO/Reports/SSR/CEO-TasksDetails Report.rdl';

    dataset
    {
        dataitem("User Tasks"; "User Tasks")
        {
            DataItemTableView = SORTING("Code");
            RequestFilterFields = "Code";
            column(companyName; info.Name)
            {
            }
            column(companyAddress; info."Address 2")
            {
            }
            column(pic; info.Picture)
            {
            }
            column("Task_Name"; "Task Name")
            {

            }
            column("Task_Details"; "Task Details")
            {

            }
            column("Full_Name"; "Full Name")
            {

            }
            column("Due_Date"; "Due Date")
            {

            }
            column(Status; "Status")
            {

            }

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

    trigger OnInitReport()
    begin
        DateFilter := TODAY;
    end;

    trigger OnPreReport()
    begin
        info.reset;
        if info.get() then
            info.CalcFields(Picture);

    end;


    var
        myInt: Integer;
        info: Record "Company Information";
        DateFilter: Date;
}
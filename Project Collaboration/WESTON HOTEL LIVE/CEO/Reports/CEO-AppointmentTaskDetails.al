report 52178861 "Appointment TasksDetails"
{
    // UsageCategory = Administration;
    // ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './CEO/Reports/SSR/CEO-AppointmentTaskDetails Report.rdl';

    dataset
    {
        dataitem("Appointment Task Details"; "CEO-Calendar Entries")
        {
            DataItemTableView = SORTING("Code1");
            RequestFilterFields = "Code1";
            column(companyName; info.Name)
            {
            }
            column(companyAddress; info."Address 2")
            {
            }
            column(CompPic; info.Picture)
            {
            }
            column("Appointment_Code"; "Code1")
            {

            }
            column("Appointment_With"; "Requesting Officer")
            {

            }
            column("Date_of_Appointment"; "Date")
            {

            }
            column("Appointment_Date"; "Date")
            {

            }
            column("Time"; "Time")
            {

            }
            column("Reason"; "Reason")
            {

            }


            dataitem("TasksListpart"; "CEOTasksListPartTable")
            {
                DataItemLinkReference = "Appointment Task Details";
                DataItemLink = "No." = field("Code1");



                column("No"; "No.")
                {

                }
                column("Task_Number"; "Task Code")
                {

                }
                column("Task_Name"; "Task Name")
                {

                }
                column("Task_Details"; "Task Details")
                {

                }
                column("Assign_To"; "Full Name")
                {

                }
                column("Due_Date"; "Due Date")
                {

                }
                column(Feedback; "Feedback")
                {

                }
                column(Status; "Status")
                {
                }



            }
        }



    }
    trigger OnInitReport()
    begin
        counted := counted + 1;
        //  counted.SETRANGE(counted."No.");
        info.reset;
        if info.get() then
            info.CalcFields(Picture);


    end;





    var
        task: Record CEOTasksListPartTable;
        info: Record "Company information";
        counted: Integer;






}
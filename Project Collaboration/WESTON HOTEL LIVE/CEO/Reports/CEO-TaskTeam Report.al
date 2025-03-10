report 52178865 GroupTaskReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = './CEO/Reports/SSR/CEO-TaskTeam Report.rdl';


    dataset
    {
        dataitem("Task-Group Setup"; "Task-Group Setup")
        {
            RequestFilterFields = "Code";
            column(companyName; info.Name)
            {
            }
            column(companyAddress; info."Address 2")
            {
            }
            column(CompPic; info.Picture)
            {
            }
            column("Team_Name"; "Team Name")
            {

            }
            Column("Code"; "Code")
            {

            }
            column("Task_Details"; "Task Details")
            {

            }
            column("Priority"; "Priority")
            {

            }
            column("Start_Date"; "Start Date")
            {

            }
            column("Due_Date"; "Due Date")
            {

            }
            column("Status"; "Status")
            {

            }
            column("Region_Name"; "Region Name")
            {

            }
            dataitem("Task-Team Members"; "Task-Team Members")
            {
                DataItemLink = "Team Code" = FIELD("Code");
                DataItemLinkReference = "Task-Group Setup";
                DataItemTableView = SORTING("Team Code");


                column("Team_Code"; "Team Code")
                {

                }
                column("PF_Number"; "PF Number")
                {

                }
                column("Full_Name"; "Full Name")
                {

                }
                column("Responsibility"; "Responsibility")
                {

                }


            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    trigger OnInitReport()
    begin
        info.reset;
        if info.get() then
            info.CalcFields(Picture);

    end;

    //  rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    var
        myInt: Integer;
        info: Record "Company Information";
}
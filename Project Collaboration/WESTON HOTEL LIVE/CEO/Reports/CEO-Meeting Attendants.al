report 52178863 MeetingAttendants
{
    UsageCategory = Administration;
    ApplicationArea = All;
    EnableExternalImages = true;
    RDLCLayout = './CEO/Reports/SSR/CEO-MeetingAttendants.rdl';


    dataset
    {
        dataitem("Meeting Attendants details"; "CEO-Calendar Entries")
        {
            DataItemTableView = SORTING("Code");
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
            // column("Meeting_Code"; "Code")
            // {

            // }
            Column("Agenda"; "Agenda")
            {

            }
            column("Meeting_Description"; "Description")
            {

            }
            column("Meeting_Kickoff_Time"; "Timee")
            {

            }
            column("Venue_of_meeting"; "Venue")
            {

            }
            column("Meeting_Date"; "Period Start")
            {

            }

            dataitem("Meeting_Attendants"; "Purch. Comment Line")
            {
                DataItemLink = "No." = FIELD("Code");
                DataItemLinkReference = "Meeting Attendants details";

                column("Attendant_Name"; "Comment")
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
        DateFilter := TODAY;

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
        DateFilter: Date;
}
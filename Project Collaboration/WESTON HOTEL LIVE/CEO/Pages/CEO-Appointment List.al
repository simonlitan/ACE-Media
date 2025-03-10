page 52179010 "CEO-Appointments List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CEO-Calendar Entries2";
    //"CEO-Appointments";
    CardPageId = "CEO-Appointment Card";


    layout
    {
        area(Content)
        {
            repeater(Appointments)
            {
                // field("No."; Rec."No.")
                // {
                //     ApplicationArea = All;
                //     Visible = false;
                // }
                field(Code; Rec.Code1)
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;

                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = All;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }
                // field(Reason; Rec.Reason)
                // {

                // }
                // field(Reason; Rec.Reason)
                // {

                // }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Print Appointments")
            {
                ApplicationArea = All;
                Image = Report;
                RunObject = report "CEO-AllAppointmentsList";

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}
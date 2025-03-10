report 52178870 "ISO-AuditTimetableReport"
{
    Caption = 'ISO-AuditTimetableReport';
    RDLCLayout = './CEO/Reports/SSR/ISO-Audit Timetable Report.rdl';
    EnableExternalImages = true;
    dataset
    {
        dataitem(AuditTimetable; "Audit Timetable")
        {
            DataItemTableView = SORTING("Timetable No.");
            RequestFilterFields = "Timetable No.";
            column(TimetableNo; "Timetable No.")
            {
            }
            dataitem(AuditTimetableListPart; "ISO-AuditTimetableListpartTabl")
            {
                DataItemLink = "Audit No." = FIELD("Timetable No.");
                DataItemLinkReference = "AuditTimetable";
                column(Audit_date; "Audit date")
                {
                }
                column(Audit_Time; "Time")
                {
                }
                column(Audit_Area; "Audit Area")
                {
                }
                column(Audit_Participants; "Participants")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}

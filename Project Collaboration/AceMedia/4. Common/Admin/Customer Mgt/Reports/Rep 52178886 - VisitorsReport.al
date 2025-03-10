report 52178886 "Visitors Report"
{
    RDLCLayout = './Admin/Customer Mgt/Reports/SSR/Visitors Report.rdl';
    DefaultLayout = RDLC;
    Caption = 'Visitors Report';
    dataset
    {
        dataitem(CmVisitors; "Cm Visitors")
        {
            RequestFilterFields = "No.", Date;
            column(No; "No.")
            {
            }
            column(Date; "Date")
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(IDNo; "ID No")
            {
            }
            column(Name; Name)
            {
            }
            column(Nationality; Nationality)
            {
            }
            column(Office; Office)
            {
            }
            column(OfficerName; "Officer Name")
            {
            }
            column(OfficertoSee; "Officer to See")
            {
            }
            column(PhoneNo; "Phone No")
            {
            }
            column(PurposeofVisit; "Purpose of Visit")
            {
            }
            column(Status; Status)
            {
            }
            column(AppointmentDate; "Appointment Date")
            {
            }
            column(BadgeNo; "Badge No")
            {
            }
            column(TimeIn; "Time In")
            {
            }
            column(TimeOut; "Time Out")
            {
            }
            column(Feedback_CmVisitors; Feedback)
            {
            }
            column(Compinfopic; Compinfo.Picture)
            {
            }

            column(CompName; Compinfo.Name)
            {
            }
            column(CompinfoAddress; Compinfo.Address + ',' + Compinfo."Address 2")
            {
            }
            column(CompinfoPhones; Compinfo."Phone No." + ' ' + Compinfo."Phone No. 2")
            {
            }
            column(Compinfomails; Compinfo."E-Mail")
            {
            }
            column(CompinfoWebpage; Compinfo."Home Page")
            {

            }
            column(Seq; Seq)
            {

            }
            trigger OnAfterGetRecord()
            begin
                seq := Seq + 1;
            end;
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
    trigger OnInitReport()
    begin
        Compinfo.get();
        Compinfo.CalcFields(Picture);
        Clear(seq);

    end;

    var
        Compinfo: Record "Company Information";
        Seq: Integer;
}

report 52179177 "Leave Recall Report"
{
    RDLCLayout = './hr/reports/ssr/Leave Recall.rdl';
    DefaultLayout = RDLC;
    Caption = 'Leave Recall Report';
    dataset
    {
        dataitem(HRMLeaveRecall; "HRM-Leave Recall")
        {
            column(No; No)
            {
            }
            column(LeaveNo; "Leave No")
            {
            }
            column(LeavePeriod; "Leave Period")
            {
            }
            column(Date; "Date")
            {
            }
            column(AppliedDays; "Applied Days")
            {
            }
            column(EmployeeNo; "Employee No")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(DaysRecalled; "Days Recalled")
            {
            }
            column(DatePosted; "Date Posted")
            {
            }
            column(CreatedBy; "Created By")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(ReasonforRecall; "Reason for Recall")
            {
            }
            column(PostedBy; "Posted By")
            {
            }
            column(Status; Status)
            {
            }
            column(Typeofleave; "Type of leave")
            {
            }
            column(UtilizedDays; "Utilized Days")
            {
            }
            column(seq; seq)
            {

            }
            column(Compinfopic; Compinfo.Picture)
            {

            }
            column(Compinfoname; Compinfo.Name)
            {

            }
            column(Compinfoaddress; Compinfo.Address)
            {

            }
            column(Compinfophone; Compinfo."Phone No.")
            {

            }
            column(Compinfoemail; Compinfo."E-Mail")
            {

            }
            column(Compinfowebpage; Compinfo."Home Page")
            {

            }
            trigger OnAfterGetRecord()
            begin
                seq := seq + 1;
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
    end;

    var
        seq: Integer;
        Compinfo: Record "Company Information";
}

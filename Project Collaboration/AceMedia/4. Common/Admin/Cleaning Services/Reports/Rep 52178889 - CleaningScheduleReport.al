report 52178889 "Cleaning Schedule Report"
{
    RDLCLayout = './Admin/Cleaning Services/Reports/SSR/Cleaning Schedule.rdl';
    DefaultLayout = RDLC;
    Caption = 'Cleaning Schedule Report';
    dataset
    {
        dataitem(CleaningHeader; "Cleaning Header")
        {
            RequestFilterFields = No;
            column(No; No)
            {
            }
            column(ScheduleType; "Schedule Type")
            {
            }
            column(SupervisorNo; "Supervisor No")
            {
            }
            column(SupervisorName; "Supervisor Name")
            {
            }
            column(StartDate; "Start Date")
            {
            }
            column(EndDate; "End Date")
            {
            }
            column(CreatedBy; "Created By")
            {
            }
            column(CreatedOn; "Created On")
            {
            }
            column(Closed; Closed)
            {
            }
            dataitem("Cleaning Line"; "Cleaning Line")
            {
                DataItemLink = No = field(No);
                column(CleanerNo_CleaningLine; "Cleaner No")
                {
                }
                column(CleanerName_CleaningLine; "Cleaner Name")
                {
                }
                column(CleaningDate_CleaningLine; "Cleaning Date")
                {
                }
                column(CleaningDone_CleaningLine; "Cleaning Done")
                {
                }
                column(CleaningTime_CleaningLine; "Cleaning Time")
                {
                }
                column(OfficeSpace_CleaningLine; "Office Space")
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
            trigger OnPreDataItem()
            begin
                Clear(seq);
            end;

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
        Clear(Seq);
        Seq := 0;
        Compinfo.get();
        Compinfo.CalcFields(Picture);
        Clear(seq);

    end;

    var
        Compinfo: Record "Company Information";
        Seq: Integer;
}

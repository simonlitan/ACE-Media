/// <summary>
/// XmlPort HRM-Leave App Upload (ID 50002).
/// </summary>
xmlport 50002 "HRM-Leave App Upload"

{
    Caption = 'Import Leave Applications';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {
            tableelement(Leave; "HRM-Leave Requisition")
            {
                fieldattribute(Application_code; Leave."No.")
                {

                }
                fieldattribute(leave_Type; Leave."Leave Type")
                {

                }
                fieldattribute(Applied_Days; Leave."Applied Days")
                {

                }
                fieldattribute(Start_Date; Leave."Starting Date")
                {

                }
                fieldattribute(ReturnDate; Leave."Return Date")
                {

                }
                fieldattribute(ApplicationDate; Leave.Date)
                {

                }
                fieldattribute(Status; Leave.Status)
                {

                }
                fieldattribute(NoSeries; Leave."No. Series")
                {

                }
                fieldattribute(Posted; Leave.Posted)
                {

                }
                fieldattribute(End_Date; Leave."End Date")
                {

                }
                fieldattribute(Reliever; Leave."Reliever No.")
                {

                }
                fieldattribute(RelieverName; Leave."Reliever Name")
                {

                }
                fieldattribute(EmpNo; Leave."Employee No")
                {

                }
                fieldattribute(RespCenter; Leave."Responsibility Center")
                {

                }
                fieldattribute(EmpName; Leave."Employee Name")
                {

                }
                fieldattribute(LeaveBalance; Leave."Leave Balance")
                {

                }


            }
        }
    }





    trigger OnInitXmlPort()
    begin
        I := 0;
    end;

    var
        I: Integer;
}






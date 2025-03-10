report 50012 "HRM Appraisal Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Perfomance Appraisal/Reports/SSR/HRM Appraisal Report.rdl';

    dataset
    {
        dataitem("HRM Perfomance Appraisal"; "HRM Perfomance Appraisal")
        {

            column(AppraisalPeriod_HRMPerfomanceAppraisal; "Appraisal Period")
            {
            }
            column(Description_HRMPerfomanceAppraisal; Description)
            {
            }
            column(StartDate_HRMPerfomanceAppraisal; "Start Date")
            {
            }
            column(EndDate_HRMPerfomanceAppraisal; "End Date")
            {
            }
            column(InstitutionCode_HRMPerfomanceAppraisal; "Institution Code")
            {
            }
            column(Status_HRMPerfomanceAppraisal; Status)
            {
            }
            column(UserName_HRMPerfomanceAppraisal; UserName)
            {
            }
            column(Closed_HRMPerfomanceAppraisal; Closed)
            {
            }
            column(cName; info.name)
            {

            }
            column(caddress; info.Address)
            {

            }
            column(logo; info.Picture)
            {

            }
            column(phone; info."Phone No.")
            {

            }
            column(email; info."E-Mail")
            {

            }
            column(url; info."Home Page")
            {

            }
            dataitem("Employee Perfomance Appraisals"; "Employee Perfomance Appraisals")
            {
                DataItemLink = "Appraisal Period" = field("Appraisal Period"), "Institution Code" = field("Institution Code");
                column(No_EmployeePerfomanceAppraisals; "No.")
                {
                }

                column(AppraisalPeriod_EmployeePerfomanceAppraisals; "Appraisal Period")
                {
                }
                column(StartDate_EmployeePerfomanceAppraisals; "Start Date")
                {
                }
                column(EndDate_EmployeePerfomanceAppraisals; "End Date")
                {
                }
                column(InstitutionCode_EmployeePerfomanceAppraisals; "Institution Code")
                {
                }
                column(DepartmentCode_EmployeePerfomanceAppraisals; "Department Code")
                {
                }
                column(TargetDescription_EmployeePerfomanceAppraisals; "Target Description")
                {
                }
                column(MidYearEmployeeEvaluation_EmployeePerfomanceAppraisals; "Mid Year Employee Evaluation")
                {
                }
                column(MidYearSupervisorEvaluation_EmployeePerfomanceAppraisals; "Mid Year Supervisor Evaluation")
                {
                }
                column(EndYearEmployeeEvaluation_EmployeePerfomanceAppraisals; "End Year Employee Evaluation")
                {
                }
                column(EndYearSupervisorEvaluation_EmployeePerfomanceAppraisals; "End Year Supervisor Evaluation")
                {
                }
                column(EmployeeNo_EmployeePerfomanceAppraisals; "Employee No")
                {
                }
                column(Supervisor_EmployeePerfomanceAppraisals; Supervisor)
                {
                }
                column(JointSupervisorEmployeeScore_EmployeePerfomanceAppraisals; "Joint SupervisorEmployee Score")
                {
                }
                column(EMidYear; EMidYear)
                {

                }
                column(SMidYear; SMidYear)
                {

                }
                column(EEndYear; EEndYear)
                {

                }
                column(SEndTear; SEndTear)
                {

                }
                column(JEmpSupr; JEmpSupr)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    //if MidYearEmployeeEvaluation_EmployeePerfomanceAppraisals:= '' then


                end;
            }
            trigger OnPreDataItem()
            begin
                info.get();
                info.CalcFields(Picture);
            end;
        }
    }

    var
        EMidYear: Decimal;
        SMidYear: Decimal;
        EEndYear: Decimal;
        SEndTear: Decimal;
        JEmpSupr: Decimal;
        info: Record "Company Information";
}
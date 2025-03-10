report 50005 "Staff Qualifications"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './HR/Reports/SSR/Staff Qualifications.rdl';

    dataset
    {
        dataitem("HRM-Emp. Qualifications Final"; "HRM-Emp. Qualifications Final")
        {

            column(EmployeeNo_HRMEmpQualificationsFinal; "Employee No.")
            {
            }
            column(Qualification_HRMEmpQualificationsFinal; Qualification)
            {
            }
            column(Description_HRMEmpQualificationsFinal; Description)
            {
            }
            column(HighestQualification_HRMEmpQualificationsFinal; "Highest Qualification")
            {
            }
            column(ToDate_HRMEmpQualificationsFinal; "To Date")
            {
            }
            column(FromDate_HRMEmpQualificationsFinal; "From Date")
            {
            }
            column(Institution_HRMEmpQualificationsFinal; Institution)
            {
            }
            column(InstitutionName_HRMEmpQualificationsFinal; "Institution Name")
            {
            }
            column(Type_HRMEmpQualificationsFinal; "Type")
            {
            }
            column(CompName; Compinfo.Name)
            {


            }
            column(CompinfoPIC; Compinfo.Picture)
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
            column(Compinfohomepage; Compinfo."Home Page")
            {

            }
            dataitem("HRM-Employee C"; "HRM-Employee C")
            {
                DataItemLink = "No." = field("Employee No.");

                column(FullName_HRMEmployeeC; "Full Name")
                {
                }
            }
            trigger OnAfterGetRecord()
            begin
                Compinfo.get();
                Compinfo.CalcFields(Picture)
            end;
        }
    }





    var
        Compinfo: record "Company Information";
}
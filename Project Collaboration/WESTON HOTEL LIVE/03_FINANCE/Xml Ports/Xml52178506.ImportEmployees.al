xmlport 52178506 "Import Employees"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = UTF16;
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(employee; "HRM-Employee C")
            {


                fieldelement(No; employee."No.")
                {
                }

                fieldelement(FirstName; employee."Last Name")
                {
                }
                fieldelement(MiddleName; employee."Middle Name")
                {
                }
                fieldelement(LastName; employee."First Name")
                {
                }
                fieldelement(Postal; employee."Postal Address")
                {

                }
                fieldelement(Phone_No; employee."Work Phone Number")
                {

                }
                fieldelement(email; employee."E-Mail")
                {

                }
                fieldelement(IDNumber; employee."ID Number")
                {

                }
                fieldelement(Gender; employee.Gender)
                {
                }
                fieldelement(Status; employee.Status)
                {

                }
                fieldelement(DepartmentCode; employee."Department Code")
                {
                }
                fieldelement(Title; employee.Title)
                {

                }
                fieldelement(Contract_Type; employee."Contract Type")
                {

                }
                fieldelement(MaritalStatus; employee."Marital Status")
                {

                }
                fieldelement(Language; employee."First Language (R/W/S)")
                {

                }
                fieldelement(DateOfBirth; employee."Date Of Birth")
                {
                }
                fieldelement(DateOfJoin; employee."Date Of Join")
                {
                }
                fieldelement(Language; employee."Second Language (R/W/S)")
                {

                }
                fieldelement(JobSpecification; employee."Job Specification")
                {

                }
                fieldelement(Country; employee."County Name")
                {

                }
                fieldelement(DateofAppointment; employee."PIN Number")
                {
                }
                fieldelement(PostingGroup; employee."NSSF No.")
                {
                }
                fieldelement(NHIFNo; employee."NHIF No.")
                {
                }
                fieldelement(Religion; employee.Region)
                {

                }
                fieldelement(JobTitle; employee."Job Title")
                {
                }
                fieldelement(PostingGroup; employee."Posting Group")
                {

                }
                fieldelement(PayrollPostingGroup; employee."Payroll Posting Group")

                { }
                fieldelement(MainBank; employee."Main Bank")
                {
                }
                fieldelement(BranchBank; employee."Branch Bank")
                {
                }
                fieldelement(BankAccountNumber; employee."Bank Account Number")
                {
                }
                // fieldelement(PayrollCode; employee."Payroll Code")
                // {

                // }
                fieldelement(SalaryGrade; employee."Salary Grade")
                {
                    MinOccurs = Zero;
                }





                // fieldelement(empCategory; employee."Employee Category")
                // {
                // }




                // fieldelement(PaymentMode; employee."Payment Mode")
                // {
                // }




                // fieldelement(SalaryCategory; employee."Salary Category")
                // {
                // }

                // fieldelement(ContractStartDate; employee."Contract Start Date")
                // {
                //     MinOccurs = Zero;
                // }
                // fieldelement(ContractEndDate; employee."Contract End Date")
                // {
                //     MinOccurs = Zero;
                // }
                // fieldelement(BasicSalary; employee."Basic Salary")
                // {
                // }
                // fieldelement(HouseAllowance; employee."House Allowance")
                // {
                // }



            }
        }
    }



    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnInitXmlPort()
    begin
        I := 0;
    end;

    var
        I: Integer;
}


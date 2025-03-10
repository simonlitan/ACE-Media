report 52179073 "All employees list"
{
    Caption = 'All employees list';
    RDLCLayout = './hr/reports/ssr/All employees list.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(HRMEmployeeC; "HRM-Employee C")
        {
            RequestFilterFields = Status;

            column(FirstName_HRMEmployeeC; "First Name")
            {
            }
            column(MiddleName_HRMEmployeeC; "Middle Name")
            {
            }
            column(LastName_HRMEmployeeC; "Last Name")
            {
            }
            column(EmployeeCategory_HRMEmployeeC; "Employee Category")
            {
            }
            column(EarnsGratuity_HRMEmployeeC; "Earns Gratuity")
            {
            }
            column(FullPartTime_HRMEmployeeC; "Full / Part Time")
            {
            }
            column(Gender_HRMEmployeeC; Gender)
            {
            }
            column(IDNumber_HRMEmployeeC; "ID Number")
            {
            }
            column(SalaryCategory_HRMEmployeeC; "Salary Category")
            {
            }
            column(BankAccountNumber; "Bank Account Number")
            {
            }
            column(CompanyEMail; "Company E-Mail")
            {
            }
            column(ContractEndDate; "Contract End Date")
            {
            }
            column(County; County)
            {
            }
            column(CountyName; "County Name")
            {
            }
            column(DateOfBirth; "Date Of Birth")
            {
            }
            column(DateOfJoin; "Date Of Join")
            {
            }
            column(DaystoRetirement; "Days to Retirement")
            {
            }

            column(DrivetoWork; "Drive to Work")
            {
            }
            column(Driver; Driver)
            {
            }
            column(DriverLicenseNumber; "Driver License Number")
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(Salutation; Salutation)
            {
            }
            column(HOD; HOD)
            {
            }
            column(JobSpecification; "Job Specification")
            {
            }
            column(JobTitle; "Job Title")
            {
            }
            column(LengthOfService; "Length Of Service")
            {
            }
            column(MainBank; "Main Bank")
            {
            }
            column(MainBankName; "Main Bank Name")
            {
            }
            column(NHIFNo; "NHIF No.")
            {
            }
            column(NSSFNo; "NSSF No.")
            {
            }
            column(No; "No.")
            {
            }
            column(PINNumber; "PIN Number")
            {
            }
            column(PhysicalDisability; "Physical Disability")
            {
            }
            column(PortalPassword; "Portal Password")
            {
            }
            column(Position; Position)
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(Region; Region)
            {
            }
            column(Retirementdate; "Retirement date")
            {
            }
            column(SalaryGrade; "Salary Grade")
            {
            }
            column(SalaryStep; "Salary Step")
            {
            }
            column(Status; Status)
            {
            }
            column(Title; Title)
            {
            }
            column(Tribe; Tribe)
            {
            }
            column(BranchBankName_HRMEmployeeC; "Branch Bank Name")
            {
            }
            column(BasicSalary_HRMEmployeeC; "Basic Salary")
            {
            }
            column(CellularPhoneNumber_HRMEmployeeC; "Cellular Phone Number")
            {
            }
            column(Citizenship_HRMEmployeeC; Citizenship)
            {
            }
            column(DateofDismisal_HRMEmployeeC; "Date of Dismisal")
            {
            }
            column(MaritalStatus_HRMEmployeeC; "Marital Status")
            {
            }
            column(CI_Picture; CI.Picture)
            {
            }
            column(DAge; DAge)
            {

            }
            trigger OnAfterGetRecord()
            begin
                if (HRMEmployeeC."Date Of Birth" <> 0D) then
                    DAge := Dates.DetermineAge(HRMEmployeeC."Date Of Birth", Today);
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
    trigger OnPreReport()
    begin
        CI.GET();
        CI.CALCFIELDS(CI.Picture);
        if (HRMEmployeeC."Date Of Birth" <> 0D) then
            DAge := Dates.DetermineAge(HRMEmployeeC."Date Of Birth", Today);
    end;


    var
        CI: Record "Company Information";
        DAge: text[50];
        Dates: Codeunit "HR Dates";

}


report 52179078 "HR Employee List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './hr/Reports/SSR/HREmployeeList.rdl';

    dataset
    {
        dataitem(DataItem6075; "HRM-Employee C")
        {
            RequestFilterFields = "No.", Status;
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }

            column(USERID; USERID)
            {
            }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(CI_EMail; CI."E-Mail")
            {
                IncludeCaption = true;
            }
            column(CI_HomePage; CI."Home Page")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(HR_Employees__No__; "No.")
            {
            }
            column(Status_DataItem6075; Status)
            {
            }
            column(HR_Employees__ID_Number_; "ID Number")
            {
            }
            column(HR_Employees__Date_Of_Joining_the_Company_; "Date Of Join")
            {
            }
            column(HR_Employees__FullName; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {
            }
            column(HR_Employees__Cell_Phone_Number_; "Cellular Phone Number")
            {
            }
            column(EmployeeCaption; EmployeeCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee_ListCaption; Employee_ListCaptionLbl)
            {
            }
            column(P_O__BoxCaption; P_O__BoxCaptionLbl)
            {
            }
            column(HR_Employees__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(HR_Employees__ID_Number_Caption; FIELDCAPTION("ID Number"))
            {
            }
            column(HR_Employees__Date_Of_Joining_the_Company_Caption; FIELDCAPTION("Date Of Join"))
            {
            }
            column(Full_NamesCaption; Full_NamesCaptionLbl)
            {
            }
            column(LengthOfService_HREmployees; "Length Of Service")
            {
            }
            column(LenghtOfServices; LenghtOfServices)
            {
            }
            column(Age; Age)
            {
            }
            column(JobTitle_HREmployeeC; "Job Title")
            {
            }
            column(Gender_HREmployeeC; Gender)
            {
            }
            column(SalaryGrade_DataItem6075; "Salary Grade")
            {
            }
            column(BasicSalary_DataItem6075; "Basic Salary")
            {
            }
            column(EthnicOrigin_DataItem6075; "Ethnic Origin")
            {
            }
            column(Tribe_DataItem6075; Tribe)
            {
            }
            /* column(DepartmentCode_DataItem6075; "Department Code")
            {
            } */
            column(HomePhoneNumber_DataItem6075; "Home Phone Number")
            {
            }

            column(DateofBirth; "Date Of Birth")
            {
            }
            dataitem("HRM-Emp. Qualifications Final"; "HRM-Emp. Qualifications Final")
            {
                DataItemLink = "Employee No." = field("No.");


                column(Description_HRMEmpQualificationsFinal; Description)
                {
                }
                column(HighestQualification_HRMEmpQualificationsFinal; "Highest Qualification")
                {
                }
                column(Institution_HRMEmpQualificationsFinal; Institution)
                {
                }
                column(FromDate_HRMEmpQualificationsFinal; "From Date")
                {
                }
                column(Qualification_HRMEmpQualificationsFinal; Qualification)
                {
                }
                column(InstitutionName_HRMEmpQualificationsFinal; "Institution Name")
                {
                }
                column(ToDate_HRMEmpQualificationsFinal; "To Date")
                {
                }
                column(Type_HRMEmpQualificationsFinal; "Type")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                CLEAR(LenghtOfServices);
                IF (("Date Of Join" <> 0D) AND ("Date Of Join" <= TODAY)) THEN
                    LenghtOfServices := HrDates.DetermineAge("Date Of Join", TODAY);

                CLEAR(Age);
                IF (("Date Of Birth" <> 0D) AND ("Date Of Birth" <= TODAY)) THEN
                    Age := HrDates.DetermineAge("Date Of Birth", TODAY);
            end;

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

    labels
    {
    }

    trigger OnPreReport()
    begin
        CI.GET();
        CI.CALCFIELDS(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        EmployeeCaptionLbl: Label 'Employee';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Employee_ListCaptionLbl: Label 'Employee List';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        Full_NamesCaptionLbl: Label 'Full Names';
        HrDates: Codeunit "HR Dates";
        LenghtOfServices: Text[100];
        Age: Text[100];
}


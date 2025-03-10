report 52178893 "HRM-Biometrics Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Biometrics/Reports/SSR/HRMBiometricsReport.rdl';

    dataset
    {
        dataitem(DataItem1; "HRM-Employee C")
        {
            column(EmployeeNo; "No.")
            {
            }
            column(EmployeeFNames; "First Name")
            {
            }
            column(EmployeeMNames; "Middle Name")
            {
            }
            column(EmployeeLNames; "Last Name")
            {
            }
            column(EmployeePhone; "Home Phone Number")
            {
            }
            column(EmployeeEmail; "E-Mail")
            {
            }
            column(EmployeeID; "ID Number")
            {
            }
            column(EmployeeGender; Gender)
            {
            }
            column(EmployeeStatus; Status)
            {
            }
            column(EmployeeDepartment; "Global Dimension 1 Code")
            {
            }
            column(EmployeeContract; "Contract Type")
            {
            }
            column(EmployeeDOJ; "Date Of Join")
            {
            }
            column(CompNames; CompanyInformation.Name)
            {
            }
            column(CompAddress; CompanyInformation.Address)
            {
            }
            column(CompCity; CompanyInformation.City)
            {
            }
            column(CompPhones; CompanyInformation."Phone No.")
            {
            }
            column(CompPicture; CompanyInformation.Picture)
            {
            }
            column(CompEmail; CompanyInformation."E-Mail")
            {
            }
            column(CompUrl; CompanyInformation."Home Page")
            {
            }

            trigger OnPreDataItem()
            begin
                CompanyInformation.GET();
                CompanyInformation.CALCFIELDS(Picture);
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

    var
        CompanyInformation: Record 79;
        TransCat: Text[100];
        AbsentPresent: Text[20];
        RawBioEntries: Record "FacePrint Biometric";
        StartDate: Date;
        EndDate: Date;
        AttendanceLedger: Record "FacePrint Biometric";
        ExpectedHours: Decimal;
        WorkedHours: Decimal;
        WorkingVariance: Decimal;
        TimeIn: Time;
        TimeOut: Time;
        TimesheetLedger: Record "FacePrint Biometric";
        Dimensionss: Record 349;
        NonWorking: Boolean;
}


/// <summary>
/// Report Employee Leave (ID 51447).
/// </summary>
report 51447 "Employee Leave"
{
    DefaultLayout = RDLC;
    RDLCLayout = './hr/Reports/SSR/Employee Leave.rdl';

    dataset
    {
        dataitem("HRM-Employee C"; "HRM-Employee C")
        {
            DataItemTableView = SORTING("No.") where ("Posting Group" = filter('Salary'));
            RequestFilterFields = "No.", "Leave Period Filter";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }

            column(USERID; UserId)
            {
            }
            column(LeaveBalance_HRMEmployeeC; "Leave Balance")
            {
            }
            column(HR_Employee_C_Position; Position)
            {
            }
            column(JobTitle_HRMEmployeeC; "Job Title")
            {
            }
            column(HR_Employee_C__Salespers__Purch__Code_; "Salespers./Purch. Code")
            {
            }
            column(HR_Employee_C__Department_Code_; "Department Code")
            {
            }
            column(HR_Employee_C__Last_Name_; "Last Name")
            {
            }
            column(HR_Employee_C__Middle_Name_; "Middle Name")
            {
            }
            column(HR_Employee_C__First_Name_; "First Name")
            {
            }
            column(FullName; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {

            }
            column(Status_HRMEmployeeC; Status)
            {
            }
            column(HR_Employee_C__No__; "No.")
            {
            }
            column(DepartmentName_HRMEmployeeC; "Department Name")
            {
            }
            dataitem("HRM-Leave Ledger"; "HRM-Leave Ledger")
            {
                dataitemlink = "Document No" = field("No.");
                column(EmployeeNo_HRMLeaveLedger; "Employee No")
                {
                }
                column(LeaveType_HRMLeaveLedger; "Leave Type")
                {
                }
                column(Remainingdays_HRMLeaveLedger; "Remaining days")
                {
                }
                column(Leave_Period;"Leave Period")
                {

                }
                column(Leave_Type;"Leave Type")
                {

                }
                column(Transaction_Date;"Transaction Date")
                {

                }
            }

            dataitem("HRM-Emp. Leaves"; "HRM-Emp. Leaves")
            {
                DataItemLink = "Employee No" = FIELD("No.");
                column(Employee_Leaves__Leave_Code_; "Leave Code")
                {
                }
                column(Employee_Leaves__Maturity_Date_; "Maturity Date")
                {
                }
                column(Employee_Leaves_Balance; Balance)
                {
                }
                column(Employee_Leaves_Employee_No; "Employee No")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("No.");
            end;

            trigger OnAfterGetRecord()
            begin

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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        EmployeeCaptionLbl: Label 'Employee';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}


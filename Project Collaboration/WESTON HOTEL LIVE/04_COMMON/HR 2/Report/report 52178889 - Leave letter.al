/// <summary>
/// Report Leave letter (ID 52178889).
/// </summary>
report 52178889 "Leave letter"
{

    DefaultLayout = RDLC;
    RDLCLayout = './HR 2/Report/SSr/leave letter.rdl';

    dataset
    {
        dataitem("Leave Letter"; "Leave Letter")
        {

            column(date_LeaveLetter; "date")
            {
            }
            column(CurrentFinancialYear_LeaveLetter; "Current Financial Year")
            {
            }
            column(salutation_LeaveLetter; salutation)
            {
            }
            column(PreviousFinancialyear_LeaveLetter; "Previous Financial year")
            {
            }
            column(Jobtitle_LeaveLetter; "Job title")
            {
            }
            column(DaysCarriedforward_LeaveLetter; "Days Carried forward")
            {
            }
            column(AnnualLeaveDays_LeaveLetter; "Annual Leave Days")
            {
            }
            dataitem(DataItem6075; "HRM-Employee C")
            {
                DataItemLink = "No." = field(No);
                column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
                {
                }
                column(COMPANYNAME; COMPANYNAME)
                {
                }
                /*  column(CurrReport_PAGENO; CurrReport.PAGENO)
                 {
                 } */
                column(USERID; USERID)
                {
                }
                column(CI_Picture; CI.Picture)
                {
                }
                column(CI_City; CI.City)
                {
                }
                column(CI__Address_2______CI__Post_Code_; CI."Address 2" + ' ' + CI."Post Code")
                {
                }
                column(CI_Address; CI.Address)
                {
                }
                column(HR_Employees__No__; "No.")
                {
                }
                column(HR_Employees__FullName; FullName)
                {
                }
                column(FNames; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
                {
                }
                column(HR_Employees__HR_Employees___Leave_Balance_; "Leave Balance")
                {
                }
                column(EmployeeCaption; EmployeeCaptionLbl)
                {
                }

                column(Employee_Leave_StatementCaption; Employee_Leave_StatementCaptionLbl)
                {
                }
                column(P_O__BoxCaption; P_O__BoxCaptionLbl)
                {
                }
                column(HR_Employees__No__Caption; FIELDCAPTION("No."))
                {
                }
                column(NameCaption; NameCaptionLbl)
                {
                }
                column(Leave_BalanceCaption; Leave_BalanceCaptionLbl)
                {
                }
                column(Day_s_Caption; Day_s_CaptionLbl)
                {
                }
                column(No; No)
                {
                }
                dataitem("HRM-Leave Types"; "HRM-Leave Types")
                {

                    column(Days_HRMLeaveTypes; Days)
                    {
                    }
                }
                dataitem(DataItem4961; "HRM-Leave Ledger")
                {
                    DataItemLink = "Employee No" = FIELD("No.");
                    //DataItemView = SORTING ("Entry No.");
                    column(HR_Leave_Ledger_Entries__Leave_Period_; "Leave Period")
                    {
                    }
                    column(HR_Leave_Ledger_Entries__Leave_Entry_Type_; "Entry Type")
                    {
                    }
                    column(HR_Leave_Ledger_Entries__Leave_Type_; "Leave Type")
                    {
                    }
                    column(HR_Leave_Ledger_Entries__No__of_days_; "No. of Days")
                    {
                    }
                    column(HR_Leave_Ledger_Entries__Leave_Posting_Description_; "Transaction Description")
                    {
                    }
                    column(HR_Leave_Ledger_Entries__Posting_Date_; "Transaction Date")
                    {
                    }
                    column(HR_Leave_Ledger_Entries__Leave_Entry_Type_Caption; FIELDCAPTION("Entry Type"))
                    {
                    }
                    column(HR_Leave_Ledger_Entries__Leave_Type_Caption; FIELDCAPTION("Leave Type"))
                    {
                    }
                    column(HR_Leave_Ledger_Entries__No__of_days_Caption; FIELDCAPTION("No. of Days"))
                    {
                    }
                    column(HR_Leave_Ledger_Entries__Leave_Posting_Description_Caption; FIELDCAPTION("Transaction Description"))
                    {
                    }
                    column(HR_Leave_Ledger_Entries__Posting_Date_Caption; FIELDCAPTION("Transaction Date"))
                    {
                    }
                    column(HR_Leave_Ledger_Entries__Leave_Period_Caption; FIELDCAPTION("Leave Period"))
                    {
                    }
                    column(HR_Leave_Ledger_Entries_Entry_No_; "Entry No.")
                    {
                    }
                    column(HR_Leave_Ledger_Entries_Staff_No_; "Employee No")
                    {
                    }



                    trigger OnPreDataItem()
                    var
                        hrm: Record "HRM-Employee C";
                    begin
                        //SETFILTER(hrm."Leave Type", GETFILTER(hrm."Leave Type Filter"));
                    end;
                }
                dataitem(DataItem9741; "HRM-Leave Requisition")
                {
                    DataItemTableView = SORTING("No.");
                    RequestFilterFields = "No.";
                    column(LeaveNo_; "No.")
                    {
                    }
                    column(HR_Leave_Requisition_Date; Date)
                    {
                    }
                    column(HR_Leave_Requisition__Employee_No_; "Employee No")
                    {
                    }
                    column(HR_Leave_Requisition__Employee_Name_; "Employee Name")
                    {
                    }
                    /*  column(HR_Leave_Requisition__Campus_Code_; "Region Code")
                     {
                     } */
                    column(HR_Leave_Requisition__Department_Code_; "Department Code")
                    {
                    }
                    column(HR_Leave_Requisition__Applied_Days_; "Applied Days")
                    {
                    }
                    column(HR_Leave_Requisition__Starting_Date_; "Starting Date")
                    {
                    }
                    column(HR_Leave_Requisition__End_Date_; "End Date")
                    {
                    }
                    column(ReturnDate; "Return Date")
                    {
                    }
                    column(HR_Leave_Requisition_Purpose; Purpose)
                    {
                    }
                    column(HR_Leave_Requisition__Leave_Type_; "Leave Type")
                    {
                    }
                    column(HR_Leave_Requisition__Leave_Balance_; "Leave Balance")
                    {
                    }

                    column(AvaillableDays_DataItem9741; "Availlable Days")
                    {
                    }

                    column(HR_Leave_Requisition_Status; Status)
                    {
                    }

                    column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
                    {
                    }
                    column(HR_Leave_Requisition__No__Caption; FIELDCAPTION("No."))
                    {
                    }
                    column(HR_Leave_Requisition_DateCaption; FIELDCAPTION(Date))
                    {
                    }
                    column(HR_Leave_Requisition__Employee_No_Caption; FIELDCAPTION("Employee No"))
                    {
                    }
                    /* column(HR_Leave_Requisition__Campus_Code_Caption; FIELDCAPTION("Region Code"))
                    {
                    } */
                    column(HR_Leave_Requisition__Department_Code_Caption; FIELDCAPTION("Department Code"))
                    {
                    }
                    column(HR_Leave_Requisition__Applied_Days_Caption; FIELDCAPTION("Applied Days"))
                    {
                    }
                    column(HR_Leave_Requisition__Starting_Date_Caption; FIELDCAPTION("Starting Date"))
                    {
                    }
                    column(HR_Leave_Requisition__End_Date_Caption; FIELDCAPTION("End Date"))
                    {
                    }
                    column(HR_Leave_Requisition_PurposeCaption; FIELDCAPTION(Purpose))
                    {
                    }
                    column(HR_Leave_Requisition__Leave_Type_Caption; FIELDCAPTION("Leave Type"))
                    {
                    }
                    column(HR_Leave_Requisition__Leave_Balance_Caption; FIELDCAPTION("Leave Balance"))
                    {
                    }
                    column(HR_Leave_Requisition_StatusCaption; FIELDCAPTION(Status))
                    {
                    }
                }


                trigger OnAfterGetRecord()
                begin
                    //"HR Employee c".VALIDATE("HR Employee c"."Allocated Leave Days");
                    //LeaveBalance:="HR Employee c"."Leave Balance";
                end;
            }
        }
    }

    /* requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    } */



    var
    trigger OnPreReport()
    begin
        CI.GET();
        CI.CALCFIELDS(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        LeaveBalance: Decimal;
        EmployeeCaptionLbl: Label 'Employee';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Employee_Leave_StatementCaptionLbl: Label 'Employee Leave Statement';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        NameCaptionLbl: Label 'Name';
        Leave_BalanceCaptionLbl: Label 'Leave Balance';
        Day_s_CaptionLbl: Label 'Day(s)';
        No: Decimal;
}
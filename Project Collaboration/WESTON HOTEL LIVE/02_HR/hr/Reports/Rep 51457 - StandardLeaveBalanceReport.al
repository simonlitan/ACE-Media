report 51457 "Standard Leave Balance Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './hr/Reports/SSR/StandardLeaveBalanceReport.rdl';

    dataset
    {
        dataitem(DataItem3372; "HRM-Employee C")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(compName; CompanyInformation.Name)
            {
            }
            column(addresses; CompanyInformation.Address + ',' + CompanyInformation."Address 2")
            {
            }
            column(phones; CompanyInformation."Phone No." + '/' + CompanyInformation."Phone No. 2")
            {
            }
            column(emails; CompanyInformation."E-Mail" + '/' + CompanyInformation."Home Page")
            {
            }
            column(pics; CompanyInformation.Picture)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            /* column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            } */
            column(USERID; USERID)
            {
            }
            column(Names; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {
            }
            column(HR_Employee_C__No__; "No.")
            {
            }
            column(Standard_Leave_Balance_ReportCaption; Standard_Leave_Balance_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(NamesCaption; NamesCaptionLbl)
            {
            }
            column(HR_Employee_C__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Status_DataItem3372; Status)
            {
            }
            column(DepartmentName_DataItem3372; "Department Name")
            {
            }
            dataitem(DataItem1; "HRM-Leave Ledger")
            {
                DataItemLink = "Employee No" = FIELD("No.");
                column(entryno; "Entry No.")
                {
                }
                column(DocNo; "Document No")
                {
                }
                column(LeaveType; "Leave Type")
                {
                }
                column(TransDate; "Transaction Date")
                {
                }
                column(Transtype; "Transaction Type")
                {
                }
                column(NoOfDays; "No. of Days")
                {
                }
                column(TransDesc; "Transaction Description")
                {
                }
                column(LeavePer; "Leave Period")
                {
                }
                column(EntryType; "Entry Type")
                {
                }
                column(CreatedBy; "Created By")
                {
                }
                column(ReversedBy; "Reversed By")
                {
                }
                column(relName; HRMLeaveRequisition."Reliever Name")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    HRMLeaveRequisition.RESET;
                    HRMLeaveRequisition.SETRANGE("No.", "Document No");
                    IF HRMLeaveRequisition.FIND('-') THEN BEGIN
                    END;
                end;
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("No.");
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

    trigger OnInitReport()
    begin
        CompanyInformation.RESET;
        IF CompanyInformation.FIND('-') THEN CompanyInformation.CALCFIELDS(Picture);
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Standard_Leave_Balance_ReportCaptionLbl: Label 'Standard Leave Balance Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NamesCaptionLbl: Label 'Names';
        CompanyInformation: Record "Company Information";
        HRMLeaveRequisition: Record "HRM-Leave Requisition";
}


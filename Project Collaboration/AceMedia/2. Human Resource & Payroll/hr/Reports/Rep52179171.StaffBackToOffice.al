report 52179171 "Staff Back To Office"
{
    Caption = 'Staff Back To Office';
    DefaultLayout = RDLC;
    RDLCLayout = './hr/Reports/SSR/Staff Back To Office.rdl';
    dataset
    {
        dataitem(HRMBackToOfficeForm; "HRM-Back To Office Form")
        {
            RequestFilterFields = "Document No";
            column(DocumentNo; "Document No")
            {
            }
            column(CourseTitle; "Course Title")
            {
            }
            column(Duration; "Duration")
            {
            }
            column(DurationUnits; "Duration Units")
            {
            }
            column(EmployeeNo; "Employee No.")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(FromDate; "From Date")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(Location; Location)
            {
            }
            column(PurposeofTraining; "Purpose of Training")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(Status; Status)
            {
            }
            column(Supervisor; Supervisor)
            {
            }
            column(SupervisorName; "Supervisor Name")
            {
            }
            column(ToDate; "To Date")
            {
            }
            column(Trainer; Trainer)
            {
            }
            column(TrainingEvaluationResults; "Training Evaluation Results")
            {
            }
            column(TrainingInstitution; "Training Institution")
            {
            }
            column(TrainingStatus; "Training Status")
            {
            }
            column(Trainingcategory; "Training category")
            {
            }
            column(UserID; "User ID")
            {
            }
            column(Description; Description)
            {
            }
            column(CostOfTraining; "Cost Of Training")
            {
            }
            column(Text1_HRMBackToOfficeForm; "Text 1")
            {
            }
            column(Text2_HRMBackToOfficeForm; "Text 2")
            {
            }
            column(Text3_HRMBackToOfficeForm; "Text 3")
            {
            }
            column(Text4_HRMBackToOfficeForm; "Text 4")
            {
            }
            column(CompName; CompanyInformation.Name)
            {
            }
            column(Address; CompanyInformation.Address + ' ' + CompanyInformation."Address 2")
            {
            }
            column(Phones; CompanyInformation."Phone No." + ' ' + CompanyInformation."Phone No. 2")
            {
            }

            column(Mails; CompanyInformation."E-Mail")
            {
            }

            column(pics; CompanyInformation.Picture)
            {
            }
            dataitem(DataItem1171; "Approval Entry")
            {
                DataItemLink = "Document No." = FIELD("Document No");
                DataItemTableView = SORTING("Table ID", "Document Type", "Document No.", "Sequence No.") ORDER(Ascending) WHERE("Approved The Document" = FILTER(true));
                column(Approval_Entry__Approver_ID_; "Approver ID")
                {
                }
                column(Approval_Entry_Status; Status)
                {
                }
                column(Approval_Entry__Last_Date_Time_Modified_; "Last Date-Time Modified")
                {
                }

                column(Approval_Entry_Table_ID; "Table ID")
                {
                }
                column(Approval_Entry_Document_Type; "Document Type")
                {
                }
                column(Approval_Entry_Document_No_; "Document No.")
                {
                }
                column(Approval_Entry_Sequence_No_; "Sequence No.")
                {
                }
                // column(ApprovalTitle; UserSetup."Approval Title")
                // {
                // }
                column(ApprovalSignature; UserSetup."User Signature")
                {
                }
                column(ApproveDateTime; "Last Date-Time Modified")
                {
                }

                trigger OnAfterGetRecord()
                begin


                    UserSetup.RESET;
                    UserSetup.SETRANGE("User ID", "Approver ID");
                    IF UserSetup.FIND('-') THEN UserSetup.CALCFIELDS("User Signature");
                end;

                trigger OnPreDataItem()
                begin
                    //   SETFILTER("Approver ID",'<>%1',"User ID");
                end;
            }
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
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);

    end;

    var
        CompanyInformation: record "Company Information";
        UserSetup: Record "User Setup";
}

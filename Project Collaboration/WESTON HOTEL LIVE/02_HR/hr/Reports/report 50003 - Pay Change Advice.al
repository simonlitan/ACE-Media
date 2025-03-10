/// <summary>
/// Report Pay Change Advice (ID 50003).
/// </summary>
report 50003 "Pay Change Advice"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './hr/Reports/SSR/PayChangeAdvice.rdl';

    dataset
    {
        dataitem(DataItemName; "Pay Change Advice")
        {
            DataItemTableView = SORTING("Authority Number");
            RequestFilterFields = "Authority Number";
            column(AuthorityNumber_DataItemName; "Authority Number")
            {
            }
            column(PFNo_DataItemName; "P/F No")
            {
            }
            column(Surname_DataItemName; Surname)
            {
            }
            column(Othernames_DataItemName; "Other names")
            {
            }
            column(NewGrade_DataItemName; "New Grade")
            {
            }
            column(Department_DataItemName; Department)
            {
            }
            column(EffectiveDateforaction_DataItemName; "Effective Date for action")
            {
            }
            column(Incrementaldate_DataItemName; "Incremental date")
            {
            }
            column(Termsofnewgrade_DataItemName; "Terms of new grade")
            {
            }
            column(PresentGrade_DataItemName; "Present Grade")
            {
            }
            dataitem("Company Information"; "Company Information")
            {

                column(Address_CompanyInformation; Address)
                {
                }
                column(Address2_CompanyInformation; "Address 2")
                {
                }
                column(EMail_CompanyInformation; "E-Mail")
                {
                }
                column(Name_CompanyInformation; Name)
                {
                }
                column(Picture_CompanyInformation; Picture)
                {
                }
                column(PhoneNo_CompanyInformation; "Phone No.")
                {
                }
            }
            dataitem(DataItem1171; "Approval Entry")
            {
                DataItemLink = "Document No." = FIELD("Authority Number");

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


            }
        }


    }








    trigger OnPreReport()
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;


    var
        CompanyInformation: Record "Company Information";
        UserSetup: Record "User Setup";
}
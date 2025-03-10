report 52178500 "Petty Cash Surrender"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Petty Cash Advance/Reports/SSR/Petty Cash Surrender.rdl';

    dataset
    {
        dataitem(DataItemName; "PettyCash Surrender Header")
        {
            RequestFilterFields = "No.";
            column(No_DataItemName; "No.")
            {
            }
            column(AccountName_DataItemName; "Account Name")
            {
            }
            column(AccountNo_DataItemName; "Account No.")
            {
            }
            column(AccountType_DataItemName; "Account Type")
            {
            }
            column(AdvanceNo_DataItemName; "Advance No.")
            {
            }
            column(Amount_DataItemName; Amount)
            {
            }
            column(BankName_DataItemName; "Bank Name")
            {
            }
            column(Cashier_DataItemName; Cashier)
            {
            }
            column(DatePosted_DataItemName; "Date Posted")
            {
            }
            column(GlobalDimension1Code_DataItemName; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_DataItemName; "Global Dimension 2 Code")
            {
            }
            column(OnBehalfOf_DataItemName; "On Behalf Of")
            {
            }
            column(Payee_DataItemName; Payee)
            {
            }
            column(PayingBankAccount_DataItemName; "Paying Bank Account")
            {
            }
            column(PostingDescription_DataItemName; "Posting Description")
            {
            }
            column(ResponsibilityCenter_DataItemName; "Responsibility Center")
            {
            }
            column(SurrenderDate_DataItemName; "Surrender Date")
            {
            }
            column(CashReceiptNo_DataItemName; "Cash Receipt No")
            {
            }
            column(PostedBy_DataItemName; "Posted By")
            {
            }
            column(Name_CompanyInformation; Compinfo.Name)
            {
            }
            column(Picture_CompanyInformation; Compinfo.Picture)
            {
            }
            column(PhoneNo_CompanyInformation; Compinfo."Phone No.")
            {
            }
            column(CountryRegionCode_CompanyInformation; Compinfo."Country/Region Code")
            {
            }
            column(County_CompanyInformation; Compinfo.County)
            {
            }
            column(Address_CompanyInformation; Compinfo.Address)
            {
            }
            column(City_CompanyInformation; Compinfo.City)
            {
            }
            column(EMail_CompanyInformation; Compinfo."E-Mail")
            {
            }
            column(FaxNo_CompanyInformation; Compinfo."Fax No.")
            {
            }
            column(HomePage_CompanyInformation; Compinfo."Home Page")
            {
            }
            dataitem("PettyCash Surrender Details"; "PettyCash Surrender Details")
            {
                DataItemLink = "Account No." = field("Account No.");
                column(AccountType_PettyCashSurrenderDetails; "Account Type")
                {
                }
                column(ActualSpent_PettyCashSurrenderDetails; "Actual Spent")
                {
                }
                column(AdvanceHolder_PettyCashSurrenderDetails; "Advance Holder")
                {
                }
                column(Amount_PettyCashSurrenderDetails; Amount)
                {
                }
                column(AccountNo_PettyCashSurrenderDetails; "Account No.")
                {
                }
                column(AccountName_PettyCashSurrenderDetails; "Account Name")
                {
                }
                column(CashReceiptAmount_PettyCashSurrenderDetails; "Cash Receipt Amount")
                {
                }
                column(CashReceiptNo_PettyCashSurrenderDetails; "Cash Receipt No")
                {
                }
                column(SurrenderDate_PettyCashSurrenderDetails; "Surrender Date")
                {
                }
                column(SurrenderNo_PettyCashSurrenderDetails; "Surrender No.")
                {
                }
            }

            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field("No.");


                column(ApproverID_ApprovalEntry; "Approver ID")
                {
                }
                column(LastDateTimeModified_ApprovalEntry; "Last Date-Time Modified")
                {
                }
                column(SenderID_ApprovalEntry; "Sender ID")
                {
                }
                dataitem("User Setup"; "User Setup")
                {
                    DataItemLink = "User ID" = field("Approver ID");
                    column(UserSignature_UserSetup; "User Signature")
                    {
                    }
                    column(ApprovalTitle_UserSetup; "Approval Title")
                    {
                    }
                }
            }
            trigger OnAfterGetRecord()
            begin
                CompInfo.Get;
                Compinfo.CalcFields(Picture);
            end;
        }

    }


    requestpage
    {
        layout
        {
            area(Content)
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
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }


    var
        Compinfo: Record "Company Information";
        myInt: Integer;
}
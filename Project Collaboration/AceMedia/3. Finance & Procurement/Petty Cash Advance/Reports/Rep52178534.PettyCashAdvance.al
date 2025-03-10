report 52178534 "Petty Cash Advance"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Petty Cash Advance/Reports/SSR/Petty Cash Advance.rdl';

    dataset
    {
        dataitem("Advance PettyCash Header"; "Advance PettyCash Header")
        {
            RequestFilterFields = "No.";
            column(No_AdvancePettyCashHeader; "No.")
            {
            }
            column(AccountNo_AdvancePettyCashHeader; "Account No.")
            {
            }
            column(AccountType_AdvancePettyCashHeader; "Account Type")
            {
            }
            column(BankName_AdvancePettyCashHeader; "Bank Name")
            {
            }
            column(Cashier_AdvancePettyCashHeader; Cashier)
            {
            }
            column(ChequeNo_AdvancePettyCashHeader; "Cheque No.")
            {
            }
            column(Date_AdvancePettyCashHeader; "Date")
            {
            }
            column(DocumentType_AdvancePettyCashHeader; "Document Type")
            {
            }
            column(GlobalDimension1Code_AdvancePettyCashHeader; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_AdvancePettyCashHeader; "Global Dimension 2 Code")
            {
            }
            column(PayMode_AdvancePettyCashHeader; "Pay Mode")
            {
            }
            column(PayingBankAccount_AdvancePettyCashHeader; "Paying Bank Account")
            {
            }
            column(PaymentAmount_AdvancePettyCashHeader; "Payment Amount")
            {
            }
            column(PaymentReleaseDate_AdvancePettyCashHeader; "Payment Release Date")
            {
            }
            column(Purpose_AdvancePettyCashHeader; Purpose)
            {
            }
            column(ResponsibilityCenter_AdvancePettyCashHeader; "Responsibility Center")
            {
            }
            column(SurrenderStatus_AdvancePettyCashHeader; "Surrender Status")
            {
            }
            column(payee_AdvancePettyCashHeader; payee)
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
            column(VATRegistrationNo_CompanyInformation; Compinfo."VAT Registration No.")
            {
            }
            dataitem("Advance PettyCash Lines"; "Advance PettyCash Lines")
            {

                DataItemLink = "Document No." = field("No.");
                column(DocumentNo_AdvancePettyCashLines; "Document No.")
                {
                }

                column(AccountNo_AdvancePettyCashLines; "Account No.")
                {
                }
                column(AccountName_AdvancePettyCashLines; "Account Name")
                {
                }
                column(AccountType_AdvancePettyCashLines; "Account Type")
                {
                }
                column(AdvanceType_AdvancePettyCashLines; "Advance Type")
                {
                }
                column(Amount_AdvancePettyCashLines; Amount)
                {
                }
                column(LineNo_AdvancePettyCashLines; "Line No.")
                {
                }
                column(PettyCashHolder_AdvancePettyCashLines; "Petty Cash Holder")
                {
                }
                column(Purpose_AdvancePettyCashLines; Purpose)
                {
                }


            }
            dataitem("User Setup1"; "User Setup")
            {
                DataItemLink = "User ID" = field(cashier);

                column(UserSignature_UserSetup1; "User Signature")
                {
                }
                column(ApprovalTitle_UserSetup1; "Approval Title")
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
                "User Setup".CalcFields("User Signature");
                "Advance PettyCash Header".CalcFields("Payment Amount");
            end;
        }

    }





    var
        Compinfo: Record "Company Information";
        myInt: Integer;
}
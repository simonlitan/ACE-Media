report 52178562 "Purchase Requisitions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/PurchaseRequisition.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(ph; "Purchase Header")
        {
            column(DocumentDate_ph; "Document Date")
            {
            }
            column(UserId_ph; "User Id")
            {
            }
            column(AssignedUserID_ph; "Assigned User ID")
            {
            }
            column(AllocatedAmount; AllocatedAmount)
            {

            }
            column(CommitedAmount; CommitedAmount)
            {

            }
            column(BalanceAmount; BalanceAmount)
            {

            }
            column(EmployeeCode; EmployeeCode)
            {

            }
            column(EmployeeName; EmployeeName)
            {

            }
            column(SenderTitle; SenderTitle)
            {

            }
            column(RequestNarration_ph; "Request Narration")
            {
            }
            column(ProjectName; ProjectName)
            {

            }
            column(No_PurchaseHeader; ph."No.")
            {
            }
            column(PaytoName_PurchaseHeader; ph."Pay-to Name")
            {
            }
            column(PostingDescription_PurchaseHeader; ph."Posting Description")
            {
            }
            column(ShortcutDimension1Code_PurchaseHeader; ph."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_PurchaseHeader; ph."Shortcut Dimension 2 Code")
            {
            }
            column(ShortcutDimension3_ph; "Shortcut Dimension  3")
            {
            }
            column(PostingDate_PurchaseHeader; ph."Posting Date")
            {
            }
            column(SugestedSupplierNo; ph."Buy-from Vendor No.")
            {
            }
            column(SuggestedSuppName; ph."Buy-from Vendor Name")
            {
            }
            column(BuyFromAddress; ph."Buy-from Address" + ',' + ph."Buy-from Address 2" + '-' + ph."Buy-from City")
            {
            }
            column(BuyFromContact; ph."Buy-from Post Code")
            {
            }
            column(Dept; ph."Shortcut Dimension 2 Code")
            {
            }

            column(logo; info.Picture)
            {

            }
            column(name; info.Name)
            {

            }
            column(name2; info."Name 2")
            {

            }
            column(Address; info.Address)
            {

            }
            column(Address2; info."Address 2")
            {

            }
            column(mail; info."E-Mail")
            {

            }
            column(url; info."Home Page")
            {

            }
            column(infofax; info."Fax No.")
            {

            }
            column(infophone; info."Phone No.")
            {

            }
            dataitem(pl; "Purchase Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"),
                               "Document No." = FIELD("No.");
                column(VATIdentifier_pl; "VAT Identifier")
                {
                }
                column(AllowInvoiceDisc_pl; "Allow Invoice Disc.")
                {
                }
                column(Type_PurchaseLine; pl.Type)
                {
                }
                column(No_PurchaseLine; pl."No.")
                {
                }
                column(Description_PurchaseLine; pl.Description)
                {
                }
                column(UnitofMeasure_PurchaseLine; pl."Unit of Measure")
                {
                }
                column(Quantity_PurchaseLine; pl.Quantity)
                {
                }
                column(DirectUnitCost_PurchaseLine; pl."Direct Unit Cost")
                {
                }
                column(Amount_PurchaseLine; pl.Amount)
                {
                }
            }
            dataitem("User Setup"; "User Setup")
            {
                DataItemLink = "User Id" = field("User Id");

                column(UserSignature_UserSetup; "User Signature")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    CalcFields("User Signature");
                end;

                trigger OnPreDataItem()
                begin
                    CalcFields("User Signature");
                end;
            }
            dataitem(ApprovalEntry; "Approval Entry")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = order(ascending) WHERE(Status = CONST(Approved));
                column(ApproverID_ApprovalEntry; ApprovalEntry."Approver ID")
                {
                }
                column(LastDateTimeModified_ApprovalEntry; ApprovalEntry."Last Date-Time Modified")
                {
                }
                column(DateTimeSentforApproval_ApprovalEntry; "Date-Time Sent for Approval")
                {
                }
                column(Sender_ID; ApprovalEntry."Sender ID")
                {

                }

                dataitem(UserSetUp; "User Setup")
                {
                    DataItemLink = "User ID" = FIELD("Approver ID");
                    column(UserID_UserSetUp; "User ID")
                    {
                    }

                    column(Signature_UserSetup; UserSetUp."User Signature")
                    {
                    }
                    column(ApprovalDesignation_UserSetup; UserSetUp."Approval Title")
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        CalcFields("User Signature");
                    end;


                    trigger OnPreDataItem()
                    begin
                        ApprovalEntry.SETRANGE(ApprovalEntry.Status, ApprovalEntry.Status::Approved);
                        CalcFields("User Signature");
                    end;
                }
                dataitem(UserSetup1; "User Setup")
                {
                    DataItemLink = "User Id" = field("Sender Id");
                    column(UserSignature_UserSetup1; "User Signature")
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        CalcFields("User Signature")
                    end;
                }

            }





            trigger OnAfterGetRecord()
            begin

                UserSetUp.Reset();
                UserSetUp.SetRange("User ID", ph."User Id");
                if UserSetUp.Find('-') then begin
                    EmployeeCode := UserSetUp."Employee No.";
                    SenderTitle := UserSetUp."Approval Title";
                    Employee.Reset();
                    Employee.SetRange("No.", EmployeeCode);
                    if Employee.Find('-') then
                        EmployeeName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end;
                Dimensionvalue.Reset();
                Dimensionvalue.SetRange(code, ph."Shortcut Dimension 2 Code");
                if Dimensionvalue.Find('-') then
                    ProjectName := Dimensionvalue.Name;
                Glbudget.Reset();
                Glbudget.SetRange(Blocked, false);
                if Glbudget.Find('-') then begin
                    FinBudgetentries.Reset();
                    FinBudgetentries.SetRange("Budget Name", Glbudget.name);
                    FinBudgetentries.SetRange("G/L Account No.", pl."No.");
                    //  FinBudgetentries.SetRange("Global Dimension 1 Code", ph."Shortcut Dimension 2 Code");
                    if FinBudgetentries.Find('-') then begin
                        FinBudgetentries.CalcFields(Allocation);
                        FinBudgetentries.CalcFields(Commitments);
                        FinBudgetentries.CalcFields(Balance);
                        AllocatedAmount := FinBudgetentries.Allocation;
                        CommitedAmount := FinBudgetentries.Commitments;
                        BalanceAmount := FinBudgetentries.Balance;
                    end;
                end;

            end;

            trigger OnPreDataItem()
            begin
                info.Get();
                info.CalcFields(Picture);
                UserSetUp.CalcFields("User Signature");
                FinBudgetentries.CalcFields(Allocation);
                FinBudgetentries.CalcFields(Commitments);
                FinBudgetentries.CalcFields(Balance);

                Glbudget.Reset();
                Glbudget.SetRange(Blocked, false);
                if Glbudget.Find('-') then begin
                    FinBudgetentries.Reset();
                    FinBudgetentries.SetRange("Budget Name", Glbudget.name);
                    FinBudgetentries.SetRange("Global Dimension 1 Code", ph."Shortcut Dimension 2 Code");
                    if FinBudgetentries.Find('-') then begin
                        FinBudgetentries.CalcFields(Allocation);
                        FinBudgetentries.CalcFields(Commitments);
                        FinBudgetentries.CalcFields(Balance);
                        AllocatedAmount := FinBudgetentries.Allocation;
                        CommitedAmount := FinBudgetentries.Commitments;
                        BalanceAmount := FinBudgetentries.Balance;
                    end;
                end;

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
        AppReq: Record "Approval Entry";
        info: Record "Company Information";
        counted: Integer;

        Employee: Record "HRM-Employee C";
        SenderTitle: text[200];
        EmployeeCode: code[50];
        EmployeeName: text[150];
        ProjectName: Text[200];
        AllocatedAmount: Decimal;
        BalanceAmount: Decimal;
        CommitedAmount: Decimal;
        FinBudgetentries: record "FIN-Budget Entries Summary";
        Glbudget: record "G/L Budget Name";
        Dimensionvalue: record "Dimension Value";
        Cashoffice: Record "Cash Office Setup";
}

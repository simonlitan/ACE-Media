report 52178533 "Votebook Report"
{
     Caption = 'Budget comparison summary';
    RDLCLayout = './Reports/SSR/FinbudgetsummaryNepad.rdl';
    DefaultLayout = rdlc;
    dataset
    {
        dataitem(FINBudgetEntriesSummary; "FIN-Budget Entries Summary")
        {
            RequestFilterFields = "Budget Name", "Budget Start Date", "Budget End Date";
            column(BudgetStartDate; "Budget Start Date")
            {
            }
            column(BudgetName; "Budget Name")
            {
            }
            column(GLAccountNo; "G/L Account No.")
            {
            }
            column(VoteName; "Vote Name")
            {
            }
            column(Allocation; Allocation)
            {
            }
            column(Balance; Balance)
            {
            }
            column(Expenses; Expenses)
            {
            }
            column(Commitments; Commitments)
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(PercentageBalance; "% Balance")
            {
            }
            column(NetBalance; "Net Balance")
            {
            }
            column(PercentageNetBalance; "% Net Balance")
            {
            }
            column(Compinfopicture; Compinfo.Picture)
            {

            }
            column(Compinfoname; Compinfo.Name)
            {

            }
            column(Compinfophone; Compinfo."Phone No.")
            {

            }
            column(Compinfoaddress; Compinfo.Address)
            {

            }
            column(Compinfoemail; Compinfo."E-Mail")
            {

            }
            column(Compinfowebpage; Compinfo."Home Page")
            {

            }
            column(seq; seq)
            {

            }
            column(Percentage; Percentage)
            {
            }
            column(Revision;Revision){

            }
            column(Revised_Allocations;"Revised Allocations"){

            }
            column(Total_Expense_Commitment;"Total Expense/Commitment"){

            }
            
            trigger OnAfterGetRecord()
            begin
                seq := seq + 1;
            end;

            trigger OnPreDataItem()
            begin
                if Balance = 0 then CurrReport.Skip();
                if Allocation = 0 then CurrReport.Skip();
            end;


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
        compinfo.get();
        compinfo.CalcFields(Picture);
        FINBudgetEntriesSummary.calcfields(Allocation);
        FINBudgetEntriesSummary.calcfields(Commitments);
        FINBudgetEntriesSummary.calcfields(Expenses);
        FINBudgetEntriesSummary.calcfields(Balance);
       if (FINBudgetEntriesSummary.Allocation = 0) or (FINBudgetEntriesSummary.Allocation < 0) then CurrReport.Skip();
        if (FINBudgetEntriesSummary.Allocation = 0) or (FINBudgetEntriesSummary.Allocation < 0) then CurrReport.Skip();
        Percentage := ((FINBudgetEntriesSummary.Allocation - FINBudgetEntriesSummary.Balance) / FINBudgetEntriesSummary.Allocation)

    end;

    trigger OnInitReport()
    begin
        compinfo.get();
        compinfo.CalcFields(Picture);
        FINBudgetEntriesSummary.calcfields(Allocation);
        FINBudgetEntriesSummary.calcfields(Commitments);
        FINBudgetEntriesSummary.calcfields(Expenses);
        FINBudgetEntriesSummary.calcfields(Balance);
        if (FINBudgetEntriesSummary.Allocation = 0) or (FINBudgetEntriesSummary.Allocation < 0) then CurrReport.Skip();
        if (FINBudgetEntriesSummary.Allocation = 0) or (FINBudgetEntriesSummary.Allocation < 0) then CurrReport.Skip();
        Percentage := ((FINBudgetEntriesSummary.Allocation - FINBudgetEntriesSummary.Balance) / FINBudgetEntriesSummary.Allocation)
    end;

    var
        Compinfo: Record "Company Information";
        seq: Integer;
        Percentage: Decimal;
}


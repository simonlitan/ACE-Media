codeunit 52178551 "Budget Balance"
{
    var
        BudgetEntries: Record "FIN-Budget Entries";
        Implines: Record "FIN-Imprest Lines";
        ImpHeader: Record "FIN-Imprest Header";


    procedure GetBudgetBalance(GLAccountNo: Code[10]; Dim1: Code[10]; Dim2: code[10]; BudgetCode: code[10]): Decimal
    var
        BalLesErr: Label 'The Budget Balance does not exist';
        Amnt: Decimal;
    begin
        BudgetEntries.Reset();
        BudgetEntries.SetRange("G/L Account No.", GLAccountNo);
        BudgetEntries.SetRange("Budget Name", BudgetCode);
        BudgetEntries.SetRange("Global Dimension 1 Code", Dim1);
        BudgetEntries.SetRange("Global Dimension 2 Code", Dim2);
        BudgetEntries.SetFilter("Commitment Status", '<>%1', BudgetEntries."Commitment Status"::"Commited/Posted");
        BudgetEntries.SetFilter("Transaction Type", '%1|%2|%3', BudgetEntries."Transaction Type"::Allocation, BudgetEntries."Transaction Type"::Commitment, BudgetEntries."Transaction Type"::Expense);
        if BudgetEntries.Findset then begin
            BudgetEntries.CalcSums(Amount);
            Amnt := BudgetEntries.Amount;
        end;
        if Amnt > 0 then
            exit(Amnt)
        // else
        // Error(BalLesErr);
    end;





    //Budget Balance for Imprest

    procedure SetBudgetBalance(var VarImprestHeader: Record "FIN-Imprest Header")
    var
        ImpLines: Record "FIN-Imprest Lines";
    begin
        ImpLines.Reset();
        Implines.SetRange(No, VarImprestHeader."No.");
        if ImpLines.FindSet() then
            repeat begin
                setBudgetBalance(ImpLines);
            end until ImpLines.Next() = 0;
    end;

    procedure setBudgetBalance(ImpLines: Record "FIN-Imprest Lines")
    begin
        ImpLines."Budget Balance" := GetBudgetBalance(ImpLines."Account No.", ImpLines."Global Dimension 1 Code", ImpLines."Shortcut Dimension 2 Code", ImpLines."Budget Name");
        ImpLines.Modify();
    end;
    //Surrender Balance
    procedure SetSurrBudgetBalance(var SurrHeader: Record "FIN-Imprest Surr. Header")
    var
        SurrLines: Record "FIN-Imprest Surrender Details";
    begin
        SurrLines.Reset();
        SurrLines.SetRange("Surrender Doc No.", SurrHeader."No");
        if SurrLines.FindSet() then
            repeat begin
                setSurrBudgetBalance(SurrLines);
            end until SurrLines.Next() = 0;
    end;

    procedure setSurrBudgetBalance(SurrLines: Record "FIN-Imprest Surrender Details")
    begin
        SurrLines."Budget Balance" := GetBudgetBalance(SurrLines."Account No:", SurrLines."Shortcut Dimension 1 Code", SurrLines."Shortcut Dimension 2 Code", SurrLines."Budget Name");
        SurrLines.Modify();
    end;

    //PV Budget Balance
    procedure setPvBudgetBalance(var PvHeader: Record "FIN-Payments Header")
    var
        pvlines: Record "FIN-Payment Line";
    begin
        pvlines.Reset();
        pvlines.SetRange(No, PvHeader."No.");
        if pvlines.FindSet() then
            repeat begin
                setPvBudgetBalance(pvlines);
            end until pvlines.Next() = 0;
        ;
    end;

    procedure setPvBudgetBalance(var PVLines: Record "FIN-Payment Line")
    var
        AccNo: Code[25];
    begin
        case
            PVLines."Account Type" of
            pvlines."Account Type"::"G/L Account":
                AccNo := PVLines."Account No.";
            PVLines."Account Type"::Vendor:
                begin
                    PVLines.CalcFields("Budgeted Acc");
                    if PVLines."Budgeted Acc" <> '' then
                        AccNo := PVLines."Budgeted Acc";
                end;
        end;
        if AccNo <> '' then begin
            PVLines."Budget Balance" := GetBudgetBalance(AccNo, PVLines."Global Dimension 1 Code", PVLines."Shortcut Dimension 2 Code", PVLines."Budget Name");

            PVLines.Modify();
        end;
    end;
    //PV Balances from posted Invoices

    procedure SetBudgetPVBalance(var PV: Record "FIN-Payments Header")
    var
        PVLines: Record "FIN-Payment Line";
    begin
        PVLines.Reset();
        PVLines.SetRange(No, PV."No.");
        if PVLines.FindSet() then
            repeat begin
                setBudgetPVBalance(PVLines);
            end until PVLines.Next() = 0;
    end;

    procedure setBudgetPVBalance(PVLines: Record "FIN-Payment Line")
    begin
        PVLines.CalcFields("Budgeted Acc");
        PVLines."Budget Balance" := GetBudgetBalance(PVLines."Budgeted Acc", PVLines."Global Dimension 1 Code", PVLines."Shortcut Dimension 2 Code", PVLines."Budget Name");
        PVLines.Modify();
    end;





}





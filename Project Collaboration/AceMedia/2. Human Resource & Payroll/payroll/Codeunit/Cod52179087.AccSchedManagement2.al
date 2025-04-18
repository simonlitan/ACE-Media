codeunit 52179087 "AccSchedManagement2"

{
    TableNo = "Acc. Schedule Line";

    trigger OnRun()
    begin
    end;

    var
        Text000: Label 'DEFAULT';
        Text001: Label 'Default Schedule';
        Text002: Label 'Default Columns';
        Text012: Label 'You have entered an illegal value or a nonexistent row number.';
        Text013: Label 'You have entered an illegal value or a nonexistent column number.';
        Text016: Label '%1\\ %2 %3 %4.', Locked = true;
        Text017: Label 'The error occurred when the program tried to calculate:\';
        Text018: Label 'Acc. Sched. Line: Row No. = %1, Line No. = %2, Totaling = %3\', Comment = '%1 = Row No., %2= Line No., %3 = Totaling';
        Text019: Label 'Acc. Sched. Column: Column No. = %1, Line No. = %2, Formula  = %3', Comment = '%1 = Column No., %2= Line No., %3 = Formula';
        Text020: Label 'Because of circular references, the program cannot calculate a formula.';
        AccSchedName: Record "Acc. Schedule Name";
        AccountScheduleLine: Record "Acc. Schedule Line";
        ColumnLayoutName: Record "Column Layout Name";
        RoundingFactor: Enum "Analysis Rounding Factor";
        AccSchedCellValue: Record "Acc. Sched. Cell Value" temporary;
        CurrExchRate: Record "Currency Exchange Rate";
        GLSetup: Record "General Ledger Setup";
        AddRepCurrency: Record Currency;
        AnalysisView: Record "Analysis View";
        MatrixMgt: Codeunit "Matrix Management";
        AccountingPeriodMgt: Codeunit "Accounting Period Mgt.";
        AnalysisViewRead: Boolean;
        StartDate: Date;
        EndDate: Date;
        FiscalStartDate: Date;
        DivisionError: Boolean;
        PeriodError: Boolean;
        CallLevel: Integer;
        CallingAccSchedLineID: Integer;
        CallingColumnLayoutID: Integer;
        OldAccSchedLineFilters: Text;
        OldColumnLayoutFilters: Text;
        OldAccSchedLineName: Code[10];
        OldColumnLayoutName: Code[10];
        OldCalcAddCurr: Boolean;
        GLSetupRead: Boolean;
        Text021: Label 'Conversion of dimension totaling filter %1 results in a filter that becomes too long.';
        BasePercentLine: array[50] of Integer;
        Text022: Label 'You cannot have more than %1 lines with %2 of %3.';
        Text023: Label 'Formulas ending with a percent sign require %2 %1 on a line before it.';
        Text024: Label 'The %1 %3 on the %2 must equal the %4 %6 on the %5 when any Dimension Totaling is used in any Column.';
        ColumnFormulaMsg: Label 'Column formula: %1.';
        RowFormulaMsg: Label 'Row formula: %1.';
        ColumnFormulaErrorMsg: Label 'Column formula: %1. \Error: %2.';
        Recalculate: Boolean;
        SystemGeneratedAccSchedQst: Label 'This account schedule may be automatically updated by the system, so any changes you make may be lost. Do you want to make a copy?';

    procedure OpenSchedule(var CurrentSchedName: Code[10]; var AccSchedLine: Record "Acc. Schedule Line")
    begin
        CheckTemplateAndSetFilter(CurrentSchedName, AccSchedLine);
    end;

    procedure OpenAndCheckSchedule(var CurrentSchedName: Code[10]; var AccSchedLine: Record "Acc. Schedule Line")
    var
        AccScheduleName: Record "Acc. Schedule Name";
        GeneralLedgerSetup: Record "General Ledger Setup";
        CopyAccountSchedule: Report "Copy Account Schedule";
        ConfirmManagement: Codeunit "Confirm Management";
    begin
        CheckTemplateAndSetFilter(CurrentSchedName, AccSchedLine);
        if AccSchedLine.IsEmpty() then
            exit;
        GeneralLedgerSetup.Get();
        if CurrentSchedName in
           [GeneralLedgerSetup."Acc. Sched. for Balance Sheet", GeneralLedgerSetup."Acc. Sched. for Cash Flow Stmt",
            GeneralLedgerSetup."Acc. Sched. for Income Stmt.", GeneralLedgerSetup."Acc. Sched. for Retained Earn."]
        then
            if ConfirmManagement.GetResponseOrDefault(SystemGeneratedAccSchedQst, true) then begin
                AccScheduleName.SetRange(Name, CurrentSchedName);
                CopyAccountSchedule.SetTableView(AccScheduleName);
                CopyAccountSchedule.RunModal;
                CurrentSchedName := CopyAccountSchedule.GetNewAccountScheduleName;
            end;
    end;

    local procedure CheckTemplateAndSetFilter(var CurrentSchedName: Code[10]; var AccSchedLine: Record "Acc. Schedule Line")
    begin
        CheckTemplateName(CurrentSchedName);
        AccSchedLine.FilterGroup(2);
        AccSchedLine.SetRange("Schedule Name", CurrentSchedName);
        AccSchedLine.FilterGroup(0);
    end;

    local procedure CheckTemplateName(var CurrentSchedName: Code[10])
    var
        AccSchedName: Record "Acc. Schedule Name";
    begin
        if not AccSchedName.Get(CurrentSchedName) then begin
            if not AccSchedName.FindFirst then begin
                AccSchedName.Init();
                AccSchedName.Name := Text000;
                AccSchedName.Description := Text001;
                AccSchedName.Insert();
                Commit();
            end;
            CurrentSchedName := AccSchedName.Name;
        end;
    end;

    procedure CheckName(CurrentSchedName: Code[10])
    var
        AccSchedName: Record "Acc. Schedule Name";
    begin
        AccSchedName.Get(CurrentSchedName);
    end;

    procedure SetName(CurrentSchedName: Code[10]; var AccSchedLine: Record "Acc. Schedule Line")
    begin
        AccSchedLine.FilterGroup(2);
        AccSchedLine.SetRange("Schedule Name", CurrentSchedName);
        AccSchedLine.FilterGroup(0);
        if AccSchedLine.Find('-') then;
    end;

    procedure LookupName(CurrentSchedName: Code[10]; var EntrdSchedName: Text[10]): Boolean
    var
        AccSchedName: Record "Acc. Schedule Name";
    begin
        AccSchedName.Name := CurrentSchedName;
        if PAGE.RunModal(0, AccSchedName) <> ACTION::LookupOK then
            exit(false);

        EntrdSchedName := AccSchedName.Name;
        exit(true);
    end;

    procedure OpenColumns(var CurrentColumnName: Code[10]; var ColumnLayout: Record "Column Layout")
    begin
        CheckColumnTemplateName(CurrentColumnName);
        ColumnLayout.FilterGroup(2);
        ColumnLayout.SetRange("Column Layout Name", CurrentColumnName);
        ColumnLayout.FilterGroup(0);
    end;

    local procedure CheckColumnTemplateName(var CurrentColumnName: Code[10])
    var
        ColumnLayoutName: Record "Column Layout Name";
    begin
        if not ColumnLayoutName.Get(CurrentColumnName) then begin
            if not ColumnLayoutName.FindFirst then begin
                ColumnLayoutName.Init();
                ColumnLayoutName.Name := Text000;
                ColumnLayoutName.Description := Text002;
                ColumnLayoutName.Insert();
                Commit();
            end;
            CurrentColumnName := ColumnLayoutName.Name;
        end;
    end;

    procedure CheckColumnName(CurrentColumnName: Code[10])
    var
        ColumnLayoutName: Record "Column Layout Name";
    begin
        ColumnLayoutName.Get(CurrentColumnName);
    end;

    procedure SetColumnName(CurrentColumnName: Code[10]; var ColumnLayout: Record "Column Layout")
    begin
        ColumnLayout.Reset();
        ColumnLayout.FilterGroup(2);
        ColumnLayout.SetRange("Column Layout Name", CurrentColumnName);
        ColumnLayout.FilterGroup(0);
    end;

    procedure CopyColumnsToTemp(NewColumnName: Code[10]; var TempColumnLayout: Record "Column Layout")
    var
        ColumnLayout: Record "Column Layout";
    begin
        TempColumnLayout.DeleteAll();
        ColumnLayout.SetRange("Column Layout Name", NewColumnName);
        if ColumnLayout.Find('-') then
            repeat
                TempColumnLayout := ColumnLayout;
                TempColumnLayout.Insert();
            until ColumnLayout.Next() = 0;
        if TempColumnLayout.Find('-') then;
    end;

    procedure LookupColumnName(CurrentColumnName: Code[10]; var EntrdColumnName: Text[10]): Boolean
    var
        ColumnLayoutName: Record "Column Layout Name";
    begin
        ColumnLayoutName.Name := CurrentColumnName;
        if PAGE.RunModal(0, ColumnLayoutName) <> ACTION::LookupOK then
            exit(false);

        EntrdColumnName := ColumnLayoutName.Name;
        exit(true);
    end;

    procedure CheckAnalysisView(CurrentSchedName: Code[10]; CurrentColumnName: Code[10]; TestColumnName: Boolean)
    var
        ColumnLayout2: Record "Column Layout";
        AnyColumnDimensions: Boolean;
    begin
        if not AnalysisViewRead then begin
            AnalysisViewRead := true;
            if CurrentSchedName <> AccSchedName.Name then begin
                CheckTemplateName(CurrentSchedName);
                AccSchedName.Get(CurrentSchedName);
            end;
            if TestColumnName then
                if CurrentColumnName <> ColumnLayoutName.Name then begin
                    CheckColumnTemplateName(CurrentColumnName);
                    ColumnLayoutName.Get(CurrentColumnName);
                end;
            if AccSchedName."Analysis View Name" = '' then begin
                GetGLSetup;
                AnalysisView.Init();
                AnalysisView."Dimension 1 Code" := GLSetup."Global Dimension 1 Code";
                AnalysisView."Dimension 2 Code" := GLSetup."Global Dimension 2 Code";
            end else
                AnalysisView.Get(AccSchedName."Analysis View Name");
            if AccSchedName."Analysis View Name" <> ColumnLayoutName."Analysis View Name" then begin
                AnyColumnDimensions := false;
                ColumnLayout2.SetRange("Column Layout Name", ColumnLayoutName.Name);
                if ColumnLayout2.Find('-') then
                    repeat
                        AnyColumnDimensions :=
                          (ColumnLayout2."Dimension 1 Totaling" <> '') or
                          (ColumnLayout2."Dimension 2 Totaling" <> '') or
                          (ColumnLayout2."Dimension 3 Totaling" <> '') or
                          (ColumnLayout2."Dimension 4 Totaling" <> '');
                    until AnyColumnDimensions or (ColumnLayout2.Next() = 0);
                if AnyColumnDimensions then
                    Error(
                      Text024,
                      AccSchedName.FieldCaption("Analysis View Name"),
                      AccSchedName.TableCaption,
                      AccSchedName."Analysis View Name",
                      ColumnLayoutName.FieldCaption("Analysis View Name"),
                      ColumnLayoutName.TableCaption,
                      ColumnLayoutName."Analysis View Name");
            end;
        end;
    end;

    local procedure AccPeriodStartEnd(ColumnLayout: Record "Column Layout"; Date: Date; var StartDate: Date; var EndDate: Date)
    var
        Steps: Integer;
        Type: Option " ",Period,"Fiscal Year";
        RangeFromType: Option Int,CP,LP;
        RangeToType: Option Int,CP,LP;
        RangeFromInt: Integer;
        RangeToInt: Integer;
    begin
        if ColumnLayout."Comparison Period Formula" = '' then
            exit;

        ColumnLayout.ParsePeriodFormula(
          ColumnLayout."Comparison Period Formula", Steps, Type, RangeFromType, RangeToType, RangeFromInt, RangeToInt);

        AccountingPeriodMgt.AccPeriodStartEnd(
          Date, StartDate, EndDate, PeriodError, Steps, Type, RangeFromType, RangeToType, RangeFromInt, RangeToInt);
    end;

    local procedure InitBasePercents(AccSchedLine: Record "Acc. Schedule Line"; ColumnLayout: Record "Column Layout")
    var
        BaseIdx: Integer;
    begin
        Clear(BasePercentLine);
        BaseIdx := 0;

        AccSchedLine.SetRange("Schedule Name", AccSchedLine."Schedule Name");
        if AccSchedLine.Find('-') then
            repeat
                if AccSchedLine."Totaling Type" = AccSchedLine."Totaling Type"::"Set Base For Percent" then begin
                    BaseIdx := BaseIdx + 1;
                    if BaseIdx > ArrayLen(BasePercentLine) then
                        ShowError(
                          StrSubstNo(Text022, ArrayLen(BasePercentLine), AccSchedLine.FieldCaption("Totaling Type"), AccSchedLine."Totaling Type"),
                          AccSchedLine, ColumnLayout);
                    BasePercentLine[BaseIdx] := AccSchedLine."Line No.";
                end;
            until AccSchedLine.Next() = 0;

        if BaseIdx = 0 then begin
            AccSchedLine."Totaling Type" := AccSchedLine."Totaling Type"::"Set Base For Percent";
            ShowError(
              StrSubstNo(Text023, AccSchedLine.FieldCaption("Totaling Type"), AccSchedLine."Totaling Type"),
              AccSchedLine, ColumnLayout);
        end;
    end;

    local procedure GetBasePercentLine(AccSchedLine: Record "Acc. Schedule Line"; ColumnLayout: Record "Column Layout"): Integer
    var
        BaseIdx: Integer;
    begin
        if BasePercentLine[1] = 0 then
            InitBasePercents(AccSchedLine, ColumnLayout);

        BaseIdx := ArrayLen(BasePercentLine);
        repeat
            if BasePercentLine[BaseIdx] <> 0 then
                if BasePercentLine[BaseIdx] < AccSchedLine."Line No." then
                    exit(BasePercentLine[BaseIdx]);
            BaseIdx := BaseIdx - 1;
        until BaseIdx = 0;

        AccSchedLine."Totaling Type" := AccSchedLine."Totaling Type"::"Set Base For Percent";
        ShowError(
          StrSubstNo(Text023, AccSchedLine.FieldCaption("Totaling Type"), AccSchedLine."Totaling Type"),
          AccSchedLine, ColumnLayout);
    end;

    local procedure GetGLSetup() Result: Boolean
    begin
        if not GLSetupRead then
            Result := GLSetup.Get();
        GLSetupRead := true;
    end;

    procedure CalcCell(var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean): Decimal
    var
        Result: Decimal;
    begin
        OnBeforeCalcCell(AccSchedLine, ColumnLayout, CalcAddCurr);

        AccountScheduleLine.CopyFilters(AccSchedLine);
        StartDate := AccountScheduleLine.GetRangeMin("Date Filter");
        if EndDate <> AccountScheduleLine.GetRangeMax("Date Filter") then begin
            EndDate := AccountScheduleLine.GetRangeMax("Date Filter");
            FiscalStartDate := AccountingPeriodMgt.FindFiscalYear(EndDate);
        end;
        DivisionError := false;
        PeriodError := false;
        CallLevel := 0;
        CallingAccSchedLineID := AccSchedLine."Line No.";
        CallingColumnLayoutID := ColumnLayout."Line No.";

        if (OldAccSchedLineFilters <> AccSchedLine.GetFilters) or
           (OldColumnLayoutFilters <> ColumnLayout.GetFilters) or
           (OldAccSchedLineName <> AccSchedLine."Schedule Name") or
           (OldColumnLayoutName <> ColumnLayout."Column Layout Name") or
           (OldCalcAddCurr <> CalcAddCurr) or
           Recalculate
        then begin
            AccSchedCellValue.Reset();
            AccSchedCellValue.DeleteAll();
            Clear(BasePercentLine);
            OldAccSchedLineFilters := AccSchedLine.GetFilters;
            OldColumnLayoutFilters := ColumnLayout.GetFilters;
            OldAccSchedLineName := AccSchedLine."Schedule Name";
            OldColumnLayoutName := ColumnLayout."Column Layout Name";
            OldCalcAddCurr := CalcAddCurr;
        end;

        Result := CalcCellValue(AccSchedLine, ColumnLayout, CalcAddCurr);
        case ColumnLayout.Show of
            ColumnLayout.Show::"When Positive":
                if Result < 0 then
                    Result := 0;
            ColumnLayout.Show::"When Negative":
                if Result > 0 then
                    Result := 0;
        end;
        if ColumnLayout."Show Opposite Sign" then
            Result := -Result;
        case ColumnLayout."Show Indented Lines" of
            ColumnLayout."Show Indented Lines"::"Indented Only":
                if AccSchedLine.Indentation = 0 then
                    Result := 0;
            ColumnLayout."Show Indented Lines"::"Non-Indented Only":
                if AccSchedLine.Indentation > 0 then
                    Result := 0;
        end;
        if AccSchedLine."Show Opposite Sign" then
            Result := -Result;

        OnBeforeCalcCellExit(AccSchedLine, ColumnLayout, CalcAddCurr, Result);
        exit(Result);
    end;

    procedure CalcCellValue(AccSchedLine: Record "Acc. Schedule Line"; ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean): Decimal
    var
        GLAcc: Record "G/L Account";
        CostType: Record "Cost Type";
        CFAccount: Record "Cash Flow Account";
        Result: Decimal;
    begin
        Result := 0;
        OnBeforeCalcCellValue(AccSchedLine, ColumnLayout, CalcAddCurr, Result);

        if AccSchedLine.Totaling = '' then
            exit(Result);

        if AccSchedCellValue.Get(AccSchedLine."Line No.", ColumnLayout."Line No.") then begin
            Result := AccSchedCellValue.Value;
            DivisionError := DivisionError or AccSchedCellValue."Has Error";
            PeriodError := PeriodError or AccSchedCellValue."Period Error";
        end else begin
            if ColumnLayout."Column Type" = ColumnLayout."Column Type"::Formula then
                Result :=
                  EvaluateExpression(
                    false, ColumnLayout.Formula, AccSchedLine, ColumnLayout, CalcAddCurr)
            else
                if AccSchedLine."Totaling Type" in
                   [AccSchedLine."Totaling Type"::Formula, AccSchedLine."Totaling Type"::"Set Base For Percent"]
                then
                    Result :=
                      EvaluateExpression(
                        true, AccSchedLine.Totaling, AccSchedLine, ColumnLayout, CalcAddCurr)
                else
                    if (StartDate = 0D) or (EndDate = 0D) or (EndDate = DMY2Date(31, 12, 9999)) then begin
                        Result := 0;
                        PeriodError := true;
                    end else
                        case AccSchedLine."Totaling Type" of
                            AccSchedLine."Totaling Type"::"Posting Accounts",
                            AccSchedLine."Totaling Type"::"Total Accounts":
                                begin
                                    AccSchedLine.CopyFilters(AccountScheduleLine);
                                    SetGLAccRowFilters(GLAcc, AccSchedLine);
                                    SetGLAccColumnFilters(GLAcc, AccSchedLine, ColumnLayout);
                                    if (AccSchedLine."Totaling Type" = AccSchedLine."Totaling Type"::"Posting Accounts") and
                                       (StrLen(AccSchedLine.Totaling) <= MaxStrLen(GLAcc.Totaling)) and (StrPos(AccSchedLine.Totaling, '*') = 0)
                                    then begin
                                        GLAcc."Account Type" := GLAcc."Account Type"::Total;
                                        GLAcc.Totaling := AccSchedLine.Totaling;
                                        Result := Result + CalcGLAcc(GLAcc, AccSchedLine, ColumnLayout, CalcAddCurr);
                                    end else
                                        if GLAcc.Find('-') then
                                            repeat
                                                Result := Result + CalcGLAcc(GLAcc, AccSchedLine, ColumnLayout, CalcAddCurr);
                                            until GLAcc.Next() = 0;
                                end;
                            AccSchedLine."Totaling Type"::"Cost Type",
                            AccSchedLine."Totaling Type"::"Cost Type Total":
                                begin
                                    AccSchedLine.CopyFilters(AccountScheduleLine);
                                    SetCostTypeRowFilters(CostType, AccSchedLine, ColumnLayout);
                                    SetCostTypeColumnFilters(CostType, AccSchedLine, ColumnLayout);
                                    if (AccSchedLine."Totaling Type" = AccSchedLine."Totaling Type"::"Cost Type") and
                                       (StrLen(AccSchedLine.Totaling) <= MaxStrLen(GLAcc.Totaling)) and (StrPos(AccSchedLine.Totaling, '*') = 0)
                                    then begin
                                        CostType.Type := CostType.Type::Total;
                                        CostType.Totaling := AccSchedLine.Totaling;
                                        Result := Result + CalcCostType(CostType, AccSchedLine, ColumnLayout, CalcAddCurr);
                                    end else
                                        if CostType.Find('-') then
                                            repeat
                                                Result := Result + CalcCostType(CostType, AccSchedLine, ColumnLayout, CalcAddCurr);
                                            until CostType.Next() = 0;
                                end;
                            AccSchedLine."Totaling Type"::"Cash Flow Entry Accounts",
                            AccSchedLine."Totaling Type"::"Cash Flow Total Accounts":
                                begin
                                    AccSchedLine.CopyFilters(AccountScheduleLine);
                                    SetCFAccRowFilter(CFAccount, AccSchedLine);
                                    SetCFAccColumnFilter(CFAccount, AccSchedLine, ColumnLayout);
                                    if (AccSchedLine."Totaling Type" = AccSchedLine."Totaling Type"::"Cash Flow Entry Accounts") and
                                       (StrLen(AccSchedLine.Totaling) <= 30)
                                    then begin
                                        CFAccount."Account Type" := CFAccount."Account Type"::Total;
                                        CFAccount.Totaling := AccSchedLine.Totaling;
                                        Result := Result + CalcCFAccount(CFAccount, AccSchedLine, ColumnLayout);
                                    end else
                                        if CFAccount.Find('-') then
                                            repeat
                                                Result := Result + CalcCFAccount(CFAccount, AccSchedLine, ColumnLayout);
                                            until CFAccount.Next() = 0;
                                end;
                        end;

            OnAfterCalcCellValue(AccSchedLine, ColumnLayout, Result);

            AccSchedCellValue."Row No." := AccSchedLine."Line No.";
            AccSchedCellValue."Column No." := ColumnLayout."Line No.";
            AccSchedCellValue.Value := Result;
            AccSchedCellValue."Has Error" := DivisionError;
            AccSchedCellValue."Period Error" := PeriodError;
            AccSchedCellValue.Insert();
        end;

        OnCalcCellValueOnBeforeExit(AccSchedLine, ColumnLayout, CalcAddCurr, StartDate, EndDate, Result);
        exit(Result);
    end;

    local procedure CalcGLAcc(var GLAcc: Record "G/L Account"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean) ColValue: Decimal
    var
        GLEntry: Record "G/L Entry";
        GLBudgEntry: Record "G/L Budget Entry";
        AnalysisViewEntry: Record "Analysis View Entry";
        AnalysisViewBudgetEntry: Record "Analysis View Budget Entry";
        AmountType: Enum "Account Schedule Amount Type";
        TestBalance: Boolean;
        Balance: Decimal;
        UseBusUnitFilter: Boolean;
        UseDimFilter: Boolean;
        IsHandled: Boolean;
    begin
        ColValue := 0;
        IsHandled := false;
        OnBeforeCalcGLAcc(GLAcc, AccSchedLine, ColumnLayout, CalcAddCurr, ColValue, IsHandled);
        if IsHandled then
            exit(ColValue);

        UseDimFilter := false;
        if AccSchedName.Name <> AccSchedLine."Schedule Name" then
            AccSchedName.Get(AccSchedLine."Schedule Name");

        if ConflictAmountType(AccSchedLine, ColumnLayout."Amount Type", AmountType) then
            exit(0);

        TestBalance :=
          AccSchedLine.Show in [AccSchedLine.Show::"When Positive Balance", AccSchedLine.Show::"When Negative Balance"];
        if ColumnLayout."Column Type" <> ColumnLayout."Column Type"::Formula then begin
            UseBusUnitFilter := (AccSchedLine.GetFilter("Business Unit Filter") <> '') or (ColumnLayout."Business Unit Totaling" <> '');
            UseDimFilter := HasDimFilter(AccSchedLine, ColumnLayout);
            case ColumnLayout."Ledger Entry Type" of
                ColumnLayout."Ledger Entry Type"::Entries:
                    if AccSchedName."Analysis View Name" = '' then begin
                        SetGLAccGLEntryFilters(GLAcc, GLEntry, AccSchedLine, ColumnLayout, UseBusUnitFilter, UseDimFilter);
                        case AmountType of
                            AmountType::"Net Amount":
                                begin
                                    if CalcAddCurr then begin
                                        GLEntry.CalcSums("Additional-Currency Amount");
                                        ColValue := GLEntry."Additional-Currency Amount";
                                    end else begin
                                        GLEntry.CalcSums(Amount);
                                        ColValue := GLEntry.Amount;
                                    end;
                                    Balance := ColValue;
                                end;
                            AmountType::"Debit Amount":
                                if CalcAddCurr then begin
                                    if TestBalance then begin
                                        GLEntry.CalcSums("Add.-Currency Debit Amount", "Additional-Currency Amount");
                                        Balance := GLEntry."Additional-Currency Amount";
                                    end else
                                        GLEntry.CalcSums("Add.-Currency Debit Amount");
                                    ColValue := GLEntry."Add.-Currency Debit Amount";
                                end else begin
                                    if TestBalance then begin
                                        GLEntry.CalcSums("Debit Amount", Amount);
                                        Balance := GLEntry.Amount;
                                    end else
                                        GLEntry.CalcSums("Debit Amount");
                                    ColValue := GLEntry."Debit Amount";
                                end;
                            AmountType::"Credit Amount":
                                if CalcAddCurr then begin
                                    if TestBalance then begin
                                        GLEntry.CalcSums("Add.-Currency Credit Amount", "Additional-Currency Amount");
                                        Balance := GLEntry."Additional-Currency Amount";
                                    end else
                                        GLEntry.CalcSums("Add.-Currency Credit Amount");
                                    ColValue := GLEntry."Add.-Currency Credit Amount";
                                end else begin
                                    if TestBalance then begin
                                        GLEntry.CalcSums("Credit Amount", Amount);
                                        Balance := GLEntry.Amount;
                                    end else
                                        GLEntry.CalcSums("Credit Amount");
                                    ColValue := GLEntry."Credit Amount";
                                end;
                        end;
                    end
                    else begin
                        SetGLAccAnalysisViewEntryFilters(GLAcc, AnalysisViewEntry, AccSchedLine, ColumnLayout);
                        case AmountType of
                            AmountType::"Net Amount":
                                begin
                                    if CalcAddCurr then begin
                                        AnalysisViewEntry.CalcSums("Add.-Curr. Amount");
                                        ColValue := AnalysisViewEntry."Add.-Curr. Amount";
                                    end else begin
                                        AnalysisViewEntry.CalcSums(Amount);
                                        ColValue := AnalysisViewEntry.Amount;
                                    end;
                                    Balance := ColValue;
                                end;
                            AmountType::"Debit Amount":
                                if CalcAddCurr then begin
                                    if TestBalance then begin
                                        AnalysisViewEntry.CalcSums("Add.-Curr. Debit Amount", "Add.-Curr. Amount");
                                        Balance := AnalysisViewEntry."Add.-Curr. Amount";
                                    end else
                                        AnalysisViewEntry.CalcSums("Add.-Curr. Debit Amount");
                                    ColValue := AnalysisViewEntry."Add.-Curr. Debit Amount";
                                end else begin
                                    if TestBalance then begin
                                        AnalysisViewEntry.CalcSums("Debit Amount", Amount);
                                        Balance := AnalysisViewEntry.Amount;
                                    end else
                                        AnalysisViewEntry.CalcSums("Debit Amount");
                                    ColValue := AnalysisViewEntry."Debit Amount";
                                end;
                            AmountType::"Credit Amount":
                                if CalcAddCurr then begin
                                    if TestBalance then begin
                                        AnalysisViewEntry.CalcSums("Add.-Curr. Credit Amount", "Add.-Curr. Amount");
                                        Balance := AnalysisViewEntry."Add.-Curr. Amount";
                                    end else
                                        AnalysisViewEntry.CalcSums("Add.-Curr. Credit Amount");
                                    ColValue := AnalysisViewEntry."Add.-Curr. Credit Amount";
                                end else begin
                                    if TestBalance then begin
                                        AnalysisViewEntry.CalcSums("Credit Amount", Amount);
                                        Balance := AnalysisViewEntry.Amount;
                                    end else
                                        AnalysisViewEntry.CalcSums("Credit Amount");
                                    ColValue := AnalysisViewEntry."Credit Amount";
                                end;
                        end;
                    end;
                ColumnLayout."Ledger Entry Type"::"Budget Entries":
                    begin
                        if AccSchedName."Analysis View Name" = '' then begin
                            SetGLAccGLBudgetEntryFilters(GLAcc, GLBudgEntry, AccSchedLine, ColumnLayout, UseBusUnitFilter, UseDimFilter);
                            case AmountType of
                                AmountType::"Net Amount":
                                    begin
                                        GLBudgEntry.CalcSums(Amount);
                                        ColValue := GLBudgEntry.Amount;
                                    end;
                                AmountType::"Debit Amount":
                                    begin
                                        GLBudgEntry.CalcSums(Amount);
                                        ColValue := GLBudgEntry.Amount;
                                        if ColValue < 0 then
                                            ColValue := 0;
                                    end;
                                AmountType::"Credit Amount":
                                    begin
                                        GLBudgEntry.CalcSums(Amount);
                                        ColValue := -GLBudgEntry.Amount;
                                        if ColValue < 0 then
                                            ColValue := 0;
                                    end;
                            end;
                            Balance := GLBudgEntry.Amount;
                        end
                        else begin
                            SetGLAccAnalysisViewBudgetEntries(GLAcc, AnalysisViewBudgetEntry, AccSchedLine, ColumnLayout);
                            case AmountType of
                                AmountType::"Net Amount":
                                    begin
                                        AnalysisViewBudgetEntry.CalcSums(Amount);
                                        ColValue := AnalysisViewBudgetEntry.Amount;
                                    end;
                                AmountType::"Debit Amount":
                                    begin
                                        AnalysisViewBudgetEntry.CalcSums(Amount);
                                        ColValue := AnalysisViewBudgetEntry.Amount;
                                        if ColValue < 0 then
                                            ColValue := 0;
                                    end;
                                AmountType::"Credit Amount":
                                    begin
                                        AnalysisViewBudgetEntry.CalcSums(Amount);
                                        ColValue := -AnalysisViewBudgetEntry.Amount;
                                        if ColValue < 0 then
                                            ColValue := 0;
                                    end;
                            end;
                            Balance := AnalysisViewBudgetEntry.Amount;
                        end;
                        if CalcAddCurr then
                            ColValue := CalcLCYToACY(ColValue);
                    end;
            end;

            OnBeforeTestBalance(
              GLAcc, AccSchedName, AccSchedLine, ColumnLayout, AmountType.AsInteger(), ColValue, CalcAddCurr, TestBalance, GLEntry, GLBudgEntry);

            if TestBalance then begin
                if AccSchedLine.Show = AccSchedLine.Show::"When Positive Balance" then
                    if Balance < 0 then
                        exit(0);
                if AccSchedLine.Show = AccSchedLine.Show::"When Negative Balance" then
                    if Balance > 0 then
                        exit(0);
            end;
        end;
        exit(ColValue);
    end;

    local procedure CalcCFAccount(var CFAccount: Record "Cash Flow Account"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout") ColValue: Decimal
    var
        CFForecastEntry: Record "Cash Flow Forecast Entry";
        AnalysisViewEntry: Record "Analysis View Entry";
        AmountType: Enum "Account Schedule Amount Type";
        IsHandled: Boolean;
    begin
        ColValue := 0;
        IsHandled := false;
        OnBeforeCalcCFAcc(CFAccount, AccSchedLine, ColumnLayout, ColValue, IsHandled);
        if IsHandled then
            exit(ColValue);

        if AccSchedName.Name <> AccSchedLine."Schedule Name" then
            AccSchedName.Get(AccSchedLine."Schedule Name");

        if ConflictAmountType(AccSchedLine, ColumnLayout."Amount Type", AmountType) then
            exit(0);

        if ColumnLayout."Column Type" <> ColumnLayout."Column Type"::Formula then
            case ColumnLayout."Ledger Entry Type" of
                ColumnLayout."Ledger Entry Type"::Entries:
                    if AccSchedName."Analysis View Name" = '' then begin
                        SetCFEntryFilters(CFAccount, CFForecastEntry, AccSchedLine, ColumnLayout);
                        case ColumnLayout."Amount Type" of
                            ColumnLayout."Amount Type"::"Net Amount":
                                begin
                                    CFForecastEntry.CalcSums("Amount (LCY)");
                                    ColValue := CFForecastEntry."Amount (LCY)";
                                end;
                        end;
                    end
                    else begin
                        SetCFAnalysisViewEntryFilters(CFAccount, AnalysisViewEntry, AccSchedLine, ColumnLayout);
                        case ColumnLayout."Amount Type" of
                            ColumnLayout."Amount Type"::"Net Amount":
                                begin
                                    AnalysisViewEntry.CalcSums(Amount);
                                    ColValue := AnalysisViewEntry.Amount;
                                end;
                        end;
                    end;
            end;

        exit(ColValue);
    end;

    local procedure CalcCellValueInAccSchedLines(SourceAccSchedLine: Record "Acc. Schedule Line"; ColumnLayout: Record "Column Layout"; Expression: Text; CalcAddCurr: Boolean; IsFilter: Boolean) Result: Decimal
    var
        AccSchedLine: Record "Acc. Schedule Line";
        IsHandled: Boolean;
        CellValue: Decimal;
    begin
        AccSchedLine.SetRange("Schedule Name", SourceAccSchedLine."Schedule Name");
        AccSchedLine.SetFilter("Row No.", Expression);
        if AccSchedLine.Find('-') then
            repeat
                if AccSchedLine."Line No." <> SourceAccSchedLine."Line No." then begin
                    IsHandled := false;
                    OnEvaluateExpressionOnBeforeCalcAccSchedLineCellValue(
                        SourceAccSchedLine, AccSchedLine, ColumnLayout, CalcAddCurr, IsHandled, CellValue);
                    if IsHandled then
                        Result += CellValue
                    else
                        Result := Result + CalcCellValue(AccSchedLine, ColumnLayout, CalcAddCurr);
                end;
            until AccSchedLine.Next() = 0
        else
            if IsFilter or (not Evaluate(Result, Expression)) then
                ShowError(Text012, SourceAccSchedLine, ColumnLayout);
    end;

    local procedure CalcCellValueInColumnLayouts(SourceColumnLayout: Record "Column Layout"; AccSchedLine: Record "Acc. Schedule Line"; Expression: Text; CalcAddCurr: Boolean; IsFilter: Boolean) Result: Decimal
    var
        ColumnLayout: Record "Column Layout";
        IsHandled: Boolean;
        CellValue: Decimal;
    begin
        ColumnLayout.SetRange("Column Layout Name", SourceColumnLayout."Column Layout Name");
        ColumnLayout.SetFilter("Column No.", Expression);
        if ColumnLayout.Find('-') then
            repeat
                if ColumnLayout."Line No." <> SourceColumnLayout."Line No." then begin
                    IsHandled := false;
                    OnEvaluateExpressionOnBeforeCalcColumnLayoutCellValue(
                      SourceColumnLayout, AccSchedLine, ColumnLayout, CalcAddCurr, IsHandled, CellValue);
                    if IsHandled then
                        Result += CellValue
                    else
                        Result := Result + CalcCellValue(AccSchedLine, ColumnLayout, CalcAddCurr);
                end;
            until ColumnLayout.Next() = 0
        else
            if IsFilter or (not Evaluate(Result, Expression)) then
                ShowError(Text013, AccSchedLine, SourceColumnLayout);
    end;

    procedure SetGLAccRowFilters(var GLAcc: Record "G/L Account"; var AccSchedLine2: Record "Acc. Schedule Line")
    begin
        case AccSchedLine2."Totaling Type" of
            AccSchedLine2."Totaling Type"::"Posting Accounts":
                begin
                    GLAcc.SetFilter("No.", AccSchedLine2.Totaling);
                    GLAcc.SetRange("Account Type", GLAcc."Account Type"::Posting);
                end;
            AccSchedLine2."Totaling Type"::"Total Accounts":
                begin
                    GLAcc.SetFilter("No.", AccSchedLine2.Totaling);
                    GLAcc.SetFilter("Account Type", '<>%1', GLAcc."Account Type"::Posting);
                end;
        end;

        OnAfterSetGLAccRowFilters(GLAcc, AccSchedLine2);
    end;

    local procedure SetGLAccGLEntryFilters(var GLAcc: Record "G/L Account"; var GLEntry: Record "G/L Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; UseBusUnitFilter: Boolean; UseDimFilter: Boolean)
    begin
        if UseBusUnitFilter then
            if UseDimFilter then
                GLEntry.SetCurrentKey(
                  "G/L Account No.", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code")
            else
                GLEntry.SetCurrentKey(
                  "G/L Account No.", "Business Unit Code", "Posting Date")
        else
            if UseDimFilter then
                GLEntry.SetCurrentKey("G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code")
            else
                GLEntry.SetCurrentKey("G/L Account No.", "Posting Date");
        if GLAcc.Totaling = '' then
            GLEntry.SetRange("G/L Account No.", GLAcc."No.")
        else
            GLEntry.SetFilter("G/L Account No.", GLAcc.Totaling);
        GLAcc.CopyFilter("Date Filter", GLEntry."Posting Date");
        AccSchedLine.CopyFilter("Business Unit Filter", GLEntry."Business Unit Code");
        AccSchedLine.CopyFilter("Dimension 1 Filter", GLEntry."Global Dimension 1 Code");
        AccSchedLine.CopyFilter("Dimension 2 Filter", GLEntry."Global Dimension 2 Code");
        GLEntry.FilterGroup(2);
        GLEntry.SetFilter("Global Dimension 1 Code", GetDimTotalingFilter(1, AccSchedLine."Dimension 1 Totaling"));
        GLEntry.SetFilter("Global Dimension 2 Code", GetDimTotalingFilter(2, AccSchedLine."Dimension 2 Totaling"));
        GLEntry.FilterGroup(8);
        GLEntry.SetFilter("Global Dimension 1 Code", GetDimTotalingFilter(1, ColumnLayout."Dimension 1 Totaling"));
        GLEntry.SetFilter("Global Dimension 2 Code", GetDimTotalingFilter(2, ColumnLayout."Dimension 2 Totaling"));
        GLEntry.SetFilter("Business Unit Code", ColumnLayout."Business Unit Totaling");
        GLEntry.FilterGroup(0);

        OnAfterSetGLAccGLEntryFilters(GLAcc, GLEntry, AccSchedLine, ColumnLayout, UseBusUnitFilter, UseDimFilter);
    end;

    local procedure SetGLAccGLBudgetEntryFilters(var GLAcc: Record "G/L Account"; var GLBudgetEntry: Record "G/L Budget Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; UseBusUnitFilter: Boolean; UseDimFilter: Boolean)
    begin
        if UseBusUnitFilter or UseDimFilter then
            GLBudgetEntry.SetCurrentKey(
              "Budget Name", "G/L Account No.", "Business Unit Code",
              "Global Dimension 1 Code", "Global Dimension 2 Code",
              "Budget Dimension 1 Code", "Budget Dimension 2 Code",
              "Budget Dimension 3 Code", "Budget Dimension 4 Code", Date)
        else
            GLBudgetEntry.SetCurrentKey("Budget Name", "G/L Account No.", Date);
        if GLAcc.Totaling = '' then
            GLBudgetEntry.SetRange("G/L Account No.", GLAcc."No.")
        else
            GLBudgetEntry.SetFilter("G/L Account No.", GLAcc.Totaling);
        GLAcc.CopyFilter("Date Filter", GLBudgetEntry.Date);
        AccSchedLine.CopyFilter("G/L Budget Filter", GLBudgetEntry."Budget Name");
        AccSchedLine.CopyFilter("Business Unit Filter", GLBudgetEntry."Business Unit Code");
        AccSchedLine.CopyFilter("Dimension 1 Filter", GLBudgetEntry."Global Dimension 1 Code");
        AccSchedLine.CopyFilter("Dimension 2 Filter", GLBudgetEntry."Global Dimension 2 Code");
        GLBudgetEntry.FilterGroup(2);
        GLBudgetEntry.SetFilter("Global Dimension 1 Code", GetDimTotalingFilter(1, AccSchedLine."Dimension 1 Totaling"));
        GLBudgetEntry.SetFilter("Global Dimension 2 Code", GetDimTotalingFilter(2, AccSchedLine."Dimension 2 Totaling"));
        GLBudgetEntry.FilterGroup(8);
        GLBudgetEntry.SetFilter("Global Dimension 1 Code", GetDimTotalingFilter(1, ColumnLayout."Dimension 1 Totaling"));
        GLBudgetEntry.SetFilter("Global Dimension 2 Code", GetDimTotalingFilter(2, ColumnLayout."Dimension 2 Totaling"));
        GLBudgetEntry.SetFilter("Business Unit Code", ColumnLayout."Business Unit Totaling");
        GLBudgetEntry.FilterGroup(0);

        OnAfterSetGLAccGLBudgetEntryFilters(GLAcc, GLBudgetEntry, AccSchedLine, ColumnLayout, UseBusUnitFilter, UseDimFilter);
    end;

    local procedure SetGLAccAnalysisViewBudgetEntries(var GLAcc: Record "G/L Account"; var AnalysisViewBudgetEntry: Record "Analysis View Budget Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
        if GLAcc.Totaling = '' then
            AnalysisViewBudgetEntry.SetRange("G/L Account No.", GLAcc."No.")
        else
            AnalysisViewBudgetEntry.SetFilter("G/L Account No.", GLAcc.Totaling);
        AnalysisViewBudgetEntry.SetRange("Analysis View Code", AccSchedName."Analysis View Name");
        GLAcc.CopyFilter("Date Filter", AnalysisViewBudgetEntry."Posting Date");
        AccSchedLine.CopyFilter("G/L Budget Filter", AnalysisViewBudgetEntry."Budget Name");
        AccSchedLine.CopyFilter("Business Unit Filter", AnalysisViewBudgetEntry."Business Unit Code");
        AnalysisViewBudgetEntry.CopyDimFilters(AccSchedLine);
        AnalysisViewBudgetEntry.FilterGroup(2);
        AnalysisViewBudgetEntry.SetDimFilters(
          GetDimTotalingFilter(1, AccSchedLine."Dimension 1 Totaling"),
          GetDimTotalingFilter(2, AccSchedLine."Dimension 2 Totaling"),
          GetDimTotalingFilter(3, AccSchedLine."Dimension 3 Totaling"),
          GetDimTotalingFilter(4, AccSchedLine."Dimension 4 Totaling"));
        AnalysisViewBudgetEntry.FilterGroup(8);
        AnalysisViewBudgetEntry.SetDimFilters(
          GetDimTotalingFilter(1, ColumnLayout."Dimension 1 Totaling"),
          GetDimTotalingFilter(2, ColumnLayout."Dimension 2 Totaling"),
          GetDimTotalingFilter(3, ColumnLayout."Dimension 3 Totaling"),
          GetDimTotalingFilter(4, ColumnLayout."Dimension 4 Totaling"));
        AnalysisViewBudgetEntry.SetFilter("Business Unit Code", ColumnLayout."Business Unit Totaling");
        AnalysisViewBudgetEntry.FilterGroup(0);

        OnAfterSetGLAccAnalysisViewBudgetEntries(GLAcc, AnalysisViewBudgetEntry, AccSchedLine, ColumnLayout);
    end;

    local procedure SetGLAccAnalysisViewEntryFilters(var GLAcc: Record "G/L Account"; var AnalysisViewEntry: Record "Analysis View Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
        AnalysisViewEntry.SetRange("Analysis View Code", AccSchedName."Analysis View Name");
        AnalysisViewEntry.SetRange("Account Source", AnalysisViewEntry."Account Source"::"G/L Account");
        if GLAcc.Totaling = '' then
            AnalysisViewEntry.SetRange("Account No.", GLAcc."No.")
        else
            AnalysisViewEntry.SetFilter("Account No.", GLAcc.Totaling);
        GLAcc.CopyFilter("Date Filter", AnalysisViewEntry."Posting Date");
        AccSchedLine.CopyFilter("Business Unit Filter", AnalysisViewEntry."Business Unit Code");
        AnalysisViewEntry.CopyDimFilters(AccSchedLine);
        AnalysisViewEntry.FilterGroup(2);
        AnalysisViewEntry.SetDimFilters(
          GetDimTotalingFilter(1, AccSchedLine."Dimension 1 Totaling"),
          GetDimTotalingFilter(2, AccSchedLine."Dimension 2 Totaling"),
          GetDimTotalingFilter(3, AccSchedLine."Dimension 3 Totaling"),
          GetDimTotalingFilter(4, AccSchedLine."Dimension 4 Totaling"));
        AnalysisViewEntry.FilterGroup(8);
        AnalysisViewEntry.SetDimFilters(
          GetDimTotalingFilter(1, ColumnLayout."Dimension 1 Totaling"),
          GetDimTotalingFilter(2, ColumnLayout."Dimension 2 Totaling"),
          GetDimTotalingFilter(3, ColumnLayout."Dimension 3 Totaling"),
          GetDimTotalingFilter(4, ColumnLayout."Dimension 4 Totaling"));
        AnalysisViewEntry.SetFilter("Business Unit Code", ColumnLayout."Business Unit Totaling");
        AnalysisViewEntry.FilterGroup(0);

        OnAfterSetGLAccAnalysisViewEntryFilters(GLAcc, AnalysisViewEntry, AccSchedLine, ColumnLayout);
    end;

    procedure SetCFAccRowFilter(var CFAccount: Record "Cash Flow Account"; var AccSchedLine2: Record "Acc. Schedule Line")
    begin
        AccSchedLine2.CopyFilter("Cash Flow Forecast Filter", CFAccount."Cash Flow Forecast Filter");

        case AccSchedLine2."Totaling Type" of
            AccSchedLine2."Totaling Type"::"Cash Flow Entry Accounts":
                begin
                    CFAccount.SetFilter("No.", AccSchedLine2.Totaling);
                    CFAccount.SetRange("Account Type", CFAccount."Account Type"::Entry);
                end;
            AccSchedLine2."Totaling Type"::"Cash Flow Total Accounts":
                begin
                    CFAccount.SetFilter("No.", AccSchedLine2.Totaling);
                    CFAccount.SetFilter("Account Type", '<>%1', CFAccount."Account Type"::Entry);
                end;
        end;

        OnAfterSetCFAccRowFilter(CFAccount, AccSchedLine2);
    end;

    procedure SetGLAccColumnFilters(var GLAcc: Record "G/L Account"; AccSchedLine2: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    var
        FromDate: Date;
        ToDate: Date;
        FiscalStartDate2: Date;
    begin
        CalcColumnDates(ColumnLayout, FromDate, ToDate, FiscalStartDate2);
        case ColumnLayout."Column Type" of
            ColumnLayout."Column Type"::"Net Change":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        GLAcc.SetRange("Date Filter", FromDate, ToDate);
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        GLAcc.SetFilter("Date Filter", '..%1', ClosingDate(FromDate - 1)); // always includes closing date
                    AccSchedLine2."Row Type"::"Balance at Date":
                        GLAcc.SetRange("Date Filter", 0D, ToDate);
                end;
            ColumnLayout."Column Type"::"Balance at Date":
                if AccSchedLine2."Row Type" = AccSchedLine2."Row Type"::"Beginning Balance" then
                    GLAcc.SetRange("Date Filter", 0D) // Force a zero return
                else
                    GLAcc.SetRange("Date Filter", 0D, ToDate);
            ColumnLayout."Column Type"::"Beginning Balance":
                if AccSchedLine2."Row Type" = AccSchedLine2."Row Type"::"Balance at Date" then
                    GLAcc.SetRange("Date Filter", 0D) // Force a zero return
                else
                    GLAcc.SetRange(
                      "Date Filter", 0D, ClosingDate(FromDate - 1));
            ColumnLayout."Column Type"::"Year to Date":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        GLAcc.SetRange("Date Filter", FiscalStartDate2, ToDate);
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        GLAcc.SetFilter("Date Filter", '..%1', ClosingDate(FiscalStartDate2 - 1)); // always includes closing date
                    AccSchedLine2."Row Type"::"Balance at Date":
                        GLAcc.SetRange("Date Filter", 0D, ToDate);
                end;
            ColumnLayout."Column Type"::"Rest of Fiscal Year":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        GLAcc.SetRange(
                          "Date Filter", CalcDate('<+1D>', ToDate), AccountingPeriodMgt.FindEndOfFiscalYear(FiscalStartDate2));
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        GLAcc.SetRange("Date Filter", 0D, ToDate);
                    AccSchedLine2."Row Type"::"Balance at Date":
                        GLAcc.SetRange("Date Filter", 0D, AccountingPeriodMgt.FindEndOfFiscalYear(ToDate));
                end;
            ColumnLayout."Column Type"::"Entire Fiscal Year":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        GLAcc.SetRange(
                          "Date Filter",
                          FiscalStartDate2,
                          AccountingPeriodMgt.FindEndOfFiscalYear(FiscalStartDate2));
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        GLAcc.SetFilter("Date Filter", '..%1', ClosingDate(FiscalStartDate2 - 1)); // always includes closing date
                    AccSchedLine2."Row Type"::"Balance at Date":
                        GLAcc.SetRange("Date Filter", 0D, AccountingPeriodMgt.FindEndOfFiscalYear(ToDate));
                end;
        end;

        OnAfterSetGLAccColumnFilters(GLAcc, AccSchedLine2, ColumnLayout)
    end;

    procedure SetCFAccColumnFilter(var CFAccount: Record "Cash Flow Account"; AccSchedLine2: Record "Acc. Schedule Line"; var ColumnLayout2: Record "Column Layout")
    var
        FromDate: Date;
        ToDate: Date;
        FiscalStartDate2: Date;
    begin
        CalcColumnDates(ColumnLayout2, FromDate, ToDate, FiscalStartDate2);
        case ColumnLayout2."Column Type" of
            ColumnLayout2."Column Type"::"Net Change":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        CFAccount.SetRange("Date Filter", FromDate, ToDate);
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        CFAccount.SetFilter("Date Filter", '..%1', ClosingDate(FromDate - 1));
                    AccSchedLine2."Row Type"::"Balance at Date":
                        CFAccount.SetRange("Date Filter", 0D, ToDate);
                end;
            ColumnLayout2."Column Type"::"Balance at Date":
                if AccSchedLine2."Row Type" = AccSchedLine2."Row Type"::"Beginning Balance" then
                    CFAccount.SetRange("Date Filter", 0D) // Force a zero return
                else
                    CFAccount.SetRange("Date Filter", 0D, ToDate);
            ColumnLayout2."Column Type"::"Beginning Balance":
                if AccSchedLine2."Row Type" = AccSchedLine2."Row Type"::"Balance at Date" then
                    CFAccount.SetRange("Date Filter", 0D) // Force a zero return
                else
                    CFAccount.SetRange(
                      "Date Filter", 0D, CalcDate('<-1D>', FromDate));
            ColumnLayout2."Column Type"::"Year to Date":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        CFAccount.SetRange("Date Filter", FiscalStartDate2, ToDate);
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        CFAccount.SetFilter("Date Filter", '..%1', FiscalStartDate2 - 1);
                    AccSchedLine2."Row Type"::"Balance at Date":
                        CFAccount.SetRange("Date Filter", 0D, ToDate);
                end;
            ColumnLayout2."Column Type"::"Rest of Fiscal Year":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        CFAccount.SetRange(
                          "Date Filter",
                          CalcDate('<+1D>', ToDate), AccountingPeriodMgt.FindEndOfFiscalYear(FiscalStartDate2));
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        CFAccount.SetRange("Date Filter", 0D, ToDate);
                    AccSchedLine2."Row Type"::"Balance at Date":
                        CFAccount.SetRange("Date Filter", 0D, AccountingPeriodMgt.FindEndOfFiscalYear(ToDate));
                end;
            ColumnLayout2."Column Type"::"Entire Fiscal Year":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        CFAccount.SetRange(
                          "Date Filter",
                          FiscalStartDate2, AccountingPeriodMgt.FindEndOfFiscalYear(FiscalStartDate2));
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        CFAccount.SetFilter("Date Filter", '..%1', ClosingDate(FiscalStartDate2 - 1));
                    AccSchedLine2."Row Type"::"Balance at Date":
                        CFAccount.SetRange("Date Filter", 0D, AccountingPeriodMgt.FindEndOfFiscalYear(ToDate));
                end;
        end;

        OnAfterSetCFAccColumnFilter(CFAccount, AccSchedLine2, ColumnLayout2);
    end;

    local procedure SetCFEntryFilters(var CFAccount: Record "Cash Flow Account"; var CFForecastEntry: Record "Cash Flow Forecast Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
        CFForecastEntry.SetCurrentKey(
  "Cash Flow Account No.", "Cash Flow Forecast No.", "Global Dimension 1 Code",
  "Global Dimension 2 Code", "Cash Flow Date");
        if CFAccount.Totaling = '' then
            CFForecastEntry.SetRange("Cash Flow Account No.", CFAccount."No.")
        else
            CFForecastEntry.SetFilter("Cash Flow Account No.", CFAccount.Totaling);
        CFAccount.CopyFilter("Date Filter", CFForecastEntry."Cash Flow Date");
        AccSchedLine.CopyFilter("Cash Flow Forecast Filter", CFForecastEntry."Cash Flow Forecast No.");
        AccSchedLine.CopyFilter("Dimension 1 Filter", CFForecastEntry."Global Dimension 1 Code");
        AccSchedLine.CopyFilter("Dimension 2 Filter", CFForecastEntry."Global Dimension 2 Code");
        CFForecastEntry.FilterGroup(2);
        CFForecastEntry.SetFilter("Global Dimension 1 Code", AccSchedLine."Dimension 1 Totaling");
        CFForecastEntry.SetFilter("Global Dimension 2 Code", AccSchedLine."Dimension 2 Totaling");
        CFForecastEntry.FilterGroup(8);
        CFForecastEntry.SetFilter("Global Dimension 1 Code", GetDimTotalingFilter(1, ColumnLayout."Dimension 1 Totaling"));
        CFForecastEntry.SetFilter("Global Dimension 2 Code", GetDimTotalingFilter(2, ColumnLayout."Dimension 2 Totaling"));
        CFForecastEntry.FilterGroup(0);
    end;

    local procedure SetCFAnalysisViewEntryFilters(var CFAccount: Record "Cash Flow Account"; var AnalysisViewEntry: Record "Analysis View Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
        AnalysisViewEntry.SetRange("Analysis View Code", AccSchedName."Analysis View Name");
        AnalysisViewEntry.SetRange("Account Source", AnalysisViewEntry."Account Source"::"Cash Flow Account");
        if CFAccount.Totaling = '' then
            AnalysisViewEntry.SetRange("Account No.", CFAccount."No.")
        else
            AnalysisViewEntry.SetFilter("Account No.", CFAccount.Totaling);
        CFAccount.CopyFilter("Date Filter", AnalysisViewEntry."Posting Date");
        AccSchedLine.CopyFilter("Cash Flow Forecast Filter", AnalysisViewEntry."Cash Flow Forecast No.");
        AnalysisViewEntry.CopyDimFilters(AccSchedLine);
        AnalysisViewEntry.FilterGroup(2);
        AnalysisViewEntry.SetDimFilters(
          GetDimTotalingFilter(1, AccSchedLine."Dimension 1 Totaling"),
          GetDimTotalingFilter(2, AccSchedLine."Dimension 2 Totaling"),
          GetDimTotalingFilter(3, AccSchedLine."Dimension 3 Totaling"),
          GetDimTotalingFilter(4, AccSchedLine."Dimension 4 Totaling"));
        AnalysisViewEntry.FilterGroup(8);
        AnalysisViewEntry.SetDimFilters(
          GetDimTotalingFilter(1, ColumnLayout."Dimension 1 Totaling"),
          GetDimTotalingFilter(2, ColumnLayout."Dimension 2 Totaling"),
          GetDimTotalingFilter(3, ColumnLayout."Dimension 3 Totaling"),
          GetDimTotalingFilter(4, ColumnLayout."Dimension 4 Totaling"));
        AnalysisViewEntry.FilterGroup(0);
    end;

    local procedure ApplyOperator(LeftResult: Decimal; RightResult: Decimal; Operator: Char; var DivisionError: Boolean) Result: Decimal
    begin
        case Operator of
            '^':
                Result := Power(LeftResult, RightResult);
            '%':
                if RightResult = 0 then begin
                    Result := 0;
                    DivisionError := true;
                end else
                    Result := 100 * LeftResult / RightResult;
            '*':
                Result := LeftResult * RightResult;
            '/':
                if RightResult = 0 then begin
                    Result := 0;
                    DivisionError := true;
                end else
                    Result := LeftResult / RightResult;
            '+':
                Result := LeftResult + RightResult;
            '-':
                Result := LeftResult - RightResult;
        end;
    end;

    local procedure ParseExpression(Expression: Text; var i: Integer) IsExpression: Boolean
    var
        Parantheses: Integer;
        Operators: Text[8];
        OperatorNo: Integer;
    begin
        Parantheses := 0;
        IsExpression := false;
        Operators := '+-*/^%';
        OperatorNo := 1;
        repeat
            i := StrLen(Expression);
            repeat
                if Expression[i] = '(' then
                    Parantheses := Parantheses + 1
                else
                    if Expression[i] = ')' then
                        Parantheses := Parantheses - 1;
                if (Parantheses = 0) and (Expression[i] = Operators[OperatorNo]) then
                    IsExpression := true
                else
                    i := i - 1;
            until IsExpression or (i <= 0);
            if not IsExpression then
                OperatorNo := OperatorNo + 1;
        until (OperatorNo > StrLen(Operators)) or IsExpression;
    end;

    procedure EvaluateExpression(IsAccSchedLineExpression: Boolean; Expression: Text; AccSchedLine: Record "Acc. Schedule Line"; ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean): Decimal
    var
        AccSchedLine2: Record "Acc. Schedule Line";
        Result: Decimal;
        Operator: Char;
        LeftOperand: Text;
        RightOperand: Text;
        LeftResult: Decimal;
        RightResult: Decimal;
        i: Integer;
        IsExpression: Boolean;
        IsFilter: Boolean;
        MaxLevel: Integer;
    begin
        Result := 0;
        MaxLevel := 25;

        OnBeforeEvaluateExpression(AccSchedLine, ColumnLayout, MaxLevel);

        CallLevel := CallLevel + 1;
        if CallLevel > MaxLevel then
            ShowError(Text020, AccSchedLine, ColumnLayout);

        Expression := DelChr(Expression, '<>', ' ');
        if StrLen(Expression) > 0 then begin
            IsExpression := ParseExpression(Expression, i);
            if IsExpression then begin
                if i > 1 then
                    LeftOperand := CopyStr(Expression, 1, i - 1)
                else
                    LeftOperand := '';
                if i < StrLen(Expression) then
                    RightOperand := CopyStr(Expression, i + 1)
                else
                    RightOperand := '';
                Operator := Expression[i];
                LeftResult :=
                  EvaluateExpression(
                    IsAccSchedLineExpression, LeftOperand, AccSchedLine, ColumnLayout, CalcAddCurr);
                if (RightOperand = '') and (Operator = '%') and not IsAccSchedLineExpression and
                   (AccSchedLine."Totaling Type" <> AccSchedLine."Totaling Type"::"Set Base For Percent")
                then begin
                    AccSchedLine2.Copy(AccSchedLine);
                    AccSchedLine2."Line No." := GetBasePercentLine(AccSchedLine, ColumnLayout);
                    AccSchedLine2.Find;
                    RightResult :=
                      EvaluateExpression(
                        IsAccSchedLineExpression, LeftOperand, AccSchedLine2, ColumnLayout, CalcAddCurr);
                end else
                    RightResult :=
                      EvaluateExpression(
                        IsAccSchedLineExpression, RightOperand, AccSchedLine, ColumnLayout, CalcAddCurr);
                Result := ApplyOperator(LeftResult, RightResult, Operator, DivisionError);
            end else
                if (Expression[1] = '(') and (Expression[StrLen(Expression)] = ')') then
                    Result :=
                      EvaluateExpression(
                        IsAccSchedLineExpression, CopyStr(Expression, 2, StrLen(Expression) - 2),
                        AccSchedLine, ColumnLayout, CalcAddCurr)
                else begin
                    IsFilter := IsExpressionFilter(Expression);
                    if (StrLen(Expression) > 10) and (not IsFilter) then
                        Evaluate(Result, Expression)
                    else
                        if IsAccSchedLineExpression then
                            Result := CalcCellValueInAccSchedLines(AccSchedLine, ColumnLayout, Expression, CalcAddCurr, IsFilter)
                        else
                            Result := CalcCellValueInColumnLayouts(ColumnLayout, AccSchedLine, Expression, CalcAddCurr, IsFilter);
                end;
        end;
        CallLevel := CallLevel - 1;
        exit(Result);
    end;

    procedure FormatCellAsText(var ColumnLayout2: Record "Column Layout"; Value: Decimal; CalcAddCurr: Boolean): Text[30]
    var
        ValueAsText: Text[30];
    begin
        ValueAsText := MatrixMgt.FormatAmount(Value, RoundingFactor, CalcAddCurr);

        if (ValueAsText <> '') and
           (ColumnLayout2."Column Type" = ColumnLayout2."Column Type"::Formula) and
           (StrPos(ColumnLayout2.Formula, '%') > 1)
        then
            ValueAsText := ValueAsText + '%';

        exit(ValueAsText);
    end;

    procedure GetDivisionError(): Boolean
    begin
        exit(DivisionError);
    end;

    procedure GetPeriodError(): Boolean
    begin
        exit(PeriodError);
    end;

    local procedure ShowError(MessageLine: Text; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
        AccSchedLine.SetRange("Schedule Name", AccSchedLine."Schedule Name");
        AccSchedLine.SetRange("Line No.", CallingAccSchedLineID);
        if AccSchedLine.FindFirst then;
        ColumnLayout.SetRange("Column Layout Name", ColumnLayout."Column Layout Name");
        ColumnLayout.SetRange("Line No.", CallingColumnLayoutID);
        if ColumnLayout.FindFirst then;
        Error(Text016,
          MessageLine,
          Text017,
          StrSubstNo(Text018, AccSchedLine."Row No.", AccSchedLine."Line No.", AccSchedLine.Totaling),
          StrSubstNo(Text019, ColumnLayout."Column No.", ColumnLayout."Line No.", ColumnLayout.Formula));
    end;

    procedure InsertGLAccounts(var AccSchedLine: Record "Acc. Schedule Line")
    var
        GLAcc: Record "G/L Account";
        GLAccList: Page "G/L Account List";
        AccCounter: Integer;
        AccSchedLineNo: Integer;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeInsertGLAccounts(AccSchedLine, IsHandled);
        if IsHandled then
            exit;

        GLAccList.LookupMode(true);
        if GLAccList.RunModal = ACTION::LookupOK then begin
            GLAccList.SetSelection(GLAcc);
            AccCounter := GLAcc.Count();
            if AccCounter > 0 then begin
                AccSchedLineNo := AccSchedLine."Line No.";
                MoveAccSchedLines(AccSchedLine, AccCounter);
                if GLAcc.FindSet then
                    repeat
                        AccSchedLine.Init();
                        AccSchedLineNo := AccSchedLineNo + 10000;
                        AccSchedLine."Line No." := AccSchedLineNo;
                        AccSchedLine.Description := GLAcc.Name;
                        AccSchedLine.Validate(Indentation, GLAcc.Indentation);
                        AccSchedLine.Bold := GLAcc."Account Type" <> GLAcc."Account Type"::Posting;
                        if GLAcc."Account Type" in
                           [GLAcc."Account Type"::Posting, GLAcc."Account Type"::Total, GLAcc."Account Type"::"End-Total"]
                        then begin
                            AccSchedLine.Totaling := GLAcc."No.";
                            AccSchedLine."Row No." := CopyStr(GLAcc."No.", 1, MaxStrLen(AccSchedLine."Row No."));
                        end;
                        if GLAcc."Account Type" in
                           [GLAcc."Account Type"::Total, GLAcc."Account Type"::"End-Total"]
                        then
                            AccSchedLine."Totaling Type" := AccSchedLine."Totaling Type"::"Total Accounts"
                        else
                            AccSchedLine."Totaling Type" := AccSchedLine."Totaling Type"::"Posting Accounts";
                        OnInsertGLAccountsOnBeforeAccSchedLineInsert(AccSchedLine, GLAcc);
                        AccSchedLine.Insert();
                    until GLAcc.Next() = 0;
            end;
        end;

        OnAfterInsertGLAccounts(AccSchedLine);
    end;

    procedure InsertCFAccounts(var AccSchedLine: Record "Acc. Schedule Line")
    var
        CashFlowAcc: Record "Cash Flow Account";
        CashFlowAccList: Page "Cash Flow Account List";
        AccCounter: Integer;
        AccSchedLineNo: Integer;
    begin
        CashFlowAccList.LookupMode(true);
        if CashFlowAccList.RunModal = ACTION::LookupOK then begin
            CashFlowAccList.SetSelection(CashFlowAcc);
            AccCounter := CashFlowAcc.Count();
            if AccCounter > 0 then begin
                AccSchedLineNo := AccSchedLine."Line No.";
                MoveAccSchedLines(AccSchedLine, AccCounter);
                if CashFlowAcc.FindSet then
                    repeat
                        AccSchedLine.Init();
                        AccSchedLineNo := AccSchedLineNo + 10000;
                        AccSchedLine."Line No." := AccSchedLineNo;
                        AccSchedLine.Description := CashFlowAcc.Name;
                        if CashFlowAcc."Account Type" in
                           [CashFlowAcc."Account Type"::Entry, CashFlowAcc."Account Type"::Total, CashFlowAcc."Account Type"::"End-Total"]
                        then begin
                            AccSchedLine.Totaling := CashFlowAcc."No.";
                            AccSchedLine."Row No." := CopyStr(CashFlowAcc."No.", 1, MaxStrLen(AccSchedLine."Row No."));
                        end;
                        if CashFlowAcc."Account Type" in
                           [CashFlowAcc."Account Type"::Total, CashFlowAcc."Account Type"::"End-Total"]
                        then
                            AccSchedLine."Totaling Type" := AccSchedLine."Totaling Type"::"Cash Flow Total Accounts"
                        else
                            AccSchedLine."Totaling Type" := AccSchedLine."Totaling Type"::"Cash Flow Entry Accounts";
                        AccSchedLine.Insert();
                    until CashFlowAcc.Next() = 0;
            end;
        end;
    end;

    procedure InsertCostTypes(var AccSchedLine: Record "Acc. Schedule Line")
    var
        CostType: Record "Cost Type";
        CostTypeList: Page "Cost Type List";
        AccCounter: Integer;
        AccSchedLineNo: Integer;
    begin
        CostTypeList.LookupMode(true);
        if CostTypeList.RunModal = ACTION::LookupOK then begin
            CostTypeList.SetSelection(CostType);
            AccCounter := CostType.Count();
            if AccCounter > 0 then begin
                AccSchedLineNo := AccSchedLine."Line No.";
                MoveAccSchedLines(AccSchedLine, AccCounter);
                if CostType.FindSet then
                    repeat
                        AccSchedLine.Init();
                        AccSchedLineNo := AccSchedLineNo + 10000;
                        AccSchedLine."Line No." := AccSchedLineNo;
                        AccSchedLine.Description := CostType.Name;
                        if CostType.Type in
                           [CostType.Type::"Cost Type", CostType.Type::Total, CostType.Type::"End-Total"]
                        then begin
                            AccSchedLine.Totaling := CostType."No.";
                            AccSchedLine."Row No." := CopyStr(CostType."No.", 1, MaxStrLen(AccSchedLine."Row No."));
                        end;
                        if CostType.Type in
                           [CostType.Type::Total, CostType.Type::"End-Total"]
                        then
                            AccSchedLine."Totaling Type" := AccSchedLine."Totaling Type"::"Cost Type Total"
                        else
                            AccSchedLine."Totaling Type" := AccSchedLine."Totaling Type"::"Cost Type";
                        AccSchedLine.Insert();
                    until CostType.Next() = 0;
            end;
        end;
    end;

    local procedure IsExpressionFilter(Expression: Text): Boolean
    begin
        exit(
          StrPos(Expression, '..') +
          StrPos(Expression, '|') +
          StrPos(Expression, '<') +
          StrPos(Expression, '>') +
          StrPos(Expression, '&') +
          StrPos(Expression, '=') > 0);
    end;

    local procedure ExchangeAmtAddCurrToLCY(AmountLCY: Decimal): Decimal
    begin
        GetGLSetup;
        exit(
          CurrExchRate.ExchangeAmtLCYToFCY(
            WorkDate, GLSetup."Additional Reporting Currency", AmountLCY,
            CurrExchRate.ExchangeRate(WorkDate, GLSetup."Additional Reporting Currency")));
    end;

    procedure SetAccSchedName(var NewAccSchedName: Record "Acc. Schedule Name")
    begin
        AccSchedName := NewAccSchedName;
    end;

    procedure GetDimTotalingFilter(DimNo: Integer; DimTotaling: Text[250]): Text[1024]
    var
        DimTotaling2: Text[250];
        DimTotalPart: Text[250];
        ResultFilter: Text[1024];
        ResultFilter2: Text[1024];
        i: Integer;
    begin
        if DimTotaling = '' then
            exit(DimTotaling);
        DimTotaling2 := DimTotaling;
        repeat
            i := StrPos(DimTotaling2, '|');
            if i > 0 then begin
                DimTotalPart := CopyStr(DimTotaling2, 1, i - 1);
                if i < StrLen(DimTotaling2) then
                    DimTotaling2 := CopyStr(DimTotaling2, i + 1)
                else
                    DimTotaling2 := '';
            end else
                DimTotalPart := DimTotaling2;
            ResultFilter2 := ConvDimTotalingFilter(DimNo, DimTotalPart);
            if ResultFilter2 <> '' then
                if StrLen(ResultFilter) + StrLen(ResultFilter2) + 1 > MaxStrLen(ResultFilter) then
                    Error(Text021, DimTotaling);

            if ResultFilter <> '' then
                ResultFilter := ResultFilter + '|';
            ResultFilter := CopyStr(ResultFilter + ResultFilter2, 1, MaxStrLen(ResultFilter));
        until i <= 0;
        exit(ResultFilter);
    end;

    local procedure ConvDimTotalingFilter(DimNo: Integer; DimTotaling: Text[250]): Text[1024]
    var
        DimVal: Record "Dimension Value";
        CostAccSetup: Record "Cost Accounting Setup";
        DimCode: Code[20];
        ResultFilter: Text[1024];
        DimValTotaling: Boolean;
    begin
        if CostAccSetup.Get then;
        if DimTotaling = '' then
            exit(DimTotaling);

        CheckAnalysisView(AccSchedName.Name, '', false);

        case DimNo of
            1:
                DimCode := AnalysisView."Dimension 1 Code";
            2:
                DimCode := AnalysisView."Dimension 2 Code";
            3:
                DimCode := AnalysisView."Dimension 3 Code";
            4:
                DimCode := AnalysisView."Dimension 4 Code";
            5:
                DimCode := CostAccSetup."Cost Center Dimension";
            6:
                DimCode := CostAccSetup."Cost Object Dimension";
        end;
        if DimCode = '' then
            exit(DimTotaling);

        DimVal.SetRange("Dimension Code", DimCode);
        DimVal.SetFilter(Code, DimTotaling);
        if DimVal.Find('-') then
            repeat
                DimValTotaling :=
                  DimVal."Dimension Value Type" in
                  [DimVal."Dimension Value Type"::Total, DimVal."Dimension Value Type"::"End-Total"];
                if DimValTotaling and (DimVal.Totaling <> '') then begin
                    if StrLen(ResultFilter) + StrLen(DimVal.Totaling) + 1 > MaxStrLen(ResultFilter) then
                        Error(Text021, DimTotaling);
                    if ResultFilter <> '' then
                        ResultFilter := ResultFilter + '|';
                    ResultFilter := ResultFilter + DimVal.Totaling;
                end;
            until (DimVal.Next() = 0) or not DimValTotaling;

        if DimValTotaling then
            exit(ResultFilter);

        exit(DimTotaling);
    end;

    local procedure CalcCostType(var CostType: Record "Cost Type"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean) ColValue: Decimal
    var
        CostEntry: Record "Cost Entry";
        CostBudgEntry: Record "Cost Budget Entry";
        AmountType: Enum "Account Schedule Amount Type";
        UseDimFilter: Boolean;
        TestBalance: Boolean;
        Balance: Decimal;
        IsHandled: Boolean;
    begin
        ColValue := 0;
        IsHandled := false;
        OnBeforeCalcCostType(CostType, AccSchedLine, ColumnLayout, CalcAddCurr, ColValue, IsHandled);
        if IsHandled then
            exit(ColValue);

        if AccSchedName.Name <> AccSchedLine."Schedule Name" then
            AccSchedName.Get(AccSchedLine."Schedule Name");

        if ConflictAmountType(AccSchedLine, ColumnLayout."Amount Type", AmountType) then
            exit(0);

        TestBalance :=
          AccSchedLine.Show in [AccSchedLine.Show::"When Positive Balance", AccSchedLine.Show::"When Negative Balance"];

        if ColumnLayout."Column Type" <> ColumnLayout."Column Type"::Formula then begin
            UseDimFilter := HasDimFilter(AccSchedLine, ColumnLayout) or HasCostDimFilter(AccSchedLine);
            case ColumnLayout."Ledger Entry Type" of
                ColumnLayout."Ledger Entry Type"::Entries:
                    begin
                        SetCostEntryFilters(CostType, CostEntry, AccSchedLine, ColumnLayout, UseDimFilter);

                        case AmountType of
                            AmountType::"Net Amount":
                                begin
                                    if CalcAddCurr then begin
                                        CostEntry.CalcSums("Additional-Currency Amount");
                                        ColValue := CostEntry."Additional-Currency Amount";
                                    end else begin
                                        CostEntry.CalcSums(Amount);
                                        ColValue := CostEntry.Amount;
                                    end;
                                    Balance := ColValue;
                                end;
                            AmountType::"Debit Amount":
                                if CalcAddCurr then begin
                                    CostEntry.CalcSums("Add.-Currency Debit Amount", "Additional-Currency Amount");
                                    if TestBalance then
                                        Balance := CostEntry."Additional-Currency Amount";
                                    ColValue := CostEntry."Add.-Currency Debit Amount";
                                end else begin
                                    if TestBalance then begin
                                        CostEntry.CalcSums("Debit Amount", Amount);
                                        Balance := CostEntry.Amount;
                                    end else
                                        CostEntry.CalcSums("Debit Amount");
                                    ColValue := CostEntry."Debit Amount";
                                end;
                            AmountType::"Credit Amount":
                                if CalcAddCurr then begin
                                    CostEntry.CalcSums("Add.-Currency Credit Amount", "Additional-Currency Amount");
                                    if TestBalance then
                                        Balance := CostEntry."Additional-Currency Amount";
                                    ColValue := CostEntry."Add.-Currency Credit Amount";
                                end else begin
                                    if TestBalance then begin
                                        CostEntry.CalcSums("Credit Amount", Amount);
                                        Balance := CostEntry.Amount;
                                    end else
                                        CostEntry.CalcSums("Credit Amount");
                                    ColValue := CostEntry."Credit Amount";
                                end;
                        end;
                    end;
                ColumnLayout."Ledger Entry Type"::"Budget Entries":
                    begin
                        SetCostBudgetEntryFilters(CostType, CostBudgEntry, AccSchedLine, ColumnLayout);

                        CostBudgEntry.CalcSums(Amount);

                        case AmountType of
                            AmountType::"Net Amount":
                                ColValue := CostBudgEntry.Amount;
                            AmountType::"Debit Amount":
                                if CostBudgEntry.Amount > 0 then
                                    ColValue := CostBudgEntry.Amount;
                            AmountType::"Credit Amount":
                                if CostBudgEntry.Amount < 0 then
                                    ColValue := CostBudgEntry.Amount;
                        end;
                        Balance := CostBudgEntry.Amount;
                        if CalcAddCurr then
                            ColValue := CalcLCYToACY(ColValue);
                    end;
            end;

            if TestBalance then begin
                if AccSchedLine.Show = AccSchedLine.Show::"When Positive Balance" then
                    if Balance < 0 then
                        exit(0);
                if AccSchedLine.Show = AccSchedLine.Show::"When Negative Balance" then
                    if Balance > 0 then
                        exit(0);
            end;
        end;
        exit(ColValue);
    end;

    local procedure SetCostEntryFilters(var CostType: Record "Cost Type"; var CostEntry: Record "Cost Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; UseDimFilter: Boolean)
    begin
        if UseDimFilter then
            CostEntry.SetCurrentKey("Cost Type No.", "Cost Center Code", "Cost Object Code")
        else
            CostEntry.SetCurrentKey("Cost Type No.", "Posting Date");
        if CostType.Totaling = '' then
            CostEntry.SetRange("Cost Type No.", CostType."No.")
        else
            CostEntry.SetFilter("Cost Type No.", CostType.Totaling);
        CostType.CopyFilter("Date Filter", CostEntry."Posting Date");
        AccSchedLine.CopyFilter("Cost Center Filter", CostEntry."Cost Center Code");
        AccSchedLine.CopyFilter("Cost Object Filter", CostEntry."Cost Object Code");
        CostEntry.FilterGroup(2);
        CostEntry.SetFilter("Cost Center Code", GetDimTotalingFilter(5, AccSchedLine."Cost Center Totaling"));
        CostEntry.SetFilter("Cost Object Code", GetDimTotalingFilter(6, AccSchedLine."Cost Object Totaling"));
        CostEntry.FilterGroup(8);
        CostEntry.SetFilter("Cost Center Code", GetDimTotalingFilter(5, ColumnLayout."Cost Center Totaling"));
        CostEntry.SetFilter("Cost Object Code", GetDimTotalingFilter(6, ColumnLayout."Cost Object Totaling"));
        CostEntry.FilterGroup(0);

        OnAfterSetCostEntryFilters(CostType, CostEntry, AccSchedLine, ColumnLayout, UseDimFilter);
    end;

    local procedure SetCostBudgetEntryFilters(var CostType: Record "Cost Type"; var CostBudgetEntry: Record "Cost Budget Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
        CostBudgetEntry.SetCurrentKey("Budget Name", "Cost Type No.", "Cost Center Code", "Cost Object Code", Date);
        if CostType.Totaling = '' then
            CostBudgetEntry.SetRange("Cost Type No.", CostType."No.")
        else
            CostBudgetEntry.SetFilter("Cost Type No.", CostType.Totaling);
        CostType.CopyFilter("Date Filter", CostBudgetEntry.Date);
        AccSchedLine.CopyFilter("Cost Budget Filter", CostBudgetEntry."Budget Name");
        AccSchedLine.CopyFilter("Cost Center Filter", CostBudgetEntry."Cost Center Code");
        AccSchedLine.CopyFilter("Cost Object Filter", CostBudgetEntry."Cost Object Code");
        CostBudgetEntry.FilterGroup(2);
        CostBudgetEntry.SetFilter("Cost Center Code", GetDimTotalingFilter(5, AccSchedLine."Cost Center Totaling"));
        CostBudgetEntry.SetFilter("Cost Object Code", GetDimTotalingFilter(6, AccSchedLine."Cost Object Totaling"));
        CostBudgetEntry.FilterGroup(8);
        CostBudgetEntry.SetFilter("Cost Center Code", GetDimTotalingFilter(5, ColumnLayout."Cost Center Totaling"));
        CostBudgetEntry.SetFilter("Cost Object Code", GetDimTotalingFilter(6, ColumnLayout."Cost Object Totaling"));
        CostBudgetEntry.FilterGroup(0);

        OnAfterSetCostBudgetEntryFilters(CostType, CostBudgetEntry, AccSchedLine, ColumnLayout);
    end;

    procedure SetCostTypeRowFilters(var CostType: Record "Cost Type"; var AccSchedLine2: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
        case AccSchedLine2."Totaling Type" of
            AccSchedLine2."Totaling Type"::"Cost Type":
                begin
                    CostType.SetFilter("No.", AccSchedLine2.Totaling);
                    CostType.SetRange(Type, CostType.Type::"Cost Type");
                end;
            AccSchedLine2."Totaling Type"::"Cost Type Total":
                begin
                    CostType.SetFilter("No.", AccSchedLine2.Totaling);
                    CostType.SetFilter(Type, '<>%1', CostType.Type::"Cost Type");
                end;
        end;

        CostType.SetFilter("Cost Center Filter", AccSchedLine2.GetFilter("Cost Center Filter"));
        CostType.SetFilter("Cost Object Filter", AccSchedLine2.GetFilter("Cost Object Filter"));
        if ColumnLayout."Ledger Entry Type" = ColumnLayout."Ledger Entry Type"::"Budget Entries" then
            CostType.SetFilter("Budget Filter", AccSchedLine2.GetFilter("Cost Budget Filter"));

        OnAfterSetCostTypeRowFilters(CostType, AccSchedLine2);
    end;

    procedure SetCostTypeColumnFilters(var CostType: Record "Cost Type"; AccSchedLine2: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    var
        FromDate: Date;
        ToDate: Date;
        FiscalStartDate2: Date;
    begin
        CalcColumnDates(ColumnLayout, FromDate, ToDate, FiscalStartDate2);
        case ColumnLayout."Column Type" of
            ColumnLayout."Column Type"::"Net Change":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        CostType.SetRange("Date Filter", FromDate, ToDate);
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        CostType.SetFilter("Date Filter", '<%1', FromDate);
                    AccSchedLine2."Row Type"::"Balance at Date":
                        CostType.SetRange("Date Filter", 0D, ToDate);
                end;
            ColumnLayout."Column Type"::"Balance at Date":
                if AccSchedLine2."Row Type" = AccSchedLine2."Row Type"::"Beginning Balance" then
                    CostType.SetRange("Date Filter", 0D) // Force a zero return
                else
                    CostType.SetRange("Date Filter", 0D, ToDate);
            ColumnLayout."Column Type"::"Beginning Balance":
                if AccSchedLine2."Row Type" = AccSchedLine2."Row Type"::"Balance at Date" then
                    CostType.SetRange("Date Filter", 0D) // Force a zero return
                else
                    CostType.SetRange(
                      "Date Filter", 0D, CalcDate('<-1D>', FromDate));
            ColumnLayout."Column Type"::"Year to Date":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        CostType.SetRange("Date Filter", FiscalStartDate2, ToDate);
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        CostType.SetFilter("Date Filter", '<%1', FiscalStartDate2);
                    AccSchedLine2."Row Type"::"Balance at Date":
                        CostType.SetRange("Date Filter", 0D, ToDate);
                end;
            ColumnLayout."Column Type"::"Rest of Fiscal Year":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        CostType.SetRange(
                          "Date Filter", CalcDate('<+1D>', ToDate), AccountingPeriodMgt.FindEndOfFiscalYear(FiscalStartDate2));
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        CostType.SetRange("Date Filter", 0D, ToDate);
                    AccSchedLine2."Row Type"::"Balance at Date":
                        CostType.SetRange("Date Filter", 0D, AccountingPeriodMgt.FindEndOfFiscalYear(ToDate));
                end;
            ColumnLayout."Column Type"::"Entire Fiscal Year":
                case AccSchedLine2."Row Type" of
                    AccSchedLine2."Row Type"::"Net Change":
                        CostType.SetRange(
                          "Date Filter", FiscalStartDate2, AccountingPeriodMgt.FindEndOfFiscalYear(FiscalStartDate2));
                    AccSchedLine2."Row Type"::"Beginning Balance":
                        CostType.SetFilter("Date Filter", '<%1', FiscalStartDate2);
                    AccSchedLine2."Row Type"::"Balance at Date":
                        CostType.SetRange("Date Filter", 0D, AccountingPeriodMgt.FindEndOfFiscalYear(ToDate));
                end;
        end;
    end;

    procedure HasDimFilter(var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"): Boolean
    begin
        exit((AccSchedLine."Dimension 1 Totaling" <> '') or
          (AccSchedLine."Dimension 2 Totaling" <> '') or
          (AccSchedLine."Dimension 3 Totaling" <> '') or
          (AccSchedLine."Dimension 4 Totaling" <> '') or
          (AccSchedLine.GetFilter("Dimension 1 Filter") <> '') or
          (AccSchedLine.GetFilter("Dimension 2 Filter") <> '') or
          (AccSchedLine.GetFilter("Dimension 3 Filter") <> '') or
          (AccSchedLine.GetFilter("Dimension 4 Filter") <> '') or
          (ColumnLayout."Dimension 1 Totaling" <> '') or
          (ColumnLayout."Dimension 2 Totaling" <> '') or
          (ColumnLayout."Dimension 3 Totaling" <> '') or
          (ColumnLayout."Dimension 4 Totaling" <> '') or
          (ColumnLayout."Cost Center Totaling" <> '') or
          (ColumnLayout."Cost Object Totaling" <> ''));
    end;

    local procedure HasCostDimFilter(var AccSchedLine: Record "Acc. Schedule Line"): Boolean
    begin
        exit((AccSchedLine."Cost Center Totaling" <> '') or
          (AccSchedLine."Cost Object Totaling" <> '') or
          (AccSchedLine.GetFilter("Cost Center Filter") <> '') or
          (AccSchedLine.GetFilter("Cost Object Filter") <> ''));
    end;

    procedure CalcColumnDates(ColumnLayout: Record "Column Layout"; var FromDate: Date; var ToDate: Date; var FiscalStartDate2: Date)
    var
        ComparisonDateFormula: DateFormula;
        ComparisonPeriodFormula: Code[20];
    begin
        ComparisonDateFormula := ColumnLayout."Comparison Date Formula";
        ComparisonPeriodFormula := ColumnLayout."Comparison Period Formula";

        if (Format(ComparisonDateFormula) <> '0') and (Format(ComparisonDateFormula) <> '') then begin
            FromDate := CalcDate(ComparisonDateFormula, StartDate);
            ToDate := CalcDate(ComparisonDateFormula, EndDate);
            if (StartDate = CalcDate('<-CM>', StartDate)) and
               (FromDate = CalcDate('<-CM>', FromDate)) and
               (EndDate = CalcDate('<CM>', EndDate))
            then
                ToDate := CalcDate('<CM>', ToDate);
            FiscalStartDate2 := AccountingPeriodMgt.FindFiscalYear(ToDate);
        end else
            if ComparisonPeriodFormula <> '' then begin
                AccPeriodStartEnd(ColumnLayout, StartDate, FromDate, ToDate);
                FiscalStartDate2 := AccountingPeriodMgt.FindFiscalYear(ToDate);
            end else begin
                FromDate := StartDate;
                ToDate := EndDate;
                FiscalStartDate2 := FiscalStartDate;
            end;
    end;

    local procedure MoveAccSchedLines(var AccSchedLine: Record "Acc. Schedule Line"; Place: Integer)
    var
        AccSchedLineNo: Integer;
        I: Integer;
    begin
        AccSchedLineNo := AccSchedLine."Line No.";
        AccSchedLine.SetRange("Schedule Name", AccSchedLine."Schedule Name");
        if AccSchedLine.Find('+') then
            repeat
                I := AccSchedLine."Line No.";
                if I > AccSchedLineNo then begin
                    AccSchedLine.Delete();
                    OnMoveAccSchedLinesOnAfterAccSchedLineDelete(AccSchedLine, Place);
                    AccSchedLine."Line No." := I + 10000 * Place;
                    AccSchedLine.Insert();
                    OnAfterAccSchedLineInsert(AccSchedLine);
                end;
            until (I <= AccSchedLineNo) or (AccSchedLine.Next(-1) = 0);
    end;

    procedure SetStartDateEndDate(NewStartDate: Date; NewEndDate: Date)
    begin
        StartDate := NewStartDate;
        EndDate := NewEndDate;
    end;

    local procedure ConflictAmountType(AccSchedLine: Record "Acc. Schedule Line"; ColumnLayoutAmtType: Enum "Account Schedule Amount Type"; var AmountType: Enum "Account Schedule Amount Type"): Boolean
    begin
        if (ColumnLayoutAmtType = AccSchedLine."Amount Type") or
           (AccSchedLine."Amount Type" = AccSchedLine."Amount Type"::"Net Amount")
        then
            AmountType := ColumnLayoutAmtType
        else
            if ColumnLayoutAmtType = ColumnLayoutAmtType::"Net Amount" then
                AmountType := AccSchedLine."Amount Type"
            else
                exit(true);
        exit(false);
    end;

    procedure DrillDown(TempColumnLayout: Record "Column Layout" temporary; var AccScheduleLine: Record "Acc. Schedule Line"; PeriodLength: Option)
    var
        AccScheduleOverview: Page "Acc. Schedule Overview";
        ErrorType: Option "None","Division by Zero","Period Error",Both;
    begin
        if TempColumnLayout."Column Type" = TempColumnLayout."Column Type"::Formula then begin
            CalcFieldError(ErrorType, AccScheduleLine."Line No.", TempColumnLayout."Line No.");
            if ErrorType <> ErrorType::None then
                Message(StrSubstNo(ColumnFormulaErrorMsg, TempColumnLayout.Formula, Format(ErrorType)))
            else
                Message(ColumnFormulaMsg, TempColumnLayout.Formula);
            exit;
        end;

        if AccScheduleLine."Totaling Type" in [AccScheduleLine."Totaling Type"::Formula, AccScheduleLine."Totaling Type"::"Set Base For Percent"] then begin
            AccScheduleOverview.SetAccSchedName(AccScheduleLine."Schedule Name");
            AccScheduleOverview.SetTableView(AccScheduleLine);
            AccScheduleOverview.SetRecord(AccScheduleLine);
            AccScheduleOverview.SetPeriodType(PeriodLength);
            AccScheduleOverview.Run;
            exit;
        end;

        OnBeforeDrillDownOnAccounts(AccScheduleLine, TempColumnLayout, PeriodLength, StartDate, EndDate);

        if AccScheduleLine.Totaling = '' then
            exit;

        if AccScheduleLine."Totaling Type" in [AccScheduleLine."Totaling Type"::"Cash Flow Entry Accounts", AccScheduleLine."Totaling Type"::"Cash Flow Total Accounts"] then
            DrillDownOnCFAccount(TempColumnLayout, AccScheduleLine)
        else
            DrillDownOnGLAccount(TempColumnLayout, AccScheduleLine);
    end;

    procedure DrillDownFromOverviewPage(TempColumnLayout: Record "Column Layout" temporary; var AccScheduleLine: Record "Acc. Schedule Line"; PeriodLength: Option)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeDrillDownFromOverviewPage(TempColumnLayout, AccScheduleLine, PeriodLength, IsHandled);
        if IsHandled then
            exit;

        if (AccScheduleLine."Totaling Type" = AccScheduleLine."Totaling Type"::Formula) and
   (TempColumnLayout."Column Type" = TempColumnLayout."Column Type"::Formula)
then
            Message(RowFormulaMsg, TempColumnLayout.Formula)
        else
            if AccScheduleLine."Totaling Type" in [AccScheduleLine."Totaling Type"::Formula, AccScheduleLine."Totaling Type"::"Set Base For Percent"] then
                Message(RowFormulaMsg, AccScheduleLine.Totaling)
            else
                DrillDown(TempColumnLayout, AccScheduleLine, PeriodLength);
    end;

    local procedure DrillDownOnGLAccount(TempColumnLayout: Record "Column Layout" temporary; var AccScheduleLine: Record "Acc. Schedule Line")
    var
        GLAcc: Record "G/L Account";
        GLAccAnalysisView: Record "G/L Account (Analysis View)";
        CostType: Record "Cost Type";
        ChartOfAccsAnalysisView: Page "Chart of Accs. (Analysis View)";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeDrillDownOnGLAccount(TempColumnLayout, AccScheduleLine, IsHandled);
        if IsHandled then
            exit;

        if AccScheduleLine."Totaling Type" in [AccScheduleLine."Totaling Type"::"Cost Type", AccScheduleLine."Totaling Type"::"Cost Type Total"] then begin
            SetCostTypeRowFilters(CostType, AccScheduleLine, TempColumnLayout);
            SetCostTypeColumnFilters(CostType, AccScheduleLine, TempColumnLayout);
            AccScheduleLine.CopyFilter("Cost Center Filter", CostType."Cost Center Filter");
            AccScheduleLine.CopyFilter("Cost Object Filter", CostType."Cost Object Filter");
            AccScheduleLine.CopyFilter("Cost Budget Filter", CostType."Budget Filter");
            CostType.FilterGroup(2);
            CostType.SetFilter("Cost Center Filter", GetDimTotalingFilter(1, AccScheduleLine."Cost Center Totaling"));
            CostType.SetFilter("Cost Object Filter", GetDimTotalingFilter(1, AccScheduleLine."Cost Object Totaling"));
            CostType.FilterGroup(8);
            CostType.SetFilter("Cost Center Filter", GetDimTotalingFilter(1, TempColumnLayout."Cost Center Totaling"));
            CostType.SetFilter("Cost Object Filter", GetDimTotalingFilter(1, TempColumnLayout."Cost Object Totaling"));
            CostType.FilterGroup(0);
            PAGE.Run(PAGE::"Chart of Cost Types", CostType);
        end else begin
            AccScheduleLine.CopyFilter("Business Unit Filter", GLAcc."Business Unit Filter");
            AccScheduleLine.CopyFilter("G/L Budget Filter", GLAcc."Budget Filter");
            SetGLAccRowFilters(GLAcc, AccScheduleLine);
            SetGLAccColumnFilters(GLAcc, AccScheduleLine, TempColumnLayout);
            AccSchedName.Get(AccScheduleLine."Schedule Name");
            if AccSchedName."Analysis View Name" = '' then begin
                AccScheduleLine.CopyFilter("Dimension 1 Filter", GLAcc."Global Dimension 1 Filter");
                AccScheduleLine.CopyFilter("Dimension 2 Filter", GLAcc."Global Dimension 2 Filter");
                AccScheduleLine.CopyFilter("Business Unit Filter", GLAcc."Business Unit Filter");
                GLAcc.FilterGroup(2);
                GLAcc.SetFilter("Global Dimension 1 Filter", GetDimTotalingFilter(1, AccScheduleLine."Dimension 1 Totaling"));
                GLAcc.SetFilter("Global Dimension 2 Filter", GetDimTotalingFilter(2, AccScheduleLine."Dimension 2 Totaling"));
                GLAcc.FilterGroup(8);
                GLAcc.SetFilter("Business Unit Filter", TempColumnLayout."Business Unit Totaling");
                GLAcc.SetFilter("Global Dimension 1 Filter", GetDimTotalingFilter(1, TempColumnLayout."Dimension 1 Totaling"));
                GLAcc.SetFilter("Global Dimension 2 Filter", GetDimTotalingFilter(2, TempColumnLayout."Dimension 2 Totaling"));
                GLAcc.FilterGroup(0);
                PAGE.Run(PAGE::"Chart of Accounts (G/L)", GLAcc)
            end else begin
                GLAcc.CopyFilter("Date Filter", GLAccAnalysisView."Date Filter");
                GLAcc.CopyFilter("Budget Filter", GLAccAnalysisView."Budget Filter");
                GLAcc.CopyFilter("Business Unit Filter", GLAccAnalysisView."Business Unit Filter");
                GLAccAnalysisView.SetRange("Analysis View Filter", AccSchedName."Analysis View Name");
                GLAccAnalysisView.CopyDimFilters(AccScheduleLine);
                GLAccAnalysisView.FilterGroup(2);
                GLAccAnalysisView.SetDimFilters(
                  GetDimTotalingFilter(1, AccScheduleLine."Dimension 1 Totaling"), GetDimTotalingFilter(2, AccScheduleLine."Dimension 2 Totaling"),
                  GetDimTotalingFilter(3, AccScheduleLine."Dimension 3 Totaling"), GetDimTotalingFilter(4, AccScheduleLine."Dimension 4 Totaling"));
                GLAccAnalysisView.FilterGroup(8);
                GLAccAnalysisView.SetDimFilters(
                  GetDimTotalingFilter(1, TempColumnLayout."Dimension 1 Totaling"),
                  GetDimTotalingFilter(2, TempColumnLayout."Dimension 2 Totaling"),
                  GetDimTotalingFilter(3, TempColumnLayout."Dimension 3 Totaling"),
                  GetDimTotalingFilter(4, TempColumnLayout."Dimension 4 Totaling"));
                GLAccAnalysisView.SetFilter("Business Unit Filter", TempColumnLayout."Business Unit Totaling");
                GLAccAnalysisView.FilterGroup(0);
                Clear(ChartOfAccsAnalysisView);
                ChartOfAccsAnalysisView.InsertTempGLAccAnalysisViews(GLAcc);
                ChartOfAccsAnalysisView.SetTableView(GLAccAnalysisView);
                ChartOfAccsAnalysisView.Run;
            end;
        end;
    end;

    local procedure DrillDownOnCFAccount(TempColumnLayout: Record "Column Layout" temporary; var AccScheduleLine: Record "Acc. Schedule Line")
    var
        CFAccount: Record "Cash Flow Account";
        GLAccAnalysisView: Record "G/L Account (Analysis View)";
        ChartOfAccsAnalysisView: Page "Chart of Accs. (Analysis View)";
    begin
        AccScheduleLine.CopyFilter("Cash Flow Forecast Filter", CFAccount."Cash Flow Forecast Filter");

        SetCFAccRowFilter(CFAccount, AccScheduleLine);
        SetCFAccColumnFilter(CFAccount, AccScheduleLine, TempColumnLayout);
        AccSchedName.Get(AccScheduleLine."Schedule Name");
        if AccSchedName."Analysis View Name" = '' then begin
            AccScheduleLine.CopyFilter("Dimension 1 Filter", CFAccount."Global Dimension 1 Filter");
            AccScheduleLine.CopyFilter("Dimension 2 Filter", CFAccount."Global Dimension 2 Filter");
            CFAccount.FilterGroup(2);
            CFAccount.SetFilter("Global Dimension 1 Filter", GetDimTotalingFilter(1, AccScheduleLine."Dimension 1 Totaling"));
            CFAccount.SetFilter("Global Dimension 2 Filter", GetDimTotalingFilter(2, AccScheduleLine."Dimension 2 Totaling"));
            CFAccount.FilterGroup(8);
            CFAccount.SetFilter("Global Dimension 1 Filter", GetDimTotalingFilter(1, TempColumnLayout."Dimension 1 Totaling"));
            CFAccount.SetFilter("Global Dimension 2 Filter", GetDimTotalingFilter(2, TempColumnLayout."Dimension 2 Totaling"));
            CFAccount.FilterGroup(0);
            PAGE.Run(PAGE::"Chart of Cash Flow Accounts", CFAccount)
        end else begin
            CFAccount.CopyFilter("Date Filter", GLAccAnalysisView."Date Filter");
            CFAccount.CopyFilter("Cash Flow Forecast Filter", GLAccAnalysisView."Cash Flow Forecast Filter");
            GLAccAnalysisView.SetRange("Analysis View Filter", AccSchedName."Analysis View Name");
            GLAccAnalysisView.CopyDimFilters(AccScheduleLine);
            GLAccAnalysisView.FilterGroup(2);
            GLAccAnalysisView.SetDimFilters(
              GetDimTotalingFilter(1, AccScheduleLine."Dimension 1 Totaling"),
              GetDimTotalingFilter(2, AccScheduleLine."Dimension 2 Totaling"),
              GetDimTotalingFilter(3, AccScheduleLine."Dimension 3 Totaling"),
              GetDimTotalingFilter(4, AccScheduleLine."Dimension 4 Totaling"));
            GLAccAnalysisView.FilterGroup(8);
            GLAccAnalysisView.SetDimFilters(
              GetDimTotalingFilter(1, TempColumnLayout."Dimension 1 Totaling"),
              GetDimTotalingFilter(2, TempColumnLayout."Dimension 2 Totaling"),
              GetDimTotalingFilter(3, TempColumnLayout."Dimension 3 Totaling"),
              GetDimTotalingFilter(4, TempColumnLayout."Dimension 4 Totaling"));
            GLAccAnalysisView.FilterGroup(0);
            Clear(ChartOfAccsAnalysisView);
            ChartOfAccsAnalysisView.InsertTempCFAccountAnalysisVie(CFAccount);
            ChartOfAccsAnalysisView.SetTableView(GLAccAnalysisView);
            ChartOfAccsAnalysisView.Run;
        end;
    end;

    procedure FindPeriod(var AccScheduleLine: Record "Acc. Schedule Line"; SearchText: Text[3]; PeriodType: Enum "Analysis Period Type")
    var
        Calendar: Record Date;
        PeriodFormMgt: Codeunit PeriodPageManagement;
    begin
        if AccScheduleLine.GetFilter("Date Filter") <> '' then begin
            Calendar.SetFilter("Period Start", AccScheduleLine.GetFilter("Date Filter"));
            //  if not PeriodFormMgt.FindDate('+', Calendar, PeriodType) then
            //  PeriodFormMgt.FindDate('+', Calendar, PeriodType::Day);
            Calendar.SetRange("Period Start");
        end;
        // PeriodFormMgt.FindDate(SearchText, Calendar, PeriodType);
        AccScheduleLine.SetRange("Date Filter", Calendar."Period Start", Calendar."Period End");
        if AccScheduleLine.GetRangeMin("Date Filter") = AccScheduleLine.GetRangeMax("Date Filter") then
            AccScheduleLine.SetRange("Date Filter", AccScheduleLine.GetRangeMin("Date Filter"));
    end;

    procedure CalcFieldError(var ErrorType: Option "None","Division by Zero","Period Error",Both; RowNo: Integer; ColumnNo: Integer)
    begin
        AccSchedCellValue.SetRange("Row No.", RowNo);
        AccSchedCellValue.SetRange("Column No.", ColumnNo);
        ErrorType := ErrorType::None;
        if AccSchedCellValue.FindFirst then
            case true of
                AccSchedCellValue."Has Error":
                    ErrorType := ErrorType::"Division by Zero";
                AccSchedCellValue."Period Error":
                    ErrorType := ErrorType::"Period Error";
                AccSchedCellValue."Has Error" and AccSchedCellValue."Period Error":
                    ErrorType := ErrorType::Both;
            end;

        AccSchedCellValue.SetRange("Row No.");
        AccSchedCellValue.SetRange("Column No.");
    end;

    procedure ForceRecalculate(NewRecalculate: Boolean)
    begin
        Recalculate := NewRecalculate;
    end;

    local procedure CalcLCYToACY(ColValue: Decimal): Decimal
    begin
        if GetGLSetup then
            if GLSetup."Additional Reporting Currency" <> '' then
                AddRepCurrency.Get(GLSetup."Additional Reporting Currency");
        if GLSetup."Additional Reporting Currency" <> '' then
            exit(Round(ExchangeAmtAddCurrToLCY(ColValue), AddRepCurrency."Amount Rounding Precision"));
        exit(0);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterAccSchedLineInsert(var AccSchedLine: Record "Acc. Schedule Line")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterCalcCellValue(var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; var Result: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInsertGLAccounts(var AccScheduleLine: Record "Acc. Schedule Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetGLAccRowFilters(var GLAccount: Record "G/L Account"; var AccScheduleLine: Record "Acc. Schedule Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetCFAccRowFilter(var CashFlowAccount: Record "Cash Flow Account"; var AccScheduleLine: Record "Acc. Schedule Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetGLAccColumnFilters(var GLAccount: Record "G/L Account"; var AccScheduleLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetCFAccColumnFilter(var CashFlowAccount: Record "Cash Flow Account"; var AccScheduleLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetGLAccGLEntryFilters(var GLAccount: Record "G/L Account"; var GLEntry: Record "G/L Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; UseBusUnitFilter: Boolean; UseDimFilter: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetGLAccGLBudgetEntryFilters(var GLAcc: Record "G/L Account"; var GLBudgetEntry: Record "G/L Budget Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; UseBusUnitFilter: Boolean; UseDimFilter: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetGLAccAnalysisViewEntryFilters(var GLAcc: Record "G/L Account"; var AnalysisViewEntry: Record "Analysis View Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetGLAccAnalysisViewBudgetEntries(var GLAcc: Record "G/L Account"; var AnalysisViewBudgetEntry: Record "Analysis View Budget Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetCostEntryFilters(var CostType: Record "Cost Type"; var CostEntry: Record "Cost Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; UseDimFilter: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetCostTypeRowFilters(var CostType: Record "Cost Type"; var AccSchedLine2: Record "Acc. Schedule Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetCostBudgetEntryFilters(var CostType: Record "Cost Type"; var CostBudgetEntry: Record "Cost Budget Entry"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCalcCell(var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean)
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnBeforeCalcCellExit(var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean; var Result: Decimal)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeCalcCellValue(var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean; var Result: Decimal)
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnBeforeCalcGLAcc(var GLAcc: Record "G/L Account"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean; var ColValue: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnBeforeCalcCFAcc(var CFAccount: Record "Cash Flow Account"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; var ColValue: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnBeforeCalcCostType(var CostType: Record "Cost Type"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean; var ColValue: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeEvaluateExpression(var AccScheduleLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; var MaxLevel: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeTestBalance(var GLAccount: Record "G/L Account"; var AccScheduleName: Record "Acc. Schedule Name"; var AccScheduleLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; AmountType: Integer; var ColValue: Decimal; CalcAddCurr: Boolean; var TestBalance: Boolean; var GLEntry: Record "G/L Entry"; var GLBudgetEntry: Record "G/L Budget Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDrillDownFromOverviewPage(var TempColumnLayout: Record "Column Layout" temporary; var AccScheduleLine: Record "Acc. Schedule Line"; PeriodLength: Option; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDrillDownOnAccounts(var AccScheduleLine: Record "Acc. Schedule Line"; var TempColumnLayout: Record "Column Layout" temporary; PeriodLength: Option; StartDate: Date; EndDate: Date)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDrillDownOnGLAccount(var TempColumnLayout: Record "Column Layout" temporary; var AccScheduleLine: Record "Acc. Schedule Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertGLAccounts(var AccScheduleLine: Record "Acc. Schedule Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCalcCellValueOnBeforeExit(var AccScheduleLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean; StartDate: Date; EndDate: Date; var Result: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnEvaluateExpressionOnBeforeCalcAccSchedLineCellValue(SourceAccSchedLine: Record "Acc. Schedule Line"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean; var IsHandled: Boolean; var CellValue: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnEvaluateExpressionOnBeforeCalcColumnLayoutCellValue(SourceColumnLayout: Record "Column Layout"; var AccSchedLine: Record "Acc. Schedule Line"; var ColumnLayout: Record "Column Layout"; CalcAddCurr: Boolean; var IsHandled: Boolean; var CellValue: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInsertGLAccountsOnBeforeAccSchedLineInsert(var AccSchedLine: Record "Acc. Schedule Line"; GLAccount: Record "G/L Account")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnMoveAccSchedLinesOnAfterAccSchedLineDelete(var AccSchedLine: Record "Acc. Schedule Line"; Place: Integer)
    begin
    end;
}


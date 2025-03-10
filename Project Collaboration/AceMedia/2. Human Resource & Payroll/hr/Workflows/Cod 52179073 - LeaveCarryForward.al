codeunit 52179073 "Leave Carry Forward"
{

    trigger OnRun()
    begin

        if Confirm('Generate Leave Balances to Carry Forward? (Ensure that you have already allocated annual leave balances)', true) = false then exit;
        Clear(ints);
        hremployee2.Reset;
        //hremployee.SetRange(hremployee.Status, hremployee.Status::Normal);
        hremployee2.SetRange(hremployee2.Status, hremployee2.Status::Active);
        if hremployee2.Find('-') then begin
            // Populate leave journal with

            // Delete Existing Journal Entries first
            leaveJournal.Reset;
            if leaveJournal.Find('-') then
                leaveJournal.DeleteAll;
            repeat

                /* begin
                    IF hremployee2."No." <> ''
                    then begin */
                /* leaveledger.Reset;
                //leaveledger.SetRange(leaveledger."Document No", hremployee2."No.");
                leaveledger.SetRange(leaveledger."Employee No", hremployee2."No.");
                //leaveledger.SetRange(leaveledger."Leave Period", (Date2DMY(Today, 3) - 1));
                leaveledger.SetRange(leaveledger."Leave Period", Date2DMY(Today, 3));
                //leaveledger.SetFilter(leaveledger."Transaction Type", '<>%1', leaveledger."Transaction Type"::"Positive Adjustment");
                //leaveledger.SetFilter(leaveledger."Entry Type", '<>%1', leaveledger."Entry Type"::Allocation);
                //if not leaveledger.Find('-') then begin
                if leaveledger.Find('-') then begin */
                // Insert the Journals

                ints := ints + 1;

                Resetints := Resetints + 5000;
                hremployee2.CalcFields("Leave Balance");
                bal := hremployee2."Leave Balance";
                ResetBal := hremployee2."Leave Balance";
                //message(format(hremployee2."First Name") + ' ' + format(hremployee2."No.") + ' ' + Format(bal));
                if bal >= 0 then begin
                    if bal > 15 then
                        bal := 15;
                    // if bal <= 15 then
                    //     bal := bal + 30;
                    // if ResetBal > 0 then begin
                    //     if ResetBal >= 15 then
                    //         ResetBal := ResetBal - 15;
                    //     if ResetBal < 15 then
                    //         ResetBal := ResetBal;
                    // end;

                    leaveJournal.Init;
                    leaveJournal."Line No." := ints;
                    leaveJournal."Staff No." := hremployee2."No.";
                    leaveJournal."Staff Name" := hremployee2."First Name" + ' ' + hremployee2."Middle Name" + ' ' + hremployee2."Last Name";
                    leaveJournal."Transaction Description" := 'Leave Carry Forward for ' + Format(Date2DMY(Today, 3));
                    leaveJournal."Leave Type" := 'ANNUAL';
                    //leaveJournal."No. of Days" := salaryGrades."Annual Leave Days";
                    leaveJournal."No. of Days" := bal;
                    leaveJournal."Transaction Type" := leaveJournal."Transaction Type"::"Positive Adjustment";
                    leaveJournal."Document No." := 'CF-' + Format(Date2DMY(Today, 3));
                    leaveJournal."Posting Date" := Today;
                    leaveJournal."Leave Period" := Date2DMY(Today, 3);
                    leaveJournal.Insert;
                    // end;
                end;

                if ResetBal >= 0 then begin
                    leaveJournal.Init;
                    leaveJournal."Line No." := leaveJournal."Line No." + Resetints;
                    leaveJournal."Staff No." := hremployee2."No.";
                    leaveJournal."Staff Name" := hremployee2."First Name" + ' ' + hremployee2."Middle Name" + ' ' + hremployee2."Last Name";
                    leaveJournal."Transaction Description" := 'Leave forfeited for ' + Format(Date2DMY(Today, 3));
                    leaveJournal."Leave Type" := 'ANNUAL';
                    leaveJournal."No. of Days" := ResetBal;
                    leaveJournal."Forfeited Days" := ResetBal - bal;
                    leaveJournal."Transaction Type" := leaveJournal."Transaction Type"::"Negative Adjustment";
                    leaveJournal."Document No." := 'Forfeit-' + Format(Date2DMY(Today, 3));
                    leaveJournal."Posting Date" := Today;
                    leaveJournal."Leave Period" := Date2DMY(Today, 3 - 1);
                    leaveJournal."Leave PeriodAcc" := salaryGrades."Leave PeriodAcc";
                    leaveJournal.Insert;

                end;
            //end;
            // end;
            //end;
            until hremployee2.Next = 0;
        end;
        Message('Annual Leave Carry forward generated successfully!');
    end;

    var
        salaryGrades: Record "HRM-Job_Salary grade/steps";
        //hremployee: Record "HRM-Employee (D)";
        hremployee2: Record "HRM-Employee C";
        leaveledger: Record "HRM-Leave Ledger";
        leaveJournal: Record "HRM-Employee Leave Journal";
        ints: Integer;
        Resetints: integer;
        bal: Decimal;
        ResetBal: Decimal;
        pperiod: Record "PRL-Payroll Periods";
        salgrade: Record "HRM-Job_Salary grade/steps";

        hremployee: Record "HRM-Employee C";


    procedure GetMonthlyAlloaction()
    begin
        if Confirm('Get Monthly Leave Allocations?', true) = false then exit;
        Clear(ints);
        hremployee.Reset;
        hremployee.SetRange(hremployee.Status, hremployee.Status::Active);
        if hremployee.Find('-') then begin
            // Populate leave journal with

            // Delete Existing Journal Entries first
            leaveJournal.Reset;
            if leaveJournal.Find('-') then
                leaveJournal.DeleteAll;
            repeat
            begin
                if ((hremployee."Salary Category" <> '') and (hremployee."Salary Grade" <> '')) then begin
                    salaryGrades.Reset;
                    salaryGrades.SetRange(salaryGrades."Employee Category", hremployee."Salary Category");
                    salaryGrades.SetRange(salaryGrades."Salary Grade code", hremployee."Salary Grade");
                    if salaryGrades.Find('-') then begin
                        if salaryGrades."Annual Leave Days" <> 0 then begin

                            // populate the Journal
                            leaveledger.Reset;
                            leaveledger.SetRange(leaveledger."Document No", hremployee."No.");
                            leaveledger.SetRange(leaveledger."Leave Period", Date2DMY(Today, 3));
                            leaveledger.SetRange(leaveledger."Leave PeriodAcc", salaryGrades."Leave PeriodAcc");
                            leaveledger.SetFilter(leaveledger."Entry Type", '<>%1', leaveledger."Entry Type"::Allocation);
                            if not leaveledger.Find('-') then begin

                                pperiod.Reset();
                                pperiod.SetRange(Closed, false);
                                if pperiod.FindFirst() then begin

                                    ints := ints + 1;
                                    leaveJournal.Init;
                                    leaveJournal."Line No." := ints;
                                    leaveJournal."Staff No." := hremployee."No.";
                                    leaveJournal."Staff Name" := hremployee."First Name" + ' ' + hremployee."Middle Name" + ' ' + hremployee."Last Name";
                                    leaveJournal."Transaction Description" := 'Leave Allocations for ' + format(pperiod."Date Opened");
                                    //leaveJournal."Transaction Description" := 'Leave Allocations for ' + Format(Date2DMY(Today, 3));
                                    leaveJournal."Leave Type" := 'ANNUAL';
                                    leaveJournal."No. of Days" := salaryGrades."Monthly Earned Leave Days";
                                    leaveJournal."Leave Period" := Date2DMY(Today, 3);
                                    leaveJournal."Leave PeriodAcc" := salaryGrades."Leave PeriodAcc";
                                    leaveJournal."Transaction Type" := leaveJournal."Transaction Type"::Allocation;
                                    //leaveJournal."Document No." := 'ALL-' + Format(Date2DMY(Today, 3));
                                    leaveJournal."Document No." := 'ALL-' + format(pperiod."Date Opened");
                                    leaveJournal."Start Date" := salaryGrades."Start Date";
                                    leaveJournal."End Date" := salaryGrades."End Date";
                                    leaveJournal."Posting Date" := pperiod."Date Opened";
                                    // leaveJournal."Leave Period" := Date2DMY(Today, 3);
                                    leaveJournal.Insert;

                                    salaryGrades."Cummulative Earned Days" := salaryGrades."Cummulative Earned Days" + salaryGrades."Monthly Earned Leave Days";
                                    salaryGrades.Modify();
                                end;
                                // Insert the Journals
                            end;

                        end;
                    end;
                end;
            end;
            until hremployee.Next = 0;
        end;
        Message('Monthly Leave Days generated successfully!');
    end;
}



// codeunit 52178552 "Budget Reversal JVs"
// {
//     procedure ReverseBudget()

//     begin
//         BCSetup.GET;
//         IF NOT ((BCSetup.Mandatory)) THEN EXIT;
//         BCSetup.TESTFIELD("Current Budget Code");
//         JVLines.TESTFIELD("Shortcut Dimension 1 Code");
//         JVLines.TESTFIELD("Shortcut Dimension 2 Code");
//         //Get Current Lines to loop through
//         JVLines.RESET;
//         JVLines.SETRANGE(JVLines."No.", JVHeader."No.");

//         IF JVLines.FIND('-') THEN BEGIN
//             REPEAT
//             BEGIN
//                 // Check if budget exists
//                 JVLines.TESTFIELD("Account No.");
//                 JVLines.SetFilter("Line No.", '<>%1', 0);
//                 GLAccount.RESET;
//                 GLAccount.SETRANGE("No.", JVLines."Account No.");
//                 IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
//                 Clear(CommDocNo);
//                 CommDocNo := JVLines."No." + '-' + JVLines."Shortcut Dimension 2 Code" + '-'
//                 + JVLines."Account No." + '-' + Format(JVLines."Line No.");

//                 IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
//                 FINBudgetEntries.RESET;
//                 FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
//                 FINBudgetEntries.SETRANGE("G/L Account No.", JVLines."Account No.");
//                 FINBudgetEntries.SetRange("Document No", CommDocNo);
//                 FINBudgetEntries.DeleteAll();
//             END
//             UNTIL JVLines.NEXT = 0;
//         END;
//     end;

//     procedure CommitBudget()
//     begin
//         BCSetup.GET;
//         IF NOT ((BCSetup.Mandatory)) THEN EXIT;
//         BCSetup.TESTFIELD("Current Budget Code");
//         JVLines.TestField("Shortcut Dimension 1 Code");
//         JVLines.TESTFIELD("Shortcut Dimension 2 Code");
//         //Get Current Lines to loop through
//         JVLines.RESET;
//         JVLines.SETRANGE(JVLines."No.", JVHeader."No.");
//         IF JVLines.FIND('-') THEN BEGIN
//             REPEAT
//             BEGIN
//                 // Check if budget exists

//                 JVLines.TESTFIELD("Account No.");
//                 GLAccount.RESET;
//                 GLAccount.SETRANGE("No.", JVLines."Account No.");
//                 IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);

//                 FINBudgetEntries.RESET;
//                 FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
//                 FINBudgetEntries.SETRANGE("G/L Account No.", JVLines."Account No.");
//                 FINBudgetEntries.SETRANGE("Global Dimension 1 Code", JVLines."Shortcut Dimension 1 Code");
//                 FINBudgetEntries.SETRANGE("Global Dimension 2 Code", JVLines."Shortcut Dimension 2 Code");
//                 FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment
//                 , FINBudgetEntries."Transaction Type"::Allocation);
//                 FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2|%3', FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::"Commited/Posted",
//                 FINBudgetEntries."Commitment Status"::Commitment);
//                 FINBudgetEntries.SetFilter("Date", PostBudgetEnties.GetBudgetStartAndEndDates(JVLines."Creation Date"));
//                 IF FINBudgetEntries.FIND('-') THEN BEGIN
//                     //Message(Format(JVLines."Shortcut Dimension 2 Code"));
//                     IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
//                         IF FINBudgetEntries.Amount > 0 THEN BEGIN
//                             IF (JVLines.Amount > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name);
//                             // Commit Budget Here
//                             PostBudgetEnties.CheckBudgetAvailability(JVLines."Account No.", JVLines."Creation Date", JVLines."Shortcut Dimension 1 Code", JVLines."Shortcut Dimension 2 Code",
//                             JVLines.Amount, JVLines.Description,
//                             'JVs', JVLines."No." + JVLines."Account No." + '-' + format(JVLines."Line No."), JVLines.Description);
//                         END ELSE
//                             ERROR('No allocation for  Account:' + GLAccount.Name);
//                     END;
//                 END ELSE
//                     IF PostBudgetEnties.checkBudgetControl(JVLines."Account No.") THEN
//                         ERROR('Missing Budget for  Account:' + GLAccount.Name);
//             END;
//             UNTIL JVLines.NEXT = 0;
//         END;
//     end;

//     var
//         GLAccount: Record "G/L Account";
//         DimensionValue: Record "Dimension Value";
//         PostBudgetEnties: Codeunit "Post Budget Enties";
//         GenSetup: Record "General Ledger Setup";
//         BCSetup: Record "FIN-Budgetary Control Setup";
//         FINBudgetEntries: Record "FIN-Budget Entries";
//         CommDocNo: Code[50];
//         RevCommNo: Code[50];
//         JVLines: Record "Journals Voucher Lines";
//         JVHeader: Record "Journal Voucher Header";


// }

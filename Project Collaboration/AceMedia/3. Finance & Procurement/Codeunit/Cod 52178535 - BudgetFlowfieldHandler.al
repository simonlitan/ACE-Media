// codeunit 52178551 BudgetFlowfieldHandler

// {
//     [EventSubscriber(ObjectType::Table, Database::"FIN-Budget Entries Summary", 'OnAfterInsertEvent', '', true, true)]
//     procedure OnAfterInsertBudget(var Rec: Record "FIN-Budget Entries Summary")
//     begin
//         UpdateStoredTotalBalance(Rec);
//     end;

//     [EventSubscriber(ObjectType::Table, Database::"FIN-Budget Entries Summary", 'OnAfterModifyEvent', '', true, true)]
//     procedure OnAfterModifyBudget(var Rec: Record "FIN-Budget Entries Summary")
//     begin
//         UpdateStoredTotalBalance(Rec);
//     end;

//     procedure UpdateStoredTotalBalance(var Budget: Record "FIN-Budget Entries Summary")
//     var
//         BudgetEntry: Record "FIN-Budget Entries";
//         TotalBalance: Decimal;
//     begin
//         TotalBalance := 0;

//         BudgetEntry.SetRange("G/L Account No.", Budget."G/L Account No.");
//         if BudgetEntry.FindSet() then
//             repeat
//                 TotalBalance += BudgetEntry.Amount;
//             until BudgetEntry.Next() = 0;

//         Budget."Stored Total Balance" := TotalBalance;
//         Budget.Modify();
//     end;
// }



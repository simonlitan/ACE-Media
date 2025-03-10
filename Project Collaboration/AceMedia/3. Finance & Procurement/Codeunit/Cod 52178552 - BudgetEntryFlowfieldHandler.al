// codeunit 52178552 BudgetEntryFlowfieldHandler

// {
//     [EventSubscriber(ObjectType::Table, Database::"FIN-Budget Entries", 'OnAfterInsertEvent', '', true, true)]
//     procedure OnAfterInsertBudgetEntry(var Rec: Record "FIN-Budget Entries")
//     begin
//         UpdateBudgetBalance(Rec."G/L Account No.");
//     end;

//     [EventSubscriber(ObjectType::Table, Database::"FIN-Budget Entries", 'OnAfterModifyEvent', '', true, true)]
//     procedure OnAfterModifyBudgetEntry(var Rec: Record "FIN-Budget Entries")
//     begin
//         UpdateBudgetBalance(Rec."G/L Account No.");
//     end;

//     [EventSubscriber(ObjectType::Table, Database::"FIN-Budget Entries", 'OnAfterDeleteEvent', '', true, true)]
//     procedure OnAfterDeleteBudgetEntry(var Rec: Record "FIN-Budget Entries")
//     begin
//         UpdateBudgetBalance(Rec."G/L Account No.");
//     end;

//     procedure UpdateBudgetBalance(GlNo: Code[20])
//     var
//         Budget: Record "FIN-Budget Entries Summary";
//         Budgethandler: Codeunit BudgetFlowfieldHandler;
//     begin
//         if Budget.Get(GlNo) then begin
//             // Call the procedure to update the stored total outstanding balance
//             Budgethandler.UpdateStoredTotalBalance(Budget);
//         end;
//     end;
// }


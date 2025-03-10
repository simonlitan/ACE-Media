// reportextension 52178500 "ExtPhys. Inventory List" extends "Phys. Inventory List"
// {
//     dataset
//     {
//         addafter()
//         {
            
//         }
//     }

//  procedure OnAfterGetRecord()
//     var
//         UnitCost: Decimal;
//     begin
//         // Assuming "Unit Cost" is a field in the Physical Inventory Journal table
//         UnitCost := "Unit Cost";
//         Amount := "Quantity" * UnitCost;
//     end;
// }

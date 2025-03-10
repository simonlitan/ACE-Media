// report 80901 "clear lines"
// {
//     ApplicationArea = All;
//     Caption = 'clear lines';
//     UsageCategory = ReportsAndAnalysis;
//     dataset
//     {
//         dataitem(self; "Self Appraisal line")
//         {
//             trigger OnAfterGetRecord()
//             begin
//                 self.DeleteAll();
//             end;
//         }
//     }
//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 group(GroupName)
//                 {
//                 }
//             }
//         }
//         actions
//         {
//             area(processing)
//             {
//             }
//         }
//     }
// }

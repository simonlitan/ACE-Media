// report 52178861 "Task Groups"
// {
//     Caption = 'Task Groups';
//     DefaultLayout = RDLC;
//     RDLCLayout = './CEO/ReportsReg/SSR/Groups Task.rdl';
//     dataset
//     {
//         dataitem(TaskGroupSetup; "Task Group Setup")
//         {
//             RequestFilterFields = Status, "Created By";
//             column(CompanyName; CompInfo.Name)
//             { }
//             column(Logo; CompInfo.Picture)
//             { }
//             column(Address; CompInfo.Address)
//             { }
//             column(PhoneNo; CompInfo."Phone No.") { }
//             column(StartTime; StartTime) { }
//             column(EndTime; EndTime) { }
//             column(Title; Format(UpperCase(Title)))
//             { }
//             column(TaskGroupID; "Task Group ID")
//             {
//             }
//             column(TaskName; "Task Name")
//             {
//             }
//             column(TaskDetails; "Task Details")
//             {
//             }
//             column(DateCreated; Format("Date Created"))
//             {
//             }
//             column(CreatedBy; "Created By")
//             {
//             }
//             column(StartDate; Format("Start Date"))
//             {
//             }
//             column(DueDate; Format("Due Date"))
//             {
//             }
//             column(Status; Status)
//             {
//             }
//             dataitem("Task-Team Members"; "Task Team Member")
//             {
//                 DataItemLink = "Team Code" = field("Task Group ID");
//                 column(PF_Number; "PF Number") { }
//                 column(Full_Name; "Full Name") { }
//                 column(E_mail; "E-mail") { }
//                 column(Responsibility; Responsibility) { }
//             }
//             trigger OnAfterGetRecord()
//             begin
//                 TaskGroupSetup.Reset();
//                 TaskGroupSetup.SetFilter("Start Date", '=%1|>%1', StartTime);
//                 TaskGroupSetup.SetFilter("Due Date", '<%1|=%1', EndTime);
//             end;
//         }
//     }
//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 group("Date Filters")
//                 {
//                     field(StartTime; StartTime)
//                     {
//                         ApplicationArea = All;
//                         Caption = 'From';
//                     }
//                     field(EndTime; EndTime)
//                     {
//                         ApplicationArea = All;
//                         Caption = 'To';
//                     }
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

//     trigger OnInitReport()
//     begin
//         CompInfo.Get;
//         CompInfo.CalcFields(Picture);
//     end;

//     var
//         CompInfo: Record "Company Information";
//         Title: Label 'Group Task Report';
//         StartTime: DateTime;
//         EndTime: DateTime;
// }


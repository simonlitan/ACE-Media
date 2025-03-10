// report 6273 "CEO Appointments"
// {
//     Caption = 'CEO Appointments';
//     DefaultLayout = RDLC;
//     RDLCLayout = './CEO/ReportsReg/SSR/CEO Appointments.rdl';
//     dataset
//     {
//         dataitem(CEOAppointments; "CEO-Appointments")
//         {
//             RequestFilterFields = "Appointment ID", Department, Status;
//             column(CompanyName; CompInfo.Name)
//             { }
//             column(Logo; CompInfo.Picture)
//             { }
//             column(Address; CompInfo.Address)
//             { }
//             column(Phone; CompInfo."Phone No.") { }
//             column(Title; Format(UpperCase(Title)))
//             { }
//             column(StartTime; StartTime) { }
//             column(End_Date; "End Date") { }
//             column(AppointmentID; "Appointment ID")
//             {
//             }
//             column(AppointmentDescription; "Appointment Description")
//             {
//             }
//             column(StartDate; Format("Start Date"))
//             {
//             }
//             column(EndDate; Format("End Date"))
//             {
//             }
//             column(Department; Department)
//             {
//             }
//             column(DepartmentName; "Department Name")
//             {
//             }
//             column(Reason; Reason)
//             {
//             }
//             column(Status; Status)
//             {
//             }
//             dataitem("Appointment Party"; "Appointment Party")
//             {
//                 DataItemLink = "Appointment ID" = field("Appointment ID");
//                 column(Party_ID; "Party ID") { }
//                 column(Party_Name; "Party Name") { }
//                 column(E_Mail; "E-Mail") { }
//                 column(Phone_No_; "Phone No.") { }
//             }
//             trigger OnAfterGetRecord()
//             begin
//                 CEOAppointments.Reset();
//                 CEOAppointments.SetFilter("Start Date", '=%1|>%1', StartTime);
//                 CEOAppointments.SetFilter("End Date", '<%1|=%1', EndTime);
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
//         Title: Label 'CEO Appointments Report';
//         StartTime: DateTime;
//         EndTime: DateTime;
// }

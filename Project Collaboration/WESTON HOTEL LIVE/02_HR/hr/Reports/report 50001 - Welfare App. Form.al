// report 50001 "Welfare App. Form"
// {

//     DefaultLayout = rdlc;
//     RDLCLayout = './hr/Reports/SSR/Welfare App. Form.rdl';


//     dataset
//     {

//         dataitem("HRM-Employee C"; "HRM-Employee C")
//         {
//             column(No_; "No.")
//             {
//             }
//             column(FullName; Names)
//             {

//             }
//             column(ID_Number; "ID Number")
//             {

//             }
//             column(Marital_Status; "Marital Status")
//             {

//             }
//             column(date;date)
//             {

//             }
//             column(Spouse;Spouse){

//             }
//             column(Date_Of_Birth; "Date Of Birth")
//             {

//             }
//             column(Station_Name; "Station Name")
//             {

//             }
//             column(Next_of_Kin; "Next of Kin")
//             {

//             }
//             column(beneficiaries; kin."Line No.")
//             {

//             }
//             column("Nameofchildren"; kin.Fullname)
//             {

//             }
//             column(Gender; Gender)
//             {

//             }
//             column(Address;kin.Address)
//             {

//             }
//             column(Age; Age)
//             {

//             }
//             column(Picture;info.Picture)
//             {

//             }
//             column(compaddress;info.Address)
//             {

//             }
//               trigger OnPreDataItem()
//                 begin

//                     if Info.Get() then
//                         Info.CalcFields(Info.Picture);
//                 end;


//         }

//     }

//    dataset
//        {
//            dataitem("HRM-Employee Kin";"HRM-Employee Kin")

//            {
//                column()
//            }
//        }


//     var
//         Emp: Record "HRM-Employee C";
//         kin: Record "HRM-Employee Kin";
//         info:  Record 79; 
// }
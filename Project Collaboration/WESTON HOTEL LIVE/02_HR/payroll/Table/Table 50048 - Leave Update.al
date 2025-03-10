// table 50048 "Leave Update"
// {
//     DataClassification = ToBeClassified;
    
//     fields
//     {
//         field(1;EmplNo; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "HRM-Employee C"."No.";// where(Status = filter(Active));

//             trigger OnValidate()
//             begin
//                 if Emp.Get("Employee No") then begin
//                     Emp.CalcFields(Emp."Leave Balance");
//                     "Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
//                     "Leave Balance" := Emp."Leave Balance";
//                     "Department Code" := emp."Department Code";
//                     Salutation := emp.Salutation;
//                     "Job title" := EMP."Job Title";

//                     HOD := emp.HOD;
//                     "Phone No" := emp."Work Phone Number";
//                     "Phone No" := emp."Home Phone Number";
//                     "Days Carried forward" := emp."Reimbursed Leave Days";
//                 end;
//             end;
//         }

//         field(2; "Days Carried Forward"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(3; "Current Leave Allocation"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(4; "Available Leave Balance"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//     }
    
//     keys
//     {
//         // key(Key1; EmplNo)
//         // {
//         //     Clustered = true;
//         // }
//     }
    
//     var
//         myInt: Integer;
//         Emp: Record "HRM-Employee C";
    
//     trigger OnInsert()
//     begin
        
//     end;
    
//     trigger OnModify()
//     begin
        
//     end;
    
//     trigger OnDelete()
//     begin
        
//     end;
    
//     trigger OnRename()
//     begin
        
//     end;
    
// }
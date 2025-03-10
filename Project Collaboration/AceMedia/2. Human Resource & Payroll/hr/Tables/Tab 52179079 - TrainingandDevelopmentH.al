// table 52179079 "Training and Development H"
// {
//     Caption = 'Training And Development H';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Code"; Code[50])
//         {
//             Caption = 'Code';
//             // trigger OnValidate()
//             // var
//             //     GenLedgerSetup: Record "HRM-Setup";
//             //     NoSeriesMgt: Codeunit NoSeriesManagement;
//             // begin
//             //     GenLedgerSetup.GET;

//             //     GenLedgerSetup.TESTFIELD(GenLedgerSetup."Training Application Nos.");
//             //     NoSeriesMgt.InitSeries(GenLedgerSetup."Training Application Nos.", xRec."No. Series", 0D, "Code", "No. Series");
//             // end;
//         }
//         field(2; "Employee No"; Code[30])
//         {
//             TableRelation = "HRM-Employee C"."No.";
//             trigger OnValidate()
//             var
//                 emp: Record "HRM-Employee C";
//             begin
//                 emp.SetRange(emp."No.", "Employee No");
//                 if emp.Find('-') then begin
//                     "Employee Name" := emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";
//                     "Date of Appointment" := emp."Date of Current Appointment";
//                     Designation := emp."Job Title";
//                 end;
//                 //"Highest Academic Qualification":=emp
//             end;

//         }
//         Field(3; "Employee Name"; Text[100])
//         {

//         }
//         field(7; "No. Series"; Code[20])
//         {
//         }

//         field(5; Status; Option)
//         {
//             OptionMembers = Open,Pending,Approved,Released,Rejected;
//         }
//         field(6; "No Series"; Code[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(8; "Date of Appointment"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(9; Designation; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         Field(10; "Training Period"; Code[50])
//         {

//         }
//     }
//     keys
//     {
//         key(PK; "Code")
//         {
//             Clustered = true;
//         }
//     }
//     trigger OnInsert()
//     var
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         emp: Record "HRM-Employee C";
//         HRSetup: Record "HRM-Setup";
//     begin
//         if Code = '' then begin
//             HRSetup.Reset;
//             if HRSetup.Find('-') then begin
//                 HRSetup.TestField(HRSetup."Training Application Nos.");
//                 NoSeriesMgt.InitSeries(HRSetup."Training Application Nos.", xRec."No. Series", 0D, code, "No. Series");
//             end;
//         end;
//         If "Employee No" <> '' then begin
//             emp.SetRange(emp."No.", "Employee No");
//             if emp.Find('-') then begin
//                 "Date of Appointment" := emp."Date of Current Appointment";
//                 Designation := emp."Job Title";
//             end;
//         end;

//     end;
// }


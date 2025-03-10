// /// <summary>
// /// Table HRM-Leave Types (ID 61279).
// /// </summary>
// table 50050 "HRM-OffDays Type"
// {
//     //LookupPageID = "HRM-Leave Types";

//     fields
//     {
//         field(1; "Code"; Code[20])
//         {
//             NotBlank = true;
//         }
//         field(2; Description; Text[200])
//         {
//         }
//         field(3; Days; Decimal)
//         {
//         }
//         field(4; "Acrue Days"; Boolean)
//         {
//         }
//         field(5; "Unlimited Days"; Boolean)
//         {
//         }
//         field(6; Gender; Option)
//         {
//             OptionCaption = 'Male,Female';
//             OptionMembers = Male,Female;
//         }
//         field(7; Balance; Option)
//         {
//             OptionCaption = 'Ignore,Carry Forward';
//             OptionMembers = Ignore,"Carry Forward";
//         }
//         field(8; "Inclusive of Holidays"; Boolean)
//         {
//         }
//         field(9; "Is on Saturday"; Boolean)
//         {
//         }
//         field(10; "Is on Sunday"; Boolean)
//         {
//         }
//         field(17; "Is on Monday"; Boolean)
//         {
//         }field(18; "Is on Tuesday"; Boolean)
//         {
//         }field(19; "IIs on Wednesday"; Boolean)
//         {
//         }field(20; "Is on Thursday"; Boolean)
//         {
//         }field(21; "Is on Friday"; Boolean)
//         {
//         }
//         field(11; "Off/Holidays Days Leave"; Boolean)
//         {
//         }
//         field(12; "Max Carry Forward Days"; Decimal)
//         {

//             trigger OnValidate()
//             begin
//                 if Balance <> Balance::"Carry Forward" then
//                     "Max Carry Forward Days" := 0;
//             end;
//         }
//         field(13; "Inclusive of Non Working Days"; Boolean)
//         {
//         }
//         field(14; "Date Filter"; Date)
//         {
//             FieldClass = FlowFilter;
//         }
//         field(15; Applied; Code[20])
//         {
//         }
//         field(16; "Deduct From Leave Days"; Boolean)
//         {
//         }
//     }

//     keys
//     {
//         key(Key1; "Code")
//         {
//         }
//     }

//     fieldgroups
//     {
//     }

//     trigger OnInsert()
//     begin
//         Rec."Deduct From Leave Days" := true;
//     end;
// }


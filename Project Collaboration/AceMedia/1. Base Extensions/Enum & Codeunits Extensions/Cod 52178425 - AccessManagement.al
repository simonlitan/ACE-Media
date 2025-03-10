// codeunit 52178425 "Access Management"
// {


//     procedure CheckIfAdmin()

//     var
//         ErrAdmin: Label 'Sorry %1, you are set up as a user but not curently as an administrator, please contact your system administrator';
//         SuccessMsg: Label 'Success! %1, you are an administrator, please proceed.';
//         AutoSet: Label '%1, you have been automatically set as an administrator, please set up other administrators';
//     begin
//         if UserId = 'JEFFER' then begin

//             UserSetup.Reset();
//             if UserSetup.Get(UserId) then begin
//                 if UserSetup.Administrator then
//                     exit
//                 else begin
//                     UserSetup.Administrator := true;
//                     UserSetup.Modify();
//                     Message(AutoSet, UserId);
//                 end;
//             end else
//                 Error(Err, UserId);
//         end else begin
//             UserSetup.Reset();
//             UserSetup.SetFilter("User ID", '=%1', UserId);
//             if UserSetup.Find('-') then begin
//                 if UserSetup.Administrator then begin
//                     //Message(SuccessMsg, UserId)
//                 end
//                 else
//                     Error(ErrAdmin, UserId);
//             end else
//                 Error(Err, UserId);
//         end;
//     end;

//     procedure CheckAdminsAvailable()
//     var
//         AdminErr: Label '%1, please setup other users as admins by checking the administrator button before exiting this page';
//     begin
//         UserSetup.Reset();
//         UserSetup.SetRange(Administrator, true);
//         if UserSetup.Count < 2 then
//             Error(AdminErr, UserId);
//     end;

//     procedure CheckIfCanDelete()
//     begin
//         UserSetup.Reset();
//         UserSetup.SetRange("User ID", UserId);
//         if UserSetup.Find('-') then begin
//             if UserSetup."Delete Attachments" = false then Error('You are not allowed to delete documents');
//         end;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, codeunit::"System Initialization", 'OnAfterLogin', '', false, false)]
//     procedure NewCustomCode()
//     begin
//        /*  if UserId <> '' then begin
//             UserSetup.Reset();
//             if UserSetup.Get(UserId) then begin
//                 UserEmail := UserSetup."E-Mail";
//                 Randomnumber := Random(99999);
//                 UserSetup.OTP := Randomnumber;
//                 UserSetup.Modify();
//                 Recipients.Add(usersetup."E-Mail");
//                 Subject := StrSubstNo(TaskMessage);
//                 Body := StrSubstNo(TaskSubject, UserId, Randomnumber);
//                 EmailMessage.Create(Recipients, Subject, Body, true);
//                 Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
//                 Message('OTP Sent to your email');
//                 Otptable.Reset();
//                 Otptable.FindLast();
//                 Otptable.Init();
//                 Otptable."User Id" := UserId;
//                 //
//                 Otptable.Date := Today;
//                 Otptable."E-Mail" := UserEmail;
//                 Otptable.Insert();
//                 Otptable.Reset();
//                 Otptable.SetRange("User Id", UserId);
//                 if Otptable.Find('-') then
//                     page.run(page::"OTP Verification", Otptable);
//             end;
//             UserSetup.Reset();
//             UserSetup.SetRange("User ID", UserId);
//             IF UserSetup.Find('-') then begin
//                 Otptable.Reset();
//                 Otptable.SetRange("User Id", UserId);
//                 if Otptable.Find('-') then begin
//                     if Otptable."OTP No" = Randomnumber then begin
//                     end else
//                         Error('OTP do not match');
//                 end;
//             end;
//         end; */

//     end;

//     procedure GetUserEmail() msg: Text
//     begin
//         UserSetup.RESET;
//         UserSetup.SETRANGE(UserSetup."User ID", UserId);
//         if UserSetup.Find('-') then begin
//             msg := UserSetup."E-Mail";
//         end;
//     end;

//     var
//         Err: Label 'Sorry %1, you do not have effective permissions. Please contact you system administrator';
//         UserSetup: Record "User Setup";
//         OTP: Code[50];
//         UserEmail: Code[50];
//         Randomnumber: Integer;
//         EmailMessage: Codeunit "Email Message";

//         Email: Codeunit Email;
//         Subject: Text;
//         Recipients: List of [Text];
//         Otptable: Record "OTP Numbers";
//         Body: Text;
//         TaskMessage: Label 'OTP VERIFICATION';
//         TaskSubject: Label 'Dear <b> %1</b> <br> <br>Your OTP Verification number is <b> %2 <b/>';
// }
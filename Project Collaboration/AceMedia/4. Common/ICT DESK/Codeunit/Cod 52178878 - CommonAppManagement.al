codeunit 52178887 "Common App Management1"
{
    trigger OnRun()
    begin

    end;

    var
        UserSetup: Record "User Setup";
        DateEquivalent: Date;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";

    procedure GetHOD(Dept: Code[20]): Code[20]
    var
        HoD: Code[20];
        SupportDesk: Record "ICT Support Desk";
    begin
        UserSetup.Reset();
        UserSetup.SetRange("Global Dimension 2 Code", Dept);
        if UserSetup.HOD then
            if UserSetup.Find('-') then begin
                SupportDesk."Assignining Adminstrator" := UserSetup."User ID";
            end;
    end;



    procedure AlertSupportTeam(SupportDesk: Record "ICT Support Desk")
    var
        Member: Record "ICT Support Desk team";
        Recipients: List of [Text];
        Body: Text;
        Subject: Label 'ICT Support Desk';
        ERPLink: Label 'http://185.219.142.163:8080/KCIC/?tenant=default&company=PCF&dc=0';
        Message: Label 'Dear Support Team Member, <br> <br> This is to inform you that %1 has raised a support ticket no. %2 on %3 which is about %4. <br> <br> Please <a hrefg="%5"> log in </a> and resolve.<br><br> Regards ICT Support Desk';
    begin
        Member.Reset();
        if Member.FindSet(true, true) then begin
            repeat
                Recipients.Add(Member.EMail);
            until Member.Next() = 0;
        end;
        Body := StrSubstNo(Message, SupportDesk."Requesting User", SupportDesk."No.", SupportDesk."Raised Date", SupportDesk."Area Description", ERPLink);
        EmailMessage.Create(Recipients, Subject, Body, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        Message('Support alert sent successfully');
    end;

    procedure VisitorPassAlert(VisitorPass: Record "Visitor Pass")
    var
        Recipients: List of [Text];
        Body: Text;
        Subject: Label 'CEO Visitor Pass';
        ERPLink: Label 'http://185.219.142.163:8080/KCIC/?tenant=default&company=PCF&dc=0';
        Message: Label 'Greetings %1, <br> <br> This is to request your permission for visitor pass belonging to %2 %3 from %4 to your office. %5 is here for a %6 visit on %7. <br> <br> Please <a href="%8"> log in </a> to take action on visitor pass %9.<br><br> Regards CRM Desk';
    begin
        UserSetup.Reset();
        UserSetup.SetRange("Global Dimension 2 Code", 'CEO');
        if UserSetup.Find('-') then begin
            repeat
                Recipients.Add(UserSetup."E-Mail");
            until UserSetup.Next() = 0;
        end;
        Body := StrSubstNo(Message, VisitorPass."Officer to visit", VisitorPass.Salutation, VisitorPass."Full Name", VisitorPass.From, VisitorPass."Full Name", VisitorPass."Visit Reason", VisitorPass.Date, ERPLink, VisitorPass."Visitor ID");
        EmailMessage.Create(Recipients, Subject, Body, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        Message('Visitor Pass alert sent successfully');
    end;

    procedure AlertCustomerService(VisitorPass: Record "Visitor Pass")
    var
        Recipients: List of [Text];
        CRMOfficer: Text;
        Body: Text;
        Subject: Label 'CEO Visitor Pass';
        ERPLink: Label 'http://185.219.142.163:8080/KCIC/?tenant=default&company=PCF&dc=0';
        Message: Label 'Greetings %1, <br> <br> This is to notify you that visitor pass belonging to %2 %3 from %4 to CEO''s office has been %4. <br> <br> Please <a href="%5"> log in </a> to take action on visitor pass %6.<br><br> Regards CRM Notifications';
    begin
        UserSetup.Reset();
        if UserSetup.Get('Appkings') then begin
            Recipients.Add(UserSetup."E-Mail");
            // CRMOfficer := UserSetup."Staff Name";
        end;
        Body := StrSubstNo(Message, CRMOfficer, VisitorPass.Salutation, VisitorPass."Full Name", VisitorPass.From, VisitorPass.Status, ERPLink, VisitorPass."Visitor ID");
        EmailMessage.Create(Recipients, Subject, Body, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        Message('Visitor Pass alert sent successfully');
    end;



    procedure NotifyMailActor(InMail: Record "Incoming Mail")
    var
        Actor: Record "Mail Actor";
        Recipients: List of [Text];
        Body: Text;
        Subject: Text;

    begin
        Actor.Reset();
        Actor.SetRange("Mail Code", InMail."Ref No");
        if Actor.FindSet(true, true) then begin
            repeat
                Recipients.Add(Actor.EMail);
            until Actor.Next() = 0;
        end;
        Subject := InMail."Mail Subject";
        // Body := StrSubstNo(Message, InMail."Ref No", Today, ERPLink);
        EmailMessage.Create(Recipients, Subject, Body, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        Message('Actors Notified Successfully');
    end;

    procedure CheckIfAdminstrator()
    var
        Err: Label 'Sorry %1 you cannot execute this. Please contact your system administrator.';
    begin
        UserSetup.Reset();
        UserSetup.SetRange("User ID", UserId);
        // UserSetup.SetRange(administrator, true);
        if not UserSetup.Find('-') then
            Error(Err, UserId);
    end;

    procedure ChangeRoleCenter()
    var
        Err: Label 'Sorry %1 you cannot Change Roles';
    begin
        UserSetup.Reset();
        UserSetup.SetRange("User ID", UserId);
        //  UserSetup.SetRange(Administrator, true);
        // UserSetup.SetRange("Change RC", true);
        if not UserSetup.Find('-') then
            Error(Err, UserId);
    end;


}


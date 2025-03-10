codeunit 52178884 "Send Email Auto"

{

 
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterDeleteAfterPosting', '', false, false)]
    local procedure OnAfterDeleteAfterPosting(SalesHeader: Record "Sales Header"; SalesInvoiceHeader: Record "Sales Invoice Header"; SalesCrMemoHeader: Record "Sales Cr.Memo Header"; CommitIsSuppressed: Boolean)
    var
        //SmtpMailSetup: Record "SMTP Mail Setup";
        //Mail: Codeunit "SMTP Mail";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipients: List of [Text];
        Subject: Text;
        Body: Text;
        SalesPostedTitle: Label 'The Sales Document %2 of Customer %1 has been posted.';
        SalesPostedMsg: Label 'Dear Manager<br><br>The Sales Document <font color="red"><strong>%2</strong></font> of Customer <strong>%1</strong> has been posted.<br> The total amount is <strong>%3</strong>. <br>The Posted Invoice Number is <strong>%4</strong>. <br> User ID <strong>%5</strong>';
    begin
        Recipients.Add('yzhums@outlook.jp');
        Recipients.Add('admin@crmbc572567.onmicrosoft.com');
        SalesInvoiceHeader.CalcFields("Amount Including VAT");
        Subject := StrSubstNo(SalesPostedTitle, SalesHeader."Sell-to Customer Name", SalesHeader."No.");
        Body := StrSubstNo(SalesPostedMsg, SalesHeader."Sell-to Customer Name", SalesHeader."No.", SalesInvoiceHeader."Amount Including VAT", SalesInvoiceHeader."No.", UserId);
        EmailMessage.Create(Recipients, Subject, Body, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;


    procedure OnSendMail()

    begin
        Recipients.Add('');


        Subject := StrSubstNo('');
        Body := StrSubstNo('');
        EmailMessage.Create(Recipients, Subject, Body, true);

        Email.OpenInEditor(EmailMessage);
    end;



    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipients: List of [Text];
        Subject: Text;
        Body: Text;
        SalesPostedTitle: Label 'The Sales Document %2 of Customer %1 has been posted.';
        SalesPostedMsg: Label 'Dear Manager<br><br>The Sales Document <font color="red"><strong>%2</strong></font> of Customer <strong>%1</strong> has been posted.<br> The total amount is <strong>%3</strong>. <br>The Posted Invoice Number is <strong>%4</strong>. <br> User ID <strong>%5</strong>';

}


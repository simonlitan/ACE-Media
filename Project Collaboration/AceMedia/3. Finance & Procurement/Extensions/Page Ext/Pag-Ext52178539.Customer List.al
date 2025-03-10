/// <summary>
/// PageExtension MyExtension (ID 52178502) extends Record MyTargetPage.
/// </summary>
pageextension 52178539 "ExtCustomer List" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Sales)
        {
            action("Aged Two")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                Image = ReceivableBill;
                RunObject = Report "Aged Receivable Two";
            }
            action(CustDetail)
            {
                ApplicationArea = all;
                RunObject = page "Customer Details";
            }
            action("Send Mails")
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    Instream: InStream;
                    Outstream: OutStream;
                    TempBlob: Codeunit "Temp Blob";
                    RecRef: RecordRef;
                    FieldRef: FieldRef;
                    Mail: Codeunit "Email Message";
                    Recipients: list of [Text];
                    Body: Text;

                begin
                    TempBlob.CreateOutStream(Outstream);
                    RecRef.Open(Database::Customer);
                    FieldRef := RecRef.Field(1);
                    FieldRef.SetRange(Rec."No.");
                    report.SaveAs(52178578, '', ReportFormat::Html, Outstream, RecRef);
                    TempBlob.CreateInStream(Instream);
                    instream.ReadText(Body);
                    Recipients.Add('Litansimon@gmail.com');
                    //  Mail.Create('Appkings', 'slitan@appkings.co.ke', Recipients, 'Mail from BC', Body, true);
                    //  Mail.send()


                end;
            }


        }

    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        USetup.RESET;
        USetup.SETRANGE(USetup."User ID", USERID);
        USetup.SETRANGE(USetup."Create Customer", false);
        IF USetup.FIND('-') THEN ERROR('You are not authorised');


    end;

    var
        myInt: Integer;
        USetup: record "User Setup";

}
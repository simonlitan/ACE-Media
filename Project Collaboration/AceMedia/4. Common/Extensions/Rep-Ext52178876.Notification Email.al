reportextension 52178876 "ExtNotification Email" extends "Notification Email"
{
    dataset
    {
    }


    procedure SetReportFieldPlaceholders(SourceRecRef: RecordRef)
    var

        CompanyInformation: Record "Company Information";
        ReceipientUser: Record User;
        PageManagement: Codeunit "Page Management";
        DataTypeManagement: Codeunit "Data Type Management";
        NotificationManagement: Codeunit "Notification Management";
        SettingsURL: Text;
        SettingsWinURL: Text;
        DocumentType: Text;
        DocumentNo: Text;
        DocumentName: Text;
        DocumentURL: Text;
        ActionText: Text;
        Field1Label: Text;
        Field1Value: Text;
        Field2Label: Text;
        Field2Value: Text;
        Field3Label: Text;
        Field3Value: Text;
        SettingsLbl: Label 'Notification Settings';
        SettingsWinLbl: Label '(Windows Client)';
        CustomLinkLbl: Label '(Custom Link)';
        Line1Lbl: Label 'Hello %1,', Comment = '%1 = User Name';
        Line2Lbl: Label 'You are registered to receive notifications related to %1.', Comment = '%1 = Company Name';
        Line3Lbl: Label 'This is a message to notify you that:';
        Line4Lbl: Label 'Notification messages are sent automatically and cannot be replied to. But you can change when and how you receive notifications:';
        DetailsLabel: Text;
        DetailsValue: Text;
        Line1: Text;
        Line2: Text;
        DetailsLbl: Label 'Details';
        Customer: Record Customer;
        Vendor: Record Vendor;
        Item: Record Item;
        IncomingDocument: Record "Incoming Document";
        GenJournalLine: Record "Gen. Journal Line";
        GenJournalBatch: Record "Gen. Journal Batch";
        ApprovalEntry: Record "Approval Entry";
        OverdueApprovalEntry: Record "Overdue Approval Entry";
        RecRef: RecordRef;
        FieldRef: FieldRef;
        RecordDetails: Text;
        HasApprovalEntryAmount: Boolean;
    begin
        Clear(Field1Label);
        Clear(Field1Value);
        Clear(Field2Label);
        Clear(Field2Value);
        Clear(Field3Label);
        Clear(Field3Value);
        Clear(DetailsLabel);
        Clear(DetailsValue);

        DetailsLabel := DetailsLbl;
        DetailsValue := "Notification Entry".FieldCaption("Created By") + ' ' + GetCreatedByText;

        if SourceRecRef.Number = DATABASE::"Approval Entry" then begin
            HasApprovalEntryAmount := true;
            SourceRecRef.SetTable(ApprovalEntry);
        end;

        GetTargetRecRef(SourceRecRef, RecRef);

        case RecRef.Number of

            DATABASE::"FIN-Memo Header",
          DATABASE::"HRM-Leave Requisition",
            DATABASE::"FIN-Imprest Header",
            DATABASE::"FIN-Payments Header",
            DATABASE::"FIN-Receipts Header",
            DATABASE::"FIN-Imprest Surr. Header",
            DATABASE::"Advance PettyCash Header",
            DATABASE::"FIN-Staff Advance Header",
            DATABASE::"FIN-Staff Advance Surr. Header",
            DATABASE::"PROC-Store Requistion Header",
            DATABASE::"Prl-Approval",
          DATABASE::"Purch. Inv. Header":
                ;


        end;

        case "Notification Entry".Type of
            "Notification Entry".Type::Approval:
                begin
                    SourceRecRef.SetTable(ApprovalEntry);
                    Field3Label := ApprovalEntry.FieldCaption("Due Date");
                    Field3Value := Format(ApprovalEntry."Due Date");
                    RecordDetails := ApprovalEntry.GetChangeRecordDetails;
                    if RecordDetails <> '' then
                        DetailsValue += RecordDetails;
                end;
            "Notification Entry".Type::Overdue:
                begin
                    Field3Label := OverdueApprovalEntry.FieldCaption("Due Date");
                    FieldRef := SourceRecRef.Field(OverdueApprovalEntry.FieldNo("Due Date"));
                    Field3Value := Format(FieldRef.Value);
                end;
        end;

        OnSetReportFieldPlaceholdersOnBeforeGetWebUrl(RecRef, Field1Label, Field1Value, Field2Label, Field2Value, Field3Label, Field3Value, SourceRecRef, DetailsLabel, DetailsValue, "Notification Entry");
        DocumentURL := PageManagement.GetWebUrl(RecRef, "Notification Entry"."Link Target Page");
        OnSetReportFieldPlaceholdersOnAfterGetDocumentURL(DocumentURL, "Notification Entry");
    end;

    local procedure GetTargetRecRef(RecRef: RecordRef; var TargetRecRefOut: RecordRef)
    var
        ApprovalEntry: Record "Approval Entry";
        OverdueApprovalEntry: Record "Overdue Approval Entry";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeGetTargetRecRef(RecRef, TargetRecRefOut, IsHandled, "Notification Entry");
        if IsHandled then
            exit;

        case "Notification Entry".Type of
            "Notification Entry".Type::"New Record":
                TargetRecRefOut := RecRef;
            "Notification Entry".Type::Approval:
                begin
                    RecRef.SetTable(ApprovalEntry);
                    TargetRecRefOut.Get(ApprovalEntry."Record ID to Approve");
                end;
            "Notification Entry".Type::Overdue:
                begin
                    RecRef.SetTable(OverdueApprovalEntry);
                    TargetRecRefOut.Get(OverdueApprovalEntry."Record ID to Approve");
                end;
        end;
    end;

    local procedure GetCreatedByText(): Text
    begin
        if "Notification Entry"."Sender User ID" <> '' then
            exit(GetUserFullName("Notification Entry"."Sender User ID"));
        exit(GetUserFullName("Notification Entry"."Created By"));
    end;

    local procedure GetUserFullName(NotificationUserID: Code[50]): Text[80]
    var
        User: Record User;
    begin
        User.SetRange("User Name", NotificationUserID);
        if User.FindFirst and (User."Full Name" <> '') then
            exit(User."Full Name");
        exit(NotificationUserID);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetTargetRecRef(RecRef: RecordRef; var TargetRecRefOut: RecordRef; var IsHandled: Boolean; NotificationEntry: Record "Notification Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnSetReportFieldPlaceholders(RecRef: RecordRef; var Field1Label: Text; var Field1Value: Text; var Field2Label: Text; var Field2Value: Text; var Field3Label: Text; var Field3Value: Text; var DetailsLabel: Text; var DetailsValue: Text)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnSetReportFieldPlaceholdersOnAfterGetDocumentURL(var DocumentURL: Text; var NotificationEntry: Record "Notification Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnSetReportFieldPlaceholdersOnBeforeGetWebUrl(RecRef: RecordRef; var Field1Label: Text; var Field1Value: Text; var Field2Label: Text; var Field2Value: Text; var Field3Label: Text; var Field3Value: Text; var SourceRecRef: RecordRef; var DetailsLabel: Text; var DetailsValue: Text; NotificationEntry: Record "Notification Entry")
    begin
    end;

    local procedure FormatAmount(Amount: Decimal): Text
    begin
        exit(Format(Amount, 0, '<Precision,2><Standard Format,0>'));
    end;

}

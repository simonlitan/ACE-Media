codeunit 52179091 "Documents"
{

    var
        Hrmemp: Record "HRM-Employee C";
        BackOffice: record "HRM-Back To Office Form";
        ExitInter: Record "HRM-Employee Exit Interviews";
        JobApp: record "HRM-Job Applications (B)";
        FieldRef: FieldRef;
        ADR: Record "HRM-Alternative Dispute R";
        RecNo: Code[20];

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);

    begin
        case DocumentAttachment."Table ID" of
            DATABASE::"HRM-Job Applications (B)":
                begin
                    RecRef.Open(DATABASE::"HRM-Job Applications (B)");
                    if JobApp.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(JobApp);
                end;
        end;

        case DocumentAttachment."Table ID" of
            DATABASE::"HRM-Employee C":
                begin
                    RecRef.Open(DATABASE::"HRM-Employee C");
                    if Hrmemp.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(Hrmemp);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"HRM-Back To Office Form":
                begin
                    RecRef.Open(DATABASE::"HRM-Back To Office Form");
                    if BackOffice.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(BackOffice);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"HRM-Employee Exit Interviews":
                begin
                    RecRef.Open(DATABASE::"HRM-Employee Exit Interviews");
                    if ExitInter.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(ExitInter);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"HRM-Alternative Dispute R":
                begin
                    RecRef.Open(DATABASE::"HRM-Alternative Dispute R");
                    if ADR.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(ADR);
                end;
        end;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    begin


        case RecRef.Number of
            DATABASE::"HRM-Job Applications (B)":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"HRM-Employee C":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"HRM-Back To Office Form":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"HRM-Employee Exit Interviews":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"HRM-Alternative Dispute R":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)

    begin

        case RecRef.Number of
            DATABASE::"HRM-Job Applications (B)":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"HRM-Employee C":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"HRM-Back To Office Form":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"HRM-Employee Exit Interviews":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"HRM-Alternative Dispute R":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;

    end;
}

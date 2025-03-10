/// <summary>
/// Codeunit Document Attachment (ID 52178503).
/// </summary>
codeunit 52178500 "DocumentAttachment2"

{
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        PaymentTerms: Record "FIN-Memo Header";
        Imprestheader: record "FIN-Imprest Header";
        PaymentHeader: Record "FIN-Payments Header";
        ImprestSurrender: Record "FIN-Imprest Surr. Header";
        ClaimHeader: Record "FIN-Staff Claims Header";
        PettyCash: Record "Advance PettyCash Header";
        LeaveApplication: Record "HRM-Leave Requisition";
        BankTransfer: Record "FIN-InterBank Transfers";
    begin
        case DocumentAttachment."Table ID" of
            DATABASE::"FIN-Memo Header":
                begin
                    RecRef.Open(DATABASE::"FIN-Memo Header");
                    if PaymentTerms.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(PaymentTerms);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"FIN-Imprest Header":
                begin
                    RecRef.Open(DATABASE::"FIN-Imprest Header");
                    if Imprestheader.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(Imprestheader);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"FIN-Payments Header":
                begin
                    RecRef.Open(DATABASE::"FIN-Payments Header");
                    if PaymentHeader.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(PaymentHeader);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"FIN-Imprest Surr. Header":
                begin
                    RecRef.Open(DATABASE::"FIN-Imprest Surr. Header");
                    if ImprestSurrender.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(ImprestSurrender);
                end;
        end;

        case DocumentAttachment."Table ID" of
            DATABASE::"FIN-Staff Claims Header":
                begin
                    RecRef.Open(DATABASE::"FIN-Staff Claims Header");
                    if ClaimHeader.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(ClaimHeader);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"Advance PettyCash Header":
                begin
                    RecRef.Open(DATABASE::"Advance PettyCash Header");
                    if PettyCash.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(PettyCash);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"FIN-InterBank Transfers":
                begin
                    RecRef.Open(DATABASE::"FIN-InterBank Transfers");
                    if BankTransfer.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(BankTransfer);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::"FIN-Memo Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"FIN-Imprest Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"FIN-Payments Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"FIN-Imprest Surr. Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Advance PettyCash Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;


        case RecRef.Number of
            DATABASE::"FIN-Staff Claims Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"FIN-Staff Advance Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"FIN-InterBank Transfers":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
    end;




    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::"FIN-Memo Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"FIN-Imprest Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"FIN-Payments Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"FIN-Imprest Surr. Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"FIN-Staff Claims Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Advance PettyCash Header":

                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"FIN-InterBank Transfers":

                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
    end;

}

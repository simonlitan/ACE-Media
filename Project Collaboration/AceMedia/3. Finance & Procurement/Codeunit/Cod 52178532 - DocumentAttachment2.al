/// <summary>
/// Codeunit Document Attachment (ID 52178503).
/// </summary>
codeunit 52178532 "DocumentAttachment2"
{
    var
        PaymentTerms: Record "FIN-Memo Header";
        Imprestheader: record "FIN-Imprest Header";
        ImprestAcc: record "FIN-Imprest Surr. Header";
        StaffClaims: record "FIN-Staff Claims Header";
        PaymentsHeader: record "FIN-Payments Header";
        FieldRef: FieldRef;
        RecNo: Code[20];
        RFQ: Record "PROC-Purchase Quote Header";
        PreqApp: record "Prequalification Application";
        Evalrep: Record "Proc Evaluation Report";


        Tender: record "Tender Applicants Registration";


    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);

    begin
        case DocumentAttachment."Table ID" of
            DATABASE::"FIN-Payments Header":
                begin
                    RecRef.Open(DATABASE::"FIN-Payments Header");
                    if PaymentsHeader.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(PaymentsHeader);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"FIN-Imprest Surr. Header":
                begin
                    RecRef.Open(DATABASE::"FIN-Imprest Surr. Header");
                    if ImprestAcc.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(ImprestAcc);
                end;
        end;
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
            DATABASE::"FIN-Staff Claims Header":
                begin
                    RecRef.Open(DATABASE::"FIN-Staff Claims Header");
                    if StaffClaims.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(StaffClaims);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"PROC-Purchase Quote Header":
                begin
                    RecRef.Open(DATABASE::"PROC-Purchase Quote Header");
                    if RFQ.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(RFQ);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"Prequalification Application":
                begin
                    RecRef.Open(DATABASE::"Prequalification Application");
                    if PreqApp.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(PreqApp);
                end;
        end;
        case DocumentAttachment."Table ID" of
            DATABASE::"Proc Evaluation Report":
                begin
                    RecRef.Open(DATABASE::"Proc Evaluation Report");
                    if Evalrep.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(Evalrep);
                end;
        end;

        case DocumentAttachment."Table ID" of
            DATABASE::"Tender Applicants Registration":
                begin
                    RecRef.Open(DATABASE::"Tender Applicants Registration");
                    if Evalrep.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(Evalrep);
                end;
        end;

    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    begin
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
            DATABASE::"FIN-Staff Claims Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"PROC-Purchase Quote Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Prequalification Application":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Proc Evaluation Report":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Tender Applicants Registration":
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
            DATABASE::"FIN-Staff Claims Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"PROC-Purchase Quote Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Prequalification Application":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Proc Evaluation Report":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
        case RecRef.Number of
            DATABASE::"Tender Applicants Registration":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;


    end;


}

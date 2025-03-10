page 52178720 "FIN-Bank & Cash Trans. Req. UP"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "FIN-InterBank Transfers";
    SourceTableView = WHERE(Posted = filter(false),
                            Status = FILTER(<> Cancelled));
    PromotedActionCategories = 'New, Approval Request, Report,Attachment, Post';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    Editable = false;
                    Enabled = true;
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    Editable = DateEditable;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                label(_________________)
                {
                    CaptionClass = Text19025618;
                    Style = Standard;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("Receiving Depot Code"; Rec."Receiving Depot Code")
                {
                    ApplicationArea = All;
                }
                field("Receiving Department Code"; Rec."Receiving Department Code")
                {
                    ApplicationArea = All;
                    // ApplicationArea = All;
                }
                field("Receiving Account"; Rec."Receiving Account")
                {
                    Editable = "Receiving AccountEditable";
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        ReceivingAccountOnAfterValidat;
                    end;
                }
                field("Receiving Bank Account Name"; Rec."Receiving Bank Account Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Currency Code Destination"; Rec."Currency Code Destination")
                {
                    ApplicationArea = All;
                    // ApplicationArea = All;
                }
                field("Amount 2"; Rec."Amount 2")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Request Amt LCY"; Rec."Request Amt LCY")
                {
                    Editable = false;
                    ApplicationArea = All;

                }
                field("Exch. Rate Destination"; Rec."Exch. Rate Destination")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                label(_______________________)
                {
                    CaptionClass = Text19044997;
                    Style = Standard;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }


                field("Source Depot Code"; Rec."Source Depot Code")
                {
                    ApplicationArea = All;
                }
                field("Source Department Code"; Rec."Source Department Code")
                {
                    ApplicationArea = All;
                    //ApplicationArea = All;
                }
                field("Paying Account"; Rec."Paying Account")
                {
                    ApplicationArea = All;
                    Editable = "Paying AccountEditable";

                    trigger OnValidate()
                    begin
                        PayingAccountOnAfterValidate;
                    end;
                }
                field("Paying  Bank Account Name"; Rec."Paying  Bank Account Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Currency Code Source"; Rec."Currency Code Source")
                {
                    Editable = false;
                    ApplicationArea = All;

                }
                field(Amount; Rec.Amount)
                {
                    Editable = AmountEditable;
                    ApplicationArea = All;
                }
                field("Pay Amt LCY"; Rec."Pay Amt LCY")
                {
                    ApplicationArea = All;
                    //ApplicationArea = All;
                }
                field("External Doc No."; Rec."External Doc No.")
                {
                    Editable = "External Doc No.Editable";
                    ApplicationArea = All;
                }
                field("Transfer Release Date"; Rec."Transfer Release Date")
                {
                    Editable = "Transfer Release DateEditable";
                    ApplicationArea = All;
                }

                field("Exch. Rate Source"; Rec."Exch. Rate Source")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    Editable = RemarksEditable;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Attachments)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                Image = Attachments;
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
            group(Process)
            {

                action(Approvals)
                {
                    ApplicationArea = All;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "Fin-Approval Entries";
                    RunPageLink = "Document No." = field("No");
                }
                separator(__________________________)
                {
                }
                action(sendApproval)
                {
                    ApplicationArea = All;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;

                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Init Code";
                    begin

                        if ApprovalMgt.IsInterBankEnabled(Rec) = true then
                            ApprovalMgt.OnSendInterBankforApproval(Rec);
                    end;
                }
                action(cancellsApproval)
                {
                    ApplicationArea = All;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Init Code";

                    begin
                        if ApprovalMgt.IsInterBankEnabled(Rec) = true then
                            ApprovalMgt.OnCancelInterBankforApproval(Rec);
                    end;
                }
                separator(___________)
                {

                }
                action(Print)
                {
                    ApplicationArea = All;
                    Caption = 'Print';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Report;
                    trigger OnAction()
                    begin
                        Rec.RESET;
                        Rec.SETRANGE(No, Rec.No);
                        REPORT.RUN(Report::"Interbank Transfers", TRUE, TRUE, Rec);
                        Rec.RESET;
                    end;
                }

            }
            group(post)
            {
                action("&Post")
                {
                    ApplicationArea = All;
                    Caption = '&Post';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.PostTransfer();
                    end;
                }
            }

        }
    }

    trigger OnAfterGetRecord()
    begin
        //OnAfterGetCurrRecord;
    end;

    trigger OnInit()
    begin
        "Transfer Release DateEditable" := TRUE;
        "External Doc No.Editable" := TRUE;
        "Exch. Rate SourceEditable" := TRUE;
        AmountEditable := TRUE;
        "Paying AccountEditable" := TRUE;
        SendingResponsibilityCenterEdi := TRUE;
        "Source Transfer TypeEditable" := TRUE;
        "Exch. Rate DestinationEditable" := TRUE;
        RemarksEditable := TRUE;
        "Amount 2Editable" := TRUE;
        "Receiving AccountEditable" := TRUE;
        RecieptResponsibilityCenterEdi := TRUE;
        ReceivingTransferTypeEditable := TRUE;
        DateEditable := TRUE;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Date := TODAY;
        Rec."Inter Bank Template Name" := JTemplate;
        Rec."Inter Bank Journal Batch" := JBatch;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Reciept Responsibility Center" := UserMgt.GetPurchasesFilter();
        //VALIDATE( "Reciept Responsibility Center");
        Rec.Status := Rec.Status::Pending;
        Rec."Created By" := USERID;

        //UpdateControl;
        //OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage()
    begin
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
            Rec.FILTERGROUP(2);
            Rec.SETRANGE("Reciept Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FILTERGROUP(0);
        END;


        TempBatch.RESET;

        TempBatch.SETRANGE(TempBatch.UserID, USERID);
        IF TempBatch.FIND('-') THEN BEGIN
            JTemplate := TempBatch."Inter Bank Template Name";
            JBatch := TempBatch."Inter Bank Batch Name";
        END;

        /*Check if the user has the batches selected*/
        IF (JTemplate = '') OR (JBatch = '') THEN BEGIN
            ERROR('Please ensure you are setup as an interbank transfer user');
        END;


    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        TempBatch: Record "FIN-Cash Office User Template";
        JTemplate: Code[20];
        JBatch: Code[20];
        //PCheck: Codeunit "50110";
        Post: Boolean;
        BankAcc: Record "Bank Account";
        RegNo: Integer;
        FromNo: Integer;
        ToNo: Integer;
        //RegMgt: Codeunit "50103";
        JournalPostedSuccessfully: Codeunit "Journal Post Successful";
        RespCenter: Record "Responsibility Center";
        UserMgt: Codeunit "User Setup Management";
        //ApprovalEntries: Page "658";
        [InDataSet]
        "Exch. Rate DestinationVisible": Boolean;
        [InDataSet]
        "Exch. Rate SourceVisible": Boolean;
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        ReceivingTransferTypeEditable: Boolean;
        [InDataSet]
        RecieptResponsibilityCenterEdi: Boolean;
        [InDataSet]
        "Receiving AccountEditable": Boolean;
        [InDataSet]
        "Amount 2Editable": Boolean;
        [InDataSet]
        RemarksEditable: Boolean;
        [InDataSet]
        "Exch. Rate DestinationEditable": Boolean;
        NameSendInterbankapprovalRequest: Integer;
        [InDataSet]
        "Source Transfer TypeEditable": Boolean;
        [InDataSet]
        SendingResponsibilityCenterEdi: Boolean;
        [InDataSet]
        "Paying AccountEditable": Boolean;
        [InDataSet]
        AmountEditable: Boolean;
        [InDataSet]
        "Exch. Rate SourceEditable": Boolean;
        [InDataSet]
        "External Doc No.Editable": Boolean;
        [InDataSet]
        "Transfer Release DateEditable": Boolean;
        Text19025618: Label 'Requesting Details';
        Text19044997: Label 'Source Details';

    //[Scope('Internal')]
    procedure GetDimensionName(var "Code": Code[20]; DimNo: Integer) Name: Text[60]
    var
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
        Text000: Label 'Are you sure you want to Cancel this Document?';
        Text001: Label 'You have selected not to Cancel this Document';
    begin
        /*Get the global dimension 1 and 2 from the database*/
        Name := '';

        GLSetup.RESET;
        GLSetup.GET();

        DimVal.RESET;
        DimVal.SETRANGE(DimVal.Code, Code);

        IF DimNo = 1 THEN BEGIN
            DimVal.SETRANGE(DimVal."Dimension Code", GLSetup."Global Dimension 1 Code");
        END
        ELSE
            IF DimNo = 2 THEN BEGIN
                DimVal.SETRANGE(DimVal."Dimension Code", GLSetup."Global Dimension 2 Code");
            END;
        IF DimVal.FIND('-') THEN BEGIN
            Name := DimVal.Name;
        END;

    end;

    //[Scope('Internal')]
    procedure UpdateControl()
    begin
        /*  IF Rec.Status <> Rec.Status::Pending THEN BEGIN
             DateEditable := FALSE;
             ReceivingTransferTypeEditable := FALSE;
             RecieptResponsibilityCenterEdi := FALSE;
             "Receiving AccountEditable" := FALSE;
             "Amount 2Editable" := FALSE;
             RemarksEditable := FALSE;
             "Exch. Rate DestinationEditable" := FALSE;
         END ELSE BEGIN
             DateEditable := TRUE;
             ReceivingTransferTypeEditable := TRUE;
             RecieptResponsibilityCenterEdi := TRUE;
             "Receiving AccountEditable" := TRUE;
             "Amount 2Editable" := TRUE;
             RemarksEditable := TRUE;
             "Exch. Rate DestinationEditable" := TRUE;


         END;

         IF Rec.Status = Rec.Status::Approved THEN BEGIN
             "Source Transfer TypeEditable" := TRUE;
             SendingResponsibilityCenterEdi := TRUE;
             "Paying AccountEditable" := TRUE;
             AmountEditable := TRUE;
             "Paying AccountEditable" := TRUE;
             "Exch. Rate SourceEditable" := TRUE;
             "External Doc No.Editable" := TRUE;
             "Transfer Release DateEditable" := TRUE;
         END ELSE BEGIN
             "Source Transfer TypeEditable" := FALSE;
             SendingResponsibilityCenterEdi := FALSE;
             AmountEditable := FALSE;
             "Paying AccountEditable" := FALSE;
             "Exch. Rate SourceEditable" := FALSE;
             "External Doc No.Editable" := FALSE;
             "Transfer Release DateEditable" := FALSE;
         END; */


    end;

    local procedure ReceivingAccountOnAfterValidat()
    begin
        //check if the currency code field has been filled in
        "Exch. Rate DestinationVisible" := FALSE;
        IF Rec."Currency Code Destination" <> '' THEN BEGIN
            "Exch. Rate DestinationVisible" := TRUE;
        END;
    end;

    local procedure PayingAccountOnAfterValidate()
    begin
        //check if the currency code field has been filled in
        "Exch. Rate SourceVisible" := FALSE;
        IF Rec."Currency Code Source" <> '' THEN BEGIN
            "Exch. Rate SourceVisible" := TRUE;
        END;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        IF Rec."Currency Code Source" <> '' THEN BEGIN
            "Exch. Rate SourceVisible" := TRUE;
        END
        ELSE BEGIN
            "Exch. Rate SourceVisible" := FALSE;
        END;

        IF Rec."Currency Code Destination" <> '' THEN BEGIN
            "Exch. Rate DestinationVisible" := TRUE;
        END
        ELSE BEGIN
            "Exch. Rate DestinationVisible" := FALSE;
        END;

        UpdateControl;
    end;
}

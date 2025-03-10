page 52178528 "Fin-Posted Inter-Bank Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "FIN-InterBank Transfers";
    SourceTableView = WHERE(Posted = filter(true));
    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
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
                    //Editable = false;
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
                    Editable = "Amount 2Editable";
                    ApplicationArea = All;
                }
                field("Request Amt LCY"; Rec."Request Amt LCY")
                {
                    ApplicationArea = All;
                    //ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    Editable = RemarksEditable;
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
                field("Exch. Rate Destination"; Rec."Exch. Rate Destination")
                {
                    Editable = "Exch. Rate DestinationEditable";
                    Visible = "Exch. Rate DestinationVisible";
                    ApplicationArea = All;
                }
                field("Exch. Rate Source"; Rec."Exch. Rate Source")
                {
                    Editable = "Exch. Rate SourceEditable";
                    Visible = "Exch. Rate SourceVisible";
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        
        area(processing)
        {
            action(Report)
            {
                ApplicationArea = all;
                RunObject = report "Interbank Transfers";
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

        /*
       IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
         FILTERGROUP(2);
         SETRANGE("Reciept Responsibility Center" ,UserMgt.GetPurchasesFilter());
         FILTERGROUP(0);
       END;
          //Reciept Responsibility Center
          */

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
        /*IF Status<>Status::Pending THEN BEGIN
           DateEditable :=FALSE;
           ReceivingTransferTypeEditable :=FALSE;
           RecieptResponsibilityCenterEdi :=FALSE;
           "Receiving AccountEditable" :=FALSE;
           "Amount 2Editable" :=FALSE;
           RemarksEditable :=FALSE;
           "Exch. Rate DestinationEditable" :=FALSE;
        END ELSE BEGIN
           DateEditable :=TRUE;
           ReceivingTransferTypeEditable :=TRUE;
           RecieptResponsibilityCenterEdi :=TRUE;
           "Receiving AccountEditable" :=TRUE;
           "Amount 2Editable" :=TRUE;
           RemarksEditable :=TRUE;
           "Exch. Rate DestinationEditable" :=TRUE;
        
        
        END;
        
        IF Status=Status::Approved THEN BEGIN
           "Source Transfer TypeEditable" :=TRUE;
           SendingResponsibilityCenterEdi :=TRUE;
           "Paying AccountEditable" :=TRUE;
           AmountEditable :=TRUE;
           "Paying AccountEditable" :=TRUE;
           "Exch. Rate SourceEditable" :=TRUE;
           "External Doc No.Editable" :=TRUE;
           "Transfer Release DateEditable" :=TRUE;
        END ELSE BEGIN
           "Source Transfer TypeEditable" :=FALSE;
           SendingResponsibilityCenterEdi :=FALSE;
           AmountEditable :=FALSE;
           "Paying AccountEditable" :=FALSE;
           "Exch. Rate SourceEditable" :=FALSE;
           "External Doc No.Editable" :=FALSE;
           "Transfer Release DateEditable" :=FALSE;
        END;
         */

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



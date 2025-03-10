page 52178701 "PROC-Internal Requisitions"
{
    Caption = 'Internal Requisition';
    DeleteAllowed = true;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    // SourceTableView = WHERE("Document Type" = FILTER(Quote), DocApprovalType = FILTER(Requisition));
    //Status = FILTER(<> Released));
    // SourceTableView = WHERE("Document Type" = FILTER(Quote), Status = FILTER(<> Released));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;

                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    // ApplicationArea = All;

                    // trigger OnValidate()
                    // begin
                    //     ShortcutDimension2CodeOnAfterV;
                    // end;
                }
                // field("Shortcut Dimension  3"; Rec."Shortcut Dimension  3")
                // {
                //     Caption = 'Division Code';
                //     ApplicationArea = all;

                // }
                field(DocApprovalType; Rec.DocApprovalType)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                // field("Document Type 2"; Rec."Document Type 2")
                // {
                //     ApplicationArea = all;
                //     Editable = false;
                // }



                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = All;
                    // ApplicationArea = All;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Procurement Type Code"; Rec."Procurement Type Code")
                {
                    ApplicationArea = All;
                    //ApplicationArea = All;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    TableRelation = "Responsibility Center".code where(Grouping = filter('PRN'));

                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    Caption = 'Requestor User ID';
                    Editable = false;

                    ApplicationArea = All;
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = all;
                    Editable = false;
                }


                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            part(PurchLines; "Purchase Quote Subform")
            {
                ApplicationArea = All;
                Editable = PurchLinesEditable;
                SubPageLink = "Document No." = FIELD("No.");
            }
            group(VendInfoPanel)
            {
                Caption = 'Vendor Information';
                // label(Reqy)
                // {
                //     CaptionClass = Text19023272;
                // }
                // label(yrt)
                // {
                //     Editable = false;
                // }
                // label(iruru)
                // {
                //     CaptionClass = Text19005663;
                // }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        /*CLEAR(ChangeExchangeRate);
                        ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",WORKDATE);
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                          VALIDATE("Currency Factor",ChangeExchangeRate.GetParameter);
                          CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                         */

                    end;

                    trigger OnValidate()
                    begin
                        CurrencyCodeOnAfterValidate;
                    end;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                    ApplicationArea = All;
                }
                field("Transport Method"; Rec."Transport Method")
                {
                    ApplicationArea = All;
                }
                field("Entry Point"; Rec."Entry Point")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Quote")
            {
                Caption = '&Quote';
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader();
                        COMMIT;
                        PAGE.RUNMODAL(PAGE::"Purchase Statistics", Rec);
                    end;
                }
                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Vendor Card";
                    RunPageLink = "No." = FIELD("Buy-from Vendor No.");
                    ShortCutKey = 'Shift+F7';
                    ApplicationArea = All;
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = FIELD("Document Type"),
                                  "No." = FIELD("No."), "Document Line No." = CONST(0);
                    ApplicationArea = All;
                }
                action(Dimension)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                    end;
                }

            }
            group("&Line")
            {
                Caption = '&Line';
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    action(Period)
                    {
                        Caption = 'Period';
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            //CurrPage.PurchLines.PAGE.ItemAvailability(0);
                        end;
                    }
                    action(Variant)
                    {
                        Caption = 'Variant';
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            //CurrPage.PurchLines.PAGE.ItemAvailability(1);
                        end;
                    }
                    action(Location)
                    {
                        Caption = 'Location';
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            //CurrPage.PurchLines.PAGE.ItemAvailability(2);
                        end;
                    }
                }
                action(Dimensions)
                {
                    ApplicationArea = all;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        //CurrPage.PurchLines.PAGE.ShowDimensions;
                    end;
                }
                action("Item Charge &Assignment")
                {
                    ApplicationArea = all;
                    Caption = 'Item Charge &Assignment';

                    trigger OnAction()
                    begin
                        //CurrPage.PurchLines.PAGE.ItemChargeAssgnt;
                    end;
                }
                action("Item &Tracking Lines")
                {
                    ApplicationArea = all;
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction()
                    begin
                        //CurrPage.PurchLines.PAGE.OpenItemTrackingLines;
                    end;
                }
            }
        }
        area(processing)
        {
            action("Make &Order")
            {

                Caption = 'Make &Order';
                Image = MakeOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                //ApprovalMgt: Codeunit "439";
                begin
                    rec.TestField(Status, rec.Status::Released);
                    IF LinesCommitted THEN
                        ERROR('All Lines should be committed');

                    //IF ApprovalMgt.PrePostApprovalCheck(SalesHeader,Rec) THEN
                    CODEUNIT.RUN(CODEUNIT::"Purch.-Quote to Order (Yes/No)", Rec);
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Calculate &Invoice Discount")
                {
                    ApplicationArea = all;
                    Caption = 'Calculate &Invoice Discount';
                    Image = CalculateInvoiceDiscount;

                    trigger OnAction()
                    begin
                        ApproveCalcInvDisc;
                    end;
                }
                separator(_________________________________________)
                {

                }
                action("E&xplode BOM")
                {
                    ApplicationArea = all;
                    Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;

                    trigger OnAction()
                    begin
                        //CurrPage.PurchLines.PAGE.ExplodeBOM;
                    end;
                }
                action("Insert &Ext. Texts")
                {
                    Caption = 'Insert &Ext. Texts';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //CurrPage.PurchLines.PAGE.InsertExtendedText(TRUE);
                    end;
                }
                separator(____________________)
                {

                }
                action("Get St&d. Vend. Purchase Codes")
                {
                    Caption = 'Get St&d. Vend. Purchase Codes';
                    Ellipsis = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        StdVendPurchCode: Record "Standard Vendor Purchase Code";
                    begin
                        StdVendPurchCode.InsertPurchLines(Rec);
                    end;
                }
                separator(________________)
                {

                }
                action("Copy Document")
                {
                    ApplicationArea = all;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Image = CopyDocument;

                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                    end;
                }
                action("Archi&ve Document")
                {
                    ApplicationArea = all;
                    Caption = 'Archi&ve Document';

                    trigger OnAction()
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                separator(_______________)
                {

                }
                action("Send A&pproval Request")
                {
                    ApplicationArea = all;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        BCSetup.GET;
                        IF BCSetup.Mandatory THEN BEGIN
                            /* IF LinesCommitted THEN
                                ERROR('All Lines should be committed'); */
                        END;
                        // Rec.TestField(Rec."Location Code");
                        //  Rec.TestField(Rec."Shortcut Dimension 1 code");
                        //   Rec.TestField(Rec."Shortcut Dimension 2 Code");
                        ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        Approvalentries: Page "Fin-Approval Entries";
                    begin
                        Approvalentries.Setfilters(DATABASE::"Purchase Header", 0, Rec."No.");
                        Approvalentries.RUN;
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = all;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelledEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
                separator(________________________________)
                {

                }
                action("Check Budget Availability")
                {
                    ApplicationArea = all;
                    Caption = 'Check Budget Availability';
                    Image = CheckLedger;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        BCSetup: Record "FIN-Budgetary Control Setup";
                    begin

                        BCSetup.GET;
                        IF NOT BCSetup.Mandatory THEN
                            EXIT;

                        IF Rec.Status = Rec.Status::Released THEN
                            ERROR('This document has already been released. This functionality is available for open documents only');
                        IF NOT SomeLinesCommitted THEN BEGIN
                            IF NOT CONFIRM('Some or All the Lines Are already Committed do you want to continue', TRUE, Rec."Document Type") THEN
                                ERROR('Budget Availability Check and Commitment Aborted');
                            DeleteCommitment.RESET;
                            DeleteCommitment.SETRANGE(DeleteCommitment."Document Type", DeleteCommitment."Document Type"::LPO);
                            DeleteCommitment.SETRANGE(DeleteCommitment."Document No.", Rec."No.");
                            DeleteCommitment.DELETEALL;
                        END;
                        Commitment.CheckPurchase(Rec);
                        MESSAGE('Budget Availability Checking Complete');
                    end;
                }
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = all;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelledEntries;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        IF NOT CONFIRM('Are you sure you want to Cancel All Commitments Done for this document', TRUE, Rec."Document Type") THEN
                            ERROR('Budget Availability Check and Commitment Aborted');

                        DeleteCommitment.RESET;
                        DeleteCommitment.SETRANGE(DeleteCommitment."Document Type", DeleteCommitment."Document Type"::LPO);
                        DeleteCommitment.SETRANGE(DeleteCommitment."Document No.", Rec."No.");
                        DeleteCommitment.DELETEALL;
                        //Tag all the Purchase Line entries as Uncommitted
                        PurchLine.RESET;
                        PurchLine.SETRANGE(PurchLine."Document Type", Rec."Document Type");
                        PurchLine.SETRANGE(PurchLine."Document No.", Rec."No.");
                        IF PurchLine.FIND('-') THEN BEGIN
                            REPEAT
                                PurchLine.Committed := FALSE;
                                PurchLine.MODIFY;
                            UNTIL PurchLine.NEXT = 0;
                        END;

                        MESSAGE('Commitments Cancelled Successfully for Doc. No %1', Rec."No.");
                    end;
                }
                separator(______________________________)
                {

                }
                action("Re&lease")
                {
                    ApplicationArea = all;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit 415;
                    begin
                        IF LinesCommitted THEN
                            ERROR('All Lines should be committed');

                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = all;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        IF LinesCommitted THEN
                            ERROR('All Lines should be committed');

                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(________)
                {

                }
                action("&Send BizTalk Rqst. for Purch. Quote")
                {
                    Caption = '&Send BizTalk Rqst. for Purch. Quote';
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        SalesHeader: Record "Sales Header";
                    //ApprovalMgt: Codeunit "439";
                    begin
                        //IF ApprovalMgt.PrePostApprovalCheck(SalesHeader,Rec) THEN
                        //  BizTalkManagement.SendReqforPurchQuote(Rec);
                    end;
                }
            }
            action("&Print")
            {
                ApplicationArea = all;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    /* BCSetup.GET;
                    IF BCSetup.Mandatory THEN
                        IF LinesCommitted THEN */
                    //ERROR('All Lines should be committed');

                    Rec.RESET();
                    Rec.SETRANGE("No.", Rec."No.");
                    REPORT.RUN(report::"purchase requisitions", TRUE, TRUE, Rec);


                end;
            }

        }
    }



    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SAVERECORD;
        EXIT(Rec.ConfirmDeletion);
    end;

    trigger OnInit()
    begin
        PurchLinesEditable := TRUE;
        PurchHistoryBtn1Visible := TRUE;
        PayToCommentBtnVisible := TRUE;
        PayToCommentPictVisible := TRUE;
        PurchHistoryBtnVisible := TRUE;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
        /*//Add dimensions if set by default here
        "Shortcut Dimension 1 Code":=UserMgt.GetSetDimensions(USERID,1);
        VALIDATE("Shortcut Dimension 1 Code");
        "Shortcut Dimension 2 Code":=UserMgt.GetSetDimensions(USERID,2);
        VALIDATE("Shortcut Dimension 2 Code");*/


        Rec.DocApprovalType := Rec.DocApprovalType::Requisition;


        UpdateControls;
        //OnAfterGetCurrRecord;

    end;







    trigger OnOpenPage()
    begin
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
            Rec.FILTERGROUP(2);
            Rec.SETRANGE("Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FILTERGROUP(0);
        END;

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        USetup.RESET;
        USetup.SETRANGE(USetup."User ID", USERID);
        USetup.SETRANGE(USetup.HOD, false);
        IF USetup.FIND('-') THEN
            ERROR('You are not the HOD');



        if rec."No." = '' then begin
            PurchSetup.Get();
            PurchSetup.TestField("Internal Requisition No.");
            NoSeriesMgt.InitSeries(PurchSetup."Internal Requisition No.", xRec."No. Series", 0D, Rec."No.", rec."No. Series");
            plines."Document Type 2" := pheader."Document Type 2";

            rec."User Id" := UserId;
        end;


    end;

    var
        pheader: record "Purchase Header";
        plines: Record "Purchase Line";
        PurchSetup: Record "Purchases & Payables Setup";
        EMP: Record "HRM-Employee C";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CopyPurchDoc: Report "Copy Purchase Document";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        PurchInfoPaneMgmt: Codeunit "Purchases Info-Pane Management";
        Commitment: Codeunit "Budgetary Control";
        BCSetup: Record "FIN-Budgetary Control Setup";
        DeleteCommitment: Record "FIN-Committment";
        USetup: Record "User Setup";
        PurchLine: Record "Purchase Line";
        [InDataSet]

        PurchHistoryBtnVisible: Boolean;
        [InDataSet]
        PayToCommentPictVisible: Boolean;
        [InDataSet]
        PayToCommentBtnVisible: Boolean;
        [InDataSet]
        PurchHistoryBtn1Visible: Boolean;
        [InDataSet]
        PurchLinesEditable: Boolean;
        Text19023272: Label 'Buy-from Vendor';
        Text19005663: Label 'Pay-to Vendor';

    procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure UpdateInfoPanel()
    var
        DifferBuyFromPayTo: Boolean;
    begin
        DifferBuyFromPayTo := Rec."Buy-from Vendor No." <> Rec."Pay-to Vendor No.";
        PurchHistoryBtnVisible := DifferBuyFromPayTo;
        PayToCommentPictVisible := DifferBuyFromPayTo;
        PayToCommentBtnVisible := DifferBuyFromPayTo;
        //PurchHistoryBtn1Visible := PurchInfoPaneMgmt.DocExist(Rec,"Buy-from Vendor No.");

    end;


    procedure LinesCommitted() Exists: Boolean
    var
        PurchLines: Record "Purchase Line";
    begin
        IF BCSetup.GET() THEN BEGIN
            IF NOT BCSetup.Mandatory THEN BEGIN
                Exists := FALSE;
                EXIT;
            END;
        END ELSE BEGIN
            Exists := FALSE;
            EXIT;
        END;
        IF BCSetup.GET THEN BEGIN
            Exists := FALSE;
            PurchLines.RESET;
            PurchLines.SETRANGE(PurchLines."Document Type", Rec."Document Type");
            PurchLines.SETRANGE(PurchLines."Document No.", Rec."No.");
            PurchLines.SETRANGE(PurchLines.Committed, FALSE);
            IF PurchLines.FIND('-') THEN
                Exists := TRUE;
        END ELSE
            Exists := FALSE;
    end;

    procedure SomeLinesCommitted() Exists: Boolean
    var
        PurchLines: Record "Purchase Line";
    begin
        IF BCSetup.GET THEN BEGIN
            Exists := FALSE;
            PurchLines.RESET;
            PurchLines.SETRANGE(PurchLines."Document Type", Rec."Document Type");
            PurchLines.SETRANGE(PurchLines."Document No.", Rec."No.");
            PurchLines.SETRANGE(PurchLines.Committed, TRUE);
            IF PurchLines.FIND('-') THEN
                Exists := TRUE;
        END ELSE
            Exists := FALSE;
    end;


    procedure UpdateControls()
    begin
        IF Rec.Status <> Rec.Status::Open THEN BEGIN
            PurchLinesEditable := FALSE;
        END ELSE
            PurchLinesEditable := TRUE;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    /*  trigger OnInsertRecord(BelowxRec: Boolean): Boolean
     begin
         if Rec."No." <> xRec."No." then begin
             PurchSetup.Get();
             PurchSetup.TestField("Requisition No");
             NoSeriesMgt.InitSeries(PurchSetup."Requisition No", xRec."No. Series", 0D, Rec."No.", Rec."No. Series");
         end;

     end;
  */

    // local procedure OnAfterGetCurrRecord()
    // begin
    //     xRec := Rec;

    //     UpdateControls;
    // end;
}

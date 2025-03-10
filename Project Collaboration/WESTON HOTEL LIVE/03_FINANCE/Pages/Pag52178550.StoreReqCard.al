page 52178550 StoreReqCard

{
    PageType = Card;
    Caption = 'Store Requisition Header';
    SourceTable = "PROC-Store Requistion Header";
    DeleteAllowed = false;
    // SourceTableView = where(Status = filter(<> Posted)); //(Posted = filter(false));
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Request date"; Rec."Request date")
                {
                    ApplicationArea = all;
                }
                field("Required Date"; Rec."Required Date")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Function Name"; Rec."Function Name")
                {
                    ApplicationArea = all;
                    Caption = 'Department Name';
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    ApplicationArea = all;
                    Caption = 'Cost_Center Name';
                    Editable = false;
                }
                // field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                // {
                //     ApplicationArea = all;
                //     Editable = true;
                // }
                // field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                // {
                //     ApplicationArea = all;
                //     Editable = true;
                // }
                // field("Region Name"; Rec.Dim4)
                // {
                //     Caption = 'Region Name';
                //     ApplicationArea = all;

                // }
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = all;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Visible = true;
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Editable = true;
                    // HideValue = false;

                    trigger OnValidate()
                    begin
                        PopulateStatus;
                        CurrPage.Update();
                    end;
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = all;
                    Editable = true;
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("SRN.No"; Rec."SRN.No")
                {
                    Visible = false;
                    ApplicationArea = all;
                }

                field("Requester ID";Rec."Requester ID")
                {
                    Caption = 'Requestor ID';
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
            group(Lines)
            {
                Caption = 'Lines';
                part(page; "PROC-Store Requisition Line UP")
                {
                    ApplicationArea = all;
                    SubPageLink = "Requistion No" = FIELD("No.");
                }
            }
        }
    }

    actions
    {
        area(processing)
        {


            action("Post")
            {
                ApplicationArea = all;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    itm: Record Item;
                begin

                    IF NOT LinesExists THEN
                        ERROR('There are no Lines created for this Document');

                    IF Rec.Status = Rec.Status::Posted THEN
                        ERROR('The Document Has Already been Posted');

                    IF Rec.Status <> Rec.Status::Released THEN
                        ERROR('The Document Has not yet been Approved');

                    // TESTFIELD("Issuing Store");
                    ReqLine.RESET;

                    ReqLine.SETRANGE(ReqLine."Requistion No", Rec."No.");

                    IF ReqLine.FIND('-') THEN BEGIN

                        IF InventorySetup.GET THEN BEGIN
                            //  ERROR('1');
                            InventorySetup.TESTFIELD(InventorySetup."Item Issue Template");
                            InventorySetup.TESTFIELD(InventorySetup."Item Issue Batch");
                            GenJnline.RESET;
                            GenJnline.SETRANGE(GenJnline."Journal Template Name", InventorySetup."Item Issue Template");
                            GenJnline.SETRANGE(GenJnline."Journal Batch Name", InventorySetup."Item Issue Batch");
                            IF GenJnline.FIND('-') THEN GenJnline.DELETEALL;
                        END;
                        REPEAT
                        BEGIN
                            //Issue
                            LineNo := LineNo + 1000;

                            GenJnline.INIT;
                            GenJnline."Journal Template Name" := InventorySetup."Item Issue Template";
                            GenJnline."Journal Batch Name" := InventorySetup."Item Issue Batch";
                            GenJnline."Line No." := LineNo;
                            GenJnline."Entry Type" := GenJnline."Entry Type"::"Negative Adjmt.";
                            GenJnline."Document No." := Rec."No.";

                            GenJnline."Item No." := ReqLine."No.";
                            GenJnline.VALIDATE("Item No.");
                            GenJnline."Location Code" := ReqLine."Issuing Store";
                            GenJnline.VALIDATE("Location Code");
                            itm.get(ReqLine."No.");
                            GenJnline."Gen. Prod. Posting Group" := itm."Gen. Prod. Posting Group";
                            GenJnline."Posting Date" := Rec."Request date";
                            GenJnline.Description := ReqLine.Description;
                            //GenJnline.Quantity:=ReqLine.Quantity;
                            GenJnline.Quantity := ReqLine."Quantity To Issue";
                            GenJnline."Shortcut Dimension 1 Code" := ReqLine."Shortcut Dimension 1 Code";
                            GenJnline.VALIDATE("Shortcut Dimension 1 Code");
                            GenJnline."Shortcut Dimension 2 Code" := ReqLine."Shortcut Dimension 2 Code";
                            GenJnline.VALIDATE("Shortcut Dimension 2 Code");
                            GenJnline.ValidateShortcutDimCode(3, ReqLine."Shortcut Dimension 3 Code");
                            GenJnline.ValidateShortcutDimCode(4, ReqLine."Shortcut Dimension 4 Code");
                            GenJnline.VALIDATE(Quantity);
                            GenJnline.VALIDATE("Unit Amount");
                            GenJnline."Reason Code" := 'STOCK';
                            GenJnline.VALIDATE("Reason Code");
                            if GenJnline.Quantity <> 0 then
                                GenJnline.INSERT(TRUE);

                            ReqLine."Quantity Issued" := ReqLine."Quantity Issued" + ReqLine."Quantity To Issue";
                            ReqLine."Quantity To Issue" := 0;

                            IF ReqLine."Quantity Issued" = ReqLine."Quantity Requested" THEN
                                ReqLine."Request Status" := ReqLine."Request Status"::Closed;
                            ReqLine.MODIFY;
                        END;
                        UNTIL ReqLine.NEXT = 0;
                        //Post Entries
                        GenJnline.RESET;
                        GenJnline.SETRANGE(GenJnline."Journal Template Name", InventorySetup."Item Issue Template");
                        //
                        GenJnline.SETRANGE(GenJnline."Journal Batch Name", InventorySetup."Item Issue Batch");
                        CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post", GenJnline);
                        //End Post entries

                        //Modify All

                        Post := JournlPosted.PostedSuccessfully();
                        IF Post THEN
                            ReqLine.MODIFYALL(ReqLine."Request Status", ReqLine."Request Status"::Closed);

                    END ELSE
                        ERROR('Check quantity to issue against  quantity in store');


                    Post := TRUE;
                    ReqLine.RESET;
                    ReqLine.SETRANGE(ReqLine."Requistion No", Rec."No.");
                    IF ReqLine.FIND('-') THEN BEGIN
                        REPEAT
                        BEGIN
                            IF ReqLine."Quantity Issued" <> ReqLine."Quantity Requested" THEN
                                IF (Post = TRUE) THEN
                                    Post := FALSE;
                        END;
                        UNTIL ReqLine.NEXT = 0;
                    END;
                    IF Post = TRUE THEN BEGIN

                        Rec.Status := Rec.Status::Posted;
                        Rec."Issue Date" := Today;
                        //rec.Issuer := UserId;
                        Rec.MODIFY;
                    END;
                    CurrPage.UPDATE;

                end;
            }
            separator(swep)
            {
            }
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("No.");
            }
            action(sendApproval)
            {
                ApplicationArea = all;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = process;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Init Code";
                    Text000: Label 'Are you sure you want to send for approval?';
                begin
                    IF NOT LinesExists THEN
                        ERROR('There are no Lines created for this Document');
                    IF CONFIRM(Text000, TRUE) THEN BEGIN
                        ApprovalMgt.OnSendSRNforApproval(Rec);
                    END ELSE
                        ;

                end;
            }
            action(cancellsApproval)
            {
                ApplicationArea = all;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = process;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Init Code";
                begin
                    ApprovalMgt.OnCancelSRNforApproval(Rec);
                end;
            }

            action("Print/Preview")
            {
                ApplicationArea = all;
                Caption = 'Print';
                Image = PreviewChecks;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    REPORT.RUN(Report::"Store Requisition", TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }


        }
    }


    trigger OnOpenPage()
    begin
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
            Rec.FILTERGROUP(2);
            Rec.SETRANGE("Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FILTERGROUP(0);
        END;
        IF QtyStore.GET(Rec."No.") THEN
            QtyStore.CALCFIELDS(QtyStore.Inventory);
        Rec.Validate(Status);
    end;

    var
        UserMgt: Codeunit "User Setup Management BR";
        ReqLine: Record "PROC-Store Requistion Lines";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        HasLines: Boolean;
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        PROCStoreRequistionLines: Record "PROC-Store Requistion Lines";
        Item: Record Item;

    procedure LinesExists(): Boolean
    var
        PayLines: Record "PROC-Store Requistion Lines";
    begin
        HasLines := FALSE;
        PayLines.RESET;
        PayLines.SETRANGE(PayLines."Requistion No", Rec."No.");
        IF PayLines.FIND('-') THEN BEGIN
            HasLines := TRUE;
            EXIT(HasLines);
        END;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;
    end;

    local procedure CommitBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Store Req. Budget Mamndatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        PROCStoreRequistionLines.RESET;
        PROCStoreRequistionLines.SETRANGE("Requistion No", Rec."No.");
        IF PROCStoreRequistionLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Check if budget exists
                PROCStoreRequistionLines.TESTFIELD("No.");
                Item.RESET;
                Item.SETRANGE("No.", PROCStoreRequistionLines."No.");
                IF Item.FIND('-') THEN;
                Item.TESTFIELD("Item G/L Budget Account");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", Item."Item G/L Budget Account");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", Item."Item G/L Budget Account");
                FINBudgetEntries.SETRANGE("Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment
                , FINBudgetEntries."Transaction Type"::Allocation);
                FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2',
                FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::Commitment);
                FINBudgetEntries.SETFILTER(Date, PostBudgetEnties.GetBudgetStartAndEndDates(Rec."Request date"));
                IF FINBudgetEntries.FIND('-') THEN BEGIN
                    IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                        IF FINBudgetEntries.Amount > 0 THEN BEGIN
                            IF (PROCStoreRequistionLines."Line Amount" > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                            // Commit Budget Here
                            PostBudgetEnties.CheckBudgetAvailability(Item."Item G/L Budget Account", Rec."Request date", '', Rec."Shortcut Dimension 2 Code",
                            PROCStoreRequistionLines."Line Amount", PROCStoreRequistionLines.Description, 'S-REQUISITION', Rec."No." + PROCStoreRequistionLines."No.", PROCStoreRequistionLines."Description 2");
                        END ELSE
                            ERROR('No allocation for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                    END;
                END ELSE
                    ERROR('Missing Budget for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
            END;
            UNTIL PROCStoreRequistionLines.NEXT = 0;
        END;
    end;

    local procedure ExpenseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Store Req. Budget Mamndatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        PROCStoreRequistionLines.RESET;
        PROCStoreRequistionLines.SETRANGE("Requistion No", Rec."No.");
        IF PROCStoreRequistionLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Expense Budget Here
                PROCStoreRequistionLines.TESTFIELD("No.");
                Item.RESET;
                Item.SETRANGE("No.", PROCStoreRequistionLines."No.");
                IF Item.FIND('-') THEN;
                Item.TESTFIELD("Item G/L Budget Account");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", Item."Item G/L Budget Account");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (PROCStoreRequistionLines."Line Amount" > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.ExpenseBudget(Item."Item G/L Budget Account", Rec."Request date", '', Rec."Shortcut Dimension 2 Code",
                    PROCStoreRequistionLines."Line Amount", PROCStoreRequistionLines.Description, USERID, TODAY, 'S-REQUISITION', Rec."No." + PROCStoreRequistionLines."No.", PROCStoreRequistionLines."Description 2");
                END;
            END;
            UNTIL PROCStoreRequistionLines.NEXT = 0;
        END;
    end;

    local procedure CancelCommitment()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Store Req. Budget Mamndatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        PROCStoreRequistionLines.RESET;
        PROCStoreRequistionLines.SETRANGE("Requistion No", Rec."No.");
        IF PROCStoreRequistionLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Expense Budget Here
                PROCStoreRequistionLines.TESTFIELD("No.");
                Item.RESET;
                Item.SETRANGE("No.", PROCStoreRequistionLines."No.");
                IF Item.FIND('-') THEN;
                Item.TESTFIELD("Item G/L Budget Account");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", Item."Item G/L Budget Account");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (PROCStoreRequistionLines."Line Amount" > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.CancelBudgetCommitment(Item."Item G/L Budget Account", Rec."Request date", '', Rec."Shortcut Dimension 2 Code",
                    PROCStoreRequistionLines."Line Amount", PROCStoreRequistionLines.Description, USERID, 'S-REQUISITION', Rec."No." + PROCStoreRequistionLines."No.", PROCStoreRequistionLines."Description 2");
                END;
            END;
            UNTIL PROCStoreRequistionLines.NEXT = 0;
        END;
    end;

    trigger OnClosePage()
    begin
        IF QtyStore.GET(Rec."No.") THEN
            QtyStore.CALCFIELDS(QtyStore.Inventory);

    end;


    procedure PopulateStatus()
    begin
        RequisitionLines.Reset();
        RequisitionLines.SetRange("Requistion No", Rec."No.");
        if RequisitionLines.FindSet() then
            repeat
                RequisitionLines.Status := Rec.Status;
                RequisitionLines.Modify();
            until RequisitionLines.Next() = 0;
    end;


    var
        QtyStore: Record Item;
        RequisitionLines: Record "PROC-Store Requistion Lines";


}



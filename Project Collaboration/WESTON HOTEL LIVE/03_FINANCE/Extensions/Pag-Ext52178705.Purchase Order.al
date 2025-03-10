pageextension 52178705 "ExtPurchase Order" extends "Purchase Order"
{


    layout
    {
        modify("Purchaser Code")
        {
            Visible = false;
        }

        modify("Order Address Code")
        {
            Visible = false;
        }
        modify("Buy-from")
        {
            Visible = false;
        }
        modify("Buy-from Address")
        {
            Visible = false;
        }
        modify("Buy-from Address 2")
        {
            Visible = false;
        }
        modify("Buy-from City")
        {
            Visible = false;
        }
        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }
        modify("Buy-from Contact")
        {
            Visible = false;
        }
        modify("Buy-from Contact No.")
        {
            Visible = false;
        }
        modify(BuyFromContactEmail)
        {
            Visible = false;
        }
        modify(Status)
        {
            Editable = true;
        }
        modify("Currency Code")
        {
            Visible = true;
        }




        modify("Assigned User ID")
        {
            Editable = false;
            Visible = false;

        }
        modify("Quote No.")
        {
            Editable = true;
            Visible = true;
        }
        addbefore("Responsibility Center")
        {

            field("User Id"; Rec."Assigned User ID 2")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Assigned User Id';
                ToolTip = 'Specifies the value of the User Id field.';
            }
        }

        addafter("Buy-from")
        {
            field("Branch"; Rec."Shortcut Dimension 1 Code")
            {
                //Caption = 'Department';
                ApplicationArea = all;

            }
            field("Cost_Center"; Rec."Shortcut Dimension 2 Code")
            {
                //  Caption = 'Cost';
                ApplicationArea = all;
            }
            // field(Department; Rec."Shortcut Dimension 1 Code")
            // {
            //     caption = 'Department Code';
            //     ApplicationArea = All;
            // }
            // field("Departments Name"; Rec."Departments Name")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Departments Name field.';
            // }
            // field("Project Code"; Rec."Shortcut Dimension 2 Code")
            // {
            //     ApplicationArea = All;
            // }

        }
        // addafter("Vendor Shipment No.")
        // {

        //     field("Shortcut Dimension  3"; Rec."Shortcut Dimension  3")
        //     {
        //         Caption = 'Division';
        //         ApplicationArea = All;
        //         ToolTip = 'Specifies the value of the Shortcut Dimension  3 field.';
        //     }
        //     field("Division Name"; Rec."Division Name")
        //     {
        //         ApplicationArea = All;
        //         ToolTip = 'Specifies the value of the Division Name field.';
        //     }

        //     field("Shortcut dimension 4"; Rec."Shortcut dimension 4")
        //     {
        //         Caption = 'Regions';
        //         ApplicationArea = All;
        //         ToolTip = 'Specifies the value of the Shortcut dimension 4 field.';
        //     }
        //}

    }
    actions
    {

        modify(Print)
        {
            Visible = false;
        }
        modify("&Print")
        {
            Visible = false;
        }

        modify(SendApprovalRequest)
        {
            trigger OnBeforeAction()
            begin
                CommitBudget();
            end;
        }
        addbefore(Post)
        {
            action("Update Posting Group")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category6;
                Visible = false;
                trigger OnAction()
                var
                    gl: Record "G/L Account";
                    purheader: Record "Purchase Header";
                    purLine: Record "Purchase Line";
                begin
                    purLine.Reset();
                    purLine.SetRange("Document No.", Rec."No.");
                    if purLine.Find('-') then begin
                        repeat
                            gl.Reset();
                            gl.SetRange("No.", purLine."No.");
                            if gl.Find('-') then begin
                                purLine."Gen. Bus. Posting Group" := gl."Gen. Bus. Posting Group";
                                purLine."Gen. Prod. Posting Group" := gl."Gen. Prod. Posting Group";
                                purLine.Modify();
                            end;
                        until purLine.Next() = 0;
                        Message('Updated Successifully');
                    end;

                end;
            }
        }
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                //  ExpenseBudget();
            end;
        }
        addbefore(Release)
        {
            action("File Attachment")
            {
                ApplicationArea = All;

                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    DMS.Reset;
                    DMS.SetRange("Document Type", DMS."Document Type"::LPO);
                    if DMS.Find('-') then begin
                        Hyperlink(DMS."url path" + Rec."No.");
                    end else
                        Message('No Link ' + format(DMS."Document Type"::LPO));
                end;

            }
        }

        addbefore(Print)
        {
            action("Print Order")
            {
                ApplicationArea = Suite;
                Caption = 'Print Order';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                // PromotedCategory = Category5;
                ToolTip = 'Prepare to print the document. The report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                begin
                    PurchaseHeader := Rec;
                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    CurrPage.SetSelectionFilter(PurchaseHeader);
                    REPORT.RUN(Report::"Procurement Report", TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
        }

        addbefore(SendCustom)
        {
            action("Print LPO")
            {
                ApplicationArea = All;
                Caption = 'Print LPO';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category10;
                ToolTip = 'Prepare to print the document. The report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                begin
                    PurchaseHeader := Rec;
                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    CurrPage.SetSelectionFilter(PurchaseHeader);
                    REPORT.RUN(Report::"Procurement Report", TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
        }

    }

    local procedure CommitBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup."LPO Budget Mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Shortcut Dimension 1 Code");
        //Get Current Lines to loop through
        PurchaseLine.RESET;
        PurchaseLine.SETRANGE("Document No.", Rec."No.");
        PurchaseLine.SETRANGE("Document Type", PurchaseLine."Document Type"::Order);
        PurchaseLine.SETFILTER(Type, '%1|%2|%3', PurchaseLine.Type::Item, PurchaseLine.Type::"Fixed Asset", PurchaseLine.Type::"G/L Account");
        IF PurchaseLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Check if budget exists
                CLEAR(GLAccountz);
                PurchaseLine.TESTFIELD("No.");
                IF PurchaseLine.Type = PurchaseLine.Type::Item THEN BEGIN
                    Item.RESET;
                    Item.SETRANGE("No.", PurchaseLine."No.");
                    IF Item.FIND('-') THEN;
                    Item.TESTFIELD("Item G/L Budget Account");
                    GLAccountz := Item."Item G/L Budget Account";
                END ELSE
                    IF PurchaseLine.Type = PurchaseLine.Type::"Fixed Asset" THEN BEGIN
                        FixedAsset.RESET;
                        FixedAsset.SETRANGE("No.", PurchaseLine."No.");
                        IF FixedAsset.FIND('-') THEN BEGIN
                            FixedAsset.TESTFIELD("FA Posting Group");
                            FAPostingGroup.RESET;
                            FAPostingGroup.SETRANGE(Code, FixedAsset."FA Posting Group");
                            IF FAPostingGroup.FIND('-') THEN BEGIN
                                FAPostingGroup.TESTFIELD("Acquisition Cost Account");
                                GLAccountz := FAPostingGroup."Acquisition Cost Account";
                            END;
                        END;
                    END ELSE
                        IF PurchaseLine.Type = PurchaseLine.Type::"G/L Account" THEN BEGIN
                            GLAccountz := PurchaseLine."No.";
                        END;
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", GLAccountz);
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 1 Code");
                // DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", GLAccountz);
                //FINBudgetEntries.SETRANGE("Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment
                , FINBudgetEntries."Transaction Type"::Allocation);
                FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2',
                FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::Commitment);
                FINBudgetEntries.SETFILTER(Date, PostBudgetEnties.GetBudgetStartAndEndDates(Rec."Order Date"));
                IF FINBudgetEntries.FIND('-') THEN BEGIN
                    IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                        IF FINBudgetEntries.Amount > 0 THEN BEGIN
                            IF (PurchaseLine."Line Amount" > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                            // Commit Budget Here
                            PostBudgetEnties.CheckBudgetAvailability(GLAccountz, Rec."Order Date", Rec."Shortcut Dimension 1 Code", Rec."Shortcut Dimension 2 Code",
                            PurchaseLine."Line Amount", PurchaseLine.Description, 'LPO', Rec."No." + PurchaseLine."No.", PurchaseLine."Description 2");
                        END ELSE
                            ERROR('No allocation for  Account:' + GLAccount.Name);
                    END;
                END ELSE
                    ERROR('Missing Budget for  Account:' + GLAccount.Name);
            END;
            UNTIL PurchaseLine.NEXT = 0;
        END;
    end;

    local procedure ExpenseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."LPO Budget Mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        PurchaseLine.SETRANGE("Document No.", Rec."No.");
        PurchaseLine.SETRANGE("Document Type", PurchaseLine."Document Type"::Order);
        PurchaseLine.SETFILTER(Type, '%1|%2|%3', PurchaseLine.Type::Item, PurchaseLine.Type::"Fixed Asset", PurchaseLine.Type::"G/L Account");
        IF PurchaseLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Expense Budget Here
                CLEAR(GLAccountz);
                PurchaseLine.TESTFIELD("No.");
                IF PurchaseLine.Type = PurchaseLine.Type::Item THEN BEGIN
                    Item.RESET;
                    Item.SETRANGE("No.", PurchaseLine."No.");
                    IF Item.FIND('-') THEN;
                    Item.TESTFIELD("Item G/L Budget Account");
                    GLAccountz := Item."Item G/L Budget Account";
                END ELSE
                    IF PurchaseLine.Type = PurchaseLine.Type::"Fixed Asset" THEN BEGIN
                        FixedAsset.RESET;
                        FixedAsset.SETRANGE("No.", PurchaseLine."No.");
                        IF FixedAsset.FIND('-') THEN BEGIN
                            FixedAsset.TESTFIELD("FA Posting Group");
                            FAPostingGroup.RESET;
                            FAPostingGroup.SETRANGE(Code, FixedAsset."FA Posting Group");
                            IF FAPostingGroup.FIND('-') THEN BEGIN
                                FAPostingGroup.TESTFIELD("Acquisition Cost Account");
                                GLAccountz := FAPostingGroup."Acquisition Cost Account";
                            END;
                        END;
                    END ELSE
                        IF PurchaseLine.Type = PurchaseLine.Type::"G/L Account" THEN BEGIN
                            GLAccountz := PurchaseLine."No.";
                        END;
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", GLAccountz);
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                //DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                //DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (PurchaseLine."Line Amount" > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.ExpenseBudgetGlobal(GLAccountz, Rec."Order Date",
                    PurchaseLine."Line Amount", PurchaseLine.Description, USERID, TODAY, 'LPO', Rec."No." + PurchaseLine."No.", PurchaseLine."Description 2");
                END;
            END;
            UNTIL PurchaseLine.NEXT = 0;
        END;
    end;

    var
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        PurchaseLine: Record "Purchase Line";
        GLAccountz: Code[20];
        FixedAsset: Record "Fixed Asset";
        item: Record Item;
        DMS: record edms;
        FAPostingGroup: Record "FA Posting Group";
}
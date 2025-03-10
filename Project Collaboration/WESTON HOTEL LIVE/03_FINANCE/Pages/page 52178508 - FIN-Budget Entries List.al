page 52178508 "FIN-Budget Entries List"
{

    PageType = List;
    SourceTable = "FIN-Budget Entries";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Entry No."; Rec."Entry No.")
                {

                    ApplicationArea = All;
                }
                field("Budget Name"; REC."Budget Name")
                {

                    ApplicationArea = All;
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {

                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {

                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {

                    ApplicationArea = All;
                }
                field("Document Description"; Rec."Document Description")
                {

                    ApplicationArea = All;
                }
                field("Document No"; Rec."Document No")
                {

                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {

                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {

                    ApplicationArea = All;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {

                    ApplicationArea = All;
                }
                field("Commitment Status"; Rec."Commitment Status")
                {

                    ApplicationArea = All;
                }

            }


        }

    }
    actions
    {
        area(Navigation)
        {
            group(Commitments)
            {
                action(CommitBudgets)
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //Rec."Shortcut Dimension 1 Code" := 'Administration';
                        Rec.Modify();
                        CommitBudget();
                    end;

                }
                action(ExpenseBudgets)
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Process;



                    trigger OnAction()
                    begin
                        ExpenseBudget();

                    end;

                }
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
        //IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        // Rec.TESTFIELD("Shortcut Dimension 1 Code");
        //Get Current Lines to loop through
        PurchaseLine.RESET;
        PurchaseLine.SETRANGE("Document No.", PurchaseLine."No.");
        PurchaseLine.SETRANGE("Document Type", PurchaseLine."Document Type"::Invoice);
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
                    IF PurchaseLine.Type = PurchaseLine."Type"::"Fixed Asset" THEN BEGIN
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

                //  DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 1 Code");
                // DimensionValue.SETRANGE("Global Dimension No.", 2);
                // IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", GLAccountz);
                // FINBudgetEntries.SETRANGE("Global Dimension 1 Code", Rec."Shortcut Dimension 1 Code");
                FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment
                , FINBudgetEntries."Transaction Type"::Allocation);
                FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2',
                FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::Commitment);
                FINBudgetEntries.SETFILTER(Date, PostBudgetEnties.GetBudgetStartAndEndDates(PurchaseHeader."Order Date"));
                IF FINBudgetEntries.FIND('-') THEN BEGIN
                    IF checkBudgetControl(FINBudgetEntries."G/L Account No.") = FALSE THEN EXIT;
                    IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                        IF FINBudgetEntries.Amount > 0 THEN BEGIN
                            IF (PurchaseLine."Line Amount" > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name);
                            // Commit Budget Here
                            PostBudgetEnties.CheckBudgetAvailabilityGlobal(GLAccountz, PurchaseHeader."Order Date",
                            PurchaseLine."Line Amount", PurchaseLine.Description, 'Invoice', PurchaseHeader."No." + PurchaseLine."No.", PurchaseLine."Description 2");
                        END ELSE
                            ERROR('No allocation for  Account:' + GLAccount.Name);
                    END;
                END;
            END;
            UNTIL PurchaseLine.NEXT = 0;
        END;
    end;

    procedure checkBudgetControl(var glAcc: Code[20]) IsBudgetControlled: Boolean
    var
        GLAccount: Record "G/L Account";
    begin
        CLEAR(IsBudgetControlled);
        GLAccount.RESET;
        GLAccount.SETRANGE("No.", glAcc);
        IF GLAccount.FIND('-') THEN;
        IF GLAccount."Budget Controlled" THEN;
        IsBudgetControlled := GLAccount."Budget Controlled";
        //ELSE ERROR('Missing account');
    end;

    local procedure ExpenseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        //IF NOT ((BCSetup.Mandatory) AND (BCSetup."LPO Budget Mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        PurchaseHeader.TESTFIELD("Shortcut Dimension 1 Code");
        //Get Current Lines to loop through
        PurchaseLine.SETRANGE("Document No.", PurchaseHeader."No.");
        PurchaseLine.SETRANGE("Document Type", PurchaseLine."Document Type"::Invoice);
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
                DimensionValue.SETRANGE(Code, PurchaseHeader."Shortcut Dimension 1 Code");
                //DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (PurchaseLine."Line Amount" > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.ExpenseBudget(GLAccountz, PurchaseHeader."Order Date", PurchaseHeader."Shortcut Dimension 1 Code", '',
                    PurchaseLine."Line Amount", PurchaseLine.Description, USERID, TODAY, 'Invoice', PurchaseHeader."No." + PurchaseLine."No.", PurchaseLine."Description 2");
                END;
            END;
            UNTIL PurchaseLine.NEXT = 0;
        END;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.Update();
    end;

    var
        PurchaseHeader: Record "Purchase Header";
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        PurchaseLine: Record "Purchase Line";
        GLAccountz: Code[20];
        FixedAsset: Record "Fixed Asset";
        item: Record Item;
        FAPostingGroup: Record "FA Posting Group";



}
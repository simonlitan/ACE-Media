codeunit 52178552 "Custom Purch.-Post Ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterReleasePurchDoc', '', true, true)]
    local procedure OnAfterRejectPurchaseOrder(var PurchHeader: Record "Purchase Header")
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        GenSetup: Record "General Ledger Setup";
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        CommDocNo: Code[50];
        RevCommNo: Code[50];
        PurchaseLine: Record "Purchase Line";
        GLAccountz: Code[30];
        FixedAsset: Record "Fixed Asset";
        item: Record Item;
        FAPostingGroup: Record "FA Posting Group";
        CheckBudgetAvail: Codeunit "Budgetary Control";
        BudgetBal: Codeunit "Budget Balance";
        InvAmount: Decimal;
    begin
        BCSetup.GET;
        // IF NOT ((BCSetup.Mandatory)) THEN
        //     EXIT;
         IF NOT ((BCSetup.Mandatory) AND (BCSetup."LPO Budget Mandatory")) THEN EXIT;
         BCSetup.TESTFIELD("Current Budget Code");
        PurchHeader.TESTFIELD("Shortcut Dimension 1 Code");
        PurchHeader.TestField("Shortcut Dimension 2 Code");

        //Get Current Lines to loop through
        PurchHeader.RESET;
        PurchaseLine.SETRANGE("Document No.", PurchHeader."No.");
        PurchaseLine.SETRANGE("Document Type", PurchaseLine."Document Type"::Order);
        PurchaseLine.SETFILTER(Type, '%1|%2|%3', PurchaseLine.Type::Item, PurchaseLine.Type::"Fixed Asset", PurchaseLine.Type::"G/L Account");
        IF PurchaseLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Check if budget exists
                // CLEAR(GLAccountz);
                // PurchaseLine.TESTFIELD("No.");
                // IF PurchaseLine.Type = PurchaseLine.Type::Item THEN BEGIN
                //     Item.RESET;
                //     Item.SETRANGE("No.", PurchaseLine."No.");
                //     IF Item.FIND('-') THEN;
                //     Item.TESTFIELD("Item G/L Budget Account");
                //     GLAccountz := Item."Item G/L Budget Account";
                // END ELSE
                //     IF PurchaseLine.Type = PurchaseLine.Type::"Fixed Asset" THEN BEGIN
                //         FixedAsset.RESET;
                //         FixedAsset.SETRANGE("No.", PurchaseLine."No.");
                //         IF FixedAsset.FIND('-') THEN BEGIN
                //             FixedAsset.TESTFIELD("FA Posting Group");
                //             FAPostingGroup.RESET;
                //             FAPostingGroup.SETRANGE(Code, FixedAsset."FA Posting Group");
                //             IF FAPostingGroup.FIND('-') THEN BEGIN
                //                 FAPostingGroup.TESTFIELD("Acquisition Cost Account");
                //                 GLAccountz := FAPostingGroup."Acquisition Cost Account";
                //             END;
                //         END;
                //     END ELSE
                //         IF PurchaseLine.Type = PurchaseLine.Type::"G/L Account" THEN BEGIN
                //             GLAccountz := PurchaseLine."No.";
                //             CommDocNo := PurchHeader."No." + PurchaseLine."No.";
                //         END;
                // GLAccount.RESET;
                // GLAccount.SETRANGE("No.", GLAccountz);
                // IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                // DimensionValue.RESET;
                // DimensionValue.SETRANGE(Code, PurchHeader."Shortcut Dimension 1 Code");
                // DimensionValue.SETRANGE("Global Dimension No.", 2);
                // IF DimensionValue.FIND('-') THEN
                //     DimensionValue.TESTFIELD(Name);
                // FINBudgetEntries.RESET;
                // FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                // FINBudgetEntries.SETRANGE("G/L Account No.", PurchaseLine."No.");
                // FINBudgetEntries.SetRange("Document No", PurchHeader."No." + PurchaseLine."No.");
                // FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", PurchaseLine."No.");
                FINBudgetEntries.SetRange("Document No", PurchHeader."No." + PurchaseLine."No.");
                FINBudgetEntries.SetRange("Global Dimension 1 Code", PurchHeader."Shortcut Dimension 1 Code");
                FINBudgetEntries.SETRANGE("Global Dimension 2 Code", PurchHeader."Shortcut Dimension 2 Code");
                FINBudgetEntries.DeleteAll();
            END
            UNTIL PurchaseLine.NEXT = 0;
        END;
    end;
}
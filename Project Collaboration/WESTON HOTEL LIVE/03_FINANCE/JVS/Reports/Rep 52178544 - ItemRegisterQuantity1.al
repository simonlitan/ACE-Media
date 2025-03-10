report 52178544 "Item Register - Quantity1"

{
    DefaultLayout = RDLC;
#pragma warning disable AL0835
    RDLCLayout = './Reports/SSR/ItemRegisterQuantity.rdlc';
#pragma warning restore AL0835
    Caption = 'Item Register - Quantity';

    dataset
    {
        dataitem("Item Register";"Item Register")
        {
            DataItemTableView = SORTING ("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(CompanyName; COMPANYNAME)
            {
            }
            column(ItemRegFilterCopyText; TABLECAPTION + ': ' + ItemRegFilter)
            {
            }
            column(ItemRegFilter; ItemRegFilter)
            {
            }
            column(No_ItemRegister; "No.")
            {
            }
            column(ItemRegQtyCaption; ItemRegQtyCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(PostingDateCaption; PostingDateCaptionLbl)
            {
            }
            column(ItemDescriptionCaption; ItemDescriptionCaptionLbl)
            {
            }
            column(No_ItemRegisterCaption; No_ItemRegisterCaptionLbl)
            {
            }
            dataitem("Item Ledger Entry";"Item Ledger Entry")
            {
                DataItemTableView = SORTING ("Entry No.");
                column(PostingDate_ItemLedgEntry; FORMAT("Posting Date"))
                {
                }
                column(EntryType_ItemLedgEntry; "Entry Type")
                {
                    IncludeCaption = true;
                }
                column(ItemNo_ItemLedgEntry; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(ItemDescription; ItemDescription)
                {
                }
                column(Quantity_ItemLedgEntry; Quantity)
                {
                    IncludeCaption = true;
                }
                column(EntryNo_ItemLedgEntry; "Entry No.")
                {
                    IncludeCaption = true;
                }
                column(DocNo_ItemLedgEntry; "Document No.")
                {
                    IncludeCaption = true;
                }
                column(CostVar; CostVar)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    ItemDescription := Description;
                    IF ItemDescription = '' THEN BEGIN
                        IF NOT Item.GET("Item No.") THEN
                            Item.INIT;
                        ItemDescription := Item.Description;
                    END;
                    CLEAR(UnitPrice);
                    CLEAR(CostVar);
                    Item.RESET;
                    Item.SETRANGE(Item."No.", "Item Ledger Entry"."Item No.");
                    IF Item.FIND('-') THEN
                        UnitPrice := Item."Unit Price";
                    //MESSAGE(FORMAT(UnitPrice));
                    CostVar := ("Item Ledger Entry".Quantity * UnitPrice);
                end;

                trigger OnPreDataItem()
                begin
                    SETRANGE("Entry No.", "Item Register"."From Entry No.", "Item Register"."To Entry No.");
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        ItemRegFilter := "Item Register".GETFILTERS;
    end;

    var
        Item: Record 27;
        ItemRegFilter: Text;
        ItemDescription: Text[50];
        ItemRegQtyCaptionLbl: Label 'Item Register - Quantity';
        CurrReportPageNoCaptionLbl: Label 'Page';
        PostingDateCaptionLbl: Label 'Posting Date';
        ItemDescriptionCaptionLbl: Label 'Description';
        No_ItemRegisterCaptionLbl: Label 'Register No.';
        UnitPrice: Decimal;
        CostVar: Decimal;
}





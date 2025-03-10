xmlport 52178508 StoreReqLines
{
    Caption = 'Import StoreLines';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {
            tableelement(StoreRequistionLinesClone; StoreReqLiNES)
            {

                fieldelement(RequistionNo; StoreRequistionLinesClone."Requistion No")
                {
                }
                fieldelement(LineNo; StoreRequistionLinesClone."Line No.")
                {
                }
                fieldelement(Type; StoreRequistionLinesClone."Type")
                {
                }
                fieldelement(No; StoreRequistionLinesClone."No.")
                {
                }
                fieldelement(Description; StoreRequistionLinesClone.Description)
                {
                }
                fieldelement(Quantity; StoreRequistionLinesClone.Quantity)
                {
                }
                fieldelement(Qtyinstore; StoreRequistionLinesClone."Qty in store")
                {
                }
                fieldelement(RequestStatus; StoreRequistionLinesClone."Request Status")
                {
                }
                fieldelement(UnitofMeasure; StoreRequistionLinesClone."Unit of Measure")
                {
                }
                fieldelement(UnitCost; StoreRequistionLinesClone."Unit Cost")
                {
                }
                fieldelement(LineAmount; StoreRequistionLinesClone."Line Amount")
                {
                }
                fieldelement(ShortcutDimension1Code; StoreRequistionLinesClone."Shortcut Dimension 1 Code")
                {
                }
                fieldelement(ShortcutDimension2Code; StoreRequistionLinesClone."Shortcut Dimension 2 Code")
                {
                }
                fieldelement(GenProdPostingGroup; StoreRequistionLinesClone."Gen. Prod. Posting Group")
                {
                }
                fieldelement(IssuingStore; StoreRequistionLinesClone."Issuing Store")
                {
                }
                fieldelement(ProductGroup; StoreRequistionLinesClone."Product Group")
                {
                }
                fieldelement(PostingDate; StoreRequistionLinesClone."Posting Date")
                {
                }
                fieldelement(CategoryCode; StoreRequistionLinesClone."Category Code")
                {
                }
                fieldelement(ItemGroup; StoreRequistionLinesClone."Item Group")
                {
                }
                fieldelement(Status; StoreRequistionLinesClone.Status)
                {
                }
                // fieldattribute(Status; pc.Status)
                // {

                // }


                // trigger OnBeforeInsertRecord()
                // begin
                //     if PC."Requistion No" = '_' then
                //         currXMLport.Skip();
                //     I := PC."Requistion No";
                // end;
            }

        }
    }






    trigger OnInitXmlPort()
    begin




    end;

    var
        I: Integer;
}






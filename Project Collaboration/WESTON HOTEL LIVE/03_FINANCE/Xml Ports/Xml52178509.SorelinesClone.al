xmlport 52178509 "Sore lines Clone"
{
    Caption = 'Sore lines Clone';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    schema
    {
        // textelement(RootNodeName)
        textelement(root)
        {
            tableelement(StoreRequistionLinesClone; "PROC-Store Requistion Lines")
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
                trigger OnBeforeInsertRecord()
                var
                    myInt: Integer;
                begin
                    if StoreRequistionLinesClone.Get(StoreRequistionLinesClone."Requistion No", StoreRequistionLinesClone."No.") then
                        currXMLport.Skip();
                end;
            }

        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {

            }
        }
    }
}




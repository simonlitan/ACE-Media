xmlport 52178510 "Store Requsition Lines"
{
    Caption = 'Store Requsition Lines';
    Direction = Import;
    Format = VariableText;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(PROCStoreRequistionLines; "PROC-Store Requistion Lines")
            {
                fieldelement(RequistionNo; PROCStoreRequistionLines."Requistion No")
                {
                }
                // fieldelement(Qtybalance; PROCStoreRequistionLines."Qty balance")
                // {
                // }
                fieldelement(LineNo; PROCStoreRequistionLines."Line No.")
                {
                }
                fieldelement(Type; PROCStoreRequistionLines."Type")
                {
                }
                fieldelement(No; PROCStoreRequistionLines."No.")
                {
                }
                fieldelement(Description; PROCStoreRequistionLines.Description)
                {
                }
                // fieldelement(Description2; PROCStoreRequistionLines."Description 2")
                // {
                // }
                fieldelement(Quantity; PROCStoreRequistionLines.Quantity)
                {
                }
                fieldelement(Qtyinstore; PROCStoreRequistionLines."Qty in store")
                {
                }
                fieldelement(RequestStatus; PROCStoreRequistionLines."Request Status")
                {
                }
                // fieldelement(ActionType; PROCStoreRequistionLines."Action Type")
                // {
                // }
                fieldelement(UnitofMeasure; PROCStoreRequistionLines."Unit of Measure")
                {
                }
                /* fieldelement(TotalBudget; PROCStoreRequistionLines."Total Budget")
                {
                }
                fieldelement(CurrentMonthBudget; PROCStoreRequistionLines."Current Month Budget")
                {
                } */
                fieldelement(UnitCost; PROCStoreRequistionLines."Unit Cost")
                {
                }
                fieldelement(LineAmount; PROCStoreRequistionLines."Line Amount")
                {
                }
                /*  fieldelement(QuantityRequested; PROCStoreRequistionLines."Quantity Requested")
                 {
                 } */
                /*  fieldelement(InStore; PROCStoreRequistionLines."In Store")
                 {
                 } */

                fieldelement(ShortcutDimension1Code; PROCStoreRequistionLines."Shortcut Dimension 1 Code")
                {
                }
                fieldelement(ShortcutDimension2Code; PROCStoreRequistionLines."Shortcut Dimension 2 Code")
                {
                }
                fieldelement(GenProdPostingGroup; PROCStoreRequistionLines."Gen. Prod. Posting Group")
                {
                }
                /*  fieldelement(CurrentActualsAmount; PROCStoreRequistionLines."Current Actuals Amount")
                 {
                 }
                 fieldelement(Committed; PROCStoreRequistionLines.Committed)
                 {
                 } */
                fieldelement(PostingDate; PROCStoreRequistionLines."Posting Date")
                {
                }
                fieldelement(CategoryCode; PROCStoreRequistionLines."Category Code")
                {
                }
                fieldelement(ProductGroup; PROCStoreRequistionLines."Product Group")
                {
                }
                //   fieldelement(ProductPostingGroup; PROCStoreRequistionLines."Product Posting Group")
                //   {
                //   } 
                fieldelement(ItemGroup; PROCStoreRequistionLines."Item Group")
                {
                }
                fieldelement(Status; PROCStoreRequistionLines.Status)
                {
                }
                /* fieldelement(ShortcutDimension3Code; PROCStoreRequistionLines."Shortcut Dimension 3 Code")
                 {
                 }
                 fieldelement(ShortcutDimension4Code; PROCStoreRequistionLines."Shortcut Dimension 4 Code")
                 {
                 } */
                fieldelement(IssuingStore; PROCStoreRequistionLines."Issuing Store")
                {
                }
                /*
              fieldelement(QuantityToIssue; PROCStoreRequistionLines."Quantity To Issue")
              {
              }
              fieldelement(QuantityIssued; PROCStoreRequistionLines."Quantity Issued")
              {
              }
              fieldelement(IssueQuantity; PROCStoreRequistionLines."Issue Quantity")
              {
              }
              fieldelement(BudgetedAmount; PROCStoreRequistionLines."Budgeted Amount")
              {
              }
              fieldelement(ActualExpenditure; PROCStoreRequistionLines."Actual Expenditure")
              {
              }
              fieldelement(CommittedAmount; PROCStoreRequistionLines."Committed Amount")
              {
              }
              fieldelement(BudgetName; PROCStoreRequistionLines."Budget Name")
              {
              }
              fieldelement(BudgetBalance; PROCStoreRequistionLines."Budget Balance")
              {
              }
              fieldelement(VoteAccount; PROCStoreRequistionLines."Vote Account")
              {
              }
              fieldelement(IssueUserID; PROCStoreRequistionLines."Issue UserID")
              {
              }
              fieldelement(ItemProductGroup; PROCStoreRequistionLines."Item Product Group")
              {
              } */
                trigger OnBeforeInsertRecord()
                var
                    myInt: Integer;
                begin
                    if PROCStoreRequistionLines.Get(PROCStoreRequistionLines."Requistion No", PROCStoreRequistionLines."No.") then
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

page 52179300 "Page Product Groups"
{
    //ApplicationArea = Basic, Suite;
    Caption = 'Product Group';
    //CardPageID = "Products Groups";
    //InsertAllowed = false;
    PageType = List;
    //RefreshOnActivate = true;
    //ShowFilter = false;
    SourceTable = "Products Groups";
    //SourceTableView = SORTING("Presentation Order");
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                //IndentationColumn = Indentation;
                //IndentationControls = "Code";
                //ShowAsTree = true;
                //ShowCaption = false;
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = Basic, Suite;
                    //StyleExpr = StyleTxt;
                    //ToolTip = 'Specifies the code for the item category.';
                    //Editable = false;

                    // trigger OnValidate()
                    // begin
                    //     CurrPage.Update(false);
                    //     CurrPage.ItemAttributesFactbox.PAGE.LoadCategoryAttributesData(Code);
                    // end;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = Basic, Suite;
                    //ToolTip = 'Specifies a description of the item category.';
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue;
                }
            }
        }
        // area(factboxes)
        // {
        //     // part(ItemAttributesFactbox; "Item Attributes Factbox")
        //     // {
        //     //     ApplicationArea = Basic, Suite;
        //     //     Caption = 'Attributes';
        //     // }
        // }
    }

    // actions
    // {
    //     // area(creation)
    //     // {
    //     //     action(Recalculate)
    //     //     {
    //     //         ApplicationArea = Basic, Suite;
    //     //         Caption = 'Recalculate';
    //     //         Image = Hierarchy;
    //     //         Promoted = true;
    //     //         PromotedCategory = Process;
    //     //         PromotedIsBig = true;
    //     //         PromotedOnly = true;
    //     //         ToolTip = 'Update the tree of item categories based on recent changes.';

    //     //         // trigger OnAction()
    //     //         // begin
    //     //         //     ItemCategoryManagement.UpdatePresentationOrder();
    //     //         // end;
    //     //     }
    //     // }
    // }

    // trigger OnAfterGetCurrRecord()
    // begin
    //     StyleTxt := GetStyleText;
    //     CurrPage.ItemAttributesFactbox.PAGE.LoadCategoryAttributesData(Code);
    // end;

    // trigger OnAfterGetRecord()
    // begin
    //     StyleTxt := GetStyleText;
    // end;

    // trigger OnDeleteRecord(): Boolean
    // begin
    //     StyleTxt := GetStyleText;
    // end;

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     StyleTxt := GetStyleText;
    // end;

    // trigger OnOpenPage()
    // begin
    //     ItemCategoryManagement.CheckPresentationOrder();
    // end;

//     protected var
//         // ItemCategoryManagement: Codeunit "Item Category Management";
//         // StyleTxt: Text;

//     procedure GetSelectionFilter(): Text
//     var
//         ItemCategory: Record "Item Category";
//         SelectionFilterManagement: Codeunit SelectionFilterManagement;
//     begin
//         CurrPage.SetSelectionFilter(ItemCategory);
//         exit(SelectionFilterManagement.GetSelectionFilterForItemCategory(ItemCategory));
//     end;

//     procedure SetSelection(var ItemCategory: Record "Item Category")
//     begin
//         CurrPage.SetSelectionFilter(ItemCategory);
//     end;
}


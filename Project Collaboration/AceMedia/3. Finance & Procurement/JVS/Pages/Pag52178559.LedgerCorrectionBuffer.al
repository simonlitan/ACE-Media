page 52178757 "Ledger Correction Buffer"
{
    PageType = List;
    SourceTable = "Ledger Correction Buffer";
    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Correct Date"; Rec."Correct Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Correct Date field.';
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Date posted"; Rec."Date Modification Posted")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date posted field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Post Correction")
            {
                ApplicationArea = All;
                Image = PostedCreditMemo;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.ModifyPostedDoc();
                end;
            }
        }
    }
}
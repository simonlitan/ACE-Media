page 52179032 "Other Items"
{
    Caption = 'Other Items';
    PageType = List;
    SourceTable = "CM Items";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("Shelf No"; Rec."Shelf No")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Model No"; Rec."Model No")
                {
                    ApplicationArea = All;
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = All;
                }
                field(Select; Rec.Select)
                {
                    ApplicationArea = All;
                }
                field(Collected; Rec.Collected)
                {
                    ApplicationArea = All;
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Mark as Collected")
            {
                ApplicationArea = all;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.MarkAsCollected();
                end;
            }
        }
    }
}

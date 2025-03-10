page 52179033 "Firearm List"
{
    Caption = 'Firearm List';
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
                field("Firearm Type"; Rec."Firearm Type")
                {
                    ApplicationArea = All;
                }
                field("Serial No"; Rec."Serial No")
                {
                    ApplicationArea = All;
                }
                field("Butt No"; Rec."Butt No")
                {
                    ApplicationArea = All;
                }
                field("No of Magazine"; Rec."No of Magazine")
                {
                    ApplicationArea = All;
                }
                field("No of Rounds"; Rec."No of Rounds")
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

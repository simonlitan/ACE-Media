page 52178721 "FIN-Budgetary Comparison List"
{
    Editable = false;
    PageType = List;
    SourceTable = "FIN-Budget Entries Summary";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Budget Name"; Rec."Budget Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Vote Name"; Rec."Vote Name")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                    // Visible = false;
                    ApplicationArea = All;

                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {

                    Editable = false;
                    //Visible = false;
                    ApplicationArea = All;
                }
                field(Allocation; Rec.Allocation)
                {
                    ApplicationArea = All;
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = All;
                }

                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
    }
}
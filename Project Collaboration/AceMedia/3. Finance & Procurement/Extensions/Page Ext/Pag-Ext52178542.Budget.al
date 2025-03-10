pageextension 52178542 "ExtBudget" extends Budget
{
    actions
    {
        addafter("Copy Budget")
        {

            action("Update Budget")
            {
                ApplicationArea = Suite;
                Caption = 'Update Budget';
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ShortCutKey = 'Return';
                ToolTip = 'Updates budget once modified';
                trigger OnAction()
                var
                    PostBudgetEnties: Codeunit "Post Budget Enties";
                begin
                    PostBudgetEnties.PostBudget();
                end;
            }


        }

    }
    var
        Budgetsummary: Record "FIN-Budget Entries Summary";
}
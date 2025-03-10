pageextension 52178543 "ExtG_L Budget Names" extends "G/L Budget Names"
{
    actions
    {

        addafter(EditBudget)
        {
            action("Budget Summary")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Budget Summary';
                Image = Journal;
                RunObject = Page "FIN-Budgetary Comparison List";
                ToolTip = 'Budget Summary';
            }
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
            action("Budget Periods")
            {
                ApplicationArea = Suite;
                Caption = 'Budget Periods';
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ShortCutKey = 'Return';
                ToolTip = 'Budget Periods';

                RunObject = page "FIN-Budget Periods Setup";
                RunPageLink = "Budget Name" = FIELD(Name);


            }
            action("Budget Comparison Report")
            {
                ApplicationArea = Suite;
                Caption = 'Votebook Summary';
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ShortCutKey = 'Return';
                ToolTip = 'Budget Comparison Summary';
                RunObject = page "FIN-Budgetary Comparison List";
                RunPageLink = "Budget Name" = FIELD(Name);

            }

        }
        addafter(ReportTrialBalance)
        {
            action("Budget Summary Report")
            {
                ApplicationArea = all;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Report;
                RunObject = report "Budget comparison summary";

            }
            action("BudgetControlPage")
            {
                ApplicationArea = all;

                RunObject = page "Budget Entries Control";
            }
        }
    }

}
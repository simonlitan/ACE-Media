page 52178761 "FIN-Memo Expense Codes"
{
    Editable = true;
    PageType = List;
    SourceTable = "FIN-Memo Expense Codes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Expense Code"; Rec."Expense Code")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    //  ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(creation)
        {
            action(MemoDet)
            {
                Caption = 'Core Mandate';
                Image = Allocations;
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = Process;
                RunObject = Page "FIN-Memo Details";
                RunPageLink = "Memo No." = FIELD("Memo No."),
                              "Expense Code" = FIELD("Expense Code"),
                              "Type" = filter('ACCOMODATION');

            }
            action(Logistics)
            {
                Caption = 'Fuel Details';
                Image = Allocations;
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = Process;
                RunObject = Page "Logistics Memo Details";
                RunPageLink = "Memo No." = FIELD("Memo No."),
                "Expense Code" = FIELD("Expense Code"), Type = filter('Fuel');
            }
            action("Maintainance")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;
                Image = OrderPromising;
                RunObject = Page "Memo Maintainance Cost";
                RunPageLink = "Memo No." = FIELD("Memo No."),
                "Expense Code" = FIELD("Expense Code"), Type = filter('MAINTAINANCE');

            }
            action("Casual Details")
            {
                Image = CreateSKU;
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = Process;
                RunObject = Page "Fin-Memo Casual";

                RunPageLink = "Memo No." = FIELD("Memo No."),
                              "Expense Code" = FIELD("Expense Code"), Type = filter('CASUALS');

                /* trigger OnAction()
                var
                    expensecodeSetup: Record "FIN-Memo Expense Codes Setup";
                    expenseCodes: Record "FIN-Memo Expense Codes";
                begin

                    expensecodeSetup.Reset();
                    expensecodeSetup.SetRange(Code, 'Casuals');
                    if not expensecodeSetup.Find('-') then begin
                        expensecodeSetup.Init();
                        expensecodeSetup.Code := 'Casuals';
                        expensecodeSetup.Description := 'Casuals';
                        expensecodeSetup.Insert();

                        expenseCodes.Init();
                        expenseCodes."Memo No." := Rec."Memo No.";
                        expenseCodes."Expense Code" := 'Casuals';
                        expenseCodes.Type := 'Accomodation';
                        expenseCodes.Insert();

                        expenseCodes.Reset();
                        expenseCodes.SetRange("Expense Code", 'Casuals');
                        expenseCodes.SetRange(Type, 'Accomodation');
                        if expenseCodes.Find('-') then begin
                            Page.Run(page::"Fin-Memo Casual", expenseCodes);
                        end;


                    end else begin
                        expenseCodes.Reset();
                        expenseCodes.SetRange("Expense Code", 'Casuals');
                        expenseCodes.SetRange(Type, 'Accomodation');
                        if not expenseCodes.Find('-') then begin
                            expenseCodes.Init();
                            expenseCodes."Memo No." := Rec."Memo No.";
                            expenseCodes."Expense Code" := 'Casuals';
                            expenseCodes.Type := 'Accomodation';
                            expenseCodes.Insert();
                            Page.Run(page::"Fin-Memo Casual", expenseCodes);
                        end else
                            Page.Run(page::"Fin-Memo Casual", expenseCodes);
                    end;

                    Page.Run(page::"Fin-Memo Casual", expenseCodes);

                end; */

            }
            action("Other Costs")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;
                Image = OrderPromising;
                RunObject = Page "Other Costs";
                RunPageLink = "Memo No." = FIELD("Memo No."),
                "Expense Code" = FIELD("Expense Code"), Type = filter('Other Costs');
            }

        }
    }

    var
        FINMemoDetails: Record "FIN-Memo Details";
}


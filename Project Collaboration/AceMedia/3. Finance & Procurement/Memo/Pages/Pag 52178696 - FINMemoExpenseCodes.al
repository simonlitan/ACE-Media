page 52178696 "FIN-Memo Expense Codes"
{
    //Editable = false;
    //InsertAllowed = false;
    DeleteAllowed = false;
    SaveValues = true;
    PageType = List;
    SourceTable = "FIN-Memo Expense Codes";
    PromotedActionCategories = 'New,Process,Report,Categories';

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
                    ToolTip = 'Specifies the value of the Type field.';
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
                PromotedCategory = Category4;
                RunObject = Page "FIN-Memo Details";
                RunPageLink = "Memo No." = FIELD("Memo No."),
                              "Expense Code" = FIELD("Expense Code"),
                              "Type" = const('DSA');

            }
            action(Logistics)
            {
                Caption = 'Fuel Details';
                Image = Allocations;
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = Category4;
                RunObject = Page "Logistics Memo Details";
                RunPageLink = "Memo No." = FIELD("Memo No."),
                "Expense Code" = FIELD("Expense Code"), Type = CONST('FUEL');
            }
            action("Maintainance")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                Image = OrderPromising;
                RunObject = Page "Memo Maintainance Cost";
                RunPageLink = "Memo No." = FIELD("Memo No."),
                "Expense Code" = FIELD("Expense Code"), Type = CONST('MAINTENANCE');

            }
            action("Casual Details")
            {
                Image = CreateSKU;
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = Category4;
                RunObject = Page "Fin-Memo Casual";
                RunPageLink = "Memo No." = FIELD("Memo No."),
                              "Expense Code" = FIELD("Expense Code"), Type = CONST('CASUALS');

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
                PromotedCategory = Category4;
                Image = OrderPromising;
                RunObject = Page "Other Costs";
                RunPageLink = "Memo No." = FIELD("Memo No."),
                "Expense Code" = FIELD("Expense Code"), Type = CONST('OTHER COSTS');
            }

        }
    }

    var
        FINMemoDetails: Record "FIN-Memo Details";
}


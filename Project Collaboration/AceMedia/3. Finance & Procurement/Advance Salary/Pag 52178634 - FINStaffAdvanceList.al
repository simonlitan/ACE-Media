page 52178634 "FIN-Staff Advance List"
{
    CardPageID = "Approved Staff Advance";
    Editable = true;
    PageType = List;
    SourceTable = "FIN-Staff Advance Header";

    layout
    {
        area(content)
        {
            repeater(rep001)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Cashier; Rec.Cashier)
                {
                    Caption = 'Requestor ID';
                    ApplicationArea = All;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
    var




    trigger OnOpenPage()
    begin
        //   rec.SetFilter(Cashier, UserId);
    end;

}


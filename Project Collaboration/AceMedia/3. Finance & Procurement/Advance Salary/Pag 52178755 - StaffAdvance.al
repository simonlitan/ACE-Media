page 52178755 "Staff Advance"
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
        rec.SetFilter(Cashier, UserId);
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.SETFILTER(Cashier, UserId)
    end;

    trigger OnInit()
    begin
        Rec.SETFILTER(Cashier, USERID);
    end;




}

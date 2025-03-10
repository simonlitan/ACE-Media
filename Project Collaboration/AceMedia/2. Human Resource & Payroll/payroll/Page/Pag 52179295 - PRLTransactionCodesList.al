page 52179295 "PRL-Transaction Codes List"
{
    CardPageID = "PRL-Transaction Code";
    Editable = true;
    PageType = List;
    SourceTable = "PRL-Transaction Codes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = all;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = all;
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = all;
                }
                field("Balance Type"; Rec."Balance Type")
                {
                    ApplicationArea = all;
                }

                field("Is Formula"; Rec."Is Formula")
                {
                    ApplicationArea = all;
                }
                field(formulae; 'E.g. ([0.05]+[0.20]*[24])/2268....')
                {
                    ApplicationArea = all;
                    Caption = 'Formula example';
                }
                field("Include Employer Deduction"; Rec."Include Employer Deduction")
                {
                    ApplicationArea = all;
                }

                field("GL Account"; Rec."GL Account")
                {
                    ApplicationArea = all;
                }
                field("Mortgage interest"; Rec."Mortgage interest")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mortgage interest field.';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Update)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.UpdateTcode();
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.UpdateTcode();
    end;

    trigger OnClosePage()
    begin
        rec.UpdateTcode();
    end;
}


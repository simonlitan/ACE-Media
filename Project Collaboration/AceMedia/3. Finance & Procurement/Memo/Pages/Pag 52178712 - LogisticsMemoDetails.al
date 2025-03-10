page 52178712 "Logistics Memo Details"
{
    PageType = List;
    SourceTable = "FIN-Memo Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Expense Code"; Rec."Expense Code")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Payee Type"; Rec."Payee Type")
                {
                    Editable = true;
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        ImpHeader: Record "FIN-Memo Header";
                    begin
                        if Rec."Payee Type" = Rec."Payee Type"::Employees then begin
                            ImpHeader.Reset();
                            ImpHeader.SetRange("No.", Rec."Memo No.");
                            if ImpHeader.Find('-') then begin
                                Rec."Staff no." := ImpHeader."Memo Requestor No";
                                Rec."Staff Name" := ImpHeader."To";
                            end;
                        end;
                    end;
                }
                field("Staff no."; Rec."Staff no.")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Vehicle No"; Rec."Vehicle No")
                {
                    ApplicationArea = All;

                }
                field("Registration No"; Rec."Registration No")
                {
                    Editable = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration No field.';
                }
                field("Fuel Consumption Rate"; Rec."Consumption Rate")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Fuel Rate"; Rec."Fuel Rate")
                {
                    ApplicationArea = All;
                }
                field(Distance; Rec.Distance)
                {
                    ApplicationArea = All;
                }

                field(Amount; Rec.Amount)
                {
                    Editable = true;
                    Enabled = false;
                    ApplicationArea = All;
                }


            }
        }
    }

    actions
    {
    }
}
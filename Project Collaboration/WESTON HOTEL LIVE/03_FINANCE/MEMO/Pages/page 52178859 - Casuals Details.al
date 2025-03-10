page 52178510 "Fin-Memo Casual"
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
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        getRequestor();
                    end;
                }
                field("Staff no."; Rec."Staff no.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Casual Category"; Rec."Casual Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Casual Category field.';
                }

                field(Rate; Rec.Rate)
                {
                    ApplicationArea = All;
                }
                field(Days; Rec.Days)
                {
                    ApplicationArea = All;

                }
                field("No. of Casuals"; Rec."No. of Casuals")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. of Casuals field.';
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
    var
        memoHeader: Record "FIN-Memo Header";

    procedure getRequestor()
    begin
        memoHeader.Reset();
        memoHeader.SetRange("No.", rEC."Memo No.");
        IF memoHeader.Find('-') then BEGIN
            Rec."Staff no." := memoHeader."Memo Requestor No";
            Rec."Staff Name" := memoHeader.From;
            //Rec."Job Grade" := 'Casuals';
        END;

    end;
}
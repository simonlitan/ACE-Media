page 52178511 "Other Costs"
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
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Item Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field(Amount; Rec.Amount)
                {
                    // Editable = false;
                    ApplicationArea = All;
                }
            }
        }
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
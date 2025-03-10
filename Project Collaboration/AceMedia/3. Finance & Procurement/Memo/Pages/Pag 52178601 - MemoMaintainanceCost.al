page 52178601 "Memo Maintainance Cost"
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
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Vehicle No"; Rec."Vehicle No")
                {
                    ApplicationArea = All;

                }
                field("Registration No"; Rec."Registration No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration No field.';
                }
                field(Description; Rec.Description)
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Description field.';
                }

                field(Amount; Rec.Amount)
                {
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
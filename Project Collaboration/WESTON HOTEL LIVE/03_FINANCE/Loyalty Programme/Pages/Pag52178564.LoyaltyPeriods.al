page 52178564 "Loyalty Periods"
{
    PageType = List;
    SourceTable = "Loyalty Periods";
    DeleteAllowed = false;
    PromotedActionCategories = 'Close Period';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Period Code"; Rec."Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Closure Date"; Rec."Closure Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closure Date field.';
                }
                field(Closed; Rec.Closed)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Close Period")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                Image = ClosePeriod;
                trigger OnAction()
                begin
                    Rec.ClosePeriod(Rec);
                end;
            }
        }
    }
}
page 52178923 "Sales Invoice.Lines"
{
    PageType = ListPart;
    SourceTable = "Sales Quote Lines";
    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field(Details; Rec.Details)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Details field.';
                }
                field(QTY; Rec.Pax)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the QTY field.';
                }
                field(days; Rec.days)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the days field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Total Price"; Rec."Total Price")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Price field.';
                }
            }
        }
    }
}
page 52178924 "Food Order Form"
{
    PageType = Document;
    SourceTable = "Food Order Form";
    DeleteAllowed = false;
    PromotedActionCategories = 'New, Report';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = false;

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Opportunity No."; Rec."Opportunity No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Opportunity No. field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salesperson Code field.';
                }
            }
            group("Event Details")
            {

                field("Event Name"; Rec."Event Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Event Name field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Day; Rec.Day)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Day field.';
                }
                field("Type of Event"; Rec."Type of Event")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Event field.';
                }
                field("Number of Pax: Expected"; Rec."Number of Pax: Expected")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Number of Pax: Expected field.';
                }
                field(Guaranteed; Rec.Guaranteed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Guaranteed field.';
                }
                field("Arrival Time"; Rec."Arrival Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Arrival Time field.';
                }
                field("Meal Time"; Rec."Meal Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Meal Time field.';
                }
            }
            group("Menu Details")
            {

                field("MenuDetails"; Rec."Menu Details")
                {
                    MultiLine = true;
                    ShowCaption = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Menu Details field.';
                }
            }
            group("Beverage Details")
            {

                field("BeverageDetails"; Rec."Beverage Details")
                {
                    MultiLine = true;
                    ShowCaption = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Beverage Details field.';
                }
            }
            group("Set up details")
            {

                field("SetupDetails"; Rec."Setup Details")
                {
                    ShowCaption = false;
                    MultiLine = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Setup Details field.';
                }
            }
            group("Decoration Details")
            {

                field("Decorationdetails"; Rec."Decoration details")
                {
                    MultiLine = true;
                    ShowCaption = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Decoration details field.';
                }
            }
            group("Entertainment")
            {

                field(Entertainments; Rec.Entertainment)
                {
                    MultiLine = true;
                    ShowCaption = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entertainment field.';
                }
            }
            group("Other details")
            {

                field("OtherDetails"; Rec."Other Details")
                {
                    ShowCaption = false;
                    MultiLine = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Other Details field.';
                }
            }
            group("Charges")
            {

                field(Food; Rec.Food)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Food field.';
                }
                field(Beverage; Rec.Beverage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Beverage field.';
                }
                field(Others; Rec.Others)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Others field.';
                }
            }
            group("Other Info")
            {

                field("Payment plan"; Rec."Payment plan")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment plan field.';
                }
                field("Event Agreement Details"; Rec."Event Agreement Details")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Event Agreement Details field.';
                }
                field("Organizer Name"; Rec."Organizer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Organizer Name field.';
                }
                field("Telephone Contact"; Rec."Telephone Contact")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telephone Contact field.';
                }
                field("Booked By"; Rec."Booked By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Booked By field.';
                }
                field("Booked Date"; Rec."Booked Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Booked Date field.';
                }
                field("Received By"; Rec."Received By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Received By field.';
                }
                field("Received Date"; Rec."Received Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Received Date field.';
                }
            }


        }

    }

    actions
    {
        area(Processing)
        {
            action(orderForm)
            {
                Caption = 'Order Form';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                Image = NewSalesQuote;
                trigger OnAction()
                var
                    opp: Record Opportunity;
                    fof: Record "Food Order Form";
                begin
                    fof.Reset();
                    fof.SetRange("No.", Rec."No.");
                    if fof.Find('-') then begin
                        opp.Reset();
                        opp.SetRange("No.", fof."Opportunity No.");
                        Report.Run(Report::"Events Order Form", true, false, opp);
                    end;

                end;
            }

            action("Agreement Form")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                Image = NewSalesQuote;
                trigger OnAction()
                var
                    opp: Record Opportunity;
                    fof: Record "Food Order Form";
                begin
                    fof.Reset();
                    fof.SetRange("No.", Rec."No.");
                    if fof.Find('-') then begin
                        opp.Reset();
                        opp.SetRange("No.", fof."Opportunity No.");
                        Report.Run(Report::"Events Agreement Form", true, false, opp);
                    end;
                end;
            }
        }
    }
}
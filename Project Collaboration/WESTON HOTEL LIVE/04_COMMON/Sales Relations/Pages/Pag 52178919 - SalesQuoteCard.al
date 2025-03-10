page 52178919 "Sales Quote Card"
{
    PageType = Document;
    SourceTable = "Sales Quotes";
    DeleteAllowed = false;
    SourceTableView = where("Document Type" = filter(Quote));


    layout
    {
        area(Content)
        {
            group(general)
            {

                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Contact No."; Rec."Contact No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact No. field.';
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
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
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salesperson Code field.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Cost field.';
                }

                field("Quote Type"; Rec."Quote Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quote Type field.';
                }
                field("To"; Rec."To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the To field.';
                }
                field(Salutation; Rec.Salutation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salutation field.';
                }

            }
            group(REFERENCE)
            {
                field(REF; Rec.REF)
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the REF field.';
                }
            }
            group(Lines)
            {
                part(quote; "Sales Quote Lines")
                {
                    ApplicationArea = All;
                    SubPageLink = "Document No." = field("No."), "Document Type" = filter(Quote);
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Print)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    squote: Record "Sales Quotes";
                begin
                    if Rec."Quote Type" = rec."Quote Type"::" " then Error('Pick The Invoice Type');
                    squote.Reset();
                    squote.SetRange("No.", Rec."No.");
                    if squote.Find('-') then begin
                        if squote."Quote Type" = squote."Quote Type"::Accomodation then
                            Report.Run(Report::"Accomodation Quotation", true, false, squote)
                        else
                            Report.Run(Report::"Conference Quotation", true, false, squote)


                    end;
                end;
            }
            action(ConfrenceQuote)
            {
                ApplicationArea = all;
                RunObject = report "Confrence Quotes";
            }
        }
    }
}
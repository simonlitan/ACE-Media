page 52178922 "Sales Invoice Card"
{
    PageType = Document;
    SourceTable = "Sales Quotes";
    DeleteAllowed = true;
    SourceTableView = where("Document Type" = filter(Invoice));


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


            }

            group(Lines)
            {
                part(quote; "Sales Invoice.Lines")
                {
                    ApplicationArea = All;
                    SubPageLink = "Document No." = field("No."), "Document Type" = filter(Invoice);
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
                    sInv: Record "Sales Quotes";
                begin

                    sInv.Reset();
                    sInv.SetRange("No.", Rec."No.");
                    if sInv.Find('-') then begin
                        Report.Run(Report::"Sales Invoice Quotation", true, false, sInv)
                    end;
                end;
            }
        }
    }
}
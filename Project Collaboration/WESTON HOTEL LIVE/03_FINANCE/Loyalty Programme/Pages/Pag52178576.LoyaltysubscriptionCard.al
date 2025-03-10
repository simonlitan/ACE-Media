page 52178576 "Loyalty subscription Card"
{
    Caption = 'Subscriptions';
    PageType = Document;
    SourceTable = "Loyalty Sales Capture";
    DeleteAllowed = false;
    PromotedActionCategories = 'Subscriptions';
    layout
    {
        area(Content)
        {
            group(general)
            {
                Editable = edt;

                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(description; Rec.description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the description field.';

                }
                field("Document Date"; Rec."Document Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Programme Type"; Rec."Programme Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Programme Type field.';
                }
                field("Active Period"; Rec."Active Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Active Period field.';
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }

            group("Sales")
            {
                Editable = edt;
                part(sl; "Loyalty Subscription Lines")
                {
                    ApplicationArea = All;
                    SubPageLink = "No." = field("No.");
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Validate Subscriptions")
            {
                Enabled = edt;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    Rec.generateSubs(Rec);
                    CurrPage.Close();
                end;
            }
        }
    }
    var
        edt: Boolean;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Programme Type" := Rec."Programme Type"::Subscriptions;
        Rec.description := 'Subscriptions Points';
    end;

    trigger OnOpenPage()
    begin
        editability();
    end;

    procedure editability()
    begin
        edt := true;
        if Rec.Posted = true then
            edt := false;

    end;

}
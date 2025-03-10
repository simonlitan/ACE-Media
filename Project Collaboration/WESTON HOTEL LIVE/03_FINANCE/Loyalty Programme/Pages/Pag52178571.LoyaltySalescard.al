page 52178571 "Loyalty Sales card"
{
    Caption = 'Points';
    PageType = Document;
    SourceTable = "Loyalty Sales Capture";
    DeleteAllowed = false;
    PromotedActionCategories = 'Points';
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
                part(sl; "Loyalty Sales Lines")
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
            action("VAlidate points")
            {
                Enabled = edt;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin

                    Rec.generatePoints(Rec);
                    CurrPage.Close();
                    ;

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Programme Type" := Rec."Programme Type"::Points;
        Rec.description := 'Loyalty Points';
    end;

    trigger OnOpenPage()
    begin
        editability();
    end;

    var
        edt: Boolean;

    procedure editability()
    begin
        edt := true;
        if rec.Posted = true then
            edt := false;
    end;
}
page 52179343 "HRM-Complaint Card"
{
    Caption = 'HRM-Complaint Card';
    PageType = Card;
    SourceTable = "HRM-Complaint Mgt Header";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Type of Complaint"; Rec."Type of Complaint")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if rec."Type of Complaint" = rec."Type of Complaint"::Internal then Fieldeditable := false else Fieldeditable := true;
                        if rec."Type of Complaint" = rec."Type of Complaint"::External then Fieldeditable1 := false else Fieldeditable1 := true;
                    end;
                }
                field("Complainant No"; Rec."Complainant No")
                {
                    editable = Fieldeditable1;
                    ApplicationArea = All;
                }
                field("Complainant Name"; Rec."Complainant Name")
                {
                    editable = Fieldeditable;
                    ApplicationArea = All;
                }

                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }

            }
            group(Descriptions)
            {
                Caption = 'Description';
                field(Description; Rec.Description)
                {
                    ShowCaption = false;
                    MultiLine = true;
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if rec."Type of Complaint" = rec."Type of Complaint"::Internal then
            Fieldeditable := false
        else
            Fieldeditable := true;
        if rec."Type of Complaint" = rec."Type of Complaint"::External then Fieldeditable1 := false else Fieldeditable1 := true;
    end;

    trigger OnAfterGetRecord()
    begin
        if rec."Type of Complaint" = rec."Type of Complaint"::Internal then
            Fieldeditable := false
        else
            Fieldeditable := true;
        if rec."Type of Complaint" = rec."Type of Complaint"::External then Fieldeditable1 := false else Fieldeditable1 := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if rec."No." = '' then begin
            Hrsetups.Get();
            Hrsetups.TestField(Hrsetups."Complaint Nos");
            NoSeriesMgt.InitSeries(Hrsetups."Complaint Nos", rec."No. Series", 0D, rec."No.", rec."No. Series");

            // rec.Validate(rec."No.");
        end;
        Rec."Created By" := UserId;
        rec.Date := Today;
    end;

    var
        Hrsetups: Record "HRM-Setup";
        Empc: Record "HRM-Employee C";
        Fieldeditable: Boolean;
        Fieldeditable1: Boolean;
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

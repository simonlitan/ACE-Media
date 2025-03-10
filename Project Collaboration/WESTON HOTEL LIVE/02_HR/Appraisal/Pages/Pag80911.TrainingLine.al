page 50217 "Training Line"
{
    Caption = 'Training Line';
    PageType = ListPart;
    SourceTable = "Training Lines";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Training Identification"; Rec."Training Identification")
                {
                    Editable = SupEditability;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Identification field.';
                }
                field("Name of Training"; Rec."Name of Training")
                {
                    Editable = SupEditability;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name of Training field.';
                }
                field(Trainer; Rec.Trainer)
                {
                    Editable = SupEditability;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trainer field.';
                }
                field(Venue; Rec.Venue)
                {
                    Editable = SupEditability;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field(Cost; Rec.Cost)
                {
                    Editable = SupEditability;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field("Implematation Date"; Rec."Implematation Date")
                {
                    Editable = SupEditability;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implematation Date field.';
                }
                field("Supervisor Comment"; Rec."Supervisor Comment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisor Comment field.';
                    Editable = SupEditability;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()

    begin
        SelfAppraisal.SetRange("No.", Rec."Document No.");
        if SelfAppraisal.FindFirst() then begin
            case SelfAppraisal.Status of
                SelfAppraisal.Status::Open:
                    begin
                        SelflineEditablity := true;
                        SupEditability := false
                    end;
                SelfAppraisal.Status::"Pending Approval":
                    begin
                        SelflineEditablity := false;
                        SupEditability := false
                    end;
                else begin
                    SelflineEditablity := false;
                    SupEditability := true
                end;
            end;
        end;
    end;

    var
        SelfAppraisal: Record "Self Appraisal";
        SelflineEditablity: Boolean;
        SupEditability: Boolean;
}

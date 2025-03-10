page 50224 "Strategic Objective Employee"
{
    Caption = 'Strategic Objective Employee';
    PageType = ListPart;
    SourceTable = "Strategic Objective";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(KRA; Rec.KRA)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the KRA field.';
                }
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategic Objective field.';
                }
                field("Strategic Obj Description"; Rec."Strategic Obj Description")
                {
                    ApplicationArea = All;
                    Caption = 'Strategy';
                    ToolTip = 'Specifies the value of the Strategic Objective field.';
                }
                field(Activities; Rec.Activities)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activities field.';
                }
                field("Expected Output"; Rec."Expected Output")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected Output field.';
                }
                field("Means of Verification"; Rec."Means of Verification")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Means of Verification field.';
                }
                field("KPI(s) e.g Timeframes"; Rec."KPI(s) e.g Timeframes")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the KPI(s) e.g Timeframes field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight field.';
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

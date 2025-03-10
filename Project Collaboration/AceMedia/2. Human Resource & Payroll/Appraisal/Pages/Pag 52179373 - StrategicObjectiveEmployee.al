page 52179373 "Strategic Objective Employee"
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
                field("KRA Description"; Rec."KRA Description")
                {
                    ApplicationArea = all;
                }

                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategic Objective field.';
                }
                // field("Strategic Obj Description"; Rec."Strategic Obj Description")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Directorate Activities';
                //     ToolTip = 'Specifies the value of the Strategic Objective field.';
                // }
                field(Strategies; Rec.Strategies)
                {
                    ApplicationArea = all;
                }
                field("Strategies Desc"; Rec."Strategies Desc")
                {
                    ApplicationArea = all;
                }
                field(Activities; Rec.Activities)
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the value of the Activities field.';
                }
                field("Activity Desc"; Rec."Activity Desc")
                {
                    ApplicationArea = all;
                }

                field("Expected Output"; Rec."Expected Output")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected Output field.';
                }
                field("Expected Output Desc"; Rec."Expected Output Desc")
                {
                    ApplicationArea = all;
                }
                field("Means of Verification"; Rec."Means of Verification")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Means of Verification field.';
                }
                field("Means of verification Desc"; Rec."Means of verification Desc")
                {
                    ApplicationArea = all;
                    Caption = 'Means of verification Desc"/Indicators';
                }
                field("Targets for Year"; Rec."Targets for Year")
                {
                    ApplicationArea = all;
                }
                field("KPI(s) e.g Timeframes"; Rec."KPI(s) e.g Timeframes")
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the value of the KPI(s) e.g Timeframes field.';
                }
                field("Staff Activities"; Rec."Staff Activities")
                {
                    ApplicationArea = all;
                }

                field("Staff expected output"; Rec."Staff expected output")
                {
                    ApplicationArea = all;

                }
                field("Staff Means of Verification"; Rec."Staff Means of Verification")
                {
                    ApplicationArea = all;
                }
                field("KPI(s) e.g Timeframes."; Rec."KPI(s) e.g Timeframes")
                {

                }
                field(Quater; Rec.Quater)
                {
                    ApplicationArea = all;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = all;
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

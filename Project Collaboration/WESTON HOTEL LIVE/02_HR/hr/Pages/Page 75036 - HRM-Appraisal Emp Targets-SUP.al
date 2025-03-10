page 75036 "HRM-Appraisal Emp Targets-SUP"
{
    DeleteAllowed = false;
    PageType = ListPart;
    SourceTable = "HRM-Appraisal Emp. Targets";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Agreed Performance Targets"; Rec."Agreed Performance Targets")
                {
                    Caption = 'Agreed Performance Targets';
                    ApplicationArea = All;
                }
                field("Expected Performance Indicator"; Rec."Expected Performance Indicator")
                {
                    ApplicationArea = All;
                }
                field("Mid Year Review (Remarks)"; Rec."Mid Year Review (Remarks)")
                {
                    ApplicationArea = All;
                }
                field("Individual Target"; Rec."Individual Target")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Agreed Score"; Rec."Agreed Score")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.SETFILTER("Appraisal year Code", HRMAppraisalYears.Code);
    end;

    trigger OnOpenPage()
    begin
        HRMAppraisalYears.RESET;
        HRMAppraisalYears.SETRANGE(Closed, FALSE);
        IF HRMAppraisalYears.FIND('-') THEN
            Rec.SETFILTER("Appraisal year Code", HRMAppraisalYears.Code);
    end;

    var
        UserSetup: Record "User Setup";
        HRMAppraisalYears: Record "HRM-Appraisal Years";
        HRMAppraisalPeriods: Record "HRM-Appraisal Periods";
        editability: Boolean;
}


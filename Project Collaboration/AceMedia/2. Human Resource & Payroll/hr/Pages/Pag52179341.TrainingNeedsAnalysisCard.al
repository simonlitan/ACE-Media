page 52179341 "Training Needs Analysis Card"
{
    Caption = 'Training Needs Analysis Card';
    PageType = Card;
    SourceTable = "HRM-Training Needs Analysis 2";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';


                field(Period; Rec.Period)
                {
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }



            }
            group("1.")
            {
                field("Trainings Attended"; Rec."Trainings Attended")
                {
                    ApplicationArea = All;
                }
                field("Reason(s) for Training"; Rec."Reason(s) for Training")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
            }
            group("2.")
            {
                field("Course Relevant"; Rec."Course Relevant")
                {
                    ApplicationArea = All;
                }
                field("Give Reason"; Rec."Give Reason")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
            }
            group("3.")
            {
                field("Selection Process"; Rec."Selection Process")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
            }

            group("4.")
            {
                field("Aware Training Needs"; Rec."Aware Training Needs")
                {
                    ApplicationArea = All;
                }
                field("Areas Need Training"; Rec."Areas Need Training")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
            }

            group("5. Please give reasons for training areas suggested in (4.)")
            {
                field("Service Delivery"; Rec."Service Delivery")
                {
                    ApplicationArea = All;
                }
                field("Career Progression"; Rec."Career Progression")
                {
                    ApplicationArea = All;
                }
                field("Self Development"; Rec."Self Development")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        rec."Created On" := Today;
        rec."Created By" := UserId;
        usersetup.get(rec."Created By");
        if usersetup.Find('-') then begin
            rec."Employee No" := usersetup."Employee No.";
            Empc.Reset();
            Empc.SetRange("No.", rec."Employee No");
            if Empc.Find('-') then begin
                rec."Employee Name" := Empc."First Name" + ' ' + empc."Middle Name" + ' ' + Empc."Last Name";
            end;
        end;
    end;

    trigger OnClosePage()
    begin
        rec."Document No" := rec.period + rec."Employee No";
    end;


    var
        Leaveperiods: record "HRM-Leave Periods";
        Empc: Record "HRM-Employee C";
        usersetup: record "User Setup";
}

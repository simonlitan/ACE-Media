page 70155 "Performance Contract Activitie"
{
    Editable = true;
    PageType = List;
    SourceTable = "Performance Contract Activitie";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                IndentationColumn = NameIndent;
                IndentationControls = "Activity Code", "Targets Description";
                ShowAsTree = false;
                field("Workplan Code"; Rec."Workplan Code")
                {
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                    ApplicationArea = All;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    Caption = 'Activity Code';
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                    ApplicationArea = All;
                }
                field("Targets Description"; Rec."Targets Description")
                {
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                    ApplicationArea = All;
                }
                field(Attributes; Rec.Attributes)
                {
                    Caption = 'Type';
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                    ApplicationArea = All;
                }
                field(Actuals; Rec.Actuals)
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
                field("General Note"; Rec."General Note")
                {
                    ApplicationArea = All;
                }
                field("Account Type"; Rec."Account Type")
                {
                    Style = Strong;
                    StyleExpr = NoEmphasize;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        UpdateControls;
                    end;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
            }
        }


    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Visible = false;
                action(IndentWorkPlan)
                {
                    Caption = 'Indent Workplan Activities';
                    Image = IndentChartOfAccounts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    // RunObject = Codeunit "Workplan Indent";
                }
                action("Import Workplan Activities")
                {
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;
                    //RunObject = XMLport 39003901;
                }
            }
        }
    }

    var
        [InDataSet]
        NoEmphasize: Boolean;
        [InDataSet]
        NameEmphasize: Boolean;
        [InDataSet]
        NameIndent: Integer;
        Text0001: Label 'Convert to Workplan Activity [ %1-%2 ]to a Workplan Budget Entry?';
        Text0002: Label 'Workplan Budget Entry created for Workplan Activity [ %1-%2 ]';

    procedure UpdateControls()
    begin
        /*
        IF (Type = Type::"Begin-Total") OR (Type = Type::"End-Total") THEN
        BEGIN
            FieldEditable:=FALSE;
        END ELSE
        BEGIN
            FieldEditable:=TRUE;
        END;
        */

        //For Bold and Indentation
        NoEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
        NameIndent := Rec.Indentation;
        NameEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;

    end;
}


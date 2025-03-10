page 52179363 "Communication Skills"
{
    Caption = 'Communication Skills';
    PageType = ListPart;
    SourceTable = "Self Appraisal Line";
    AutoSplitKey = true;
    SourceTableView = where(Type = const("Communication Skills"));
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                    Visible = false;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                    Editable = false;
                }
                field("Type Code"; Rec."Type Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Max Score"; Rec."Max Score")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Max Score field.';
                }
                field("Self Score"; Rec."Self Score")
                {
                    Editable = SelflineEditablity;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Self Score field.';
                }
                field("Supervisor Score"; Rec."Supervisor Score")
                {
                    ApplicationArea = All;
                    Editable = SupEditability;
                    ToolTip = 'Specifies the value of the Supervisor Score field.';
                }
                field("Agreed Score"; Rec."Agreed Score")
                {
                    ApplicationArea = All;
                    Editable = SupEditability;
                    ToolTip = 'Specifies the value of the Agreed Score field.';
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {

            action("Generate Apraisal Lines")
            {
                ApplicationArea = all;
                trigger OnAction()
                begin

                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        SelflineEditablity := true;
        SupEditability := true;
    end;

    var
        SelfAppraisal: Record "Self Appraisal";
        SelflineEditablity: Boolean;
        SupEditability: Boolean;
}

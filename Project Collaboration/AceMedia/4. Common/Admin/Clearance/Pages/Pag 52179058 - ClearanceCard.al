page 52179058 "Clearance Card"
{
    Caption = 'Clearance Card';
    PageType = Card;
    SourceTable = "Clearance Header";
    DeleteAllowed = false;
    PromotedActionCategories = 'New,Process,Report,Approvals';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Nature of Leaving"; Rec."Nature of Leaving")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nature of Leaving field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Submit; Rec.Submit)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Submit field.';
                }
                field("Date of Leaving"; Rec."Date of Leaving")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Leaving field.';
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User Id field.';
                }

            }
            group("Reason ")
            {
                field(Reason; Rec.Reason)
                {
                    ShowCaption = false;
                    MultiLine = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
            part("Clearance Lines"; "Clearance Lines")
            {
                ApplicationArea = all;
                SubPageLink = "Employee No" = field("Employee No");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Intiate Clearance")
            {
                ApplicationArea = all;
                Image = Start;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.GetClearance();
                end;
            }
            action("Submit ")
            {
                ApplicationArea = all;
                Image = Indent;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.SubmitToHr();
                end;
            }

        }
    }
}

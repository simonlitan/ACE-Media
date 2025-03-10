page 52178971 "Legal-Claims Card"
{
    Caption = 'Legal-Claims Card';
    PageType = Card;
    SourceTable = "Legal-Claims Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Claim Code"; Rec."Claim Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Claim Code field.';
                    Visible = false;
                }
                field("Claim Number"; Rec."Claim Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Claim Code field.';
                }
                field("Date Raised"; Rec."Date Raised")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Raised field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Claim description"; Rec."Claim description")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Title field.';
                }


                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Raised Against"; Rec."Raised Against")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Claim Status"; Rec."Claim Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                // field(SystemCreatedAt; Rec.SystemCreatedAt)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                // }
                // field(SystemCreatedBy; Rec.SystemCreatedBy)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                // }
                // field(SystemId; Rec.SystemId)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the SystemId field.';
                // }
                // field(SystemModifiedAt; Rec.SystemModifiedAt)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                // }
                // field(SystemModifiedBy; Rec.SystemModifiedBy)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                // }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Settle")
            {
                ApplicationArea = All;
                Caption = 'Settle';
                Image = AuthorizeCreditCard;
                Promoted = true;
                PromotedCategory = Process;
                // RunObject = report "ISO-Audit Findings Report";
                RunObject = page "Legal-Claims Settlement Card";

                trigger OnAction()
                begin


                end;
            }
            action("Renegotiate")
            {
                ApplicationArea = All;
                Caption = 'Renegotiate';
                Image = Apply;
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = report "ISO-Audit Findings Report";
                RunObject = page "Legal-Renegotiation Card";

                trigger OnAction()
                begin


                end;
            }


        }
    }
}

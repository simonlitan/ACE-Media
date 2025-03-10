page 68474 "HR Confirmation Appraisal Sup"
{
    PageType = Card;
    SourceTable = "Appraisal Card Confirmation";
    SourceTableView = WHERE(Status = FILTER(Supervisor));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ApplicationArea = All;
                }
                field("Staff No"; Rec."Staff No")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = All;
                }
                field("Supervisor ID"; Rec."Supervisor ID")
                {
                    ApplicationArea = All;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = All;
                }
                field("Position Held Since"; Rec."Position Held Since")
                {
                    ApplicationArea = All;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = All;
                }
                field(Text1; Rec.Text1)
                {
                    Caption = 'General Conduct and Personal characteristics';
                    ApplicationArea = All;
                }
                field(Text2; Rec.Text2)
                {
                    Caption = 'Administrative abilities';
                    ApplicationArea = All;
                }
                field(Text3; Rec.Text3)
                {
                    Caption = 'Proffessional or Technical abilities';
                    ApplicationArea = All;
                }
                field(Text4; Rec.Text4)
                {
                    Caption = 'Capacity for Organization';
                    ApplicationArea = All;
                }
                field(Text5; Rec.Text5)
                {
                    Caption = 'Manner of handling University facilities and equipment in his/her possession';
                    ApplicationArea = All;
                }
                field(Text6; Rec.Text6)
                {
                    Caption = 'Relations with students';
                    ApplicationArea = All;
                }
                field(Text7; Rec.Text7)
                {
                    Caption = 'Relation with supervisor and other senior staff';
                    ApplicationArea = All;
                }
                field(Text8; Rec.Text8)
                {
                    Caption = 'Ability to cooperate with other staff including juniors';
                    ApplicationArea = All;
                }
                field(Text9; Rec.Text9)
                {
                    Caption = '<TeHow She/He handles University clients/visitors';
                    ApplicationArea = All;
                }
                field(Text10; Rec.Text10)
                {
                    Caption = 'Special Aptitudes noted';
                    ApplicationArea = All;
                }
                field(Text11; Rec.Text11)
                {
                    Caption = 'Have any criticism of the employee''s work /conduct been communicated to him/her';
                    ApplicationArea = All;
                }
                field(Text12; Rec.Text12)
                {
                    Caption = 'General observations about the employee';
                    ApplicationArea = All;
                }
                field("Promotion Recommended"; Rec."Promotion Recommended")
                {
                    ApplicationArea = All;
                }
                field(Text13; Rec.Text13)
                {
                    Caption = 'Do you recommend the promotion to be deffered and for how long';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}


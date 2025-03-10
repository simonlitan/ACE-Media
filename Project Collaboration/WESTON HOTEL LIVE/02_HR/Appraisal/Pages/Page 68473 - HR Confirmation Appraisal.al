page 68473 "HR Confirmation Appraisal"
{
    PageType = Card;
    SourceTable = "Appraisal Card Confirmation";
    SourceTableView = WHERE(Status = FILTER(Appraisee));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'STAFF DETAILS';
                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ApplicationArea = All;
                }
                field("Staff No"; Rec."Staff No")
                {
                    ApplicationArea = All;
                }
                field("Staff Name"; Rec."Staff Name")
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
                field("Position Held Since"; Rec."Position Held Since")
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
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = All;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = All;
                }
                field("Supervisor ID"; Rec."Supervisor ID")
                {
                    ApplicationArea = All;
                }
            }
            group("APPRAISAL QUESTIONS")
            {
                Caption = 'APPRAISAL QUESTIONS';
                field(Text1; Rec.Text1)
                {
                    Caption = '1. General Conduct & Personal characteristics';
                    ApplicationArea = All;
                }
                field(Text2; Rec.Text2)
                {
                    Caption = '2. Administrative abilities';
                    ApplicationArea = All;
                }
                field(Text3; Rec.Text3)
                {
                    Caption = '3. Proffessional or Technical abilities';
                    ApplicationArea = All;
                }
                field(Text4; Rec.Text4)
                {
                    Caption = '4. Capacity for Organization';
                    ApplicationArea = All;
                }
                field(Text5; Rec.Text5)
                {
                    Caption = '5. Manner of handling Institution facilities & equipment in his/her possession';
                    ApplicationArea = All;
                }
                field(Text6; Rec.Text6)
                {
                    Caption = '6. Relations with students';
                    ApplicationArea = All;
                }
                field(Text7; Rec.Text7)
                {
                    Caption = '7. Relation with supervisor and other senior staff';
                    ApplicationArea = All;
                }
                field(Text8; Rec.Text8)
                {
                    Caption = '8. Ability to cooperate with other staff including juniors';
                    ApplicationArea = All;
                }
                field(Text9; Rec.Text9)
                {
                    Caption = '9. How She/He handles Institution clients/visitors';
                    ApplicationArea = All;
                }
                field(Text10; Rec.Text10)
                {
                    Caption = '10. Special Aptitudes noted';
                    ApplicationArea = All;
                }
                field(Text11; Rec.Text11)
                {
                    Caption = 'Have any criticism of the employee''s work /conduct been communicated to him/her';
                    MultiLine = false;
                    ApplicationArea = All;
                }
                field(Text12; Rec.Text12)
                {
                    Caption = '12. General observations about the employee';
                    ApplicationArea = All;
                }
                field("Promotion Recommended"; Rec."Promotion Recommended")
                {
                    Caption = '13. Confirmation Recommended';
                    ApplicationArea = All;
                }
                field(Text13; Rec.Text13)
                {
                    Caption = ' Do you recommend the promotion to be deffered and for how long';
                    ApplicationArea = All;
                }
            }
            group("FOR OFFICIAL USE")
            {
                Caption = 'FOR OFFICIAL USE';
                field("Comments by HR"; Rec."Comments by HR")
                {
                    Caption = 'Comments and Reccommendations by (Admin & HR)';
                    MultiLine = false;
                    ApplicationArea = All;
                }
                field("Asst.Director Action"; Rec."VC/DVC Action")
                {
                    ApplicationArea = All;
                }
                field("Deffered for"; Rec."Deffered for")
                {
                    ApplicationArea = All;
                }
                field("Approval by CEO"; Rec."Approval by VC/DVC")
                {
                    Caption = 'Action by the CEO)';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}


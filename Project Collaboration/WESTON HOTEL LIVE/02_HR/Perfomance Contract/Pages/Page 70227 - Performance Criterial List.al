page 70227 "Performance Criterial List"
{
    PageType = ListPart;
    SaveValues = true;
    SourceTable = "Performance Criteria Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Criteria Category"; Rec."Performance Criteria Category")
                {
                    ApplicationArea = All;
                }
                field("Performance Criteria Step Code"; Rec."Performance Criteria Step Code")
                {
                    ApplicationArea = All;
                }
                field("Performance Criteria Descripti"; Rec."Performance Criteria Descripti")
                {
                    Caption = 'Performance Criteria Descripton';
                    ApplicationArea = All;
                }
                field("Performance Step Description"; Rec."Performance Step Description")
                {
                    ApplicationArea = All;
                }
                field(units; Rec.units)
                {
                    ApplicationArea = All;
                }
                field(Weights; Rec.Weights)
                {
                    ApplicationArea = All;
                }
                field("Status Last Contract Period"; Rec."Status Last Contract Period")
                {
                    ApplicationArea = All;
                }
                field("Target (Contract Period)"; Rec."Target (Contract Period)")
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}


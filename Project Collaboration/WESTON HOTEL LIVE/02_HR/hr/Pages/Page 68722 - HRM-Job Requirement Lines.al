page 68722 "HRM-Job Requirement Lines"
{
    CardPageID = "HRM-Job Requirements";
    PageType = Card;
    SourceTable = "HRM-Job Requirements";
    InsertAllowed = true;
    DeleteAllowed = true;
    ModifyAllowed = true;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = true;
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = All;
                }
                /* field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = All;

                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = All;

                } */
                field("Qualification Description"; Rec."Qualification Description")
                {

                    ApplicationArea = All;

                }
                field("Grade Attained"; Rec."Grade Attained")
                {
                    ApplicationArea = All;
                }
                /*  field(Priority; Rec.Priority)
                 {
                     ApplicationArea = All;
                 }
                 field(Mandatory; Rec.Mandatory)
                 {
                     ApplicationArea = All;
                 } */
            }
        }
    }

    actions
    {
    }
}


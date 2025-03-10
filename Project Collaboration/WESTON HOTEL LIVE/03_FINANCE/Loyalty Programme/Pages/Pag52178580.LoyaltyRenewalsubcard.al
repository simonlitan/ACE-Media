page 52178580 "Loyalty Renewal sub-card"
{
    SourceTable = "Customer Loyalty Progs";
    PageType = Document;
    DeleteAllowed = false;
    InsertAllowed = false;
    PromotedActionCategories = 'Post Subscription';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = false;
                field("No.";

                Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Programme; Rec.Programme)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Programme field.';
                }
                field("ID/Passport No."; Rec."ID/Passport No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ID/Passport No. field.';
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
                field("LifeTime Registration"; Rec."LifeTime Registration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LifeTime Registration field.';
                }
                field("Renewal Registration"; Rec."Renewal Registration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Renewal Registration field.';
                }
            }
            group(Subscriptions)
            {
                part(subs; "Loyality Subs Per Period")
                {
                    ApplicationArea = All;
                    SubPageLink = Programme = field(Programme), "No." = field("No.");
                }
            }



        }
    }

    actions
    {
        area(Processing)
        {
            action("Post Subscription")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    rec.PostSubscription(Rec);
                end;
            }
        }
    }
}

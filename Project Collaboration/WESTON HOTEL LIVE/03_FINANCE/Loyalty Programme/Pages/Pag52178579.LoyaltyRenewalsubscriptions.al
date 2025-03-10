page 52178579 "Loyalty Renewal subscriptions"
{
    SourceTable = "Customer Loyalty Progs";
    CardPageId = "Loyalty Renewal sub-card";
    PageType = List;
    DeleteAllowed = false;
    InsertAllowed = false;
    Editable = false;
    SourceTableView = where("Renewal Registration" = filter(true));
    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("No."; Rec."No.")
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
        }
    }
}
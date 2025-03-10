page 52178566 "Loyalty Customers"
{
    PageType = Document;
    SourceTable = "Loyalty Subscriptions";
    DeleteAllowed = false;
    PromotedActionCategories = 'Renewals,Confirm Details';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = conf;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("ID/Passport No."; Rec."ID/Passport No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ID/Passport No. field.';
                }
                field("Details confirmed"; Rec."Details confirmed")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Details confirmed field.';
                }
                field("Earned Points"; Rec."Earned Points")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Earned Points field.';
                }
                field("Subscription Balance"; Rec."Subscription Balance")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Subscription Balance field.';
                }
            }
            group("Programmes")
            {
                part(lprogs; "Customer Loyalty Progs")
                {
                    ApplicationArea = All;
                    SubPageLink = "No." = field("No.");
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Renewal Subscriptions")
            {

                action("Renewals")
                {
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = New;
                    Image = SubcontractingWorksheet;

                    RunObject = page "Loyalty Renewal subscriptions";
                    RunPageLink = "No." = field("No."), "Renewal Registration" = filter(true);
                }
                action("Confirm Details")
                {
                    Visible = conf;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    Image = Confirm;
                    trigger OnAction()
                    begin
                        Rec.confirmDetails();
                        CurrPage.Close();
                        ;
                    end;
                }
            }

        }
    }

    trigger OnOpenPage()
    begin
        editability();
    end;

    var
        conf: Boolean;

    procedure editability()

    begin
        conf := true;
        if Rec."Details confirmed" = true then
            conf := false;


    end;
}
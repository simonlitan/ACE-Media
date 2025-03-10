page 52178990 "Cm Visitors Card"
{
    Caption = 'Visitors Card';
    PageType = Card;
    SourceTable = "Cm Visitors";
    DeleteAllowed = false;
    PromotedActionCategories = 'New,Process,Report,Items';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ShowMandatory = true;
                    Editable = Allfieldseditable;
                    ApplicationArea = All;
                }
                field("ID No"; Rec."ID No")
                {
                    NotBlank = true;
                    ShowMandatory = true;
                    Editable = Allfieldseditable;
                    ApplicationArea = All;
                }
                field("Phone No"; Rec."Phone No")
                {
                    NotBlank = true;
                    ShowMandatory = true;
                    Editable = Allfieldseditable;
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    // ShowMandatory = true;
                    Editable = Allfieldseditable;
                    ApplicationArea = All;
                }

                field("Officer to See"; Rec."Officer to See")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Officer to See field.';
                }
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Officer Name field.';
                }
                field(Office; Rec.Office)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Office field.';
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appointment Date field.';
                }
                field("Badge No"; Rec."Badge No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Badge No field.';
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nationality field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                group("Purpose of Visit")
                {
                    field("Purpose of  Visit"; Rec."Purpose of Visit")
                    {
                        NotBlank = true;
                        Editable = Allfieldseditable;
                        ShowCaption = false;
                        ShowMandatory = true;
                        MultiLine = true;
                        ApplicationArea = All;
                    }
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = All;
                }
                group("Feedback ")
                {

                    field(Feedback; Rec.Feedback)
                    {
                        Editable = Allfieldseditable1;
                        ShowCaption = false;
                        ShowMandatory = true;
                        MultiLine = true;
                        ApplicationArea = All;
                    }
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }


        }
    }
    actions
    {
        area(Processing)
        {
            action("Register Visitor")
            {
                ApplicationArea = all;
                Visible = Fieldvisible;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.CheckIn();
                end;
            }
            action("Check Out Visitor")
            {
                ApplicationArea = all;
                Visible = Fieldvisible1;
                Image = Apply;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.CheckOut();
                end;
            }
            action("Item List")
            {
                ApplicationArea = all;
                Image = NonStockItem;
                Promoted = true;
                PromotedCategory = category4;
                RunObject = page "Other Items";
                RunPageLink = "No." = field("No.");
            }
            action("Firearm List")
            {
                ApplicationArea = all;
                Image = NonStockItem;
                Promoted = true;
                PromotedCategory = category4;
                RunObject = page "Firearm List";
                RunPageLink = "No." = field("No.");
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        if rec.Status = rec.Status::New then Allfieldseditable := true else Allfieldseditable := false;
        if rec.Status = rec.Status::New then Fieldvisible := true else Fieldvisible := false;
        if rec.Status = rec.Status::"Checked Out" then Fieldvisible1 := false else Fieldvisible1 := true;
        if rec.Status = rec.Status::"Checked In" then Allfieldseditable1 := true else Allfieldseditable1 := false;

    end;

    trigger OnAfterGetRecord()
    begin
        if rec.Status = rec.Status::New then Allfieldseditable := true else Allfieldseditable := false;
        if rec.Status = rec.Status::New then Fieldvisible := true else Fieldvisible := false;
        if rec.Status = rec.Status::"Checked Out" then Fieldvisible1 := false else Fieldvisible1 := true;
        if rec.Status = rec.Status::"Checked In" then Allfieldseditable1 := true else Allfieldseditable1 := false;

    end;

    trigger OnOpenPage()
    begin
        if rec.Status = rec.Status::New then Allfieldseditable := true else Allfieldseditable := false;
        if rec.Status = rec.Status::New then Fieldvisible := true else Fieldvisible := false;
        if rec.Status = rec.Status::"Checked Out" then Fieldvisible1 := false else Fieldvisible1 := true;
        if rec.Status = rec.Status::"Checked In" then Allfieldseditable1 := true else Allfieldseditable1 := false;
        //UpdateFields();
    end;

    var
        Fieldvisible: Boolean;
        Fieldvisible1: Boolean;
        feedbackeditable: Boolean;
        Allfieldseditable: Boolean;
        Allfieldseditable1: Boolean;
}

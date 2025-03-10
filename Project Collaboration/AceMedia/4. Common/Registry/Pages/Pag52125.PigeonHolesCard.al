page 52178928 "Pigeon Hole"
{
    Caption = 'Pigeon Holes Card';
    PageType = Card;
    SourceTable = "Pigeon Hole";
    PromotedActionCategories = 'New, Process, Report, Pigeon Hole Ops';

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = not IsClosed;
                field("Hole ID"; Rec."Hole ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Hole ID field.';
                }
                field(Owner; Rec.Owner)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Owner field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                }
                field(Secretary; Rec.Secretary)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Secretary field.';
                }
                field("Secretary Name"; Rec."Secretary Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Secretary Name field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                // field("Modified by"; Rec."Modified by")
                // {
                //     ApplicationArea = All;
                // }
                // field("Date Modified"; Rec."Date Modified")
                // {
                //     ApplicationArea = All;
                // }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
            part(PM; "Personal Mails")
            {
                Editable = not IsClosed;
                SubPageLink = "Hole ID" = field("Hole ID");
                ApplicationArea = All;
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Close Pigeon Hole")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Closed;
                PromotedCategory = Category4;
                Visible = not IsClosed;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the closure of  %1 for %2 ';
                    Text001: Label '%1-%2 has been closed!';
                begin
                    if Confirm(Text000, true, Rec."Hole ID", Rec.Owner) then begin
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify();
                        Message(Text001, Rec."Hole ID", Rec.Owner);
                    end;
                end;
            }
            action("Re-Open")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = ReopenCancelled;
                PromotedCategory = Category4;
                Visible = not IsReopend;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the re-openning of  %1 for %2 ';
                    Text001: Label '%1-%2 has been re-opened!';
                begin
                    if Confirm(Text000, true, Rec."Hole ID", Rec.Owner) then begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify();
                        Message(Text001, Rec."Hole ID", Rec.Owner);
                    end;
                end;
            }
            action("Transfer")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = MovementWorksheet;
                PromotedCategory = Category4;
                Visible = not IsTransfered and IsReopend;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the closure of  %1 for %2 ';
                    Text001: Label '%1-%2 has been transfered!';
                begin
                    if Confirm(Text000, true, Rec."Hole ID", Rec.Owner) then begin
                        Rec.Status := Rec.Status::Transfered;
                        Rec.Modify();
                        Message(Text001, Rec."Hole ID", Rec.Owner);
                    end;
                end;
            }
        }
    }
    trigger OnInit()
    begin
        PageControls();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        PageControls();
    end;

    trigger OnOpenPage()
    begin
        PageControls();
    end;

    procedure PageControls()
    begin
        if Rec.Status = Rec.Status::Closed then
            IsClosed := true
        else
            IsClosed := false;
        if Rec.Status = Rec.Status::Open then
            IsReopend := true
        else
            IsReopend := false;
        if Rec.Status = Rec.Status::Transfered then
            IsTransfered := true
        else
            IsTransfered := false;
    end;

    var
        RegistryMgnt: Codeunit "Common App Management";
        IsClosed: Boolean;
        IsReopend: Boolean;
        IsTransfered: Boolean;
}

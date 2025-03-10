page 52178931 "Personal Mails"
{
    Caption = 'Personal Mails';
    PageType = ListPart;
    SourceTable = "Personal Mail";
    CardPageId = "Personal Mail Card";
    SourceTableView = order(descending);
    Editable = true;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Mail ID"; Rec."Mail ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Mail ID field.';
                }
                field("Subject"; Rec."Subject")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field("Received by"; Rec."Received by")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Received by field.';
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Received From field.';
                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sender field.';
                }
                field("Collected?"; Rec."Collected?")
                {
                    ApplicationArea = All;
                }
                field("Date Collected"; Rec."Date Collected")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Attach Mails")
            {
                Image = MailAttachment;
                ApplicationArea = All;
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    //DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
            action("Collect Mail")
            {
                ApplicationArea = All;
                Image = CollectedTax;
                Visible = not IsCollected;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the collection of  %1-%2 mail ';
                    Text001: Label '%1-%2 has been collected!';
                begin
                    if Confirm(Text000, true, Rec."Mail ID", Rec."Subject") then begin
                        Rec.Status := Rec.Status::Collected;
                        Rec."Date Collected" := CurrentDateTime;
                        Rec."Collected?" := true;
                        Rec.Modify();
                        Message(Text001, Rec."Mail ID", Rec."Subject");
                        RegistryMgnt.PersonalFileMovement(Rec);
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
        if Rec.Status = Rec.Status::Collected then
            IsCollected := true
        else
            IsCollected := false;
    end;

    var
        RegistryMgnt: Codeunit "Common App Management";
        IsCollected: Boolean;
}

page 52178927 "Personal Mail Card"
{
    Caption = 'Personal Mail Card';
    PageType = Card;
    SourceTable = "Personal Mail";
    PromotedActionCategories = 'New, Process, Report, Attach Mails,Collect,Return';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Mail ID"; Rec."Mail ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mail ID field.';
                }
                field("Hole ID"; Rec."Hole ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Hole ID field.';
                }
                field(Recepient; Rec.Recepient)
                {
                    ApplicationArea = All;
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Posted field.';
                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sender field.';
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
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Collected?"; Rec."Collected?")
                {
                    ApplicationArea = All;
                }
                field("Date Collected"; Rec."Date Collected")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Collected field.';
                }
                field("Ref No."; Rec."Ref No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
            part(FMH; "File Movement History")
            {
                ApplicationArea = All;
                SubPageLink = "File ID" = field("Mail ID");
            }
        }
        area(FactBoxes)
        {
            part(DA; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Mail ID");
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action(Attachments)
            {
                ApplicationArea = All;
                Promoted = true;
                Caption = 'Attach Mail';
                PromotedCategory = Category8;
                Image = Attachments;
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;

            }
            action("Collect Mail")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = MailAttachment;
                PromotedCategory = Category5;
                Visible = not IsCollected;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the collection of  %1 - %2 mail ';
                    Text001: Label '%1 - %2 has been collected!';
                begin
                    if Confirm(Text000, true, Rec."Mail ID", Rec."Subject") then begin
                        Rec.Status := Rec.Status::Collected;
                        Rec."Date Collected" := CurrentDateTime;
                        Rec."Collected?" := true;
                        Rec.Modify();
                        Message(Text001, Rec."Mail ID", Rec."Subject");
                        RegistryMgnt.PersonalFileMovement(Rec);
                        PageControls();
                    end;
                end;
            }
            action("Return Mail to Hole")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = MailAttachment;
                PromotedCategory = Category6;
                Visible = IsCollected;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the return of  %1 - %2 mail ';
                    Text001: Label '%1 - %2 has been return!';
                begin
                    if Confirm(Text000, true, Rec."Mail ID", Rec."Subject") then begin
                        Rec.Status := Rec.Status::Open;
                        Rec."Collected?" := false;
                        Rec.Modify();
                        Message(Text001, Rec."Mail ID", Rec."Subject");
                        RegistryMgnt.PersonalFileMovement(Rec);
                        PageControls();
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
        DMS: Record EDMS;
}

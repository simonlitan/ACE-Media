page 52178906 "Deparmental File Card"
{
    Caption = 'Deparmental File Card';
    PageType = Card;
    SourceTable = "Departmental File";
    PromotedActionCategories = 'New, Process, Report, External Documents,Forward,File Operations,Attachments';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Folio No."; Rec."Folio No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Folio No. field.';
                }
                field("Subject"; Rec."Subject")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ShowCaption = true;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = All;
                    Caption = 'Reference No./ Date';
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field(Confidential; Rec.Confidential)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Confidential field.';
                    trigger OnValidate()
                    begin
                        RegistryMgnt.ForwardToSecretRegistry(Rec);
                    end;
                }
                field("Has External Documents"; Rec."Has External Documents")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Has External Documents field.';
                    trigger OnValidate()
                    begin
                        RegistryMgnt.AttachExternalDocs(Rec);
                        PageControls();
                    end;
                }
                field("Receieved by"; Rec."Receieved by")
                {
                    ApplicationArea = All;
                    Caption = 'Recieved By';
                    Editable = false;
                }
                field("Received at"; Rec."Received at")
                {
                    ApplicationArea = All;
                    Caption = 'Received At';
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                }
                field("Ref No."; Rec."Ref No.")
                {
                    ApplicationArea = All;
                    Caption = 'Mail ID';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Assign Staff"; Rec."Assign Staff")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assign Staff field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff Name field.';
                }
                field("Staff Mail"; Rec."Staff Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff Mail field.';
                }
                field("Date Assigned"; Rec."Date Assigned")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Assigned field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
            part(MC; "Mail Comments")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Folio No." = field("Folio No.");
            }
            part(FMH; "File Movement History")
            {
                ApplicationArea = All;
                SubPageLink = "File ID" = field("Folio No.");
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
                PromotedCategory = Category7;
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
            action("Forward to CEO")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = MailAttachment;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Visible = not IsForwarded;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the forwarding of  %1-%2 mail ';
                    Text001: Label '%1-%2 has been forwarded!';
                begin
                    if Confirm(Text000, true, Rec."Folio No.", Rec."Subject") then begin
                        Rec.Status := Rec.Status::Forwarded;
                        Rec.Modify();
                        Message(Text001, Rec."Folio No.", Rec."Subject");
                        RegistryMgnt.DeptFileMovement(Rec);
                        PageControls();
                    end
                end;

            }
            Action("Note to Staff")
            {
                ApplicationArea = all;
                promoted = true;
                Image = MailAttachment;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    Text00: Label 'Do you wish to note this Mail?';
                begin
                    if Confirm(Text00, true) then begin
                        Rec.Status := Rec.Status::Assigned;
                        Message(Text00, Rec."Folio No.", Rec."Assign Staff");
                        Rec.Notemail();

                    end;
                end;
            }
            action("Re-Open")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = MailAttachment;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Visible = IsForwarded;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the re-opening of  %1-%2 mail ';
                    Text001: Label '%1-%2 has been re-opened!';
                begin
                    if Confirm(Text000, true, Rec."Folio No.", Rec."Subject") then begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify();
                        Message(Text001, Rec."Folio No.", Rec."Subject");
                        RegistryMgnt.DeptFileMovement(Rec);
                        PageControls();
                    end
                end;

            }
            action("Returned")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = UpdateXML;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the returning of  %1-%2 mail ';
                    Text001: Label '%1-%2 has been returned!';
                begin
                    if Confirm(Text000, true, Rec."Folio No.", Rec."Subject") then begin
                        Rec.Status := Rec.Status::Returned;
                        Rec.Modify();
                        Message(Text001, Rec."Folio No.", Rec."Subject");
                        RegistryMgnt.DeptFileMovement(Rec);
                        PageControls();
                    end;
                end;
            }
            action("Mark as Received")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = ReceivableBill;
                PromotedCategory = Category6;
                Visible = not IsReceived;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the receipt of  %1-%2 mail ';
                    Text001: Label '%1-%2 has been received!';
                    Text003: Label 'This mail has already been received';
                begin
                    if Rec.Status <> Rec.Status::Received then
                        if Confirm(Text000, true, Rec."Folio No.", Rec."Subject") then begin
                            Rec.Status := Rec.Status::Received;
                            Rec.Modify();
                            Message(Text001, Rec."Folio No.", Rec."Subject");
                            RegistryMgnt.DeptFileMovement(Rec);
                            PageControls();
                        end
                        else
                            Message(Text003);
                end;
            }
            action("Brougt Up")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = UpdateXML;
                PromotedCategory = Category6;
                Visible = not IsBroughtUp;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the bring-up of  %1-%2 mail ';
                    Text001: Label '%1-%2 has been brought up!';
                begin
                    if Confirm(Text000, true, Rec."Folio No.", Rec."Subject") then begin
                        Rec.Status := Rec.Status::BroughtUp;
                        Rec.Modify();
                        Message(Text001, Rec."Folio No.", Rec."Subject");
                        RegistryMgnt.DeptFileMovement(Rec);
                        PageControls();
                    end;
                end;
            }
            action("Mark/Note Mail")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = NewTransferOrder;
                PromotedCategory = Category6;
                Visible = not IsMarked;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Text000: Label 'Do you wish to confirm the marking or noting of  %1-%2 mail ';
                    Text001: Label '%1-%2 has been marked!';
                begin
                    if Confirm(Text000, true, Rec."Folio No.", Rec."Subject") then begin
                        Rec.Status := Rec.Status::Marked;
                        Rec.Modify();
                        Message(Text001, Rec."Folio No.", Rec."Subject");
                        RegistryMgnt.DeptFileMovement(Rec);
                        PageControls();
                    end;
                end;
            }
            action("Send Notification Mail")
            {
                ApplicationArea = all;
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;
                trigger OnAction()
                var
                    mail: codeunit "Send Email Auto";
                begin
                    mail.OnSendMail();
                end;
            }
          
            action("Attach Mails")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = NewTransferOrder;
                PromotedCategory = Category6;
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
        if Rec."Has External Documents"
        then
            HasAttachments := true
        else
            HasAttachments := false;
        if Rec.Status = Rec.Status::Received then
            IsReceived := true
        else
            IsReceived := false;
        if Rec.Status = Rec.Status::Marked then
            IsMarked := true
        else
            IsMarked := false;
        if Rec.Status = Rec.Status::BroughtUp then
            IsBroughtUp := true
        else
            IsBroughtUp := false;
        if Rec.Status = Rec.Status::Forwarded then
            IsForwarded := true
        else
            IsForwarded := false;
    end;

    var
        HasAttachments: Boolean;
        RegistryMgnt: Codeunit "Common App Management";
        IsReceived: Boolean;
        IsMarked: Boolean;
        IsBroughtUp: Boolean;
        IsForwarded: Boolean;
        DMS: Record EDMS;


}

page 52178926 "Outbound Mail Card"
{
    Caption = 'Outbound Mail Card';
    PageType = Card;
    SourceTable = "Outbound Mail";
    PromotedActionCategories = 'New,Process,Report,Attach Mails,Mail Actions';

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
                field("Mail Decription"; Rec."Mail Description")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Mail Decription field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field(From; Rec.From)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Receiving Officer"; Rec."Receiving Officer")
                {
                    ApplicationArea = All;
                }
                field("Date Received"; Rec."Date Received")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Received field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

            }
            group("Dispatch Details")
            {
                field("Date Dispatched"; Rec."Date Dispatched")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Dispatched field.';
                }
                field("Dispatching Officer"; Rec."Dispatching Officer")
                {
                    ApplicationArea = All;
                }
                field("Mode of Dispatch"; Rec."Mode of Dispatch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mode of Dispatch field.';
                }
                field("Weight "; Rec."Weight ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight  field.';
                }

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
            action("Disptach Mail")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category5;
                Image = SendMail;
                Visible = IsComplete;
                trigger OnAction()
                var
                    Text000: Label '%1 mail has been dispatched successfully';
                begin

                    Rec.TestField(Destination);
                    Rec.Status := Rec.Status::Dispatched;
                    Rec."Dispatching Officer" := UserId;
                    Rec.Modify();
                    Message(Text000, Rec."Mail Description");
                    CurrPage.Close();

                end;
            }
            action("Confirm Completeness")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category5;
                Image = CompleteLine;
                Visible = IsComplete or IsOpen;
                trigger OnAction()
                var
                    Text000: Label '%1 mail has been returned for correction for confirmation';
                begin

                    Rec.Status := Rec.Status::Correction;
                    Rec.Modify();
                    Message(Text000, Rec."Mail Description");
                    CurrPage.Close();

                end;
            }
            action("Forward to Registry")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = IsIncorrect or IsOpen;
                Image = SuggestVendorBills;
                trigger OnAction()
                var
                    Text000: Label '%1 mail has been forwarded to registry';
                begin
                    Rec.Status := Rec.Status::Complete;
                    Rec.Modify();
                    Message(Text000, Rec."Mail Description");
                    CurrPage.Close();
                end;
            }
            action("Cancel Dispatch")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = IsDispatched;
                Image = CancelIndent;
                trigger OnAction()
                var
                    Text000: Label '%1 mail has been cancelled and re-open for correction';
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify();
                    Message(Text000, Rec."Mail Description");
                    CurrPage.Close();
                    Page.Run(Page::"Outbound Mails");
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
        if Rec.Status = Rec.Status::Complete then
            IsComplete := true
        else
            IsComplete := false;
        if Rec.Status = Rec.Status::Correction then
            IsIncorrect := true
        else
            IsIncorrect := false;
        if Rec.Status = Rec.Status::Dispatched then
            IsDispatched := true
        else
            IsDispatched := false;
        if Rec.Status = Rec.Status::Open then
            IsOpen := true
        else
            IsOpen := false
    end;

    var
        IsIncorrect: Boolean;
        RegistryMgnt: Codeunit "Common App Management";
        IsDispatched: Boolean;
        IsOpen: Boolean;
        IsComplete: Boolean;
        DMS: Record EDMS;
}

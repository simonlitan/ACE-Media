page 52179051 "Received Mail Card"
{
    Caption = 'Received Mail';
    PageType = Card;
    SourceTable = "Received Mail";
    layout
    {
        area(content)
        {
            group(General)
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
                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;
                    Caption = 'Recieved From';
                    ToolTip = 'Specifies the value of the Sender field.';
                }
                // field("Received From"; Rec."Received From")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Received From field.';
                // }
                field("KEFRI's"; Rec."KEFRI's")
                {
                    ApplicationArea = All;
                    caption = 'Nepad';
                    ToolTip = 'Specifies the value of the KEFRI''s field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        SendBackToSender();
                        Rec.Modify();
                    end;
                }
                group(SB2S)
                {
                    Visible = BackToSender;
                    ShowCaption = false;
                    field("Send back to Sender"; Rec."Send back to Sender")
                    {
                        ApplicationArea = All;

                        ToolTip = 'Specifies the value of the Send back to Sender field.';
                        trigger OnValidate()
                        var
                            myInt: Integer;
                        begin
                            Rec.Reset();
                            Rec.SetRange("Mail ID", Rec."Mail ID");
                            if Rec.Find('-') then begin
                                Rec.DeleteAll();
                                CurrPage.Close();
                                Message('The mail has been sent back to the sender');
                            end;

                        end;
                    }
                }

                field("Received by"; Rec."Receieved by")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receieved by field.';
                }
                field("Received at"; Rec."Received at")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Received at field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if Rec.Type = Rec.Type::Official then
                            RegistryMgnt.MoveMailData(Rec)
                        else
                            if Rec.Type = Rec.Type::Personal then
                                SelectPigeonHole();
                    end;
                }
                group(PH)
                {
                    Visible = IsPersonal;
                    ShowCaption = false;
                    field("Pigeon Hole ID"; Rec."Pigeon Hole ID")
                    {
                        ApplicationArea = ALl;
                        trigger OnValidate()
                        begin
                            RegistryMgnt.MoveMailData(Rec)
                        end;
                    }
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
         
        }
    }
    trigger OnOpenPage()
    begin
    end;

    trigger OnInit()
    begin

    end;

    trigger OnModifyRecord(): Boolean
    begin
        SelectPigeonHole();
    end;

    procedure SendBackToSender()
    begin
        if not Rec."KEFRI's" then
            BackToSender := true
        else
            BackToSender := false;
    end;

    procedure SelectPigeonHole()
    begin
        if Rec.Type = Rec.Type::Personal
        then
            IsPersonal := true
        else
            IsPersonal := false;
    end;


    var
        BackToSender: Boolean;
        RegistryMgnt: Codeunit "Common App Management";
        IsPersonal: Boolean;
        DMS: Record EDMS;

}

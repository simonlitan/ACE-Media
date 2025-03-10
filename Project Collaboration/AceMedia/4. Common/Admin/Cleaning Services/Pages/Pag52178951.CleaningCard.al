page 52178951 "Cleaning Card"
{
    Caption = 'Cleaning Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Cleaning Header";
    PromotedActionCategories = 'New,Process,Report,Attachments';

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Fieldeditable;
                Caption = 'General';

                field(No; Rec.No)
                {
                    ApplicationArea = All;
                }
                field("Schedule Type"; Rec."Schedule Type")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field("Supervisor No"; Rec."Supervisor No")
                {
                    ApplicationArea = All;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = All;
                }
                field(Closed; Rec.Closed)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closed field.';

                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = All;
                }
            }
            part("Cleaning Listpart"; "Cleaning Listpart")
            {
                Editable = Fieldeditable;
                ApplicationArea = all;
                SubPageLink = No = field(No);
            }
        }

    }
    actions
    {

        area(Processing)
        {
            action(Attachments)
            {
                ApplicationArea = all;
                Image = Attachments;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.Run();
                end;
            }
            action("Close Schedule")
            {
                ApplicationArea = all;
                Image = Closed;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.OnClose();
                end;
            }

        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        if rec.Closed = false then Fieldeditable := true else Fieldeditable := false;
    end;

    trigger OnOpenPage()
    begin
        if rec.Closed = false then Fieldeditable := true else Fieldeditable := false;
    end;

    trigger OnAfterGetRecord()
    begin
        if rec.Closed = false then Fieldeditable := true else Fieldeditable := false;
    end;

    var
        Fieldeditable: Boolean;
        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";

        Cleaningheader: Record "Cleaning Header";
        CleaningLines: Record "Cleaning Line";
}

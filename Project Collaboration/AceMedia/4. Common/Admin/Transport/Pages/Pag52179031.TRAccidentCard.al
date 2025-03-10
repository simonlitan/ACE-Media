page 52178912 "TR Accident Card"
{
    Caption = 'TR Accident Card';
    PageType = Card;
    SourceTable = "TR Accidents";
    PromotedActionCategories = 'New,Procees,Report,Attachments';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("Date of Incident"; Rec."Date of Incident")
                {
                    ApplicationArea = All;
                }
                field("Driver No"; Rec."Driver No")
                {
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }

                field(Casualties; Rec.Casualties)
                {
                    ApplicationArea = All;
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = All;
                }
                group("General Descriptionn")
                {
                    Caption = 'General Description';
                    field("General Description"; Rec."General Description")
                    {
                        ShowCaption = false;
                        MultiLine = true;
                        ApplicationArea = All;
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

        }
    }
    var
        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";
        DocAttach: codeunit DocumentAttachment2;
}

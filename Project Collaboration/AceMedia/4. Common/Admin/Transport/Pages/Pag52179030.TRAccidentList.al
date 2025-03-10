page 52178911 "TR Accident List"
{
    CardPageId = "TR Accident Card";
    DeleteAllowed = false;
    Caption = 'TR Accident List';
    PageType = ListPart;
    SourceTable = "TR Accidents";

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                field("General Description"; Rec."General Description")
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
        DocAttach: codeunit "DocumentAttachment2";
}

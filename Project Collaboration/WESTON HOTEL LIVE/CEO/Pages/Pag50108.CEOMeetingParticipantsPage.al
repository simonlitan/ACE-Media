page 52178934 "CEO-Meeting Participants Page"
{
    AutoSplitKey = true;
    Caption = 'Participants Sheet';
    //DataCaptionFields = "Document Type", "No.";
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "CEOCommentSheetTable";
    //SourceTable = "CEO-Calendar Entries";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("No."; Rec."Number")
                {
                    ApplicationArea = All;

                }
                field("Attendant Name"; Rec."Attendant Name")
                {
                    ApplicationArea = All;

                }
                field("Responsibility"; Rec.Responsibility)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // SetUpNewLine;
    end;
}


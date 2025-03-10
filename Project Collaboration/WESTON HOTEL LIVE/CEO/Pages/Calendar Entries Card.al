page 52179007 "Calendar Entries Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CEO-Calendar Entries";

    layout
    {
        area(Content)
        {
            group("General")
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    //Visible = DocNoVisible;
                    Caption = 'Meeting Code';
                    trigger OnValidate()
                    var
                        NoSeriesMgt: Codeunit NoSeriesManagement;
                    begin
                        if Rec."Code" <> xRec."Code" then begin
                            //HRSetup.Get;
                            NoSeriesMgt.TestManual('CEOCAL');
                            Rec."No. Series" := '';
                        end;
                    end;
                }
                field("Meeting Date"; Rec."Period Start")
                {
                    Caption = 'Date';
                    ApplicationArea = All;
                }
                field("Time"; Rec."Timee")
                {
                    Caption = 'Time';
                    ApplicationArea = All;
                }
                field("Venue"; Rec."Venue")
                {
                    Caption = 'Venue';
                    ApplicationArea = All;
                }
                // field("Calendar Name"; Rec."Calendar Name")
                // {
                //     TableRelation = "CEO-Production Forecast Name";

                // }
                field("AgendaDescription"; Rec.Agenda)
                {
                    Caption = 'Agenda';
                    ApplicationArea = All;

                }
                field("Meetingdescription"; Rec.Description)
                {

                    Caption = 'Description';
                    MultiLine = True;
                    ApplicationArea = All;
                }

                // field("No. of People"; Rec."No. of People")
                // {
                //     Caption = 'Attendees';

                // }




            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Co&mments")
            {
                ApplicationArea = Comments;
                Caption = 'Add meeting Attendants';
                Image = ViewComments;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Purch. Comment Sheet";
                RunPageLink = "No." = FIELD("Code");
                ToolTip = 'View or add comments for the record.';
            }

            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Memo Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
            action("Print Meeting Details")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = report MeetingAttendants;
                trigger OnAction()
                begin

                end;
            }

        }
    }

    var
        myInt: Integer;
}
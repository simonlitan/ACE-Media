page 52178901 "TR Workticket Card"
{
    Caption = 'TR Workticket Card';
    PageType = Card;
    SourceTable = "TR Workticket Header";
    PromotedActionCategories = 'New,Process,Report,Attachments';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Registration No"; Rec."Registration No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration No field.';
                }
                field("Previous Ticket No"; Rec."Previous Ticket No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Previous Ticket No field.';
                }
                field("Ticket No"; Rec."Ticket No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ticket No field.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ending Date field.';
                }
                field("Odometer at Start"; Rec."Odometer at Start")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Odometer at Start field.';
                }
                field("Fuel Consumed"; Rec."Fuel Consumed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fuel Consumed field.';
                }
                field(Station; Rec.Station)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Station field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field(Closed; Rec.Closed)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closed field.';
                }

            }
            part("Workticket Lines"; "TR Workticket Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Registration No" = field("Registration No"), "Ticket No" = field("Ticket No");
            }
            part("Vehicle Defects"; "TR Vehicle Defects")
            {
                ApplicationArea = All;
                SubPageLink = "Registration No" = field("Registration No"), "Ticket No" = field("Ticket No");
            }
            part("Accidents"; "TR Accident List")
            {
                ApplicationArea = all;
                SubPageLink = "Ticket No" = field("Ticket No"), "Registration No" = field("Registration No");
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
            action("Work Ticket Report")
            {
                ApplicationArea = all;
                Image = Worksheet;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                begin
                    rec.Reset();
                    rec.SetRange(rec."Ticket No", rec."Ticket No");
                    report.run(report::"TR Workticket", true, true, rec);
                end;
            }
            action("Close Ticket")
            {
                ApplicationArea = all;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.MarkAsClosed();
                end;
            }
        }
    }
    var
        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";
        DocAttach: codeunit "Document Attachment Mgmt";
}

page 52178718 "FIN-Interbank Transfer"
{
    CardPageID = "FIN-Bank & Cash Trans. Req. UP";
    PageType = List;
    SourceTable = "FIN-InterBank Transfers";
    SourceTableView = WHERE(Posted = FILTER(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = All;
                }
                field("Receiving Account"; Rec."Receiving Account")
                {
                    ApplicationArea = All;
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                }
                field("Receiving Bank Account Name"; Rec."Receiving Bank Account Name")
                {
                    ApplicationArea = All;
                }

                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Paying Account"; Rec."Paying Account")
                {
                    ApplicationArea = All;
                }
                field("Bank Type"; Rec."Bank Type")
                {
                    ApplicationArea = All;
                }
                field("Source Depot Code"; Rec."Source Depot Code")
                {
                    ApplicationArea = All;
                }
                field("Source Department Code"; Rec."Source Department Code")
                {
                    ApplicationArea = All;
                }
                field("Source Depot Name"; Rec."Source Depot Name")
                {
                    ApplicationArea = All;
                }
                field("Receiving Depot Code"; Rec."Receiving Depot Code")
                {
                    ApplicationArea = All;
                }
                field("Receiving Department Code"; Rec."Receiving Department Code")
                {
                    ApplicationArea = All;
                }
                field("Receiving Depot Name"; Rec."Receiving Depot Name")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Attachments)
            {
                ApplicationArea = All;
                Promoted = true;
                // PromotedCategory = Category8;
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
            action("Posted Interbank Transfers")
            {
                RunObject = Page "FIN-Posted Interbank Trans2";
                RunPageLink = No = FIELD(No);
                ApplicationArea = All;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rcpt.RESET;
        Rcpt.SETRANGE(Rcpt.Posted, FALSE);
        Rcpt.SETRANGE(Rcpt."Created By", USERID);
        IF Rcpt.COUNT > 0 THEN BEGIN
            IF CONFIRM('There are still some unposted imprest Surrenders. Continue?', FALSE) = FALSE THEN BEGIN
                ERROR('There are still some unposted imprest Surrenders. Please utilise them first');
            END;
        END;
    end;

    var
        Rcpt: Record "FIN-InterBank Transfers";
}

page 52178653 "FIN-Interbank Transfer"
{
    CardPageID = "FIN-Bank & Cash Trans. Req. UP";
    PageType = List;
    Editable = false;
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
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    ApplicationArea = All;
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = All;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field("Transaction Name"; Rec."Transaction Name")
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
                field("Receiving Department Name"; Rec."Receiving Department Name")
                {
                    ApplicationArea = All;
                }
                field("Source Department Name"; Rec."Source Department Name")
                {
                    ApplicationArea = All;
                }
                field("Paying  Bank Account Name"; Rec."Paying  Bank Account Name")
                {
                    ApplicationArea = All;
                }
                field("Inter Bank Template Name"; Rec."Inter Bank Template Name")
                {
                    ApplicationArea = All;
                }
                field("Inter Bank Journal Batch"; Rec."Inter Bank Journal Batch")
                {
                    ApplicationArea = All;
                }
                field("Receiving Transfer Type"; Rec."Receiving Transfer Type")
                {
                    ApplicationArea = All;
                }
                field("Source Transfer Type"; Rec."Source Transfer Type")
                {
                    ApplicationArea = All;
                }
                field("Currency Code Destination"; Rec."Currency Code Destination")
                {
                    ApplicationArea = All;
                }
                field("Currency Code Source"; Rec."Currency Code Source")
                {
                    ApplicationArea = All;
                }
                field("Amount 2"; Rec."Amount 2")
                {
                    ApplicationArea = All;
                }
                field("Exch. Rate Source"; Rec."Exch. Rate Source")
                {
                    ApplicationArea = All;
                }
                field("Exch. Rate Destination"; Rec."Exch. Rate Destination")
                {
                    ApplicationArea = All;
                }
                field("Reciprical 1"; Rec."Reciprical 1")
                {
                    ApplicationArea = All;
                }
                field("Reciprical 2"; Rec."Reciprical 2")
                {
                    ApplicationArea = All;
                }
                field("Balance 1"; Rec."Balance 1")
                {
                    ApplicationArea = All;
                }
                field("Balance 2"; Rec."Balance 2")
                {
                    ApplicationArea = All;
                }
                field("Current Source A/C Bal."; Rec."Current Source A/C Bal.")
                {
                    ApplicationArea = All;
                }
                field("Register Number"; Rec."Register Number")
                {
                    ApplicationArea = All;
                }
                field("From No"; Rec."From No")
                {
                    ApplicationArea = All;
                }
                field("To No"; Rec."To No")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Division';
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Region';
                    ApplicationArea = All;
                }
                field(Dim3; Rec.Dim3)
                {
                    ApplicationArea = All;
                }
                field(Dim4; Rec.Dim4)
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 3 Code1"; Rec."Shortcut Dimension 3 Code1")
                {
                    Caption = 'Division';
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 4 Code1"; Rec."Shortcut Dimension 4 Code1")
                {
                    Caption = 'Region';
                    ApplicationArea = All;
                }
                field(Dim31; Rec.Dim31)
                {
                    ApplicationArea = All;
                }
                field(Dim41; Rec.Dim41)
                {
                    ApplicationArea = All;
                }
                field("Sending Responsibility Center"; Rec."Sending Responsibility Center")
                {
                    ApplicationArea = All;
                }
                field("Reciept Responsibility Center"; Rec."Reciept Responsibility Center")
                {
                    ApplicationArea = All;
                }
                field("Sending Resp Centre"; Rec."Sending Resp Centre")
                {
                    ApplicationArea = All;
                }
                field("Receipt Resp Centre"; Rec."Receipt Resp Centre")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Request Amt LCY"; Rec."Request Amt LCY")
                {
                    ApplicationArea = All;
                }
                field("Pay Amt LCY"; Rec."Pay Amt LCY")
                {
                    ApplicationArea = All;
                }
                field("External Doc No."; Rec."External Doc No.")
                {
                    ApplicationArea = All;
                }
                field("Transfer Release Date"; Rec."Transfer Release Date")
                {
                    ApplicationArea = All;
                }
                field("Cancelled By"; Rec."Cancelled By")
                {
                    ApplicationArea = All;
                }
                field("Date Cancelled"; Rec."Date Cancelled")
                {
                    ApplicationArea = All;
                }
                field("Time Cancelled"; Rec."Time Cancelled")
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

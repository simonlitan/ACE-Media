page 52178730 "FIN-Posted petty cash"
{
    CardPageID = "Advance PettyCash Header Crd";
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Advance PettyCash Header";
    SourceTableView = WHERE("Document Type" = filter("Advance Petty Cash"), Status = FILTER(Posted));


    layout
    {
        area(content)
        {
            repeater(Group)

            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }

                field(Payee; Rec.Payee)
                {
                    ApplicationArea = All;
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ApplicationArea = All;
                }
                field(Cashier; Rec.Cashier)
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

                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;
                }



                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = All;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = All;
                }
                field("Payment Release Date"; Rec."Payment Release Date")
                {
                    ApplicationArea = All;
                }

                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }

                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {

            group("&Functions")
            {
                Caption = '&Functions';
                action("Print/Preview")
                {
                    Caption = 'Print/Preview';
                    Image = PreviewChecks;
                    Promoted = true;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        IF Rec.Status = Rec.Status::Pending THEN
                            //ERROR('You cannot Print until the document is released for approval');
                            Rec.RESET;
                        Rec.SETFILTER("No.", Rec."No.");
                        REPORT.RUN(51673, TRUE, TRUE, Rec);
                        Rec.RESET;
                    end;
                }
                action("Import Petty Cash")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Journal;
                    RunObject = xmlport "Petty Cash";

                }
                action("Import Users")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Journal;
                    RunObject = xmlport "Users Import";

                }




            }
        }
    }
}
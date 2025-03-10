page 52178771 "Pv Budget Test Lines"
{
    PageType = ListPart;
    SourceTable = "FIN-Payment Line";

    layout
    {
        area(content)
        {
            repeater(__)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Document No"; Rec."Document No")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                }
                field(Grouping; Rec.Grouping)
                {
                    ApplicationArea = All;
                }
                field("Document Line"; Rec."Document Line")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
                field("Council No."; Rec."Council No.")
                {
                    //ApplicationArea = All;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = All;
                }
                field("Budgeted Acc"; Rec."Budgeted Acc")
                {
                    ApplicationArea = all;
                }
                field("Budgeted Allocation"; Rec."Budgeted Allocation")
                {
                    Editable = false;

                }
                field("Budget Balance"; Rec."Budget Balance")
                {

                }
               
                field("Budget Balance1"; Rec."Budget Balance1")
                {
                    ApplicationArea = all;
                    Visible = false;

                }
                field("Budgeted Allocation1"; Rec."Budgeted Allocation1")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Total Expense & Commitment"; Rec."Total Expense & Commitment")
                {
                    Visible = false;

                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }



                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Advance Type"; Rec."Advance Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(" Advance Grouping"; Rec."Advance Grouping")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Advance No."; Rec."Advance No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }



                field("Not Vatable"; Rec."Not Vatable")
                {
                    ApplicationArea = All;
                }

                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = All;
                }
                field("PAYE Code"; Rec."PAYE Code")
                {

                }
                field("PAYE Amount"; Rec."PAYE Amount")
                {

                }

                field("VAT Rate"; Rec."VAT Rate")
                {
                    ApplicationArea = All;
                }
                field("VAT Six % Rate"; Rec."VAT Six % Rate")
                {
                    ApplicationArea = All;
                }
                field(Commission; Rec.Commission)
                {
                    ApplicationArea = All;
                    //ApplicationArea = All;
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    ApplicationArea = All;
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = All;
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        //check if the payment reference is for farmer purchase
                        IF Rec."Payment Reference" = Rec."Payment Reference"::"Farmer Purchase" THEN BEGIN
                            IF Rec.Amount <> xRec.Amount THEN BEGIN
                                ERROR('Amount cannot be modified');
                            END;
                        END;

                        Rec."Amount With VAT" := Rec.Amount;


                    end;
                }
            
            
                field("VAT Withheld Amount"; Rec."VAT Withheld Amount")
                {
                    ApplicationArea = All;
                }
                field("Withholding Tax Amount"; Rec."Withholding Tax Amount")
                {
                    ApplicationArea = all;
                }

                field("Net Amount"; Rec."Net Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }

                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    //ApplicationArea = All;
                }


            }
        }
    }

    actions
    {
    }

    var
    // RecPayTypes: Record "61129";
    // TarriffCodes: Record "61716";
    // GenJnlLine: Record "81";
    // DefaultBatch: Record "232";
    // CashierLinks: Record "61720";
    // LineNo: Integer;
    // CustLedger: Record "25";
    // CustLedger1: Record "25";
    // Amt: Decimal;
    // TotAmt: Decimal;
    // ApplyInvoice: Codeunit "402";
    // AppliedEntries: Record "61728";
    // VendEntries: Record "25";
    // PInv: Record "122";
    // VATPaid: Decimal;
    // VATToPay: Decimal;
    // PInvLine: Record "123";
    // VATBase: Decimal;
    // ImprestHeader: Record "61688";

    //[Scope('Internal')]
    procedure GetDocNo(): Code[20]
    begin
        //EXIT("Inv Doc No");
    end;
}
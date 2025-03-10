page 52178674 "FIN-Staff Claim Lines"
{
    PageType = ListPart;
    SourceTable = "FIN-Staff Claim Lines";
    Caption = 'Claim Lines';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Advance Type"; Rec."Advance Type")
                {

                }

                field("Account No:"; Rec."Account No.")
                {
                    ApplicationArea = All;
                    // trigger OnLookup(var Text: Text): Boolean
                    // begin
                    //     Rec.VALIDATE("Account Name");
                    // end;
                }
                field("Account Name"; Rec."Account Name")
                {

                    ApplicationArea = All;

                }


                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        /*{Get the total amount paid}
                        Bal:=0;
                        
                        PayHeader.RESET;
                        PayHeader.SETRANGE(PayHeader."Line No.",No);
                        IF PayHeader.FINDFIRST THEN
                          BEGIN
                            PayLine.RESET;
                            PayLine.SETRANGE(PayLine.No,PayHeader."Line No.");
                            IF PayLine.FIND('-') THEN
                              BEGIN
                                REPEAT
                                  Bal:=Bal + PayLine."Pay Mode";
                                UNTIL PayLine.NEXT=0;
                              END;
                          END;
                        //Bal:=Bal + Amount;
                        
                        IF Bal > PayHeader.Amount THEN
                          BEGIN
                            ERROR('Please ensure that the amount inserted does not exceed the amount in the header');
                          END;
                          */

                    end;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
                field("Claim Receipt No"; Rec."Claim Receipt No")
                {
                    ApplicationArea = All;
                }
                field("Expenditure Date"; Rec."Expenditure Date")
                {
                    ApplicationArea = All;
                }
                field(Purpose; Rec.Purpose)
                {
                    Caption = 'Expenditure Description';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    var
        PayHeader: Record "FIN-Payments Header";
        PayLine: Record "FIN-Payment Line";
        Bal: Decimal;
        RecPay: Record "FIN-Receipts and Payment Types";
}

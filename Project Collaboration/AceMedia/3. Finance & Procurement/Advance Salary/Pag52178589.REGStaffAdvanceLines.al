page 52178631 "REG-Staff Advance Lines"

{
    PageType = ListPart;
    SourceTable = "FIN-Staff Advance Lines";

    layout
    {
        area(content)
        {
            repeater(" ")
            {
                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = All;
                }

                field("Account No:"; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
                field("Account Name"; Rec."Account Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Purpose; Rec.Purpose)
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

            }
        }
    }
    actions
    {
    }
    var // PayHeader: Record "ACA-Day Of Week";
        // PayLine: Record "HRM-Training Facilitators";
        Bal: Decimal;
}


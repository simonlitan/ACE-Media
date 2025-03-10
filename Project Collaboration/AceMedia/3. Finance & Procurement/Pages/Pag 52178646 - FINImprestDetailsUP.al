page 52178646 "FIN-Imprest Details UP"
{
    caption = 'Imprest Request Lines';
    PageType = ListPart;
    SourceTable = "FIN-Imprest Lines";

    layout
    {
        area(content)
        {
            repeater(__________________)
            {
                field("Advance Type"; Rec."Advance Type")
                {
                    Caption = 'Imprest Type';
                    ApplicationArea = All;
                    Editable = true;
                }
                field(No; Rec.No)
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Account No:"; Rec."Account No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Budget Balance"; Rec."Budget Balance")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Grade; Rec."Salary Grade")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Region field.';
                    Editable = true;
                }
                field(Rates; Rec.Rates)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rates field.';
                    Editable = true;
                }
                field("No of days"; Rec."No of days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of days field.';
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
                field("Imprest Holder"; Rec."Imprest Holder")
                {
                    ApplicationArea = All;
                }

                field(Purpose; Rec.Purpose)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
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
            action("Check Line Budget")
            {
                Caption = 'Check Line Budget';

                ApplicationArea = All;

                trigger OnAction()
                begin
                    "G/L Vote".RESET;
                    "G/L Vote".SETFILTER("G/L Vote"."No.", Rec."Account No.");
                    "G/L Vote".SETFILTER("G/L Vote"."Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");

                    // IF "G/L Vote".FIND('-') THEN
                    REPORT.RUN(50129, TRUE, TRUE, "G/L Vote");
                end;
            }
        }
    }

    var
        //PayHeader: Record "61732";
        PayLine: Record "FIN-Receipt Line q";
        Bal: Decimal;
        "G/L Vote": Record "G/L Account";
        ImprestHeader: Record "FIN-Imprest Header";
}

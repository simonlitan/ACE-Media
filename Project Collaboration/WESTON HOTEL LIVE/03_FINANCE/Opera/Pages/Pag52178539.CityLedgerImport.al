page 52178539 "City Ledger Import"
{
    PageType = List;
    SourceTable = "City Ledger Import";
    SourceTableView = WHERE(Posted = FILTER(false));
    ApplicationArea = all;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Amount USD"; Rec."Amount USD")
                {
                    ApplicationArea = All;
                }
                field("Names 1"; Rec."Names 1")
                {
                    ApplicationArea = All;
                }
                field("Names 2"; Rec."Names 2")
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
            action("ImportCity Ledger Transactions")
            {
                ApplicationArea = All;
                RunObject = XMLport "ImportCity Ledger Transactions";
            }
            action("Import City Ledger")
            {
                Caption = 'Import City Ledger';
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                //RunObject = XMLport 50031;
                Visible = false;
                ApplicationArea = All;
            }
            action("Post City Ledger")
            {
                Caption = 'Post City Ledger';
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    GenLine.RESET;
                    GenLine.SETRANGE(GenLine."Journal Template Name", 'GENERAL');
                    GenLine.SETRANGE(GenLine."Journal Template Name", 'NOVACOM');
                    GenLine.DELETEALL;

                    CityLedger.RESET;
                    // CityLedger.SETRANGE(CityLedger."Line No", "Line No");
                    IF CityLedger.FIND('-') THEN BEGIN

                        REPEAT
                            GenLine.RESET;
                            GenLine.SETRANGE(GenLine."Journal Template Name", 'GENERAL');
                            GenLine.SETRANGE(GenLine."Journal Batch Name", 'NOVACOM');

                            IF GenLine.FIND('+') THEN BEGIN
                                LineNo := GenLine."Line No." + 1000;
                            END
                            ELSE BEGIN
                                LineNo := 1000;
                            END;


                            LineNo := LineNo + 1;
                            GenLine.INIT;
                            GenLine."Line No." := LineNo;
                            GenLine."Journal Template Name" := 'GENERAL';
                            GenLine."Journal Batch Name" := 'novacom';
                            GenLine."Document No." := 'OPERA-REC';
                            GenLine."Account Type" := GenLine."Account Type"::Customer;
                            GenLine."Account No." := CityLedger."Customer No.";
                            GenLine.VALIDATE(GenLine."Account No.");
                            GenLine."Posting Date" := CityLedger.Date;
                            GenLine.Amount := CityLedger.Amount;
                            GenLine."Bal. Account Type" := GenLine."Bal. Account Type"::"G/L Account";
                            GenLine."Bal. Account No." := '1272';
                            GenLine."Shortcut Dimension 1 Code" := '10';
                            GenLine."Shortcut Dimension 2 Code" := '1001';
                            GenLine.INSERT;


                        UNTIL CityLedger.NEXT = 0
                    END;


                    /*GenLine.RESET;
                    GenLine.SETRANGE(GenLine."Journal Template Name",'GENERAL');
                    GenLine.SETRANGE(GenLine."Journal Batch Name",'novacom');
                    GenLine.SETRANGE( GenLine.Amount,0);
                    IF GenLine.FIND('-') THEN BEGIN
                    //REPEAT
                    GenLine.DELETEALL;
                    //UNTIL GenLine.NEXT=0;
                    END;
                     */

                end;
            }
            action("Post City Ledger Transactions")
            {
                Promoted = true;
                // RunObject = Report 50238;
                ApplicationArea = All;
            }
        }
    }

    var
        GenLine: Record 81;
        CityLedger: Record "City Ledger Import";
        LineNo: Integer;
}


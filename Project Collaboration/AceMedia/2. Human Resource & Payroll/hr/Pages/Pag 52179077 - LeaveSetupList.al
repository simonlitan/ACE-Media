page 52179077 "Leave Setup List"
{
    ApplicationArea = All;
    Caption = 'Leave Setup List';
    PageType = List;
    SourceTable = "Leave Setup";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Id; Rec.Id)
                {
                    // ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Id field.';
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave Period field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Activate")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    If rec.Active = false then Begin
                        rec.Active := True;
                        Message('Period Activated');
                    End
                    else
                        Error('Period Already Active');
                end;
            }
            action("Close Period")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                begin

                    // ClosePeriod();
                    // If Rec.Closed = False then begin
                    //     Rec.Closed := True;
                    //end;
                end;
            }
            action("Open Period")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                begin
                    // ReOpenPeriod();
                    // If Rec.Closed = True then begin
                    //     Rec.Closed := False;
                    // end;
                end;
            }
        }
    }
    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     if rec."Leave Period" <> '' then begin
    //         Rec.Reset();
    //         Rec.SetRange(rec."Leave Period", xRec."Leave Period");
    //         if rec.Find('-') then begin
    //             Error('Record Already Exists');
    //         end;
    //     end;
    // end;

    procedure ClosePeriod()
    var
        ledger: Record "HRM-Leave Ledger";
        leavereq: Record "HRM-Leave Requisition";
        ren: Integer;
    begin
        Rec.Reset();
        Rec.SetRange(Rec."Leave Period", LedgerEnt."Leave PeriodAcc");
        Rec.SetFilter(Rec."Leave Period", LedgerEnt."Leave PeriodAcc", '<>%1 <>%2', '', '');
        if Rec.Find('-') then begin
            if ((LedgerEnt."Entry No." = 0) and (LedgerEnt."Document No" = '')) or ((LedgerEnt."Entry No." = 0) or (LedgerEnt."Document No" = '')) then begin
                message('Found Dups');
                LedgerEnt.SetRange(LedgerEnt."Entry No.", 0);
                if LedgerEnt.Find('+') then begin
                    ren := -(2000);
                end;
                repeat
                    LedgerEnt.Init();
                    LedgerEnt."Entry No." := ren + 1;
                    LedgerEnt."Document No" := 'Leave' + format(LedgerEnt."Entry No.");
                    LedgerEnt.closed := True;
                    LedgerEnt.Modify();
                    Message('Ledger Modified');
                until LedgerEnt.Next() = 0;
            end;

            message('Found');
            repeat
                LedgerEnt.Init();
                LedgerEnt.closed := True;
                LedgerEnt.Modify();
                Message('Ledger Modified');
            until LedgerEnt.Next() = 0;



            // begin
            //     leavereq.Reset();
            //     leavereq.SetRange("No.", ledger."Document No");
            //     leavereq.SetFilter("No.", ledger."Document No", '<>%1 <>%2', '', '');
            //     ledger.SetFilter(ledger."Entry Type", '<>%1', ledger."Entry Type"::Allocation);
            //     if leavereq.find('-') then begin
            //         if ledger."Entry No." = 0 then begin
            //             if ledger.Find('-') then begin
            //                 ren := -1150;
            //                 repeat
            //                     ledger.Init();
            //                     //ledger."Entry No." := ren + 10;
            //                     //ledger."Starting Date" := leavereq."Starting Date";
            //                     //ledger."End Date" := leavereq."End Date";
            //                     ledger.closed := True;
            //                     ledger.Modify();
            //                     Message('Modified');
            //                 until ledger.next() = 0;
            //             end;
            //         end;
            //     end;
            // end;
        end
        else
            Error('No Entry Found');
        ;

        Rec.Closed := True;
        Rec.Modify();
        Message('Period Closed');
        //  LedgerEnt.Reset();
        //  LedgerEnt.SetRange("Leave PeriodAcc", Rec."Leave Period");
        //  If LedgerEnt.Find('-') then begin
        //      if LedgerEnt.closed = false then begin
        //         LedgerEnt.closed := true;
        //         LedgerEnt.Modify();
        //         Rec.Closed := True;
        //         Rec.Active := False;
        //         Rec.Modify();
        //      end
        //      else
        //      exit;
        // end;
    end;

    procedure ReOpenPeriod()
    var
    begin
        LedgerEnt.Reset();
        LedgerEnt.SetRange("Leave PeriodAcc", Rec."Leave Period");
        If LedgerEnt.Find('-') then begin
            if LedgerEnt.closed = True then begin
                LedgerEnt.closed := False;
                LedgerEnt.Modify();
                Message('Record Modified');
            end;
            Rec.Closed := False;
            Rec.Active := False;
            Message('Leave Period Reopened');
        end;
    end;

    var
        LedgerEnt: Record "HRM-Leave Ledger";


}

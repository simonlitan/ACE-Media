page 52179132 "HRM-Emp. Leave Journal Lines"
{
    PageType = List;
    SourceTable = "HRM-Employee Leave Journal";
    PromotedActionCategories = 'New,Process,Report,CarryFoward,Approvals';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = all;
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = all;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                    ApplicationArea = all;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = all;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = all;
                }
                field("Forfeited Days"; Rec."Forfeited Days")
                {

                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = all;
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = All;
                }
                field("Leave PeriodAcc"; Rec."Leave PeriodAcc")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post_Leave)
            {
                ApplicationArea = all;
                Caption = 'Post Leave Journal';
                Image = PostDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;


                trigger OnAction()
                begin
                    CODEUNIT.Run(Codeunit::"HR Post Leave Journal Ent.");
                end;
            }
        }
        area(creation)
        {
            /* action(GetAnnual_Leave)
            {
                ApplicationArea = all;
                Caption = 'Get Annual Leave Allocations';
                Image = GetLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = New;


                trigger OnAction()
                begin
                    if Confirm('Generate annual Leave allocations?', true) = false then exit;
                    Clear(ints);
                    hremployee.Reset;
                    hremployee.SetRange(hremployee.Status, hremployee.Status::Normal);
                    if hremployee.Find('-') then begin
                        // Populate leave journal with

                        // Delete Existing Journal Entries first
                        leaveJournal.Reset;
                        if leaveJournal.Find('-') then
                            leaveJournal.DeleteAll;
                        repeat
                        begin
                            if ((hremployee."Salary Category" <> '') and (hremployee."Salary Grade" <> '')) then begin
                                salaryGrades.Reset;
                                salaryGrades.SetRange(salaryGrades."Employee Category", hremployee."Salary Category");
                                salaryGrades.SetRange(salaryGrades."Salary Grade code", hremployee."Salary Grade");
                                if salaryGrades.Find('-') then begin
                                    if salaryGrades."Annual Leave Days" <> 0 then begin

                                        // populate the Journal
                                        leaveledger.Reset;
                                        leaveledger.SetRange(leaveledger."Document No", hremployee."No.");
                                        leaveledger.SetRange(leaveledger."Leave Period", Date2DMY(Today, 3));
                                        leaveledger.SetFilter(leaveledger."Entry Type", '<>%1', leaveledger."Entry Type"::Allocation);
                                        if not leaveledger.Find('-') then begin
                                            // Insert the Journals

                                            ints := ints + 1;
                                            leaveJournal.Init;
                                            leaveJournal."Line No." := ints;
                                            leaveJournal."Staff No." := hremployee."No.";
                                            leaveJournal."Staff Name" := hremployee."First Name" + ' ' + hremployee."Middle Name" + ' ' + hremployee."Last Name";
                                            leaveJournal."Transaction Description" := 'Leave Allocations for ' + Format(Date2DMY(Today, 3));
                                            leaveJournal."Leave Type" := 'ANNUAL';
                                            leaveJournal."No. of Days" := salaryGrades."Annual Leave Days";
                                            leaveJournal."Transaction Type" := leaveJournal."Transaction Type"::Allocation;
                                            leaveJournal."Document No." := 'ALL-' + Format(Date2DMY(Today, 3));
                                            leaveJournal."Posting Date" := Today;
                                            leaveJournal."Leave Period" := Date2DMY(Today, 3);
                                            leaveJournal.Insert;
                                        end;

                                    end;
                                end;
                            end;
                        end;
                        until hremployee.Next = 0;
                    end;
                    Message('Annual leave days generated successfully!');
                end;
            } */

            action(GetmonthlyLeave)
            {
                ApplicationArea = all;
                Caption = 'Get Annual Leave Allocations';
                Image = GetLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = New;


                trigger OnAction()
                var
                    pperiod: Record "PRL-Payroll Periods";
                    salgrade: Record "HRM-Job_Salary grade/steps";
                begin
                    if Confirm('Get Annual Leave Allocations?', true) = false then exit;
                    Clear(ints);
                    hremployee.Reset;
                    hremployee.SetRange(hremployee.Status, hremployee.Status::Active);
                    if hremployee.Find('-') then begin
                        // Populate leave journal with

                        // Delete Existing Journal Entries first
                        leaveJournal.Reset;
                        if leaveJournal.Find('-') then
                            leaveJournal.DeleteAll;
                        repeat
                        begin
                            if ((hremployee."Salary Category" <> '') and (hremployee."Salary Grade" <> '')) then begin
                                salaryGrades.Reset;
                                salaryGrades.SetRange(salaryGrades."Employee Category", hremployee."Salary Category");
                                salaryGrades.SetRange(salaryGrades."Salary Grade code", hremployee."Salary Grade");
                                if salaryGrades.Find('-') then begin
                                    if salaryGrades."Annual Leave Days" <> 0 then begin

                                        // populate the Journal
                                        leaveledger.Reset;
                                        leaveledger.SetRange(leaveledger."Document No", hremployee."No.");
                                        leaveledger.SetRange(leaveledger."Leave Period", Date2DMY(Today, 3));
                                        leaveledger.SetRange(leaveledger."Leave PeriodAcc", salaryGrades."Leave PeriodAcc");
                                        leaveledger.SetFilter(leaveledger."Entry Type", '<>%1', leaveledger."Entry Type"::Allocation);
                                        if not leaveledger.Find('-') then begin

                                            pperiod.Reset();
                                            pperiod.SetRange(Closed, false);
                                            if pperiod.FindFirst() then begin

                                                ints := ints + 1;
                                                leaveJournal.Init;
                                                leaveJournal."Line No." := ints;
                                                leaveJournal."Staff No." := hremployee."No.";
                                                leaveJournal."Staff Name" := hremployee."First Name" + ' ' + hremployee."Middle Name" + ' ' + hremployee."Last Name";
                                                leaveJournal."Transaction Description" := 'Leave Allocations for ' + format(pperiod."Date Opened");
                                                //leaveJournal."Transaction Description" := 'Leave Allocations for ' + Format(Date2DMY(Today, 3));
                                                leaveJournal."Leave Type" := 'ANNUAL';
                                                leaveJournal."No. of Days" := salaryGrades."Annual Leave Days";
                                                leaveJournal."Leave Period" := Date2DMY(Today, 3);
                                                leaveJournal."Leave PeriodAcc" := salaryGrades."Leave PeriodAcc";
                                                leaveJournal."Transaction Type" := leaveJournal."Transaction Type"::Allocation;
                                                //leaveJournal."Document No." := 'ALL-' + Format(Date2DMY(Today, 3));
                                                leaveJournal."Document No." := 'Annual Allocation-' + format(pperiod."Date Opened");
                                                leaveJournal."Start Date" := salaryGrades."Start Date";
                                                leaveJournal."End Date" := salaryGrades."End Date";
                                                leaveJournal."Posting Date" := pperiod."Date Opened";
                                                // leaveJournal."Leave Period" := Date2DMY(Today, 3);
                                                leaveJournal.Insert;

                                                // salaryGrades."Cummulative Earned Days" := salaryGrades."Cummulative Earned Days" + salaryGrades."Monthly Earned Leave Days";
                                                salaryGrades.Modify();
                                            end;
                                            // Insert the Journals
                                        end;

                                    end;
                                end;
                            end;
                        end;
                        until hremployee.Next = 0;
                    end;
                    Message('Monthly Leave Days generated successfully!');
                end;
            }

            action("Leave Carry Forward")
            {
                ApplicationArea = all;
                Caption = 'Leave Carry Forward';
                Image = GetLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    LeaveJournal: Codeunit "Leave Carry Forward";
                begin
                    CODEUNIT.Run(Codeunit::"Leave Carry Forward");
                    //LeaveJournal.GetMonthlyAlloaction();

                end;
            }

            action("Close Period")
            {
                ApplicationArea = All;
                Image = GetLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = New;

                trigger OnAction()
                begin

                end;
            }


            group(Import)
            {

                Caption = '&Actions';
                action("Import Leave Balances")
                {
                    Caption = 'Import Leave Balances';
                    Image = ImportExcel;
                    Promoted = true;
                    PromotedIsBig = true;
                    ApplicationArea = all;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        if Confirm('!!!!!!!!!!!!!!!!!!!!....................... IMPORTANT.................!!!!!!!!!!!!!!!!!!!!!!!\' +
                        'Please ensure that your data is saved in ''.CSV'' format i.e. Comma delimeted.' +
                        '\The data should be in the following format:\' +
                        ' Line No|Staff No|Name|Description|Leave Type|No. of Days|Trans Type|Doc. No|Post Date|Leave Period.\' +
                        '\' +
                        '...........................EXAMPLE.........................\' +
                        '1|0001|Wanjala Tom|2015Leave days|ANNUAL|23|ALLOCATION|leave_2015|22012015|2015\' +
                        '2|0002|Jacinta Mwali|2015Leave days|ANNUAL|23|ALLOCATION|leave_2015|22012015|2015\' +
                        '\' +
                        'Continue?', true) = false then
                            Error('Cancelled by user!');
                        //  XMLPORT.Run(XmlPort::"Import Leave Journal", false, true);
                        Message('Processed your action successfully!');
                    end;
                }
            }
            action(reportupdate)
            {
                Image = ImportExcel;
                Promoted = true;
                PromotedIsBig = true;
                ApplicationArea = all;
                PromotedCategory = New;
                // RunObject = Report "Leave rport";
            }
        }
    }

    var
        salaryGrades: Record "HRM-Job_Salary grade/steps";
        hremployee: Record "HRM-Employee C";
        leaveledger: Record "HRM-Leave Ledger";
        leaveJournal: Record "HRM-Employee Leave Journal";
        ints: Integer;
}


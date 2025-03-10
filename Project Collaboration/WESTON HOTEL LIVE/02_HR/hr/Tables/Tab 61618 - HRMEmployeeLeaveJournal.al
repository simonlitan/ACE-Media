table 61618 "HRM-Employee Leave Journal"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Staff No."; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                if emp.Get("Staff No.") then
                    "Staff Name" := emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";
            end;
        }
        field(3; "Staff Name"; Text[250])
        {
        }
        field(4; "Transaction Description"; Text[150])
        {
        }
        field(5; "Leave Type"; Code[20])
        {
            TableRelation = "HRM-Leave Types".Code;
        }
        field(6; "No. of Days"; Decimal)
        {
        }
        field(7; "Transaction Type"; Option)
        {
            OptionCaption = ' ,Allocation,Application,Positive Adjustment,Negative Adjustment';
            OptionMembers = " ",Allocation,Application,"Positive Adjustment","Negative Adjustment";
        }
        field(8; "Document No."; Code[20])
        {
        }
        field(9; "Posting Date"; Date)
        {
        }
        field(10; "Leave Period"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
        }
    }

    fieldgroups
    {
    }
    procedure GetAnnualLeaveDays()
    begin
        if Confirm('Generate annual Leave allocations?', true) = false then exit;
        Clear(ints);
        hremployee.Reset;
        // hremployee.SetRange(hremployee.Status, hremployee.Status::Active);
         hremployee.SetRange(hremployee."Posting Group", 'Salary');
        if hremployee.Find('-') then begin
            // Populate leave journal with

            // Delete Existing Journal Entries first

            leaveJournal.Reset;
            if leaveJournal.Find('-') then
                leaveJournal.DeleteAll;
            repeat
            begin


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
                    //leaveJournal."No. of Days" := salaryGrades."Annual Leave Days";

                    hremployee.CalcFields("Leave Balance");
                    // if (hremployee."Leave Balance" > 15) and (hremployee.status = hremployee.status::Active) then begin
                    //    if hremployee.Status = hremployee.Status::Active then begin
                    //         hremployee."Allocated Leave Days" := 26;
                    //        // hremployee."Reimbursed Leave Days" := 15;
                    //          hremployee."Reimbursed Leave Days" := hremployee."Leave Balance";
                    //         leaveJournal."No. of Days" := 26 + hremployee."Leave Balance";
                    // end else begin
                    // if (hremployee."Leave Balance" < 15) and (hremployee.status = hremployee.status::Active) then
                    if hremployee.status = hremployee.status::Active then begin
                        if hremployee.Status <> hremployee.Status::Terminated then
                        //  hremployee."Allocated Leave Days" := 26;
                       // hremployee."Reimbursed Leave Days" := hremployee."Leave Balance";
                    leaveJournal."No. of Days" := 26;

                    //Create 2 entries for Annual allocation and leave balance carry foward;
                    // if hremployee.status = hremployee.status::Active then
                    //     hremployee."Allocated Leave Days" := 26;
                    // leaveJournal."No. of Days" := 26;

                end;
                end;

                leaveJournal."Transaction Type" := leaveJournal."Transaction Type"::Allocation;
                leaveJournal."Document No." := 'ALL-' + Format(Date2DMY(Today, 3));
                leaveJournal."Posting Date" := Today;
                leaveJournal."Leave Period" := Date2DMY(Today, 3);
                leaveJournal.Insert;
            end;
            //Leave allocation entry number




            until hremployee.Next = 0;
        end;
        Message('Annual leave days generated successfully!');
    end;

    procedure ImportLeaveDays()
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
        XMLPORT.Run(50166, false, true);
        Message('Imported Successfully!');
    end;

    var
        emp: Record "HRM-Employee C";
        salaryGrades: Record "HRM-Job_Salary grade/steps";
        hremployee: Record "HRM-Employee C";
        leaveledger: Record "HRM-Leave Ledger";
        leaveJournal: Record "HRM-Employee Leave Journal";
        leaveJournal2: Record "HRM-Employee Leave Journal";
        ints: Integer;
}


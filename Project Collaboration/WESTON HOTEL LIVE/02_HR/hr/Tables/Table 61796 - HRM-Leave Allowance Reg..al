table 61796 "HRM-Leave Allowance Reg."
{

    fields
    {
        field(1; "Employee No"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(2; "First Name"; Text[100])
        {
            CalcFormula = Lookup("HRM-Employee C"."First Name" WHERE("No." = FIELD("Employee No")));
            FieldClass = FlowField;
        }
        field(3; "Middle Name"; Text[100])
        {
            CalcFormula = Lookup("HRM-Employee C"."Middle Name" WHERE("No." = FIELD("Employee No")));
            FieldClass = FlowField;
        }
        field(4; "Last Name"; Text[100])
        {
            CalcFormula = Lookup("HRM-Employee C"."Last Name" WHERE("No." = FIELD("Employee No")));
            FieldClass = FlowField;
        }
        field(5; "Leave Allowance Amount"; Decimal)
        {
        }
        field(6; "Reject Reason"; Text[100])
        {
        }
        field(7; "Payroll Period"; Date)
        {

        }
        field(8; "Allowance Paid"; boolean)
        {
            Editable = false;

        }
        field(9; "No."; code[30])
        {


        }
    }

    keys
    {
        key(Key1; "Employee No", "Payroll Period")
        {
        }
    }

    fieldgroups
    {
    }
    procedure PostLeaveAllowance()
    begin
        /* Message('This Action will delete all leave allowances for ' + Format(dateFilter) + ', \Be sure before continuing!!!');
        if Confirm('Delete all Leave Allowances and Post new?', false) = false then exit; */
        payrolPeriod.Reset;
        payrolPeriod.SetFilter(payrolPeriod.Closed, '=%1', false);
        payrolPeriod.SetFilter(payrolPeriod."Date Opened", '<>%1', 0D);
        if payrolPeriod.Find('-') then begin
            emptrans.Reset;
            emptrans.SetFilter(emptrans."Payroll Period", '=%1', payrolPeriod."Date Opened");
            emptrans.SetRange(emptrans."Transaction Code", 'E005');
            /* if emptrans.Find('-') then begin
                emptrans.DeleteAll;
            end; */

            leaveAll.Reset;
            leaveAll.SetFilter(leaveAll."Payroll Period", '=%1', dateFilter);
            if leaveAll.Find('-') then begin
                repeat
                begin
                    emptrans.Init;
                    emptrans."Employee Code" := leaveAll."Employee No";
                    emptrans."Transaction Code" := 'E005';
                    emptrans."Period Month" := payrolPeriod."Period Month";
                    emptrans."Period Year" := payrolPeriod."Period Year";
                    emptrans."Payroll Period" := payrolPeriod."Date Opened";
                    emptrans."Transaction Name" := 'LEAVE ALLOWANCE';
                    emptrans.Amount := leaveAll."Leave Allowance Amount";
                    emptrans."Recurance Index" := 1;

                    emptrans.Insert();
                end;
                until leaveAll.Next = 0;
                leaveAll."Allowance Paid" := true;
                emps."Paid Leave Allowance" := true;
                Message('Leave Allowances Updated Successfully.');
            end else
                Error('No data to post!');
        end;
    end;




    procedure GetLeaveAllowance()
    var
        prlPeriod: Record "PRL-Payroll Periods";
    begin
        if Confirm('Get Leave Allowance Data?', true) = false then exit;

        prlPeriod.Reset();
        prlPeriod.SetRange(Closed, false);

        if prlPeriod.Find('-') then begin
            // Message(Format(prlPeriod."Period Month"));
            salarycard.Reset();
            salarycard.SetRange("Payroll Period", prlPeriod."Date Opened");
            salarycard.SetRange("Period Month", prlPeriod."Period Month");
            salarycard.SetRange("Period Year", prlPeriod."Period Year");
            if salarycard.Find('-') then begin


                repeat
                begin
                    emps.Reset();
                    emps.SetRange("No.", salarycard."Employee Code");
                    emps.SetRange(Status, emps.Status::Active);
                    emps.SetRange("Paid Leave Allowance", false);
                    if emps.Find('-') then begin
                        repeat
                            emps.CalcFields("Leave Balance");
                            if (emps."Leave Balance" <= 15) then begin
                                leaveAll.init;
                                leaveAll."Leave Allowance Amount" := ((salarycard."Basic Pay") * (1 / 3));
                                leaveAll."Employee No" := salarycard."Employee Code";
                                leaveAll."Payroll Period" := salarycard."Payroll Period";


                                leaveAll.Insert;
                            end;
                        until emps.Next() = 0;
                    end;


                end;
                until salarycard.Next = 0;
                Message('Leave Allowances Amounts obtained!');
            end else
                Error('There are no records in the filter...');
        end;
    end;

    var
        dateFilter: Date;
        payrolPeriod: Record "PRL-Payroll Periods";
        salarycard: record "PRL-Salary Card";
        leaveAll: Record "HRM-Leave Allowance Reg.";
        emps: Record "HRM-Employee C";
        salarygrades: Record "HRM-Job_Salary grade/steps";
        emptrans: Record "PRL-Employee Transactions";
        leavereq: Record "HRM-Leave Requisition";
        TGroup: Text[30];
        TGroupOrder: Integer;
        TSubGroupOrder: Integer;
        Allheader: Record "HRM-Leave Allowance Header";
}


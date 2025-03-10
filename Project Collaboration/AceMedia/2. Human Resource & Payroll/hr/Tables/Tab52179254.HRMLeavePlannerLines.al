table 52179254 "HRM-Leave Planner Lines"
{
    Caption = 'HRM-Leave Planner Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Period; Code[50])
        {
            Editable = false;
            Caption = 'Period';
        }
        field(2; "Employee No"; Code[50])
        {
            Editable = false;
            Caption = 'Employee No';
        }
        field(3; "Leave Type"; Code[50])
        {
            Caption = 'Leave Type';
            TableRelation = "HRM-Leave Types".Code where(Annual = const(true));
        }
        field(4; "S/No"; Integer)
        {
            Caption = 'S/No';
        }
        field(5; "Start Date"; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()
            begin
                leaveperiods.Reset();
                leaveperiods.SetRange(closed, false);
                if leaveperiods.Find('-') then begin
                    if ("Start Date" < leaveperiods."Start Date") or ("Start Date" > leaveperiods."End Date") then error('The start date does not fall within the range of %1..%2', leaveperiods."Start Date", leaveperiods."End Date");
                end else
                    error('No open period!');
                // if  Leaveperiods.ge();
                dates.Reset;
                dates.SetRange(dates."Period Start", "Start Date");
                dates.SetFilter(dates."Period Type", '=%1', dates."Period Type"::Date);
                if dates.Find('-') then
                    if ((dates."Period Name" = 'Sunday') or (dates."Period Name" = 'Saturday')) then begin
                        if (dates."Period Name" = 'Sunday') then
                            Error('You can not start your leave on a Sunday')
                        ELSE
                            IF (dates."Period Name" = 'Saturday') THEN ERROR('You can not start your leave on a Saturday')
                    end;

                // Check if the start date is a holliday
                BaseCalendar.RESET;
                BaseCalendar.SETRANGE(BaseCalendar.Date, "Start Date");
                BaseCalendar.SETFILTER(BaseCalendar."Recurring System", '=%1', BaseCalendar."Recurring System"::"Annual Recurring");
                IF BaseCalendar.FIND('-') THEN BEGIN
                    IF BaseCalendar.Description <> '' THEN
                        ERROR('You can not start your Leave on a Holiday - ''' + BaseCalendar.Description + '''')
                    ELSE
                        ERROR('You can not start your Leave on a Holiday');
                END;
                // For one of Hollidays Like Isther
                BaseCalendar.Reset;
                BaseCalendar.SetFilter(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar");
                BaseCalendar.SetRange(BaseCalendar.Date, "Start Date");
                if BaseCalendar.Find('-') then begin
                    repeat
                        if BaseCalendar.Nonworking = true then begin
                            if BaseCalendar.Description <> '' then
                                Error('You can not start your Leave on a Holiday - ''' + BaseCalendar.Description + '''')
                            else
                                Error('You can not start your Leave on a Holiday');
                        end;
                    until BaseCalendar.Next = 0;
                end;

                // For Annual Holidays
                BaseCalendar.Reset;
                BaseCalendar.SetFilter(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar");
                BaseCalendar.SetRange(BaseCalendar."Recurring System", BaseCalendar."Recurring System"::"Annual Recurring");
                if BaseCalendar.Find('-') then begin
                    repeat
                        if ((Date2DMY("Start Date", 1) = BaseCalendar."Date Day") and (Date2DMY("Start Date", 2) = BaseCalendar."Date Month")) then begin
                            if BaseCalendar.Nonworking = true then begin
                                if BaseCalendar.Description <> '' then
                                    Error('You can not start your Leave on a Holiday - ''' + BaseCalendar.Description + '''')
                                else
                                    Error('You can not start your Leave on a Holiday');
                            end;
                        end;
                    until BaseCalendar.Next = 0;
                end;
                if ("No of Days" <> 0) and ("Start Date" <> 0D) then begin
                    "End Date" := CalcEndDate("Start Date", "No of Days");


                end;
            end;
        }
        field(6; "No of Days"; Decimal)
        {
            Caption = 'No of Days';
        }
        field(7; "End Date"; Date)
        {
            Editable = false;
            Caption = 'End Date';
            trigger onvalidate()
            begin
                leaveperiods.Reset();
                leaveperiods.SetRange(closed, false);
                if leaveperiods.Find('-') then begin
                    if "End Date" > leaveperiods."End Date" then error('The end date is greater than the set date of %2', leaveperiods."Start Date", leaveperiods."End Date");
                end else
                    error('No open period!');
            end;
        }
    }
    keys
    {
        key(PK; Period, "Employee No", "Leave Type", "S/No")
        {
            Clustered = true;
        }
    }
    procedure CalcEndDate(SDate: Date; LDays: Integer) LEndDate: Date
    var
        EndLeave: Boolean;
        DayCount: Integer;
        ltype: Record "HRM-Leave Types";
    begin
        ltype.Reset;
        if ltype.Get("Leave Type") then begin
        end;
        SDate := SDate;//-1;
        EndLeave := false;
        while EndLeave = false do begin
            if not DetermineIfIsNonWorking(SDate, ltype) then
                DayCount := DayCount + 1;
            SDate := SDate + 1;
            if DayCount = LDays then
                EndLeave := true;
        end;
        LEndDate := SDate - 1;

        while DetermineIfIsNonWorking(LEndDate, ltype) = true do begin
            LEndDate := LEndDate + 1;
        end;
    end;

    procedure DetermineIfIsNonWorking(var bcDate: Date; var ltype: Record "HRM-Leave Types") ItsNonWorking: Boolean
    var
        dates: Record Date;
    begin
        Clear(ItsNonWorking);
        GeneralOptions.Find('-');
        //One off Hollidays like Good Friday
        BaseCalendar.Reset;
        BaseCalendar.SetFilter(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar");
        BaseCalendar.SetRange(BaseCalendar.Date, bcDate);
        if BaseCalendar.Find('-') then begin
            if BaseCalendar.Nonworking = true then
                ItsNonWorking := true;
        end;

        // For Annual Holidays
        BaseCalendar.Reset;
        BaseCalendar.SetFilter(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar");
        BaseCalendar.SetRange(BaseCalendar."Recurring System", BaseCalendar."Recurring System"::"Annual Recurring");
        if BaseCalendar.Find('-') then begin
            repeat
            /* if ((Date2DMY(bcDate, 1) = BaseCalendar."Date Day") and (Date2DMY(bcDate, 2) = BaseCalendar."Date Month")) then begin
                if BaseCalendar.Nonworking = true then
                    ItsNonWorking := true;
            end; */
            until BaseCalendar.Next = 0;
        end;

        if ItsNonWorking = false then begin
            // Check if its a weekend
            dates.Reset;
            dates.SetRange(dates."Period Type", dates."Period Type"::Date);
            dates.SetRange(dates."Period Start", bcDate);
            if dates.Find('-') then begin
                //if date is a sunday
                if dates."Period Name" = 'Sunday' then begin
                    //check if Leave includes sunday
                    if ltype."Inclusive of Sunday" = false then ItsNonWorking := true;
                end else
                    if dates."Period Name" = 'Saturday' then begin
                        //check if Leave includes sato
                        if ltype."Inclusive of Saturday" = false then ItsNonWorking := true;
                    end;
            end;
        end;
    end;

    var
        TaskMessage1: Label 'LEAVE RELIEVER';
        Leavereq: Record "HRM-Leave Requisition";

        TaskSubject1: Label 'Dear <b> %1</b> <br> <br> This is to inform you that you have been chosen as the reliever by:<b> %2 </b> in leave No: <b> %3 </b> for a number of<b> %5 <b> days <br><br>Expected return date is %4.<br></br> Kindly Login in to the system to accept.';
        useremail: text[150];
        Availlabledays: Decimal;

        lastNo: Integer;

        EmailMessage: Codeunit "Email Message";

        Email: Codeunit Email;
        Subject: Text;
        Recipients: List of [Text];
        Body: Text;

        enddate2: date;

        GenLedgerSetup: Record "HRM-Setup";
        //RespCenter: Record "FIN-Responsibility Center BR";
        UserMgt: Codeunit "User Setup Management";
        Dimval: Record "Dimension Value";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        Emp3: Record "HRM-Employee C";
        Emp: Record "HRM-Employee C";
        ApprovalMgnt: Codeunit IntCodeunit2;

        BaseCalendar: Record "Base Calendar Change";
        Leaveperiods: record "HRM-Leave Periods";

        CurDate: Date;
        LeaveTypes: Record "HRM-Leave Types";
        DayApp: Decimal;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EndDate: Date;
        BeginDate: Date;
        NextDate: Date;
        varDaysApplied: Integer;
        fDays: Integer;
        ReturnDateLoop: Boolean;
        Employee: Record "HRM-Employee C";
        fEmpNo: Code[30];
        EmpLeaveApps: Record "HRM-Leave Requisition";
        GeneralOptions: Record "HRM-Setup";
        "HR Set Up": Record "HRM-Human Resources Setup.";
        Levels: Integer;
        LEmployee: Record "HRM-Employee C";
        CurrYear: Integer;
        CYSDate: Date;
        CYEDate: Date;
        CurrYearValue: Integer;
        Number: Integer;
        SMTP: Codeunit "Email Message";// replaced "SMTP Mail"
        Names: Text[100];
        objPeriod: Record "PRL-Payroll Periods";
        PayPeriod: Date;
        CurrYearValue2: Integer;
        prCodes: Record "PRL-Transaction Codes";
        prTrans: Record "PRL-Employee Transactions";
        //todo   Payroll: Record "PRL-Salary Card";
        Grd: Code[10];
        hrSetup: Record "HRM-Setup";
        mContent: Text[100];
        mSubject: Text[100];
        nonworking: Decimal;
        CurrDate: Date;
        NONWORKINDAYS: Integer;
        Users2: Record User;
        usersetup: Record "User Setup";
        leaveLedgers: Record "HRM-Leave Ledger";
        Leavedays: Decimal;
        dates: Record Date;
        HRMLeaveTypes: Record "HRM-Leave Types";
}

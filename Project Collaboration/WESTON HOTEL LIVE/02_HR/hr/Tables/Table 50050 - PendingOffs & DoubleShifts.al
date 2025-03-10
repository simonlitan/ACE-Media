table 50052 "PendingOffs & DoubleShifts"
{
    DrillDownPageID = "Pending Offs & Double Shifts";
    LookupPageID = "Pending Offs & Double Shifts";

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; Date; Date)
        {
        }
        field(3; "Employee No"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                if Emp.Get("Employee No") then begin
                    "Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    "Department Code" := emp."Department Code";
                    "Job title" := EMP."Job Title";

                    HOD := emp.HOD;
                    "Phone No" := emp."Work Phone Number";
                    "Phone No" := emp."Home Phone Number";
                end;
            end;
        }
        field(4; "Employee Name"; Text[100])
        {

        }
        field(6; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(7; "Applied Days"; Integer)
        {
            //DecimalPlaces = 0 : 0;

            // trigger OnValidate()
            // begin
            //     CalcFields("Availlable Days");
            //     if ("Availlable Days" = 0) //or ("Availlable Days" > 1))
            //      then begin
            //         //if "Leave Type" = '' then
            //         Error('You entered 0 days!');
            //     end;
            //     if ("Applied Days" <> 0) and ("Off-Day Date" <> 0D) then begin
            //         "End Date" := CalcEndDate("Off-Day Date", "Applied Days");
            //         "Return Date" := CalcReturnDate("End Date");
            //         Validate("Off-Day Date")
            //     end;
            // end;
        }
        field(8; "Off-Day Date"; Date)
        {

            trigger OnValidate()
            begin
                dates.Reset;
                dates.SetRange(dates."Period Start", "Off-Day Date");
                dates.SetFilter(dates."Period Type", '=%1', dates."Period Type"::Date);
                if dates.Find('-') then
                    // if (dates."Period Name" = 'Sunday') /*OR (dates."Period Name"='Saturday'))*/then begin
                    //     if (dates."Period Name" = 'Sunday') then Error('You can not start your leave on a Sunday')
                    //     //ELSE IF (dates."Period Name"='Saturday') THEN ERROR('You can not start your leave on a Saturday')
                    // end;

                    // Check if the start date is a holliday
                    BaseCalendar.RESET;
                BaseCalendar.SETRANGE(BaseCalendar.Date, "Off-Day Date");
                BaseCalendar.SETFILTER(BaseCalendar."Recurring System", '=%1', BaseCalendar."Recurring System"::"Annual Recurring");
                IF BaseCalendar.FIND('-') THEN BEGIN
                    IF BaseCalendar.Description <> '' THEN
                        ERROR('Null! This date is a holiday - ''' + BaseCalendar.Description + '''')
                    ELSE
                        ERROR('You cannot have an off day on a holiday!');
                END;
                // For one of Hollidays Like Isther
                BaseCalendar.Reset;
                BaseCalendar.SetFilter(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar");
                BaseCalendar.SetRange(BaseCalendar.Date, "Off-Day Date");
                if BaseCalendar.Find('-') then begin
                    repeat
                        if BaseCalendar.Nonworking = true then begin
                            if BaseCalendar.Description <> '' then
                                Error('Null! This date is a holiday - ''' + BaseCalendar.Description + '''')
                            else
                                Error('You cannot have an off day on a holiday!');
                        end;
                    until BaseCalendar.Next = 0;
                end;

                // For Annual Holidays
                BaseCalendar.Reset;
                BaseCalendar.SetFilter(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar");
                BaseCalendar.SetRange(BaseCalendar."Recurring System", BaseCalendar."Recurring System"::"Annual Recurring");
                if BaseCalendar.Find('-') then begin
                    repeat
                        if ((Date2DMY("Off-Day Date", 1) = BaseCalendar."Date Day") and (Date2DMY("Off-Day Date", 2) = BaseCalendar."Date Month")) then begin
                            if BaseCalendar.Nonworking = true then begin
                                if BaseCalendar.Description <> '' then
                                    Error('Null! This date is a holiday - ''' + BaseCalendar.Description + '''')
                                else
                                    Error('You cannot have an off day on a holiday!');
                            end;
                        end;
                    until BaseCalendar.Next = 0;
                end;


                if ("Applied Days" <> 0) and ("Off-Day Date" <> 0D) then begin
                    "End Date" := CalcEndDate("Off-Day Date", "Applied Days");
                    "Return Date" := CalcReturnDate("End Date");
                end;

            end;
        }
        field(9; "End Date"; Date)
        {
        }
        field(10; Reason; Text[200])
        {
        }
        field(11; "Request Type"; option)
        {
            //OptionMembers = "Pending Offs","Double Shifts";
            //OptionCaption = 'Pending Offs, Double Shifts';

            OptionMembers = ,"Pending Off","Double Shift";
            OptionCaption = ' ,Pending Off, Double Shift';
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(34; HOD; Boolean)
        {

        }
        field(14; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Cancelled,Posted';
            OptionMembers = Open,Released,"Pending Approval",Cancelled,Posted;

            trigger OnValidate()
            var
                UserMgt: Codeunit "User Setup Management";
                //todo ApprovalMgt: Codeunit "Approvals Management";
                ReqLine: Record "HMS-Setup Blood Group";
                InventorySetup: Record "Inventory Setup";
                GenJnline: Record "Item Journal Line";
                LineNo: Integer;
                Post: Boolean;
                //JournlPosted: Codeunit "Journal Post Successful";
                HasLines: Boolean;
                AllKeyFieldsEntered: Boolean;
                FixedAsset: Record "Fixed Asset";
                //MinorAssetsIssue: Record "HMS-Patient";
                LeaveEntry: Record "PendingOffs DoubleShifts Ldger";
                [InDataSet]
                "No.Editable": Boolean;
                [InDataSet]
                DateEditable: Boolean;
                [InDataSet]
                "Employee NoEditable": Boolean;
                [InDataSet]
                "Department CodeEditable": Boolean;
                [InDataSet]
                "Project CodeEditable": Boolean;
                [InDataSet]
                "Applied DaysEditable": Boolean;
                [InDataSet]
                "Starting DateEditable": Boolean;
                [InDataSet]
                PurposeEditable: Boolean;
                ApprovalEntries: Page "Fin-Approval Entries";
                DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application";
                HREmp: Record "HRM-Employee C";
            begin



            end;
        }
        field(15; "User ID"; Code[30])
        {
        }
        field(16; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

        }
        field(17; Posted; Boolean)
        {
        }
        field(18; "Posted By"; Code[20])
        {
        }
        field(19; "Posting Date"; Date)
        {
        }
        field(21; "Availlable Days"; Decimal)
        {
            //"Availlable Days" := 1;
            DecimalPlaces = 0 : 0;
        }
        field(26; "Available days"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(22; "Return Date"; Date)
        {
        }

        field(46; "Shortcut Dimension  3"; code[50])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(47; "Shortcut dimension 4"; code[50])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(28; "Previous Financial Year"; code[30])
        {


        }

        field(29; "Current Financial Year"; code[30])
        {

        }
        field(30; "Job title"; code[70])
        {
            TableRelation = "HRM-Jobs"."Job Title";
        }

        field(33; "Phone No"; text[30])
        {

        }

    }

    keys
    {
        key(Key1; "No.")
        {
        }
    }

    fieldgroups
    {
    }
    procedure Leavedate()
    var
        Leavereq: record "HRM-Leave Requisition";
        Acctperiods: record "Accounting Period";
    begin
        Leavereq.Reset();
        Leavereq.SetRange("Employee No", Rec."No.");
        Leavereq.SetRange(Status, Leavereq.Status::Posted);
        if Leavereq.Find('-') then begin
            Acctperiods.SetRange("New Fiscal Year", True);
            SetFilter(Date, '>%1', Acctperiods."Starting Date");
            SetFilter(Date, '<%1', enddate2);
            enddate2 := CalcDate('1Y', Acctperiods."Starting Date");


        end;

    end;

    trigger OnDelete()
    begin
        if Status <> Status::Open then Error('You can only delete a document if its status is still Open!')
    end;

    trigger OnInsert()
    begin



        if "No." = '' then begin
            GenLedgerSetup.Get();
            GenLedgerSetup.TestField(GenLedgerSetup."Leave Application Nos.");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Leave Application Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        "User ID" := UserId;
        Date := Today;
        Status := Status::Open;
        rec.SETRANGE(rec."User ID", USERID);
        rec.SETRANGE(rec.Status, Rec.Status::Open);
        IF rec.COUNT > 0 THEN BEGIN
            ERROR('There are still some pending applications in your account. Please use the pending application first');
        END;
        rec.SETRANGE(rec."User ID", USERID);
        rec.SETRANGE(rec.Status, Rec.Status::"Pending Approval");
        IF rec.COUNT > 0 THEN BEGIN
            ERROR('There are still some pending applications in your account. Please use the pending application first');
        END;

        if usersetup.Get(UserId) then begin
            /*  if usersetup."Staff No" = '' then
                 Error('You are not authorized to use the leave application page. Please consult the system administrator.');
             if Employee.Get(CopyStr(usersetup."Staff No", 4, ((StrLen(usersetup."Staff No")) - 3))) then begin
                 "Employee No" := Employee."No.";
                 Validate("Employee No");
                 "Department Code" := usersetup."Global Dimension 1 Code";
                 "Project Code" := usersetup."Global Dimension 2 Code";
                 Date := Today;
             end; */
        end;
    end;

    var
        enddate2: date;
        lastNo: Integer;
        GenLedgerSetup: Record "HRM-Setup";
        //RespCenter: Record "FIN-Responsibility Center BR";
        UserMgt: Codeunit "User Setup Management";
        Dimval: Record "Dimension Value";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        Emp3: Record "HRM-Employee C";
        Emp: Record "HRM-Employee C";
        "Employee Leaves": Record "HRM-Emp. Leaves";
        BaseCalendar: Record "Base Calendar Change";
        CurDate: Date;
        //LeaveTypes: Record "HRM-Leave Types";
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
        leaveLedgers: Record "PendingOffs DoubleShifts Ldger";
        dates: Record Date;

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

    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    var
        ltype: Record "HRM-Leave Types";
    begin
        ltype.Reset;
        // if ltype.Get("Leave Type") then begin
        // end;
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
        //if //DetermineIfIncludesNonWorking("Leave Type") = false then 
        begin
            fReturnDate := CalcDate('1D', fReturnDate);
            if DetermineIfIsNonWorking(fReturnDate, ltype) then begin
                varDaysApplied := varDaysApplied + 1;
            end else
                varDaysApplied := varDaysApplied;
            varDaysApplied := varDaysApplied + 1
        end
        // else 
        // begin
        //     fReturnDate := CalcDate('1D', fReturnDate);
        //     varDaysApplied := varDaysApplied - 1;
        // end;
        until varDaysApplied = 0;
        exit(fReturnDate);
    end;

    procedure DeterminethisLeaveEndDate(var fDate: Date) fEndDate: Date
    var
        ltype: Record "HRM-Leave Types";
    begin
        // if ltype.Get("Leave Type") then 
        begin
        end;
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('1D', fEndDate);
            while (ReturnDateLoop) do begin
                if DetermineIfIsNonWorking(fEndDate, ltype) then
                    fEndDate := CalcDate('-1D', fEndDate)
                else
                    ReturnDateLoop := false;
            end
        end;
        exit(fEndDate);
    end;

    procedure GetPayPeriod()
    begin
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then
            PayPeriod := objPeriod."Date Opened";
    end;

    procedure CalcEndDate(SDate: Date; LDays: Integer) LEndDate: Date
    var
        EndLeave: Boolean;
        DayCount: Integer;
        ltype: Record "HRM-Leave Types";
    begin
        ltype.Reset;
        //if ltype.Get("Leave Type") then 
        begin
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

    procedure CalcReturnDate(EndDate: Date) RDate: Date
    var
        EndLeave: Boolean;
        DayCount: Integer;
        LEndDate: Date;
        ltype: Record "HRM-Leave Types";
    begin
        //if ltype.Get("Leave Type") then 
        begin
        end;
        /*  EndLeave:=FALSE;
         EndDate:=EndDate+1;
         LEndDate:=EndDate;
         CLEAR(DayCount);
         WHILE EndLeave=FALSE DO BEGIN
         IF NOT DetermineIfIsNonWorking(EndDate,ltype) THEN BEGIN
         DayCount:=DayCount+1;
         EndDate:=EndDate+1;

         END ELSE BEGIN
         EndLeave:=TRUE;
         END;
         END;
           */
        RDate := EndDate + 1;
        while DetermineIfIsNonWorking(RDate, ltype) = true do begin
            RDate := RDate + 1;
        end;

    end;

    procedure GetDate(var Applied_Dayes: Integer; var Start_Date: Date)
    var
        DaysCount: Integer;
        NewDate: Date;
        Last_is_WotkingDay: Boolean;
    begin
        /*clear(DaysCount);
        clear(NewDate);
         NewDate:=Start_Date;
        repeat
        DaysCount:=DaysCount+1;
        Last_is_WotkingDay:=false;
        
        until (() AND ()) */

    end;

    procedure ItsHolliday(var Start_Date: Date) holliday: Boolean
    var
        baseCal: Record "Base Calendar Change";
        days: Integer;
        Months: Integer;
        bool_Non_Working: Boolean;
    begin
        Clear(days);
        Clear(Months);
        Clear(bool_Non_Working);
        days := Date2DMY(Start_Date, 1);
        Months := Date2DMY(Start_Date, 2);
        baseCal.Reset;
        baseCal.SetFilter(baseCal."Recurring System", '=%1', baseCal."Recurring System"::"Annual Recurring");
        if baseCal.Find('-') then begin
            repeat
                if ((Months = Date2DMY(baseCal.Date, 1)) and (days = Date2DMY(baseCal.Date, 1))) then bool_Non_Working := true;
            until ((((Months = Date2DMY(baseCal.Date, 1)) and (days = Date2DMY(baseCal.Date, 1)))) or (baseCal.Next = 0))
        end;
    end;

    procedure ItsSunday(var Start_Date: Date; var LeaveType: Integer)
    var
        leave_types: Record "HRM-Leave Types";
        dates: Record Date;
    begin
    end;
}


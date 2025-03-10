codeunit 52178889 Staffportal
{
    var
        PayslipYears: Record "PRL-Payroll Periods";
        ResponsibilityCentre: Record "Responsibility Center";
        EmployeeCard: Record "HRM-Employee C";
        LeaveRequisition: Record "HRM-Leave Requisition";
        HRMLeaveTypes: Record "HRM-Leave Types";
        HRMLeaveLedger: Record "HRM-Leave Ledger";
        HRMLeavePeriod: Record "HRM-Leave Periods";
        NoSeriesMngnt: Codeunit NoSeriesManagement;
        HRMTrainingRequisition: Record "HRM-Training Applications";
        HRMTrainingParticipants: Record "HRM-Training Participants";
        HRMTrainingCourses: Record "HRM-Training Courses";
        CountryRegion: Record "Country/Region";
        BaseCalendar: Record "Base Calendar Change";
        HRSetup: Record "HRM-Setup";
        P9: Record "PRL-Employee P9 Info";

        ApprovalMngnt: Codeunit "Init Code";
        ApprovalMngnt2: Codeunit "IntCodeunit2";
        Dates: Record Date;
        PurchasePayables: Record "Purchases & Payables Setup";
        CashOfficeSetup: Record "Cash Office Setup";
        StoreRequisitionHeader: Record "PROC-Store Requistion Header";
        StoreRequisitionLines: Record "PROC-Store Requistion Lines";
        ItemCard: Record Item;
        ItemLeaderEntries: Record "Item Ledger Entry";
        FixedAssets: Record "Fixed Asset";
        EndLeave: Boolean;
        DayCount: Integer;
        varDaysApplied: Decimal;
        availableDays: Decimal;
        ImprestHeader: Record "FIN-Imprest Header";
        ImprestLines: Record "FIN-Imprest Lines";
        ImprestSurrenderHeader: Record "FIN-Imprest Surr. Header";
        ImprestSurrenderLines: Record "FIN-Imprest Surrender Details";
        ClaimRequisition: Record "FIN-Staff Claims Header";
        ClaimLines: Record "FIN-Staff Claim Lines";
        FinReceiptsPaymentTypes: Record "FIN-Receipts and Payment Types";
        PettyCashHeader: Record "Advance PettyCash Header";
        PettyCashLines: Record "Advance PettyCash Lines";
        PettyCashSurrenderHeader: Record "PettyCash Surrender Header";
        PettyCashSurrenderLines: Record "PettyCash Surrender Details";
        GlAccount: Record "G/L Account";
        PrlSalaryCard: Record "PRL-Salary Card";
        VendorCard: Record Vendor;
        FILEPATH_S: Label 'C:\inetpub\wwwroot\KSAPortals\KSAStaff\Downloads\';

        FILEPATH_S2: Label 'D:\KSA\KSAStaff\KSAStaff\Downloads\';

    procedure CheckValidStaffNo(username: Text) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            Message := 'Valid';
        end else begin
            Message := 'Invalid';
        end;
    end;

    procedure CheckStaffPasswordChanged(username: Text) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            if EmployeeCard."Changed Password" = true then begin
                Message := Format(EmployeeCard."Changed Password");
            end else begin
                Message := Format(EmployeeCard."Changed Password");
            end;
        end;
    end;

    procedure StaffLogin(username: Text; password: Text) Message: Text
    var
        fullNames: Text;
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            if EmployeeCard."Portal Password" = password then begin
                if EmployeeCard.Status = EmployeeCard.Status::Active then begin
                    fullNames := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
                    Message := 'SUCCESS' + '::' + EmployeeCard."No." + '::' + fullNames;
                end else begin
                    Message := 'Your account is inactive. Please contact the system administrator' + '::';
                end;
            end else begin
                Message := 'Incorrect password' + '::';
            end;
        end else begin
            Message := 'Invalid Staff No' + '::';
        end;
    end;

    procedure LoginForUnchnagedPassword(username: Text) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            if EmployeeCard.Status = EmployeeCard.Status::Active then begin
                Message := 'SUCCESS' + '::' + EmployeeCard."No." + '::' + EmployeeCard."Company E-Mail";
            end else begin
                Message := 'Your account is inactive. Please contact the system administrator' + '::';
            end;
        end else begin
            Message := 'Invalid Staff No' + '::';
        end;
    end;

    procedure UpdateStaffPassword(username: Text; genpass: Text) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            EmployeeCard."Portal Password" := genpass;
            EmployeeCard.Password := genpass;
            EmployeeCard."Changed Password" := true;
            if EmployeeCard.Modify() then begin
                Message := 'SUCCESS';
            end else begin
                Message := 'FAILED';
            end;
        end;
    end;

    procedure GetStaffEmail(username: Text) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            Message := EmployeeCard."Company E-Mail" + '::' + EmployeeCard."E-Mail";
        end;
    end;

    procedure GetStaffPassword(username: Text) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            Message := EmployeeCard."Portal Password";
        end;
    end;

    procedure GetStaffGender(username: Text) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            Message := Format(EmployeeCard.Gender);
        end;
    end;

    procedure GetStaffDetails(username: Text) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            Message := 'SUCCESS' + '::' + EmployeeCard."No." + '::' + Format(EmployeeCard.Gender) + '::' + EmployeeCard."ID Number" + '::' + EmployeeCard."E-Mail" + '::' + EmployeeCard."Company E-Mail" + '::' + EmployeeCard."Home Phone Number" + '::' + GetStaffCitizenship(EmployeeCard.Citizenship) + '::' + EmployeeCard."Post Code" + '::' + EmployeeCard."Postal Address" + '::' + EmployeeCard."Job Title";
        end;
    end;

    procedure GetStaffDepartmentDetails(username: Text) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            Message := 'SUCCESS' + '::' + EmployeeCard."Global Dimension 1 Code" + '::' + EmployeeCard."Global Dimension 2 Code";
        end;
    end;

    procedure GetStaffCitizenship(code: Text) Message: Text
    begin
        CountryRegion.Reset();
        CountryRegion.SetRange(CountryRegion.Code, code);
        if CountryRegion.Find('-') then begin
            Message := CountryRegion.Name;
        end;
    end;

    procedure CalcReturnDate(EndDate: Date; "Leave Type": Text) RDate: Date
    begin
        IF HRMLeaveTypes.GET("Leave Type") THEN BEGIN
        END;
        RDate := EndDate + 1;
        WHILE DetermineIfIsNonWorking(RDate, "Leave Type") = TRUE DO BEGIN
            RDate := RDate + 1;
        END;
    end;

    procedure ValidateStartDate("Starting Date": Date)
    begin
        dates.Reset();
        dates.SETRANGE(dates."Period Start", "Starting Date");
        dates.SETFILTER(dates."Period Type", '=%1', dates."Period Type"::Date);
        IF dates.FIND('-') THEN
            IF ((dates."Period Name" = 'Sunday') OR (dates."Period Name" = 'Saturday')) THEN BEGIN
                IF (dates."Period Name" = 'Sunday') THEN
                    ERROR('You can not start your leave on a Sunday')
                ELSE
                    IF (dates."Period Name" = 'Saturday') THEN ERROR('You can not start your leave on a Saturday')
            END;

        BaseCalendar.Reset();
        BaseCalendar.SETFILTER(BaseCalendar."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendar.SETRANGE(BaseCalendar.Date, "Starting Date");
        IF BaseCalendar.FIND('-') THEN BEGIN
            REPEAT
                IF BaseCalendar.Nonworking = TRUE THEN BEGIN
                    IF BaseCalendar.Description <> '' THEN
                        ERROR('You can not start your Leave on a Holiday - ''' + BaseCalendar.Description + '''')
                    ELSE
                        ERROR('You can not start your Leave on a Holiday');
                END;
            UNTIL BaseCalendar.NEXT = 0;
        END;

        // For Annual Holidays
        BaseCalendar.Reset();
        BaseCalendar.SETFILTER(BaseCalendar."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendar.SETRANGE(BaseCalendar."Recurring System", BaseCalendar."Recurring System"::"Annual Recurring");
        IF BaseCalendar.FIND('-') THEN BEGIN
            REPEAT
                IF ((DATE2DMY("Starting Date", 1) = BaseCalendar."Date Day") AND (DATE2DMY("Starting Date", 2) = BaseCalendar."Date Month")) THEN BEGIN
                    IF BaseCalendar.Nonworking = TRUE THEN BEGIN
                        IF BaseCalendar.Description <> '' THEN
                            ERROR('You can not start your Leave on a Holiday - ''' + BaseCalendar.Description + '''')
                        ELSE
                            ERROR('You can not start your Leave on a Holiday');
                    END;
                END;
            UNTIL BaseCalendar.NEXT = 0;
        END;
    end;

    procedure CalcEndDate(SDate: Date; LDays: Integer; "Leave Type": Text) LEndDate: Date
    begin
        SDate := SDate;
        EndLeave := FALSE;
        DayCount := 1;
        WHILE EndLeave = FALSE DO BEGIN
            IF NOT DetermineIfIsNonWorking(SDate, "Leave Type") THEN
                DayCount := DayCount + 1;
            SDate := SDate + 1;
            IF DayCount > LDays THEN
                EndLeave := TRUE;
        END;
        LEndDate := SDate - 1;

        WHILE DetermineIfIsNonWorking(LEndDate, "Leave Type") = TRUE DO BEGIN
            LEndDate := LEndDate + 1;
        END;
    end;

    procedure DetermineIfIsNonWorking(VAR bcDate: Date; VAR "Leave Type": Text) ItsNonWorking: Boolean
    begin
        CLEAR(ItsNonWorking);
        HRSetup.FIND('-');
        //One off Hollidays like Good Friday
        BaseCalendar.Reset();
        BaseCalendar.SETFILTER(BaseCalendar."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendar.SETRANGE(BaseCalendar.Date, bcDate);
        IF BaseCalendar.FIND('-') THEN BEGIN
            IF BaseCalendar.Nonworking = TRUE THEN
                ItsNonWorking := TRUE;
        END;

        // For Annual Holidays
        BaseCalendar.Reset();
        BaseCalendar.SETFILTER(BaseCalendar."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendar.SETRANGE(BaseCalendar."Recurring System", BaseCalendar."Recurring System"::"Annual Recurring");
        IF BaseCalendar.FIND('-') THEN BEGIN
            REPEAT
                IF ((DATE2DMY(bcDate, 1) = BaseCalendar."Date Day") AND (DATE2DMY(bcDate, 2) = BaseCalendar."Date Month")) THEN BEGIN
                    IF BaseCalendar.Nonworking = TRUE THEN
                        ItsNonWorking := TRUE;
                END;
            UNTIL BaseCalendar.NEXT = 0;
        END;
        IF ItsNonWorking = FALSE THEN BEGIN
            // Check if its a weekend
            dates.Reset();
            dates.SETRANGE(dates."Period Type", dates."Period Type"::Date);
            dates.SETRANGE(dates."Period Start", bcDate);
            IF dates.FIND('-') THEN BEGIN
                //if date is a sunday
                IF dates."Period Name" = 'Sunday' THEN BEGIN
                    //check if Leave includes sunday
                    HRMLeaveTypes.Reset();
                    HRMLeaveTypes.SETRANGE(HRMLeaveTypes.Code, "Leave Type");
                    IF HRMLeaveTypes.FIND('-') THEN BEGIN
                        IF HRMLeaveTypes."Inclusive of Sunday" = FALSE THEN ItsNonWorking := TRUE;
                    END;
                END ELSE
                    IF dates."Period Name" = 'Saturday' THEN BEGIN
                        //check if Leave includes sato
                        HRMLeaveTypes.Reset();
                        HRMLeaveTypes.SETRANGE(HRMLeaveTypes.Code, "Leave Type");
                        IF HRMLeaveTypes.FIND('-') THEN BEGIN
                            IF HRMLeaveTypes."Inclusive of Saturday" = FALSE THEN ItsNonWorking := TRUE;
                        END;
                    END;

            END;
        END;
    end;

    procedure GetDocResponsibilityCentres(grouping: Text) Message: Text


    begin
        ResponsibilityCentre.Reset();
        ResponsibilityCentre.SetRange(ResponsibilityCentre.Grouping, grouping);

        if ResponsibilityCentre.Find('-') then begin
            /*repeat
                Message += ResponsibilityCentre.Code + '::' + ResponsibilityCentre.Name + '[]';
            until ResponsibilityCentre.Next() = 0;*/
            Message := ResponsibilityCentre.Code + '[]';
        end;

    end;

    procedure GetRelievers() Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(Status, EmployeeCard.Status::Active);
        EmployeeCard.SetRange("On Leave", false);
        if EmployeeCard.Find('-') then begin
            repeat
                Message += EmployeeCard."No." + '::' + EmployeeCard."First Name" + ' ' + EmployeeCard."Last Name" + '[]';
            until
            EmployeeCard.Next() = 0;
        end;

    end;
    procedure GetCustomers() Message: Text
    var 
    customerlist: Record "Customer";
    begin
        customerlist.Reset();
        if customerlist.Find('-') then begin
            repeat
                Message += customerlist."No." + '::' + customerlist."Name" + '[]';
            until
            customerlist.Next() = 0;
        end;
    end;

    procedure GetRelieverEmail(StaffNum: Text) Message: Text;
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange("No.", StaffNum);
        if EmployeeCard.Find('-') then
            Message := EmployeeCard."E-Mail"
        else
            Message := 'Not found';
    end;

    procedure GetLeaveTypes(gender: Text) Message: Text
    var
        LeaveTypes: Record "HRM-Leave Types";
        LeaveTypeList: Text;
        GenderOption: Integer;
    begin
        LeaveTypeList := '';
        LeaveTypes.Reset();

        case gender of
            'Male':
                GenderOption := 1;
            'Female':
                GenderOption := 2;
            else
                GenderOption := 0;
        end;

        LeaveTypes.SetFilter(Gender, '0|%1', GenderOption);
        // LeaveTypes.SetFilter(Code, '<> %1', 'ANNUAL LEAVE');

        if LeaveTypes.FindSet() then begin
            repeat
                if LeaveTypeList <> '' then
                    LeaveTypeList := LeaveTypeList + '|';
                LeaveTypeList := LeaveTypeList + LeaveTypes.Code + '::' + LeaveTypes.Description; // Concatenate Code and Description
            until LeaveTypes.Next() = 0;
        end;

        Message := LeaveTypeList;
        exit(Message);
    end;

    procedure GetLeaveTypes1(gender: Text) Message: Text
    var
        LeaveTypes: Record "HRM-Leave Types";
        LeaveTypeList: Text;
        GenderOption: Integer;
    begin
        LeaveTypeList := '';
        LeaveTypes.Reset();

        case gender of
            'Male':
                GenderOption := 1;
            'Female':
                GenderOption := 2;
            else
                GenderOption := 0;
        end;

        LeaveTypes.SetFilter(Gender, '0|%1', GenderOption);
        // LeaveTypes.SetFilter(Code, '<> %1', 'ANNUAL LEAVE');
        // LeaveTypes.SetFilter(code, '<> %1', 'OFF DAY');

        if LeaveTypes.FindSet() then begin
            repeat
                if LeaveTypeList <> '' then
                    LeaveTypeList := LeaveTypeList + '|';
                LeaveTypeList := LeaveTypeList + LeaveTypes.Code + '::' + LeaveTypes.Description; // Concatenate Code and Description
            until LeaveTypes.Next() = 0;
        end;

        Message := LeaveTypeList;
        exit(Message);
    end;

    procedure DetermineLeaveReturnDate(fBeginDate: Date; fDays: Decimal; "Leave Type": Text) fReturnDate: Date
    begin
        HRMLeaveTypes.Reset();
        IF HRMLeaveTypes.GET("Leave Type") THEN BEGIN
        END;
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        REPEAT
            IF DetermineIfIncludesNonWorking("Leave Type") = FALSE THEN BEGIN
                fReturnDate := CALCDATE('1D', fReturnDate);
                IF DetermineIfIsNonWorking(fReturnDate, "Leave Type") THEN BEGIN
                    varDaysApplied := varDaysApplied + 1;
                END ELSE
                    varDaysApplied := varDaysApplied;
                varDaysApplied := varDaysApplied + 1
            END
            ELSE BEGIN
                fReturnDate := CALCDATE('1D', fReturnDate);
                varDaysApplied := varDaysApplied - 1;
            END;
        UNTIL varDaysApplied = 0;
        EXIT(fReturnDate);
    end;

    procedure DetermineIfIncludesNonWorking(VAR fLeaveCode: Text): Boolean
    begin
        IF HRMLeaveTypes.GET(fLeaveCode) THEN BEGIN
            IF HRMLeaveTypes."Inclusive of Non Working Days" = TRUE THEN
                EXIT(TRUE);
        END;
    end;

    procedure GetMyleaveApplications(username: Text) Message: Text
    begin
        LeaveRequisition.Reset();
        LeaveRequisition.SetRange(LeaveRequisition."Employee No", username);
        if LeaveRequisition.Find('-') then begin
            repeat
                Message += LeaveRequisition."No." + '::' + LeaveRequisition."Leave Type" + '::' + Format(LeaveRequisition."Applied Days") + '::' + Format(LeaveRequisition.Date) + '::' + Format(LeaveRequisition."Starting Date") + '::' + Format(LeaveRequisition."End Date") + '::' + Format(LeaveRequisition."Return Date") + '::' + Format(LeaveRequisition.Status) + '[]'
            until LeaveRequisition.Next() = 0;
        end;
    end;

    procedure HasPendingLeaveApplication(username: Text) Message: Text;
    begin
        LeaveRequisition.Reset();
        LeaveRequisition.SetRange(LeaveRequisition."Employee No", username);
        LeaveRequisition.SetRange(LeaveRequisition.Status, LeaveRequisition.Status::"Pending Approval");
        if LeaveRequisition.Find('-') then begin
            Message := 'Yes';
        end;
    end;

    procedure AvailableLeaveDayss(username: Text; leaveType: Text) Message: Text
    var
        Year: Code[20];
    begin
        HRMLeavePeriod.Reset();
        HRMLeavePeriod.SetRange(HRMLeavePeriod.Current, true);
        HRMLeavePeriod.SetRange(HRMLeavePeriod.Closed, false);
        if HRMLeavePeriod.Find('-') then begin
            HRMLeaveLedger.Reset();
            HRMLeaveLedger.SetRange(HRMLeaveLedger."Employee No", username);
            HRMLeaveLedger.SetRange(HRMLeaveLedger."Leave Type", leaveType);
            // HRMLeaveLedger.SetRange(HRMLeaveLedger."Current Leave Period", HRMLeavePeriod.Year);
            if HRMLeaveLedger.Find('-') then begin
                Clear(availableDays);
                repeat
                    HRMLeaveLedger.CalcSums("No. of Days");
                    availableDays := availableDays + HRMLeaveLedger."No. of Days";
                until HRMLeaveLedger.Next() = 0;
            end;
            Message := Format(availableDays);
        end;
    end;

    procedure AvailableLeaveDays1(username: Text; leaveType: Text) Message: Text
    begin
        HRMLeaveLedger.reset();
        HRMLeaveLedger.SetRange(HRMLeaveLedger."Employee No", username);
        HRMLeaveLedger.SetRange(HRMLeaveLedger."Leave Type", leaveType);
        if HRMLeaveLedger.Find('-') then begin
            Clear(availableDays);
            repeat
                availableDays := availableDays + HRMLeaveLedger."No. of Days";
            until HRMLeaveLedger.Next() = 0;
        end;
        Message := Format(availableDays);
    end;


    procedure AvailableLeaveDays(EmployeeNo: Text; LeaveType: Text) availabledays: Text
    // procedure AvailableLeaveDays(EmployeeNo: Text; LeaveType: Text; CurrentLeavePeriod: Code[10]) availabledays: Text
    Var
        LeavePeriods: Record "HRM-Leave Periods";
        LvTypes: Record "HRM-Leave Types";
        daysInteger: Decimal;
    //Year: Code[30];
    begin
        CLEAR(availabledays);
        CLEaR(daysInteger);
        LvTypes.Reset();
        LvTypes.SetRange(Code, LeaveType);
        if LvTypes.Find('-') then begin
            if LvTypes."Annual" = false then begin
                HRMLeaveLedger.Reset();
                HRMLeaveLedger.SetRange("Employee No", EmployeeNo);
                HRMLeaveLedger.SetRange("Leave Type", LeaveType);
                //HRMLeaveLedger.SetFilter("Current Leave Period", currentleaveperiod);
                if HRMLeaveLedger.Find('-') then
                    HRMLeaveLedger.CalcSums("No. of Days");
                daysInteger := LvTypes.Days + HRMLeaveLedger."No. of Days";
            end else begin
                HRMLeaveLedger.Reset();
                HRMLeaveLedger.SetRange("Employee No", EmployeeNo);
                HRMLeaveLedger.SetRange("Leave Type", LeaveType);
                //HRMLeaveLedger.SetFilter("Current Leave Period", currentleaveperiod);
                if HRMLeaveLedger.Find('-') then begin
                    HRMLeaveLedger.CalcSums("No. of Days");
                    daysInteger := HRMLeaveLedger."No. of Days";
                end;
            end;
            availabledays := FORMAT(daysInteger);
        end;
        /*   LeaveLE.Reset();
          LeaveLE.SETRANGE(LeaveLE."Employee No", EmployeeNo);
          LeaveLE.SETRANGE(LeaveLE."Leave Type", LeaveType);
          LeaveLE.SETRANGE(LeaveLE."Current Leave Period", CurrentLeavePeriod);
          IF LeaveLE.FIND('-') THEN
              REPEAT
              BEGIN
                  LeaveLE.CalcSums("No. of Days");
                  daysInteger := daysInteger + LeaveLE."No. of Days"
                  // availabledays:=FORMAT(LeaveLE."No. of Days");
              END;
              UNTIL LeaveLE.NEXT = 0;
          availabledays := FORMAT(daysInteger); */
    end;

    procedure GetDefaultDays(LeaveType: Text) Message: Text
    var
        LeaveTypes: Record "HRM-Leave Types";
    begin
        LeaveTypes.Reset();
        LeaveTypes.SetRange(LeaveTypes.Code, LeaveType);
        if LeaveTypes.Find('-') then
            Message := Format(LeaveTypes.Days)
    end;

    procedure GetLeaveDetails(LeaveNo: Code[20]) ReturnMsg: Text;
    begin
        LeaveRequisition.Reset();
        LeaveRequisition.SetRange(LeaveRequisition."No.", LeaveNo);

        if (LeaveRequisition.Find('-')) then begin
            ReturnMsg := LeaveRequisition."Employee No" + ':' + LeaveRequisition."Employee Name" + ':' + FORMAT(LeaveRequisition."Date") + ':' + FORMAT(LeaveRequisition."Applied Days") + ':' + FORMAT(LeaveRequisition."Starting Date") + ':' + FORMAT(LeaveRequisition."End Date") + ':' + LeaveRequisition."Purpose" + ':' + LeaveRequisition."Leave Type" + ':' + FORMAT(LeaveRequisition."Return Date") + ':' + LeaveRequisition."User ID" + ':' + LeaveRequisition."Reliever No." + ':' + LeaveRequisition."Reliever Name" + ':' + LeaveRequisition."Department Code";
        end else begin
            ReturnMsg := 'Leave Does Not Exist' + '::';
        end

    end;

    procedure IsLeaveAnnual(leaveType: Text) Message: Text
    begin
        HRMLeaveTypes.Reset();
        HRMLeaveTypes.SetRange(HRMLeaveTypes.Code, leaveType);
        if HRMLeaveTypes.Find('-') then begin
            Message := Format(HRMLeaveTypes.Annual);
        end;
    end;

    procedure GetEmployeeName(employeeCode: Text) Message: Text
    var
        EmployeeCard: Record "HRM-Employee C";
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", employeeCode);
        if EmployeeCard.Find('-') then begin
            Message := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
        end;
    end;


    procedure HRMLeaveApplication1(leaveNo: Code[20]; username: Text; reliever: Text; leaveType: Text; appliedDays: Decimal; startDate: Date; endDate: Date; returnDate: Date; purpose: Text; responsibilityCenter: Text) Message: Text
    var
        NextLeaveNo: Text;
    begin
        HRSetup.Get();

        // Check if Leave No. is provided
        if leaveNo <> '' then begin
            // Attempt to find an existing record by Leave No.
            LeaveRequisition.Reset();
            LeaveRequisition.SetRange("No.", leaveNo);

            if LeaveRequisition.FindFirst() then begin
                // Record exists, update it
                LeaveRequisition."Reliever No." := reliever;
                LeaveRequisition.Validate("Reliever No.");
                LeaveRequisition."Applied Days" := appliedDays;
                LeaveRequisition."Starting Date" := startDate;
                LeaveRequisition."End Date" := endDate;
                LeaveRequisition."Return Date" := returnDate;
                LeaveRequisition.Purpose := purpose;
                LeaveRequisition."Responsibility Center" := responsibilityCenter;
                LeaveRequisition."User ID" := UserId;
                LeaveRequisition.Date := Today();

                EmployeeCard.Reset();
                EmployeeCard.SetRange(EmployeeCard."No.", username);
                if EmployeeCard.Find('-') then begin
                    LeaveRequisition."Department Code" := EmployeeCard."Global Dimension 1 Code";
                    // LeaveRequisition."Global Dimension 2 Code" := EmployeeCard."Global Dimension 2 Code";
                end;

                if LeaveRequisition.Modify() then
                    // Message := 'SUCCESS:: Record updated with No. ' + LeaveRequisition."No."
                    Message := 'SUCCESS' + '::' + LeaveRequisition."No."

                else
                    Message := 'FAILED' + '::';
                exit;
            end else begin
                Message := 'FAILED' + '::' + leaveNo + ' not found.';
                exit;
            end;
        end;

        // Insert a new record if Leave No. is not provided
        NextLeaveNo := NoSeriesMngnt.GetNextNo(HRSetup."Leave Application Nos.", 0D, true);
        LeaveRequisition.Init();
        LeaveRequisition."No." := NextLeaveNo;
        LeaveRequisition."No. Series" := HRSetup."Leave Application Nos.";
        LeaveRequisition."Employee No" := username;
        LeaveRequisition.Validate("Employee No");
        LeaveRequisition."Reliever No." := reliever;
        LeaveRequisition.Validate("Reliever No.");
        LeaveRequisition."Leave Type" := leaveType;
        LeaveRequisition."Applied Days" := appliedDays;
        LeaveRequisition."Starting Date" := startDate;
        LeaveRequisition."End Date" := endDate;
        LeaveRequisition."Return Date" := returnDate;
        LeaveRequisition.Purpose := purpose;
        LeaveRequisition."Responsibility Center" := responsibilityCenter;
        LeaveRequisition."User ID" := UserId;
        LeaveRequisition.Date := Today();

        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            LeaveRequisition."Department Code" := EmployeeCard."Global Dimension 1 Code";
            // LeaveRequisition."Global Dimension 2 Code" := EmployeeCard."Global Dimension 2 Code";
        end;

        if LeaveRequisition.Insert() then
            Message := 'SUCCESS' + '::' + LeaveRequisition."No."
        else
            Message := 'FAILED' + '::';
    end;

    procedure HRMLeaveApplication(username: Text; reliever: Text; leaveType: Text; appliedDays: Decimal; startDate: Date; endDate: Date; returnDate: Date; purpose: Text; responsibilityCenter: Text) Message: Text
    var
        NextLeaveNo: Text;
    begin
        HRSetup.Get();
        NextLeaveNo := NoSeriesMngnt.GetNextNo(HRSetup."Leave Application Nos.", 0D, true);
        LeaveRequisition.Init();
        LeaveRequisition."No." := NextLeaveNo;
        LeaveRequisition."No. Series" := HRSetup."Leave Application Nos.";
        LeaveRequisition."Employee No" := username;
        LeaveRequisition.Validate("Employee No");
        LeaveRequisition."Reliever No." := reliever;
        LeaveRequisition.Validate("Reliever No.");
        LeaveRequisition."Leave Type" := leaveType;
        LeaveRequisition."Applied Days" := appliedDays;
        LeaveRequisition."Starting Date" := startDate;
        LeaveRequisition."End Date" := endDate;
        LeaveRequisition."Return Date" := returnDate;
        LeaveRequisition.Purpose := purpose;
        LeaveRequisition."Responsibility Center" := responsibilityCenter;
        LeaveRequisition."User ID" := UserId;
        LeaveRequisition."No. Series" := HRSetup."Leave Application Nos.";
        LeaveRequisition.Date := Today();

        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            LeaveRequisition."Department Code" := EmployeeCard."Global Dimension 1 Code";
            // LeaveRequisition."Global Dimension 2 Code" := EmployeeCard."Global Dimension 2 Code";
        end;

        if LeaveRequisition.Insert() then begin
            Message := 'SUCCESS' + '::' + LeaveRequisition."No.";
        end else begin
            Message := 'FAILED' + '::';
        end;
    end;

    procedure GetLeaveRelieverDetails(relieverNo: Text) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", relieverNo);
        if EmployeeCard.Find('-') then begin
            Message := EmployeeCard."No." + '::' + EmployeeCard."E-Mail" + '::' + EmployeeCard."Company E-Mail";
        end;
    end;

    procedure OnsendLeaveRequisitionForApproval(leaveNo: Text) Message: Text
    begin
        LeaveRequisition.Reset();
        LeaveRequisition.SetRange(LeaveRequisition."No.", leaveNo);
        if LeaveRequisition.Find('-') then begin
            if ApprovalMngnt2.IsLeaveEnabled(LeaveRequisition) = true then begin
                ApprovalMngnt2.OnSendLeaveforApproval(LeaveRequisition);
                Message := 'SUCCESS';
            end else begin
                Message := 'No approval workflow set';
            end;
        end;
    end;

    procedure OnCancelLeaveApplication(leaveNo: Text) Message: Text
    begin
        LeaveRequisition.Reset();
        LeaveRequisition.SetRange(LeaveRequisition."No.", leaveNo);
        if LeaveRequisition.Find('-') then begin
            ApprovalMngnt2.OnCancelLeaveforApproval(LeaveRequisition);
        end;
    end;

    procedure GetPayslipYears() Message: Text

    begin
        PayslipYears.Reset();
        // PayslipYears.SetRange(Closed, true);
        // PayslipYears.SetRange("Allow View of Online Payslips", true);
        repeat
            if PayslipYears.Find('-') then begin
                Message := Format(PayslipYears."Period Year") + '[]';
            end
        until PayslipYears.Next() = 0;
    end;

    procedure GetPayslipMonths() Message: Text
    var

        MonthName: Text;
    begin
        PayslipYears.Reset();
        PayslipYears.SetRange(Closed, true);
        PayslipYears.SetRange("Allow View of Online Payslips", true);

        if PayslipYears.FindSet() then begin
            repeat
                // Map numeric month to name
                MonthName := GetMonthName(PayslipYears."Period Month");

                // Append to message
                Message := Message + Format(PayslipYears."Period Month") + '::' + MonthName + '[]';
            until PayslipYears.Next() = 0;
        end;
    end;

    procedure GetMonthName(MonthNumber: Integer): Text
    begin
        case MonthNumber of
            1:
                exit('January');
            2:
                exit('February');
            3:
                exit('March');
            4:
                exit('April');
            5:
                exit('May');
            6:
                exit('June');
            7:
                exit('July');
            8:
                exit('August');
            9:
                exit('September');
            10:
                exit('October');
            11:
                exit('November');
            12:
                exit('December');
            else
                exit('Invalid Month'); // Handles unexpected values
        end;
    end;

    procedure GenerateStaffLeaveStatement(username: Text; fileNameFromApp: Text)
    var
        fileName: Text;
    begin
        fileName := FILEPATH_S + fileNameFromApp;
        fileName := FILEPATH_S2 + fileNameFromApp;
        if Exists(fileName) then Erase(fileName);

        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            Report.SaveAsPdf(Report::"HR Leave Statement", fileName, LeaveRequisition);
        end;
    end;

    procedure HRMTrainingApplication(username: Text; supervisor: Text; trainingCategory: Integer; courseCode: Text; purpose: Text; sponsor: Integer; location: Integer; country: Text; county: Text; trainer: Text; directorate: Text; department: Text) Message: Text
    var
        NextTrainingNos: Text;
    begin
        HRSetup.Get();
        NextTrainingNos := NoSeriesMngnt.GetNextNo(HRSetup."Training Application Nos.", 0D, true);
        HRMTrainingRequisition.Init();
        HRMTrainingRequisition."Application No" := NextTrainingNos;
        HRMTrainingRequisition."Application Date" := Today();
        HRMTrainingRequisition."User ID" := UserId;
        HRMTrainingRequisition.Supervisor := supervisor;
        HRMTrainingRequisition."Training Category" := trainingCategory;
        HRMTrainingRequisition."Employee No." := username;
        HRMTrainingRequisition."Individual Course Code" := courseCode;
        HRMTrainingRequisition."Purpose of Training" := purpose;
        HRMTrainingRequisition.Sponsor := sponsor;
        HRMTrainingRequisition.Location := location;
        HRMTrainingRequisition.Country := country;
        HRMTrainingRequisition.County := county;
        HRMTrainingRequisition.Trainer := trainer;
        //   HRMTrainingRequisition.Directorate := directorate;
        //   HRMTrainingRequisition.Department := department;

        VendorCard.Reset();
        VendorCard.SetRange(VendorCard."No.", trainer);
        if VendorCard.Find('-') then begin
            HRMTrainingRequisition."Training Institution" := VendorCard.Name;
        end;

        HRMTrainingCourses.Reset();
        HRMTrainingCourses.SetRange(HRMTrainingCourses."Course Code", courseCode);
        if HRMTrainingCourses.Find('-') then begin
            HRMTrainingRequisition."Individual Course Description" := HRMTrainingCourses."Course Tittle";
            HRMTrainingRequisition."From Date" := HRMTrainingCourses."Start Date";
            HRMTrainingRequisition."To Date" := HRMTrainingCourses."End Date";
            HRMTrainingRequisition."No of Participants" := HRMTrainingCourses."No of Participants Required";
            //HRMTrainingRequisition."Cost Of Training" := HRMTrainingCourses."Cost Of Training";
            HRMTrainingRequisition.Description := HRMTrainingCourses."Course Tittle";
            HRMTrainingRequisition.Duration := HRMTrainingCourses.Duration;
            HRMTrainingRequisition."Duration Units" := HRMTrainingCourses."Duration Units";
        end;

        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", supervisor);
        if EmployeeCard.Find('-') then begin
            HRMTrainingRequisition."Supervisor Name" := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
        end;

        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            HRMTrainingRequisition."Employee Name" := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
        end;

        if HRMTrainingRequisition.Insert() then begin
            Message := 'SUCCESS' + '::' + HRMTrainingRequisition."Application No";
        end else begin
            Message := 'FAILED' + '::';
        end;
    end;

    procedure InsertHRMTrainingParticipants(trainingCode: Text; employeeCode: Text; objective: Text) Message: Text
    begin
        HRMTrainingParticipants.Reset();
        HRMTrainingParticipants.SetRange(HRMTrainingParticipants."Training Code", trainingCode);
        HRMTrainingParticipants.SetRange(HRMTrainingParticipants."Employee Code", employeeCode);
        if not HRMTrainingParticipants.Find('-') then begin
            HRMTrainingParticipants.Init();
            HRMTrainingParticipants."Training Code" := trainingCode;
            HRMTrainingParticipants."Employee Code" := employeeCode;
            HRMTrainingParticipants.Objectives := objective;

            EmployeeCard.Reset();
            EmployeeCard.SetRange(EmployeeCard."No.", employeeCode);
            if EmployeeCard.Find('-') then begin
                HRMTrainingParticipants."Employee name" := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
            end;

            if HRMTrainingParticipants.Insert() then begin
                Message := 'SUCCESS';
            end else begin
                Message := 'FAILED';
            end;
        end else begin
            Message := 'Training participant already exists';
        end;
    end;

    procedure RemoveHRMTrainingParticipant(trainingCode: Text; employeeCode: Text) Message: Text
    begin
        HRMTrainingParticipants.Reset();
        HRMTrainingParticipants.SetRange(HRMTrainingParticipants."Training Code", trainingCode);
        HRMTrainingParticipants.SetRange(HRMTrainingParticipants."Employee Code", employeeCode);
        if HRMTrainingParticipants.Find('-') then begin
            if HRMTrainingParticipants.Delete() then begin
                Message := 'SUCCESS';
            end else begin
                Message := 'FAILED';
            end;
        end;
    end;

    procedure CreateStoreRequisitionHeader(username: Text; requisitionType: Integer; requiredDate: Date; department: Text; resCenter: text; issuingStore: Text; description: Text) Message: Text
    var
        NextStoreNo: Text;
    begin
        PurchasePayables.Get();
        NextStoreNo := NoSeriesMngnt.GetNextNo(PurchasePayables."Stores Requisition No", 0D, true);
        StoreRequisitionHeader.Init();
        StoreRequisitionHeader."No." := NextStoreNo;
        StoreRequisitionHeader."Requisition Type" := requisitionType;
        StoreRequisitionHeader."Request date" := Today();
        StoreRequisitionHeader."Required Date" := requiredDate;
        // StoreRequisitionHeader."Global Dimension 1 Code" := directorate;
        // StoreRequisitionHeader.Validate("Global Dimension 1 Code");
        StoreRequisitionHeader."Global Dimension 1 Code" := department;
        StoreRequisitionHeader.Validate("Global Dimension 1 Code");
        StoreRequisitionHeader."Responsibility Center" := resCenter;
        StoreRequisitionHeader."Issuing Store" := issuingStore;
        StoreRequisitionHeader."Requester ID" := username;
        StoreRequisitionHeader."Staff No." := username;
        StoreRequisitionHeader."Request Description" := description;
        StoreRequisitionHeader."No. Series" := PurchasePayables."Stores Requisition No";
        StoreRequisitionHeader."User ID" := username;
        //  StoreRequisitionHeader."Requester ID" := username;

        if StoreRequisitionHeader.Insert() then begin
            Message := 'SUCCESS' + '::' + StoreRequisitionHeader."No.";
        end else begin
            Message := 'ERROR' + '::';
        end;
    end;

    procedure InsertStoreRequisitionLines(storeNo: Text; type: Integer; itemNo: Text; quantityRequested: Decimal; issuingStore: Text) Message: Text
    begin
        StoreRequisitionHeader.Reset();
        StoreRequisitionHeader.SetRange(StoreRequisitionHeader."No.", storeNo);
        if StoreRequisitionHeader.Find('-') then begin
            StoreRequisitionLines.Init();
            StoreRequisitionLines."Requistion No" := StoreRequisitionHeader."No.";
            StoreRequisitionLines.Type := type;
            StoreRequisitionLines."No." := itemNo;

            if type = 1 then begin
                ItemCard.Reset();
                ItemCard.SetRange(ItemCard."No.", itemNo);
                if ItemCard.Find('-') then begin
                    StoreRequisitionLines.Description := ItemCard.Description;
                    StoreRequisitionLines."Description 2" := ItemCard."Description 2";
                    StoreRequisitionLines."Line Amount" := ItemCard."Unit Price";
                    StoreRequisitionLines."Unit Cost" := ItemCard."Unit Cost";
                    StoreRequisitionLines."Unit of Measure" := ItemCard."Base Unit of Measure";
                    StoreRequisitionLines."Qty in store" := GetItemQuantity(itemNo);
                end;
            end else begin
                FixedAssets.Reset();
                FixedAssets.SetRange(FixedAssets."No.", itemNo);
                if FixedAssets.Find('-') then begin
                    StoreRequisitionLines.Description := FixedAssets.Description;
                    StoreRequisitionLines."Description 2" := FixedAssets."Description 2";
                end;
            end;

            StoreRequisitionLines."Shortcut Dimension 1 Code" := StoreRequisitionHeader."Global Dimension 1 Code";
            StoreRequisitionLines."Shortcut Dimension 2 Code" := StoreRequisitionHeader."Shortcut Dimension 2 Code";
            StoreRequisitionLines."Issuing Store" := issuingStore;
            StoreRequisitionLines."Quantity Requested" := quantityRequested;
            StoreRequisitionLines."Qty balance" := StoreRequisitionLines."Qty in store" - quantityRequested;

            if StoreRequisitionLines.Insert() then begin
                Message := 'SUCCESS';
            end else begin
                Message := 'FAILED';
            end;
        end;
    end;
    // procedure GetItemQuantity(itemNo: Text) Message: Decimal
    // var ItemQty: Decimal;
    // begin
    //   ItemLeaderEntries.Reset();
    //   ItemLeaderEntries.SetRange(ItemLeaderEntries."Item No.", itemNo);
    //   if ItemLeaderEntries.Find('-') then begin
    //     repeat
    //       ItemQty := ItemQty + ItemLeaderEntries.Quantity;
    //     until ItemLeaderEntries.Next() = 0;
    //     Message := ItemQty;
    //   end;
    // end;
    procedure GetItemQuantity(itemNo: Text) Message: Decimal
    var
        ItemQty: Decimal;
    begin
        ItemQty := 0; // Initialize ItemQty to zero
        ItemLeaderEntries.Reset();
        ItemLeaderEntries.SetRange(ItemLeaderEntries."Item No.", itemNo);
        if ItemLeaderEntries.Find('-') then begin
            repeat
                ItemQty := ItemQty + ItemLeaderEntries.Quantity;
            until ItemLeaderEntries.Next() = 0;
        end;
        Message := ItemQty;
    end;

    procedure GetStoreItemQuantity(itemNo: Text) Message: Text
    var
        ItemQty: Decimal;
    begin
        ItemLeaderEntries.Reset();
        ItemLeaderEntries.SetRange(ItemLeaderEntries."Item No.", itemNo);
        if ItemLeaderEntries.Find('-') then begin
            repeat
                ItemQty := ItemQty + ItemLeaderEntries.Quantity;
            until ItemLeaderEntries.Next() = 0;
            Message := Format(ItemQty);
        end;
    end;

    procedure OnSendStoreRequisitionForApproval(storeNo: Text) Message: Text
    begin
        StoreRequisitionHeader.Reset();
        StoreRequisitionHeader.SetRange(StoreRequisitionHeader."No.", storeNo);
        if StoreRequisitionHeader.Find('-') then begin
            if ApprovalMngnt.IsSRNEnabled(StoreRequisitionHeader) = true then begin
                ApprovalMngnt.OnSendSRNforApproval(StoreRequisitionHeader);
                Message := 'SUCCESS';
            end else begin
                Message := 'No approval workflow enabled';
            end;
        end;
    end;

    procedure OnCancelStoreRequisitionApproval(storeNo: Text)
    begin
        StoreRequisitionHeader.Reset();
        StoreRequisitionHeader.SetRange(StoreRequisitionHeader."No.", storeNo);
        if StoreRequisitionHeader.Find('-') then begin
            ApprovalMngnt.OnCancelSRNforApproval(StoreRequisitionHeader);
        end;
    end;

    procedure GetMyClaims(username: Text) Message: Text
    var
        ClaimsHeader: Record "FIN-Staff Claims Header";
    begin
        ClaimsHeader.Reset();
        ClaimsHeader.SetRange(ClaimsHeader.Cashier, username);

        if ClaimsHeader.Find('-') then begin
            repeat
                Message += ClaimsHeader."No." + '::' + Format(ClaimsHeader.Date) + '::' + ClaimsHeader.Payee + '::' + ClaimsHeader.Purpose + '::' + Format(ClaimsHeader.Status) + '[]'
            until ClaimsHeader.Next() = 0;
        end else begin
            Message := 'No Claims';
        end;
    end;

    procedure CreateClaimRequisitionHeader(username: Text; department: Text; responsibilityCenter: Text; purpose: Text) Message: Text
    var
        NextClaimNo: Text;
        FullName: Text;
    begin
        Clear(NextClaimNo);
        CashOfficeSetup.Get();
        NextClaimNo := NoSeriesMngnt.GetNextNo(CashOfficeSetup."Staff Claim No", 0D, true);

        ClaimRequisition.Init();
        ClaimRequisition."No." := NextClaimNo;
        ClaimRequisition.Date := Today();
        ClaimRequisition."Account No." := username;
        ClaimRequisition.Validate("Account No.");
        ClaimRequisition.Cashier := username;
        ClaimRequisition.Purpose := purpose;
        ClaimRequisition."Responsibility Center" := responsibilityCenter;
        ClaimRequisition.Posted := false;
        ClaimRequisition.Status := ClaimRequisition.Status::Pending;
        ClaimRequisition."No. Series" := CashOfficeSetup."Staff Claim No";
        // ClaimRequisition."Global Dimension 1 Code" := directorate;
        // ClaimRequisition.Validate("Global Dimension 1 Code");
        ClaimRequisition."Global Dimension 1 Code" := department;
        ClaimRequisition.Validate("Global Dimension 1 Code");
        ClaimRequisition."Account Type" := ClaimRequisition."Account Type"::Customer;

        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            FullName := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
            ClaimRequisition."On Behalf Of" := FullName;
            ClaimRequisition.Payee := FullName;
        end;

        if ClaimRequisition.Insert() then begin
            Message := 'SUCCESS' + '::' + ClaimRequisition."No.";
        end else begin
            Message := 'FAILED' + '::';
        end;
    end;

    procedure InsertClaimRequisitionLines(claimNo: Text; claimType: Text; amount: Decimal) Message: Text
    begin
        ClaimRequisition.Reset();
        ClaimRequisition.SetRange(ClaimRequisition."No.", claimNo);
        if ClaimRequisition.Find('-') then begin
            ClaimLines.Init();
            ClaimLines."Document No." := claimNo;
            ClaimLines."Advance Type" := claimType;
            ClaimLines.Validate("Advance Type");
            ClaimLines.Amount := amount;
            ClaimLines."Amount LCY" := amount;
            ClaimLines."Global Dimension 1 Code" := ClaimRequisition."Global Dimension 1 Code";
            ClaimLines."Shortcut Dimension 2 Code" := ClaimRequisition."Shortcut Dimension 2 Code";
            ClaimLines."Due Date" := ClaimRequisition.Date;
            ClaimLines."Imprest Holder" := ClaimRequisition.Cashier;
            ClaimLines.Purpose := ClaimRequisition.Purpose;
            ClaimLines."Budgetary Control A/C" := true;

            if ClaimLines.Insert() then begin
                Message := 'SUCCESS' + '::';
            end else begin
                Message := 'FAILED' + '::';
            end;
        end;
    end;

    procedure RemoveClaimRequisitionLines(lineNo: Integer) Message: Text
    begin
        ClaimLines.Reset();
        ClaimLines.SetRange(ClaimLines."Line No.", lineNo);
        if ClaimLines.Find('-') then begin
            if ClaimLines.Delete() then begin
                Message := 'SUCCESS';
            end else begin
                Message := 'FAILED';
            end;
        end;
    end;

    procedure OnSendClaimRequisitionForApproval(claimNo: Text) Message: Text
    begin
        ClaimRequisition.Reset();
        ClaimRequisition.SetRange(ClaimRequisition."No.", claimNo);
        if ClaimRequisition.Find('-') then begin
            if ApprovalMngnt.IsClaimsEnabled(ClaimRequisition) = true then begin
                ApprovalMngnt.OnSendClaimforApproval(ClaimRequisition);
                Message := 'SUCCESS';
            end else begin
                Message := 'No approval workflow set';
            end;
        end;
    end;

    procedure OnCancelClaimRequisition(claimNo: Text)
    begin
        ClaimRequisition.Reset();
        ClaimRequisition.SetRange(ClaimRequisition."No.", claimNo);
        if ClaimRequisition.Find('-') then begin
            ApprovalMngnt.OnCancelClaimForApproval(ClaimRequisition);
        end;
    end;

    //procedure CreateImprestRequisitionHeader(username: Text; directorate: Text; department: Text; resCenter: Text; purpose: Text) Message: Text;
    procedure CreateImprestRequisitionHeader(username: Text; department: Text; resCenter: Text; purpose: Text ) Message: Text;
    var
        NextImprestNo: Text;
        fullName: Text;
        customerlist: Record "Customer";
    begin
        CashOfficeSetup.Get();
        NextImprestNo := NoSeriesMngnt.GetNextNo(CashOfficeSetup."Imprest Req No", 0D, true);
        ImprestHeader.Init();
        ImprestHeader."No." := NextImprestNo;
        ImprestHeader.Date := Today();
        //  ImprestHeader."Global Dimension 1 Code" := directorate;
        ImprestHeader."Global Dimension 1 Code" := department;
        ImprestHeader.Validate("Global Dimension 1 Code");
        //ImprestHeader.Validate("Shortcut Dimension 2 Code");
        ImprestHeader."No. Series" := CashOfficeSetup."Imprest Req No";
        ImprestHeader."Responsibility Center" := resCenter;
        ImprestHeader."Account Type" := ImprestHeader."Account Type"::Customer;
        //ImprestHeader."Account No." := username;
        //ImprestHeader.Validate("Account No.");
        ImprestHeader.Purpose := purpose;
        ImprestHeader."Requested By" := username;
        ImprestHeader."Employee No" := username;
        ImprestHeader.Cashier := username;
        customerlist.Reset();
        customerlist.SetRange(customerlist."No.", username);
        if customerlist.Find('-') then begin
            ImprestHeader."Account No." := customerlist."No.";
            ImprestHeader.Payee := customerlist.Name;
        end ;

        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            fullName := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
            //ImprestHeader.Payee := fullName;
            ImprestHeader."On Behalf Of" := fullName;
            ImprestHeader."payees bank code" := EmployeeCard."Main Bank";
            ImprestHeader."payees bank name" := EmployeeCard."Main Bank Name";
            ImprestHeader."payees Branch code" := EmployeeCard."Branch Bank";
            ImprestHeader."payees  branch name" := EmployeeCard."Branch Bank Name";
            ImprestHeader."payees bank account" := EmployeeCard."Bank Account Number";
            ImprestHeader."Mobile No" := EmployeeCard."Home Phone Number";
            ImprestHeader."Job Title" := EmployeeCard."Job Title";
        end;

        if ImprestHeader.Insert() then begin
            Message := 'SUCCESS' + '::' + ImprestHeader."No.";
        end else begin
            Message := 'FAILED' + '::';
        end;
    end;

    procedure InsertImprestRequisitonLines(imprestNo: Text; advanceType: Text; amount: Decimal) Message: Text
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange(ImprestHeader."No.", imprestNo);
        if ImprestHeader.Find('-') then begin
            ImprestLines.Init();
            ImprestLines.No := imprestNo;
            ImprestLines."Advance Type" := advanceType;
            ImprestLines.Amount := amount;
            ImprestLines."Amount LCY" := amount;
            ImprestLines."Due Date" := ImprestHeader.Date;
            ImprestLines."Imprest Holder" := ImprestHeader."Account No.";
            ImprestLines.Purpose := ImprestHeader.Purpose;
            ImprestLines."Global Dimension 1 Code" := ImprestHeader."Global Dimension 1 Code";
            ImprestLines."Shortcut Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";

            FinReceiptsPaymentTypes.Reset();
            FinReceiptsPaymentTypes.SetRange(FinReceiptsPaymentTypes.Code, advanceType);
            FinReceiptsPaymentTypes.SetRange(FinReceiptsPaymentTypes.Type, FinReceiptsPaymentTypes.Type::Imprest);
            if FinReceiptsPaymentTypes.Find('-') then begin
                ImprestLines."Account No." := FinReceiptsPaymentTypes."G/L Account";

                GlAccount.Reset();
                GlAccount.SetRange(GlAccount."No.", FinReceiptsPaymentTypes."G/L Account");
                if GlAccount.Find('-') then begin
                    ImprestLines."Account Name" := GlAccount.Name;
                end;
            end;

            if ImprestLines.Insert() then begin
                Message := 'SUCCESS';
            end else begin
                Message := 'FAILED';
            end;
        end;
    end;

    procedure RemoveImprestRequisitionLine(imprestNo: Text; advanceType: Text) Message: Text
    begin
        ImprestLines.Reset();
        ImprestLines.SetRange(ImprestLines.No, imprestNo);
        ImprestLines.SetRange(ImprestLines."Advance Type", advanceType);
        if ImprestLines.Find('-') then begin
            if ImprestLines.Delete() then begin
                Message := 'SUCCESS';
            end else begin
                Message := 'FAILED';
            end;
        end;
    end;

    procedure OnSendImprestRequisitionForApproval(imprestNo: Text) Message: Text
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange(ImprestHeader."No.", imprestNo);
        if ImprestHeader.Find('-') then begin
            if ApprovalMngnt.IsImprestEnabled(ImprestHeader) = true then begin
                ApprovalMngnt.OnSendImprestforApproval(ImprestHeader);
                Message := 'SUCCESS';
            end else begin
                Message := 'No approval workflow enabled';
            end;
        end;
    end;

    procedure OnCancelImprestRequisition(imprestNo: Text)
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange(ImprestHeader."No.", imprestNo);
        if ImprestHeader.Find('-') then begin
            ApprovalMngnt.OnCancelImprestForApproval(ImprestHeader);
        end;
    end;

    procedure GetNextImprestSurrenderNo() Message: Text
    begin
        CashOfficeSetup.Get();
        Message := NoSeriesMngnt.GetNextNo(CashOfficeSetup."Imprest Surrender No", 0D, true);
    end;

    procedure GetImprestDetails(imprestNo: Text) Message: Text
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange(ImprestHeader."No.", imprestNo);
        if ImprestHeader.Find('-') then begin
            Message := ImprestHeader."No." + '::' + ImprestHeader.Purpose + '::' + ImprestHeader."Responsibility Center";
        end;
    end;

    procedure GetMyImprests(username: Text) Message: Text

    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange(ImprestHeader."Account No.", username);
        if ImprestHeader.Find('-') then begin
            repeat
                Message +=
                ImprestHeader."No." + '::' +
                  ImprestHeader.Payee + '::'
                 + ImprestHeader.Purpose + '::'
                // + ImprestHeader."Memo No." + '::'
                + Format(ImprestHeader.Status) + '[]'
            until ImprestHeader.Next() = 0;
        end else begin
            Message := 'No Imprests';
        end;
    end;

    procedure GetAdvancetype(Type: Integer) Message: Text
    var
        AdvanceType: Record "FIN-Receipts and Payment Types";
    begin
        AdvanceType.Reset();
        AdvanceType.SetRange(AdvanceType.Type, Type);
        if AdvanceType.Find('-') then begin
            repeat
                Message += AdvanceType.Code + '::' + AdvanceType.Description + '[]';
            until AdvanceType.Next() = 0;
        end else begin
            Message := 'No Advance type';
        end;
    end;

    procedure GenerateMemoReport(memoNo: Text; fileNameFromApp: Text)
    var
        MemoHeader: Record "FIN-Memo Header";
        filename: Text;
    begin
        filename := FILEPATH_S + fileNameFromApp;
        if Exists(filename) then Erase(filename);

        MemoHeader.Reset();
        MemoHeader.SetRange(MemoHeader."No.", memoNo);
        if MemoHeader.Find('-') then begin
          //  Report.SaveAsPdf(Report::"FIN-Memo Report", filename, MemoHeader);
        end
    end;



    procedure LoadImprestSurrenderLineDetails(surrenderNo: Text; accountNo: Text) Message: Text
    begin
        ImprestSurrenderLines.Reset();
        ImprestSurrenderLines.SetRange(ImprestSurrenderLines."Surrender Doc No.", surrenderNo);
        ImprestSurrenderLines.SetRange(ImprestSurrenderLines."Account No:", accountNo);
        if ImprestSurrenderLines.Find('-') then begin
            Message := 'SUCCESS' + '::' + Format(ImprestSurrenderLines."Actual Spent") + '::' + Format(ImprestSurrenderLines."Cash Receipt Amount");
        end else begin
            Message := 'Not Found' + '::';
        end;
    end;

    procedure CreateImprestSurrenderHeader(surrenderNo: Text; imprestNo: Text; resCenter: Text) Message: Text
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange(ImprestHeader."No.", imprestNo);
        if ImprestHeader.Find('-') then begin
            ImprestSurrenderHeader.Reset();
            ImprestSurrenderHeader.SetRange(ImprestSurrenderHeader.No, surrenderNo);
            if ImprestSurrenderHeader.Find('-') then begin
                ImprestSurrenderHeader."Imprest Issue Doc. No" := imprestNo;
                ImprestSurrenderHeader."Responsibility Center" := resCenter;
                ImprestSurrenderHeader."Shortcut Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";
                ImprestSurrenderHeader.Validate("Shortcut Dimension 2 Code");
                if ImprestSurrenderHeader.Modify() then begin
                    Message := 'SUCCESS' + '::' + ImprestSurrenderHeader.No;
                end else begin
                    Message := 'FAILED' + '::';
                end;
            end else begin
                CashOfficeSetup.Get();
                ImprestSurrenderHeader.Init();
                ImprestSurrenderHeader.No := surrenderNo;
                ImprestSurrenderHeader."Imprest Issue Doc. No" := imprestNo;
                ImprestSurrenderHeader."Responsibility Center" := resCenter;
                ImprestSurrenderHeader."Surrender Date" := Today();
                ImprestSurrenderHeader."Received From" := ImprestHeader.Payee;
                ImprestSurrenderHeader."On Behalf Of" := ImprestHeader."On Behalf Of";
                ImprestSurrenderHeader.Cashier := ImprestHeader.Cashier;
                ImprestSurrenderHeader."Account Type" := ImprestSurrenderHeader."Account Type"::Customer;
                ImprestSurrenderHeader."Account No." := ImprestHeader."Account No.";
                ImprestSurrenderHeader."Account Name" := ImprestHeader.Payee;
                ImprestSurrenderHeader."No. Series" := CashOfficeSetup."Imprest Surrender No";
                ImprestSurrenderHeader.Amount := ImprestHeader."Total Net Amount";
                ImprestSurrenderHeader.Payee := ImprestHeader.Payee;
                ImprestSurrenderHeader."Global Dimension 1 Code" := ImprestHeader."Global Dimension 1 Code";
                ImprestSurrenderHeader."Global Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";
                ImprestSurrenderHeader."Shortcut Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";
                ImprestSurrenderHeader.Validate("Global Dimension 1 Code");
                ImprestSurrenderHeader.Validate("Global Dimension 2 Code");
                ImprestSurrenderHeader."No. Series" := CashOfficeSetup."Imprest Surrender No";

                if ImprestSurrenderHeader.Insert() then begin
                    Message := 'SUCCESS' + '::' + ImprestSurrenderHeader.No;
                end else begin
                    Message := 'FAILED' + '::';
                end;
            end;

            ImprestHeader."Surrender Status" := ImprestHeader."Surrender Status"::Full;
            ImprestHeader.Modify();
        end;
    end;

    procedure InsertImprestSurrenderLines(documentNo: Text; actualSpent: Decimal; cashAmount: Decimal; imprestNo: Text; accountNo: Text) Message: Text
    begin
        ImprestLines.Reset();
        ImprestLines.SetRange(ImprestLines.No, imprestNo);
        ImprestLines.SetRange(ImprestLines."Account No.", accountNo);
        IF ImprestLines.Find('-') then begin
            ImprestSurrenderLines.Reset();
            ImprestSurrenderLines.SetRange(ImprestSurrenderLines."Surrender Doc No.", documentNo);
            ImprestSurrenderLines.SetRange(ImprestSurrenderLines."Account No:", accountNo);
            if ImprestSurrenderLines.Find('-') then begin
                ImprestSurrenderLines."Actual Spent" := actualSpent;
                ImprestSurrenderLines.Validate("Actual Spent");
                ImprestSurrenderLines."Cash Receipt Amount" := cashAmount;
                ImprestSurrenderLines.Validate("Cash Receipt Amount");
                ImprestSurrenderLines.Modify();
            end else begin
                ImprestSurrenderLines.Init();
                ImprestSurrenderLines."Surrender Doc No." := documentNo;
                ImprestSurrenderLines."Account No:" := ImprestLines."Account No.";
                ImprestSurrenderLines."Imprest Type" := ImprestLines."Advance Type";
                ImprestSurrenderLines.Validate(ImprestSurrenderLines."Account No:");
                ImprestSurrenderLines."Account Name" := ImprestLines."Account Name";
                ImprestSurrenderLines.Amount := ImprestLines.Amount;
                ImprestSurrenderLines."Due Date" := ImprestLines."Due Date";
                ImprestSurrenderLines."Imprest Holder" := ImprestLines."Imprest Holder";
                ImprestSurrenderLines."Actual Spent" := actualSpent;
                ImprestSurrenderLines.Validate("Actual Spent");
                ImprestSurrenderLines."Cash Receipt Amount" := cashAmount;
                ImprestSurrenderLines.Validate("Cash Receipt Amount");
                ImprestSurrenderLines."Apply to" := ImprestLines."Apply to";
                ImprestSurrenderLines."Apply to ID" := ImprestLines."Apply to ID";
                ImprestSurrenderLines."Surrender Date" := ImprestLines."Surrender Date";
                ImprestSurrenderLines.Surrendered := ImprestLines.Surrendered;
                ImprestSurrenderLines."Cash Receipt No" := ImprestLines."M.R. No";
                ImprestSurrenderLines."Date Issued" := ImprestLines."Date Issued";
                ImprestSurrenderLines."Type of Surrender" := ImprestLines."Type of Surrender";
                ImprestSurrenderLines."Dept. Vch. No." := ImprestLines."Dept. Vch. No.";
                ImprestSurrenderLines."Currency Factor" := ImprestLines."Currency Factor";
                ImprestSurrenderLines."Currency Code" := ImprestLines."Currency Code";
                ImprestSurrenderLines."Imprest Req Amt LCY" := ImprestLines."Amount LCY";
                ImprestSurrenderLines."Shortcut Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
                ImprestSurrenderLines."Shortcut Dimension 2 Code" := ImprestLines."Shortcut Dimension 2 Code";
                ImprestSurrenderLines."Shortcut Dimension 3 Code" := ImprestLines."Shortcut Dimension 3 Code";
                ImprestSurrenderLines."Shortcut Dimension 4 Code" := ImprestLines."Shortcut Dimension 4 Code";
                ImprestSurrenderLines.Insert();
            end;
        end;
    end;

    procedure OnSendImprestSurrenderForApproval(surrenderNo: Text) Message: Text
    begin
        ImprestSurrenderHeader.Reset();
        ImprestSurrenderHeader.SetRange(ImprestSurrenderHeader.No, surrenderNo);
        if ImprestSurrenderHeader.Find('-') then begin
            if ApprovalMngnt.IsImprestAccEnabled(ImprestSurrenderHeader) then begin
                ApprovalMngnt.OnSendImprestAccforApproval(ImprestSurrenderHeader);
                Message := 'SUCCESS';
            end else begin
                Message := 'No approval workflow enabled';
            end;
        end;
    end;

    procedure OnCancelImprestSurrender(surrenderNo: Text) Message: Text
    begin
        ImprestSurrenderHeader.Reset();
        ImprestSurrenderHeader.SetRange(ImprestSurrenderHeader.No, surrenderNo);
        if ImprestSurrenderHeader.Find('-') then begin
            ApprovalMngnt.OnCancelImprestAccforApproval(ImprestSurrenderHeader);
        end;
    end;

    procedure CreatePettyCashRequisitionHeader(username: Text; directorate: Text; department: Text; resCenter: Text; purpose: Text) Message: Text
    var
        NextPettyCashNo: Text;
        fullName: Text;
    begin
        CashOfficeSetup.Get();
        NextPettyCashNo := NoSeriesMngnt.GetNextNo(CashOfficeSetup."Advance Petty Cash", 0D, true);
        PettyCashHeader.Init();
        PettyCashHeader."No." := NextPettyCashNo;
        PettyCashHeader.Date := Today();
        PettyCashHeader."Global Dimension 1 Code" := directorate;
        PettyCashHeader."Global Dimension 2 Code" := department;
        PettyCashHeader.Validate("Global Dimension 1 Code");
        PettyCashHeader.Validate("Global Dimension 2 Code");
        PettyCashHeader.Cashier := username;
        PettyCashHeader."Account No." := username;
        PettyCashHeader."Account Type" := PettyCashHeader."Account Type"::Customer;
        PettyCashHeader."No. Series" := CashOfficeSetup."Advance Petty Cash";
        PettyCashHeader."Responsibility Center" := resCenter;
        PettyCashHeader."Document Type" := PettyCashHeader."Document Type"::"Advance Petty Cash";
        PettyCashHeader.Purpose := purpose;

        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.");
        if EmployeeCard.Find('-') then begin
            fullName := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
            PettyCashHeader.payee := fullName;
            PettyCashHeader."On behalf of" := fullName;
        end;

        if PettyCashHeader.Insert() then begin
            Message := 'SUCCESS' + '::' + PettyCashHeader."No.";
        end else begin
            Message := 'FAILED' + '::';
        end;
    end;

    procedure InsertPettyCashRequisitionLine(pettyCashNo: Text; advanceType: Text; amount: Decimal) Message: Text
    begin
        PettyCashHeader.Reset();
        PettyCashHeader.SetRange(PettyCashHeader."No.", pettyCashNo);
        if PettyCashHeader.Find('-') then begin
            PettyCashLines.Init();
            PettyCashLines."Document No." := pettyCashNo;
            PettyCashLines."Advance Type" := advanceType;
            PettyCashLines.Amount := amount;
            PettyCashLines."Petty Cash Holder" := PettyCashHeader."Account No.";
            PettyCashLines.Purpose := PettyCashHeader.Purpose;
            PettyCashLines."Account Type" := PettyCashLines."Account Type"::Customer;

            FinReceiptsPaymentTypes.Reset();
            FinReceiptsPaymentTypes.SetRange(FinReceiptsPaymentTypes.Code, advanceType);
            FinReceiptsPaymentTypes.SetRange(FinReceiptsPaymentTypes.Type, FinReceiptsPaymentTypes.Type::"Petty Cash");
            if FinReceiptsPaymentTypes.Find('-') then begin
                PettyCashLines."Account No." := FinReceiptsPaymentTypes."G/L Account";

                GlAccount.Reset();
                GlAccount.SetRange(GlAccount."No.", FinReceiptsPaymentTypes."G/L Account");
                if GlAccount.Find('-') then begin
                    PettyCashLines."Account Name" := GlAccount.Name;
                end;
            end;

            if PettyCashLines.Insert() then begin
                Message := 'SUCCESS';
            end else begin
                Message := 'FAILED';
            end;
        end;
    end;

    procedure RemovePettyCashRequisitionLine(lineNo: Integer) Message: Text
    begin
        PettyCashLines.Reset();
        PettyCashLines.SetRange(PettyCashLines."Line No.", lineNo);
        if PettyCashLines.Find('-') then begin
            if PettyCashLines.Delete() then begin
                Message := 'SUCCESS';
            end else begin
                Message := 'FAILED';
            end;
        end
    end;

    procedure OnSendPettyCashRequisitionForApproval(pettyCashNo: Text) Message: Text
    begin
        PettyCashHeader.Reset();
        PettyCashHeader.SetRange(PettyCashHeader."No.", pettyCashNo);
        if PettyCashHeader.Find('-') then begin
            if ApprovalMngnt.IsAdvPettyCashEnabled(PettyCashHeader) = true then begin
                ApprovalMngnt.OnSendAdvPettyCashforApproval(PettyCashHeader);
                Message := 'SUCCESS';
            end else begin
                Message := 'No approval workflow enabled';
            end;
        end else begin
            Message := 'Petty Cash Requisition not found';
        end;
    end;

    procedure OnCancelPettyCashRequisition(pettyCashNo: Text)
    begin
        PettyCashHeader.Reset();
        PettyCashHeader.SetRange(PettyCashHeader."No.", pettyCashNo);
        if PettyCashHeader.Find('-') then begin
            ApprovalMngnt.OnCancelAdvPettyCashforApproval(PettyCashHeader);
        end;
    end;

    procedure GetNextPettyCashNo() Message: Text
    var
        NextPettyCashNo: Text;
    begin
        NextPettyCashNo := NoSeriesMngnt.GetNextNo('SAD', 0D, true);
        Message := NextPettyCashNo;
    end;

    procedure GetPettyCashDetails(pettyCashNo: Text) Message: Text
    begin
        PettyCashHeader.Reset();
        PettyCashHeader.SetRange(PettyCashHeader."No.", pettyCashNo);
        if PettyCashHeader.Find('-') then begin
            Message := PettyCashHeader."No." + '::' + PettyCashHeader.Purpose + '::' + PettyCashHeader."Responsibility Center";
        end;
    end;

    procedure LoadPettyCashSurrenderSurrenderLineDetails(surrenderNo: Text; accountNo: Text) Message: Text
    begin
        PettyCashSurrenderLines.Reset();
        PettyCashSurrenderLines.SetRange(PettyCashSurrenderLines."Surrender No.", surrenderNo);
        PettyCashSurrenderLines.SetRange(PettyCashSurrenderLines."Account No.", accountNo);
        if PettyCashSurrenderLines.Find('-') then begin
            Message := 'SUCCESS' + '::' + Format(PettyCashSurrenderLines."Actual Spent") + '::' + Format(PettyCashSurrenderLines."Cash Receipt Amount");
        end else begin
            Message := 'Not Found' + '::';
        end;
    end;

    procedure CreatePettyCashSurrenderHeader(surrenderNo: Text; pettyCashNo: Text; resCenter: Text) Message: Text
    begin
        PettyCashHeader.Reset();
        PettyCashHeader.SetRange(PettyCashHeader."No.", pettyCashNo);
        if PettyCashHeader.Find('-') then begin
            PettyCashSurrenderHeader.Reset();
            PettyCashSurrenderHeader.SetRange(PettyCashSurrenderHeader."No.", surrenderNo);
            if PettyCashSurrenderHeader.Find('-') then begin
                PettyCashSurrenderHeader."Advance No." := pettyCashNo;
                PettyCashSurrenderHeader."Responsibility Center" := resCenter;
                if PettyCashSurrenderHeader.Modify() then begin
                    Message := 'SUCCESS' + '::' + PettyCashSurrenderHeader."No.";
                end else begin
                    Message := 'FAILED' + '::';
                end;
            end else begin
                PettyCashSurrenderHeader.Init();
                PettyCashSurrenderHeader."No." := surrenderNo;
                PettyCashSurrenderHeader."Advance No." := pettyCashNo;
                PettyCashSurrenderHeader."Responsibility Center" := resCenter;
                PettyCashSurrenderHeader."Account No." := PettyCashHeader."Account No.";
                PettyCashSurrenderHeader."Account Name" := PettyCashHeader.payee;
                PettyCashSurrenderHeader.Payee := PettyCashHeader.payee;
                PettyCashSurrenderHeader."Account Type" := PettyCashSurrenderHeader."Account Type"::Customer;
                PettyCashSurrenderHeader.Cashier := PettyCashHeader.Cashier;
                PettyCashSurrenderHeader."Global Dimension 1 Code" := PettyCashHeader."Global Dimension 1 Code";
                PettyCashSurrenderHeader."Global Dimension 2 Code" := PettyCashHeader."Global Dimension 2 Code";
                PettyCashSurrenderHeader.Validate("Global Dimension 1 Code");
                PettyCashSurrenderHeader.Validate("Global Dimension 2 Code");
                PettyCashSurrenderHeader."Surrender Date" := Today();

                PettyCashHeader."Surrender Status" := PettyCashHeader."Surrender Status"::Full;
                PettyCashHeader.Modify();

                if PettyCashSurrenderHeader.Insert() then begin
                    Message := 'SUCCESS' + '::' + PettyCashSurrenderHeader."No.";
                end else begin
                    Message := 'FAILED' + '::';
                end;
            end;
        end;
    end;
    //     procedure UpdatePettyCashSurrenderHeader(surrenderNo: Text; pettyCashNo: Text; resCenter: Text) Message: Text
    // begin
    //     PettyCashSurrenderHeader.Reset();
    //     PettyCashSurrenderHeader.SetRange(PettyCashSurrenderHeader."No.", surrenderNo);

    //     if PettyCashSurrenderHeader.Find('-') then begin
    //         // Update only fields that need to be changed
    //         PettyCashSurrenderHeader."Advance No." := pettyCashNo;
    //         PettyCashSurrenderHeader."Responsibility Center" := resCenter;

    //         // Ensure Account No. and Account Name are not overwritten unless necessary
    //         if PettyCashSurrenderHeader."Account No." = '' then
    //             PettyCashSurrenderHeader."Account No." := PettyCashHeader."Account No.";
    //         if PettyCashSurrenderHeader."Account Name" = '' then
    //             PettyCashSurrenderHeader."Account Name" := PettyCashHeader.payee;

    //         // Update other fields only if they are meant to be changed
    //         PettyCashSurrenderHeader.Payee := PettyCashHeader.payee;
    //         PettyCashSurrenderHeader."Account Type" := PettyCashSurrenderHeader."Account Type"::Customer;
    //         PettyCashSurrenderHeader.Cashier := PettyCashHeader.Cashier;
    //         PettyCashSurrenderHeader."Global Dimension 1 Code" := PettyCashHeader."Global Dimension 1 Code";
    //         PettyCashSurrenderHeader."Global Dimension 2 Code" := PettyCashHeader."Global Dimension 2 Code";

    //         // Validate if necessary
    //         PettyCashSurrenderHeader.Validate("Global Dimension 1 Code");
    //         PettyCashSurrenderHeader.Validate("Global Dimension 2 Code");

    //         if PettyCashSurrenderHeader.Modify() then begin
    //             Message := 'SUCCESS' + '::' + PettyCashSurrenderHeader."No.";
    //         end else begin
    //             Message := 'FAILED' + '::';
    //         end;
    //     end else begin
    //         Message := 'FAILED: Record not found for Surrender No. ' + surrenderNo;
    //     end;
    // end;


    procedure InsertPettyCashSurrenderLines(documentNo: Text; pettyCashNo: Text; amountSpent: Decimal; cashReturned: Decimal; accountNo: Text)
    begin
        PettyCashLines.Reset();
        PettyCashLines.SetRange(PettyCashLines."Document No.", documentNo);
        PettyCashLines.SetRange(PettyCashLines."Account No.", accountNo);
        if PettyCashLines.Find('-') then begin
            PettyCashSurrenderLines.Reset();
            PettyCashSurrenderLines.SetRange(PettyCashSurrenderLines."Surrender No.", documentNo);
            PettyCashSurrenderLines.SetRange(PettyCashSurrenderLines."Account No.", accountNo);
            if PettyCashSurrenderLines.Find('-') then begin
                PettyCashSurrenderLines."Actual Spent" := amountSpent;
                PettyCashSurrenderLines."Cash Receipt Amount" := cashReturned;
                PettyCashSurrenderLines.Amount := PettyCashLines.Amount;
                PettyCashSurrenderLines.Modify();
            end else begin
                PettyCashSurrenderLines.Init();
                PettyCashSurrenderLines."Surrender No." := documentNo;
                PettyCashSurrenderLines.Amount := PettyCashLines.Amount;
                PettyCashSurrenderLines."Actual Spent" := amountSpent;
                PettyCashSurrenderLines."Cash Receipt Amount" := cashReturned;
                PettyCashSurrenderLines."Account No." := PettyCashLines."Account No.";
                PettyCashSurrenderLines."Account Name" := PettyCashLines."Account Name";
                PettyCashSurrenderLines."Account Type" := PettyCashSurrenderLines."Account Type"::Customer;
                PettyCashSurrenderLines."Advance Holder" := PettyCashLines."Petty Cash Holder";
                PettyCashSurrenderLines.Insert();
            end;
        end;
    end;

    procedure UpdatePettyCashSurrenderLines(documentNo: Text; pettyCashNo: Text; amountSpent: Decimal; cashReturned: Decimal; accountNo: Text)
    begin
        PettyCashSurrenderLines.Reset();
        PettyCashSurrenderLines.SetRange(PettyCashSurrenderLines."Surrender No.", documentNo);
        PettyCashSurrenderLines.SetRange(PettyCashSurrenderLines."Account No.", accountNo);

        if PettyCashSurrenderLines.Find('-') then begin
            PettyCashSurrenderLines."Actual Spent" := amountSpent;
            PettyCashSurrenderLines."Cash Receipt Amount" := cashReturned;
            PettyCashSurrenderLines.Modify();
        end else begin
            Error('Record not found for Document No. %1 and Account No. %2', documentNo, accountNo);
        end;
    end;


    procedure OnSendPettyCashSurrenderForApproval(surrenderNo: Text) Message: Text
    begin
        PettyCashSurrenderHeader.Reset();
        PettyCashSurrenderHeader.SetRange(PettyCashSurrenderHeader."No.", surrenderNo);
        if PettyCashSurrenderHeader.Find('-') then begin
            if ApprovalMngnt.IsSurrPettyCashEnabled(PettyCashSurrenderHeader) = true then begin
                ApprovalMngnt.OnSendSurrPettyCashforApproval(PettyCashSurrenderHeader);
                Message := 'SUCCESS';
            end else begin
                Message := 'No approval workflow enabled';
            end;
        end;
    end;

    procedure OnCancelPettyCashSurrender(pettyCashNo: Text)
    begin
        PettyCashSurrenderHeader.Reset();
        PettyCashSurrenderHeader.SetRange(PettyCashSurrenderHeader."No.", pettyCashNo);
        if PettyCashSurrenderHeader.Find('-') then begin
            ApprovalMngnt.OnCancelSurrPettyCashforApproval(PettyCashSurrenderHeader);
        end;
    end;

    procedure GeneratePayslipReport(employeeNo: Text; period: Date; fileNameFromApp: Text)
    var
        fileName: Text;

        PRLPeriodTransactions: Record "PRL-Period Transactions";
    begin
        fileName := FILEPATH_S + fileNameFromApp;
        // fileName := FILEPATH_S2 + fileNameFromApp;
        if Exists(fileName) then Erase(fileName);

        PRLPeriodTransactions.RESET;
        PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code", EmployeeNo);
        PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period", Period);

        IF PRLPeriodTransactions.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(Report::"Individual Payslips V.1.1.3", fileName, PRLPeriodTransactions);
            MESSAGE('Report saved successfully at %1', fileName);
        END ELSE BEGIN
            MESSAGE('No data found for the specified employee and period.');
        end;
    end;

    procedure Generatep9Report(employeeNo: Text; period: Integer; fileNameFromApp: Text)
    var
        fileName: Text;
    begin
        fileName := FILEPATH_S + fileNameFromApp;
        //fileName:= FILEPATH_S2 + fileNameFromApp;

        if Exists(fileName) then Erase(fileName);

        P9.Reset();
        P9.SetRange(P9."Employee Code", employeeNo);
        //  P9.SetRange(P9."Payroll Period", period);
        P9.SetRange(P9."Period Year", period);
        if P9.Find('-') then begin
            Report.SaveAsPdf(Report::"P9 Report (Final)", fileName, P9);
        end;
    end;
    // procedure ClaimRequisitionApprovalRequest(reqNo: Code[40]) Message:Text
    // var
    //     GLAccount: Record "G/L Account";
    //     DimensionValue: Record "Dimension Value";
    //     PostBudgetEnties: Codeunit "Post Budget Enties";
    //     FINBudgetEntries: Record "FIN-Budget Entries";
    //     ClaimRequisition: Record "FIN-Staff Claims Header";
    //     BCSetup: Record "FIN-Budgetary Control Setup";
    //     FINStaffClaimLines: Record "FIN-Staff Claim Lines";
    // begin
    //     ClaimRequisition.Reset();
    //     ClaimRequisition.SetRange(ClaimRequisition."No.", reqNo);
    //     if ClaimRequisition.Find('-') then begin
    //         if ApprovalMngnt.IsClaimsEnabled(ClaimRequisition) = false then begin
    //             Message := 'Approval workflow not enabled';
    //             exit;
    //         end;

    //         BCSetup.Get();
    //         if not ((BCSetup.Mandatory) and (BCSetup."Claims Budget mandatory")) then exit;
    //         BCSetup.TestField("Current Budget Code");

    //         FINStaffClaimLines.Reset();
    //         FINStaffClaimLines.SetRange(FINStaffClaimLines.No, reqNo);
    //         if FINStaffClaimLines.Find('-') then begin
    //             repeat
    //                 // Check if budget exists
    //                 FINStaffClaimLines.TestField("Account No:");
    //                 GLAccount.Reset();
    //                 GLAccount.SetRange("No.", FINStaffClaimLines."Account No:");
    //                 if GLAccount.Find('-') then begin
    //                     GLAccount.TestField(Name);
    //                     DimensionValue.Reset();
    //                     DimensionValue.SetRange(DimensionValue.Code, ClaimRequisition."Global Dimension 1 Code");
    //                     DimensionValue.SetRange(DimensionValue.Code, ClaimRequisition."Shortcut Dimension 2 Code");
    //                     if DimensionValue.Find('-') then begin
    //                         DimensionValue.TestField(Name);
    //                         FINBudgetEntries.Reset();
    //                         FINBudgetEntries.SetRange(FINBudgetEntries."Budget Name", BCSetup."Current Budget Code");
    //                         FINBudgetEntries.SetRange(FINBudgetEntries."G/L Account No.", FINStaffClaimLines."Account No:");
    //                         FINBudgetEntries.SetFilter(FINBudgetEntries."Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment, FINBudgetEntries."Transaction Type"::Allocation);
    //                         FINBudgetEntries.SetFilter(FINBudgetEntries."Commitment Status", '%1|%2', FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::Commitment);
    //                         FINBudgetEntries.SetFilter(FINBudgetEntries.Date, PostBudgetEnties.GetBudgetStartAndEndDates(ClaimRequisition.Date));
    //                         if FINBudgetEntries.Find('-') then begin
    //                             FINBudgetEntries.CalcSums(FINBudgetEntries.Amount);
    //                             if FINBudgetEntries.Amount > 0 then begin
    //                                 if FINStaffClaimLines.Amount > FINBudgetEntries.Amount then Error('Less Funds, Account: ' + GLAccount.Name);                                       

    //                                 // Commit budget here
    //                                 PostBudgetEnties.CheckBudgetAvailability(FINStaffClaimLines."Account No:", ClaimRequisition.Date, FINStaffClaimLines."Global Dimension 1 Code", FINStaffClaimLines."Shortcut Dimension 2 Code",FINStaffClaimLines."Shortcut Dimension 3 Code",FINStaffClaimLines."Shortcut Dimension 4 Code",
    //                                     FINStaffClaimLines.Amount, FINStaffClaimLines."Account Name", 'CLAIM', ClaimRequisition."No." + FINStaffClaimLines."Account No:", ClaimRequisition.Purpose);
    //                             end else Error('No allocation for Account: ' + GLAccount.Name);
    //                         end else begin
    //                             if PostBudgetEnties.checkBudgetControl(FINStaffClaimLines."Account No:") then Error('Missing Budget for  Account: ' + GLAccount.Name);
    //                         end;
    //                     end;
    //                 end;
    //             until FINStaffClaimLines.Next = 0;
    //         end;

    //         ApprovalMngnt.OnSendClaimforApproval(ClaimRequisition);
    //         Message := 'SUCCESS';
    //     end;
    // end;

    procedure SaveMemoAttchmnts(DocumentsNoz: Text; Attachmentz: Text; Decriptionz: Text; Username: Text)
    var
        Attchemnets: Record GeneralDocumentAttachment;
    begin
        Attchemnets.RESET;
        Attchemnets.INIT;
        Attchemnets."Document No" := DocumentsNoz;
        Attchemnets.Attachment := Attachmentz;
        Attchemnets.Description := Decriptionz;
        Attchemnets.UserID := Username;
        Attchemnets.INSERT;
    end;

    procedure RegFileUploadAtt(retNo: Code[50]; FileName: Text; attachment: BigText; tableId: Integer; DocType: Text) return_value: Boolean
    var
        FromRecRef: RecordRef;
        FileManagement: Codeunit "File Management";
        Bytes: dotnet BCArray;
        Convert: dotnet BCConvert;
        MemoryStream: dotnet BCMemoryStream;
        Ostream: OutStream;
        tableFound: Boolean;
        ImprestSurrenderHeader: Record "FIN-Imprest Surr. Header";
        ClaimRequisition: Record "FIN-Staff Claims Header";
        ImprestRequisition: Record "FIN-Imprest Header";
        PettyCashHeader: Record "Advance PettyCash Header";
        PettyCashSurrender: Record "PettyCash Surrender Header";
        DocAttachment: Record "Document Attachment";
    begin

        tableFound := false;
        return_value := false;
        if TableID = Database::"FIN-Imprest Surr. Header" then begin
            ImprestSurrenderHeader.RESET;
            if ImprestSurrenderHeader.FIND('-') then begin
                FromRecRef.GETTABLE(ImprestSurrenderHeader);
            end;
            tableFound := true;
        end;

        if TableId = Database::"FIN-Staff Claims Header" then begin
            ClaimRequisition.Reset();
            if ClaimRequisition.Find('-') then begin
                FromRecRef.GetTable(ClaimRequisition);
            end;
            tableFound := true;
        end;

        if TableId = Database::"FIN-Imprest Header" then begin
            ImprestRequisition.Reset();
            if ImprestRequisition.Find('-') then begin
                FromRecRef.GetTable(ImprestRequisition);
            end;
            tableFound := true;
        end;

        if tableId = Database::"Advance PettyCash Header" then begin
            PettyCashHeader.Reset();
            if PettyCashHeader.Find('-') then begin
                FromRecRef.GetTable(PettyCashHeader);
            end;
            tableFound := true;
        end;

        if tableId = Database::"Advance PettyCash Header" then begin
            PettyCashHeader.Reset();
            if PettyCashHeader.Find('-') then begin
                FromRecRef.GetTable(PettyCashHeader);
            end;
            tableFound := true;
        end;

        if tableId = Database::"PettyCash Surrender Header" then begin
            PettyCashSurrender.Reset();
            if PettyCashSurrender.Find('-') then begin
                FromRecRef.GetTable(PettyCashSurrender);
            end;
            tableFound := true;
        end;

        if tableFound = true then begin
            if FileName <> '' then begin
                Clear(DocAttachment);
                DocAttachment.Init();
                DocAttachment."File Extension" := FileManagement.GetExtension(FileName);
                DocAttachment."File Name" := CopyStr(FileManagement.GetFileNameWithoutExtension(FileName), 1, MaxStrLen(FileName));
                DocAttachment.Validate("File Extension", FileManagement.GetExtension(FileName));
                DocAttachment.Validate("File Name", CopyStr(FileManagement.GetFileNameWithoutExtension(FileName), 1, MaxStrLen(FileName)));
                DocAttachment."Table ID" := FromRecRef.Number;
                DocAttachment."No." := retNo;
                DocAttachment.Validate("Table ID", FromRecRef.Number);
                DocAttachment.Validate("No.", retNo);
                Bytes := Convert.FromBase64String(Attachment);
                MemoryStream := MemoryStream.MemoryStream(Bytes);
                DocAttachment."Document Reference ID".ImportStream(MemoryStream, '', FileName);
                DocAttachment.Insert(true);
                return_value := true;

            end else
                return_value := false;
        end else
            return_value := false;
    end;

    procedure RegFileUploadAtt1(retNo: Code[50]; FileName: Text; attachment: BigText; tableId: Integer; DocType: Text) return_value: Boolean
    var
        FromRecRef: RecordRef;
        FileManagement: Codeunit "File Management";
        Bytes: dotnet BCArray;
        //  Convert: dotnet Convert;
        // MemoryStream: dotnet MemoryStream;
        Ostream: OutStream;
        tableFound: Boolean;
        ImprestSurrenderHeader: Record "FIN-Imprest Surr. Header";
        ClaimRequisition: Record "FIN-Staff Claims Header";
        ImprestRequisition: Record "FIN-Imprest Header";
        PettyCashHeader: Record "Advance PettyCash Header";
        PettyCashSurrender: Record "PettyCash Surrender Header";
        DocAttachment: Record "Document Attachment";
    begin

        tableFound := false;
        return_value := false;
        if TableID = Database::"FIN-Imprest Surr. Header" then begin
            ImprestSurrenderHeader.RESET;
            if ImprestSurrenderHeader.FIND('-') then begin
                FromRecRef.GETTABLE(ImprestSurrenderHeader);
            end;
            tableFound := true;
        end;

        if TableId = Database::"FIN-Staff Claims Header" then begin
            ClaimRequisition.Reset();
            if ClaimRequisition.Find('-') then begin
                FromRecRef.GetTable(ClaimRequisition);
            end;
            tableFound := true;
        end;

        if TableId = Database::"FIN-Imprest Header" then begin
            ImprestRequisition.Reset();
            if ImprestRequisition.Find('-') then begin
                FromRecRef.GetTable(ImprestRequisition);
            end;
            tableFound := true;
        end;

        if tableId = Database::"Advance PettyCash Header" then begin
            PettyCashHeader.Reset();
            if PettyCashHeader.Find('-') then begin
                FromRecRef.GetTable(PettyCashHeader);
            end;
            tableFound := true;
        end;

        if tableId = Database::"Advance PettyCash Header" then begin
            PettyCashHeader.Reset();
            if PettyCashHeader.Find('-') then begin
                FromRecRef.GetTable(PettyCashHeader);
            end;
            tableFound := true;
        end;

        if tableId = Database::"PettyCash Surrender Header" then begin
            PettyCashSurrender.Reset();
            if PettyCashSurrender.Find('-') then begin
                FromRecRef.GetTable(PettyCashSurrender);
            end;
            tableFound := true;
        end;

        if tableFound = true then begin
            if FileName <> '' then begin
                Clear(DocAttachment);
                DocAttachment.Init();
                DocAttachment."File Extension" := FileManagement.GetExtension(FileName);
                DocAttachment."File Name" := CopyStr(FileManagement.GetFileNameWithoutExtension(FileName), 1, MaxStrLen(FileName));
                DocAttachment.Validate("File Extension", FileManagement.GetExtension(FileName));
                DocAttachment.Validate("File Name", CopyStr(FileManagement.GetFileNameWithoutExtension(FileName), 1, MaxStrLen(FileName)));
                DocAttachment."Table ID" := FromRecRef.Number;
                DocAttachment."No." := retNo;
                DocAttachment.Validate("Table ID", FromRecRef.Number);
                DocAttachment.Validate("No.", retNo);
                // Bytes := Convert.FromBase64String(Attachment);
                // MemoryStream := MemoryStream.MemoryStream(Bytes);
                //DocAttachment."Document Reference ID".ImportStream(MemoryStream, '', FileName);
                DocAttachment.Insert(true);
                return_value := true;

            end else
                return_value := false;
        end else
            return_value := false;
    end;

    procedure DeleteDocumentAttachment(systemId: Text; fileName: Text; documentNo: Text) Message: Text
    var
        Attachments: Record GeneralDocumentAttachment;
        DocumentAttachment: Record "Document Attachment";
    begin
        Attachments.Reset();
        Attachments.SetRange(Attachments.SystemId, systemId);
        if Attachments.Find('-') then begin
            Attachments.Delete();
            Message := 'SUCCESS'
        end;

        DocumentAttachment.Reset();
        DocumentAttachment.SetRange(DocumentAttachment."File Name", fileName);
        DocumentAttachment.SetRange(DocumentAttachment."No.", documentNo);
        if DocumentAttachment.Find('-') then begin
            DocumentAttachment.Delete();
            Message := Message + '::' + 'SUCCESS';
        end;
    end;

    procedure GetAttachmentDetails(systemId: Text) Message: Text
    var
        Attachments: Record GeneralDocumentAttachment;
    begin
        Attachments.Reset();
        Attachments.SetRange(Attachments.SystemId, systemId);
        if Attachments.Find('-') then begin
            Message := Attachments."Document No" + '::' + Attachments.Description;
        end;
    end;
}

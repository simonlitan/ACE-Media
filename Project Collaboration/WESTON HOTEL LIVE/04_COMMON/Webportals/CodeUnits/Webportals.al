dotnet
{
    assembly(mscorlib)
    {
        type(System.Array; Bytes) { }
    }
    assembly(mscorlib)
    {
        type(System.Convert; Convert) { }
    }
    assembly(mscorlib)
    {
        type(System.IO.MemoryStream; MemoryStream) { }
    }
}
codeunit 52178865 "Webportals"
{
    var
        EmployeeCard: Record "HRM-Employee C";
        LeaveLE: Record "HRM-Leave Ledger";
        LeaveT: Record "HRM-Leave Requisition";
        HRLeave: Record "HRM-Leave Requisition";
        ltype: Record "HRM-Leave Types";
        HRSetup: Record "HRM-Setup";
        HRMEmployeeD: Record "HRM-Employee C";
        SupervisorCard: Record "User Setup";
        ApprovalMgmtFin: Codeunit "Init Code";
        ApprovalMgnt: Codeunit IntCodeunit2;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        //ApprovalMgmtHr: Codeunit "Leave Init Code";
        //ApprovalSetup: Record "Approval Setup";
        PurchaseRN: Record "Purchase Header";
        PurchaseLines: Record "Purchase Line";
        ClaimRequisition: Record "FIN-Staff Claims Header";
        PRLPeriodTransactions: Record "PRL-Period Transactions";
        StoreRequisition: Record "PROC-Store Requistion Header";
        StoreReqLines: Record "PROC-Store Requistion Lines";
        ImprestRequisition: Record "FIN-Imprest Header";
        ApproverComments: Record "Approval Comment Line";
        ImprestReqLines: Record "FIN-Imprest Lines";
        ClaimReqLines: Record "FIN-Staff Claim Lines";
        P9: Record "PRL-Employee P9 Info";
        RecAccountusers: Record "Online Recruitment users";
        JobApplications: Record "HRM-Job Applications (B)";
        ApplicantQualifications: Record "HRM-Applicant Qualifications";
        NextJobapplicationNo: Code[20];
        Vendors: Record Vendor;
        QuotationRequestVendors: Record "PROC-Quotation Request Vendors";
        PurchaseHeader: Record "Purchase Header";
        dates: Record Date;
        SDate: Date;
        EndLeave: Boolean;
        varDaysApplied: Decimal;
        fReturnDate: Date;
        DayCount: Integer;
        tableNo: Integer;
        State: Option Open,Pending,Approval,Cancelled,Approved,"Pending Approval";
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
        BaseCalendar: Record "Base Calendar Change";
        ApprovalEntry: Record "Approval Entry";
        ApprovalEntry_2: Record "Approval Entry";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        // AppMgt: Codeunit "Approvals Management-PROC";
        Approvals: Codeunit "Approval Workflow Setup Mgt.";
        TXTCorrectDetails: Label 'Login';
        TXTIncorrectDetails: Label 'Incorrect Username or Password';
        FILESPATH_S: Label 'C:\inetpub\wwwroot\StaffPortal\Downloads\';
        FILESPATH_V: Label 'C:\inetpub\wwwroot\Vendor\Downloads\';
        FILESPATH_EPROC: Label 'C:\inetpub\wwwroot\Procurement\Downloads\';
        Text004: Label 'Approval Setup not found.';
        TblCustomer: Record Customer;
        daysInteger: Decimal;
        NextLeaveApplicationNo: Text;
        NextClaimapplicationNo: text;
        NextImprestapplicationNo: Text;
        NextBidApplicationNo: Text;
        NextStoreqNo: Text;
        LastNum: Text;
        SupervisorId: Text;
        EmployeeUserId: Text;
        FullNames: Text;
        Initials: Option;
        pCode: Code[30];
        IDNum: Text;
        Gender: Option;
        Phone: Code[20];
        rAddress: Text;
        Citizenship: Text;
        County: Text;
        Mstatus: Option;
        Eorigin: Option;
        Disabled: Text;
        dDetails: Text;
        DOB: Date;
        Dlicense: Text;
        KRA: Text;
        firstLang: Code[50];
        secondLang: Code[50];
        AdditionalLang: Code[50];
        ApplicantType: Option;
        pAddress: Text;
        filename: Text;
        IStream: InStream;
        Bytes: DotNet Bytes;
        Convert: DotNet Convert;
        MemStream: DotNet MemoryStream;
        tblBidder: Record "Tender Applicants Registration";
        tblTenders: Record "Tender Header";
        tblTenderBids: Record "Tender Submission Header";
        tblTenderBidFinReq: Record "Tender Bidder Fin Reqs";
        TrainingApplication: Record "HRM-Training Applications";
        NextTrainingApplicationNo: Text;
        ResponsibilityCentre: Record "Responsibility Center";
    // Staff Portal Functions
    procedure GetResponsibilityCentres(grouping: Text) Message: Text
    begin
        ResponsibilityCentre.Reset();
        ResponsibilityCentre.SetRange(ResponsibilityCentre.Grouping, grouping);
        if ResponsibilityCentre.Find('-') then begin
            repeat
                Message += ResponsibilityCentre.Code + '[]';
            until ResponsibilityCentre.Next() = 0;
            //Message := ResponsibilityCentre.Code + '[]';
        end;

    end;

    procedure GetDepartments() Message: Text
   var 
    dimensions: Record "Dimension Value";
    begin
        dimensions.Reset();
        dimensions.SetRange(dimensions."Global Dimension No.", 2);
        if dimensions.Find('-') then begin
            repeat
                Message += dimensions.Code + '::' + dimensions.Name + '[]';
            until dimensions.Next() = 0;
            //Message := dimensions."Dimension Value Code" + '[]';
        end;
    end;

    procedure CreateTrainingRequisition(EmployeeNo: Code[30]; coursettl: Text; trainingCat: Integer; Supervisor: Text; department: Text; iCourseCode: Text; fromdate: Date; todate: Date; duation: Integer; dunits: Integer; sponsor: Integer; specify: Text; location: Integer; country: Text; county: Text; cost: Decimal; trainer: Text; rCenter: Text; purpose: Text) successMessage: Text
    var
        test: Page "HRM-Training Application Card";
    begin
        TrainingApplication.INIT;
        HRSetup.GET;
        HRSetup.FindLast();
        NextTrainingApplicationNo := NoSeriesMgt.GetNextNo(HRSetup."Training Application Nos.", 0D, TRUE);
        TrainingApplication.Reset();
        TrainingApplication.SETRANGE(TrainingApplication."Employee No.", EmployeeNo);
        IF NOT TrainingApplication.FindLast()
        THEN BEGIN
            TrainingApplication."Application No" := NextTrainingApplicationNo;
            TrainingApplication."No. Series" := HRSetup."Training Application Nos.";
            TrainingApplication."Application Date" := Today;
            TrainingApplication."User ID" := EmployeeNo;
            TrainingApplication."Employee No." := EmployeeNo;
            EmployeeCard.Reset();
            EmployeeCard.SetRange("No.", EmployeeNo);
            if EmployeeCard.FindFirst() then
                TrainingApplication."Employee Name" := EmployeeCard.FullName();
            //TrainingApplication.Validate("Employee No.");
            if trainingCat = 0 then
                TrainingApplication."Training Category" := TrainingApplication."Training Category"::Individual
            else
                TrainingApplication."Training Category" := TrainingApplication."Training Category"::Group;
            TrainingApplication.Supervisor := Supervisor;
            TrainingApplication."Course Title" := coursettl;
            TrainingApplication.Department := department;
            TrainingApplication.Validate(Department);
            TrainingApplication."Individual Course Code" := iCourseCode;
            TrainingApplication.Validate("Individual Course Code");
            TrainingApplication."From Date" := fromdate;
            TrainingApplication."To Date" := todate;
            TrainingApplication.Duration := duation;
            if dunits = 0 then
                TrainingApplication."Duration Units" := TrainingApplication."Duration Units"::Hours;
            if dunits = 1 then
                TrainingApplication."Duration Units" := TrainingApplication."Duration Units"::Days;
            if dunits = 2 then
                TrainingApplication."Duration Units" := TrainingApplication."Duration Units"::Weeks;
            if dunits = 3 then
                TrainingApplication."Duration Units" := TrainingApplication."Duration Units"::Months;
            if dunits = 4 then
                TrainingApplication."Duration Units" := TrainingApplication."Duration Units"::Years;
            if sponsor = 0 then
                TrainingApplication.Sponsor := TrainingApplication.Sponsor::Self;
            if sponsor = 1 then
                TrainingApplication.Sponsor := TrainingApplication.Sponsor::Donor;
            if sponsor = 2 then
                TrainingApplication.Sponsor := TrainingApplication.Sponsor::Other;

            TrainingApplication.Specify := specify;

            if location = 0 then
                TrainingApplication.Location := TrainingApplication.Location::Local;
            if location = 1 then
                TrainingApplication.Location := TrainingApplication.Location::International;

            TrainingApplication.Country := country;
            TrainingApplication.County := county;
            TrainingApplication."Cost Of Training" := cost;
            TrainingApplication.Trainer := trainer;
            TrainingApplication.Validate(Trainer);
            TrainingApplication."Responsibility Center" := rCenter;
            TrainingApplication."Purpose of Training" := purpose;

            TrainingApplication.Insert();

            successMessage := 'Training application submitted successfully';

        END
        else begin
            successMessage := 'You have pending approval training applications';
        end;
        //send request for approval
        // TrainingApplication.Reset();
        // TrainingApplication.SETRANGE(TrainingApplication."Application No", NextTrainingApplicationNo);
        // IF TrainingApplication.FIND('-')
        // THEN BEGIN
        //     //ApprovalMgmtHr.on
        // end
    end;

    procedure CheckStaffLogin(username: Code[20]; userpassword: Text[50]) ReturnMsg: Text[200];
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);

        if (EmployeeCard.Find('-')) then begin
            //if (EmployeeCard.Status = 0) then begin
            if (EmployeeCard.Status = EmployeeCard.Status::Active) then begin
                if (EmployeeCard."Changed Password" = true) then begin
                    if (EmployeeCard."Portal Password" = userpassword) then begin
                        ReturnMsg := 'SUCCESS' + '::' + Format(EmployeeCard."Changed Password") + '::' + EmployeeCard."No." + '::' + EmployeeCard.FullName();
                    end else begin
                        FullNames := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
                        ReturnMsg := 'Invalid Password' + '::' + Format(EmployeeCard."Changed Password") + '::' + EmployeeCard."No." + '::' + FullNames;
                    end
                end else begin
                    if (EmployeeCard."Portal Password" = userpassword) then begin
                        ReturnMsg := 'SUCCESS' + '::' + Format(EmployeeCard."Changed Password") + '::' + EmployeeCard."No." + '::' + FullNames;
                    end else begin
                        ReturnMsg := 'Invalid Password' + '::' + Format(EmployeeCard."Changed Password");
                    end
                end
            end else begin
                ReturnMsg := 'Your Account Status Is Inactive. Please Contact Administrator.' + '::';
            end
        end else begin
            ReturnMsg := 'Invalid Staff Number' + '::';
        end

    end;

    procedure CheckStaffLoginForUnchangedPass(Username: Code[20]; password: Text[50]) ReturnMsg: Text[200];
    begin
        EmployeeCard.Reset();

        EmployeeCard.SetRange(EmployeeCard."No.", Username);
        EmployeeCard.SetRange(EmployeeCard."Portal Password", password);

        if (EmployeeCard.Find('-')) then begin
            if (EmployeeCard.Status = EmployeeCard.Status::Active) then begin
                ReturnMsg := 'SUCCESS' + '::' + EmployeeCard."No." + '::' + EmployeeCard."Company E-Mail";
            end else begin
                ReturnMsg := 'Your Account Status Is Inactive. Please Contact Administrator.' + '::';
            end

        end
        else begin
            ReturnMsg := 'Invalid Password' + '::'
        end

    end;

    procedure UpdateStaffPass(username: Code[30]; genpass: Text) ReturnMsg: Text[200];
    begin
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", username);
        IF EmployeeCard.FIND('-') THEN BEGIN
            EmployeeCard."Portal Password" := genpass;
            EmployeeCard."Changed Password" := TRUE;
            EmployeeCard.Modify();
            ReturnMsg := 'SUCCESS' + '::';
        END
    end;

    procedure VerifyCurrentPassword(username: Code[20]; oldpass: Text[100]) ReturnMsg: Text[200];
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        EmployeeCard.SetRange(EmployeeCard."Portal Password", oldpass);

        if (EmployeeCard.Find('-')) then begin
            ReturnMsg := 'SUCCESS' + '::';
        end
    end;

    procedure ChangeStaffPassword(username: Code[30]; password: Text) ReturnMsg: Text[200];
    begin
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", username);
        IF EmployeeCard.FIND('-') THEN BEGIN
            EmployeeCard."Portal Password" := password;
            EmployeeCard."Changed Password" := TRUE;
            EmployeeCard.Modify();
            ReturnMsg := 'SUCCESS' + '::';
        END;
    end;

    procedure CheckStaffPasswordChanged(username: Code[30]) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", username);
        IF EmployeeCard.FIND('-') THEN BEGIN
            IF (EmployeeCard."Changed Password" = TRUE) THEN BEGIN
                Message := 'SUCCESS' + '::' + FORMAT(EmployeeCard."Changed Password");
            END ELSE BEGIN
                Message := 'FAILED' + '::' + FORMAT(EmployeeCard."Changed Password");
            END
        END ELSE BEGIN
            Message := 'FAILED' + '::';
        END
    end;

    procedure CheckValidStaffNo(username: Code[30]) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", username);
        IF EmployeeCard.FIND('-') THEN BEGIN
            Message := 'SUCCESS' + '::';
        END ELSE BEGIN
            Message := 'FAILED' + '::';
        END
    end;

    procedure GetStaffProfileDetails(username: Code[30]) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", username);
        IF EmployeeCard.FIND('-') THEN BEGIN
            Message := EmployeeCard."ID Number" + '::' + EmployeeCard.Citizenship + '::' + EmployeeCard."Postal Address" + '::' +
  EmployeeCard."Job Title" + '::' + EmployeeCard."Company E-Mail" + '::' + FORMAT(EmployeeCard.Title) + '::' + FORMAT(EmployeeCard."Date Of Birth") + '::' + FORMAT(EmployeeCard.Gender) + '::' + EmployeeCard."Cellular Phone Number" + '::' + FORMAT(EmployeeCard.Title);

        END
    end;

    procedure GetStaffMail(username: Code[30]) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", username);
        IF EmployeeCard.FIND('-') THEN BEGIN
            Message := EmployeeCard."Company E-Mail" + '::';
        END
    end;

    procedure GetProfilePicture(StaffNo: Text) BaseImage: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", StaffNo);

        IF EmployeeCard.FIND('-') THEN BEGIN
            IF EmployeeCard.Picture.HASVALUE THEN BEGIN
                // EmployeeCard.CALCFIELDS(Picture);
                // EmployeeCard.Picture.CREATEINSTREAM(IStream);
                // MemoryStream := MemoryStream.MemoryStream();
                // COPYSTREAM(MemoryStream, IStream);
                // Bytes := MemoryStream.GetBuffer();
                // BaseImage := Convert.ToBase64String(Bytes);
            END;
        END;
    end;

    procedure GetCurrentPassword(username: Code[30]) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", username);
        IF EmployeeCard.FIND('-') THEN BEGIN
            Message := EmployeeCard."Portal Password" + '::';
        END
    end;

    procedure GenerateLeaveStatement(StaffNo: Text; filenameFromApp: Text)
    begin
        filename := FILESPATH_S + filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);
        LeaveT.Reset();
        LeaveT.SETRANGE(LeaveT."Employee No", StaffNo);

        IF LeaveT.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(Report::"HR Leave Statement", filename, LeaveT);
        END
    end;

    procedure GenerateLeaveApplication(StaffNo: Text; filenameFromApp: Text)
    begin
        filename := FILESPATH_S + filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", StaffNo);

        IF EmployeeCard.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(Report::"HR Leave Application (1)", filename, EmployeeCard);
        END
    end;

    procedure GetStaffDetails(username: Code[30]) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", username);
        IF EmployeeCard.FIND('-') THEN BEGIN
            Message := EmployeeCard."ID Number" + '::' + EmployeeCard.Citizenship + '::' + EmployeeCard."Postal Address" + '::' +
  EmployeeCard."Job Title" + '::' + EmployeeCard."Company E-Mail" + '::' + FORMAT(EmployeeCard.Title) + '::' + FORMAT(EmployeeCard."Date Of Birth");

        END
    end;

    procedure GetStaffGender(username: Code[30]) Message: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", username);
        IF EmployeeCard.FIND('-') THEN BEGIN
            Message := FORMAT(EmployeeCard.Gender) + '::' + EmployeeCard."Cellular Phone Number";

        END
    end;

    procedure GeneratePaySlipReport(EmployeeNo: Text; Period: Date; filenameFromApp: Text) filename: Text[100]
    begin
        filename := FILESPATH_S + filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);
        //MESSAGE('OK');
        PRLPeriodTransactions.RESET;
        PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code", EmployeeNo);
        PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period", Period);

        IF PRLPeriodTransactions.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(Report::"Individual Payslips V.1.1.3", filename, PRLPeriodTransactions);
        END;
        EXIT(filename);
    end;

    procedure Generatep9Report(SelectedPeriod: Integer; EmployeeNo: Text; filenameFromApp: Text) filename: Text[100]
    begin
        filename := FILESPATH_S + filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);
        //MESSAGE('OK');
        P9.Reset();
        P9.SETRANGE(P9."Period Year", SelectedPeriod);
        P9.SETRANGE(P9."Employee Code", EmployeeNo);

        IF P9.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(51746, filename, P9);
        END;
        EXIT(filename);
    end;

    procedure ApproveDocument(DocumentNo: Text; ApproverID: Text)
    var
    //  ApprovalEntryProc: Record "Approval Entry-proc";
    begin
        // ApprovalEntryProc.SETRANGE(ApprovalEntryProc."Document No.", DocumentNo);
        // ApprovalEntryProc.SETRANGE(ApprovalEntryProc."Approver ID", ApproverID);

        // IF ApprovalEntryProc.FIND('-') THEN BEGIN

        //     REPEAT
        //         IF NOT ApprovalSetup.GET THEN
        //             ERROR(Text004);

        //         AppMgt.ApproveApprovalRequest(ApprovalEntryProc);

        //     UNTIL ApprovalEntryProc.NEXT = 0;
        // END
    end;

    procedure RejectDocument(DocumentNo: Text; ApproverID: Text)
    var
    // ApprovalEntryProc: Record "Approval Entry-proc";
    begin
        // ApprovalEntryProc.SETRANGE(ApprovalEntryProc."Document No.", DocumentNo);
        // ApprovalEntryProc.SETRANGE(ApprovalEntryProc."Approver ID", ApproverID);

        // IF ApprovalEntryProc.FIND('-') THEN
        //     REPEAT
        //         IF NOT ApprovalSetup.GET THEN
        //             ERROR(Text004);

        //         AppMgt.RejectApprovalRequest(ApprovalEntryProc);

        //     UNTIL ApprovalEntryProc.NEXT = 0;
    end;

    procedure CancelDocument(DocumentNo: Text; SenderID: Text)
    begin
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SETRANGE(ApprovalEntry."Sender ID", SenderID);

        IF ApprovalEntry.FIND('-') THEN
            REPEAT
            //AppMgt.CancelApproval(ApprovalEntry);
            UNTIL ApprovalEntry.NEXT = 0;
    end;

    procedure CancelApprovalRequest(ReqNo: Text)
    begin
        ApprovalEntry.Reset();
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", ReqNo);
        IF ApprovalEntry.FIND('-') THEN BEGIN
            ApprovalEntry.DELETE;
            PurchaseRN.Reset();
            PurchaseRN.SETRANGE(PurchaseRN."No.", ReqNo);
            IF PurchaseRN.FIND('-') THEN BEGIN
                PurchaseRN.Status := PurchaseRN.Status::Open;
                PurchaseRN.Modify();
            END;
        END;
    end;

    procedure AvailableLeaveDays(EmployeeNo: Text; LeaveType: Text) availabledays: Text
    begin
        CLEAR(availabledays);
        CLEAR(daysInteger);
        LeaveLE.Reset();
        LeaveLE.SETRANGE(LeaveLE."Employee No", EmployeeNo);
        LeaveLE.SETRANGE(LeaveLE."Leave Type", LeaveType);
        //LeaveLE.SETRANGE(LeaveLE."Leave Period",Year);
        IF LeaveLE.FIND('-') THEN
            REPEAT
            BEGIN
                daysInteger := daysInteger + LeaveLE."No. of Days"
                // availabledays:=FORMAT(LeaveLE."No. of Days");
            END;
            UNTIL LeaveLE.NEXT = 0;
        availabledays := FORMAT(daysInteger);
    end;

  procedure AvailableLeaveDayss(EmployeeNo: Text; LeaveType: Text) availabledays: Text
    // procedure AvailableLeaveDays(EmployeeNo: Text; LeaveType: Text; CurrentLeavePeriod: Code[10]) availabledays: Text
    Var
        //LeavePeriods: Record "HRM-Leave Periods";
        LvTypes: Record "HRM-Leave Types";
    //Year: Code[30];
    begin
        CLEAR(availabledays);
        CLEaR(daysInteger);
        LvTypes.Reset();
        LvTypes.SetRange(Code, LeaveType);
        if LvTypes.Find('-') then begin
             if LvTypes.Code <> 'ANN' = false then begin
           // if LvTypes."ANN" = false then begin
                LeaveLE.Reset();
                LeaveLE.SetRange("Employee No", EmployeeNo);
                LeaveLE.SetRange("Leave Type", LeaveType);
                //LeaveLE.SetFilter("Current Leave Period", currentleaveperiod);
                if LeaveLE.Find('-') then
                    LeaveLE.CalcSums("No. of Days");
                daysInteger := LvTypes.Days + LeaveLE."No. of Days";
            end else begin
                LeaveLE.Reset();
                LeaveLE.SetRange("Employee No", EmployeeNo);
                LeaveLE.SetRange("Leave Type", LeaveType);
                //LeaveLE.SetFilter("Current Leave Period", currentleaveperiod);
                if LeaveLE.Find('-') then begin
                    LeaveLE.CalcSums("No. of Days");
                    daysInteger := LeaveLE."No. of Days";
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
    procedure IsLeaveAnnual(leaveType: Text) Message: Text
    var
        LeaveTypes: Record "HRM-Leave Types";
    begin
        LeaveTypes.Reset();
        LeaveTypes.SetRange(LeaveTypes.Code, leaveType);
        if LeaveTypes.Find('-') then begin
           // Message := Format(LeaveTypes.Code <> 'ANN');
              Message := Format(leaveType = 'ANN')
        end;
    end;

    procedure TotalLeaveDays(EmployeeNo: Text; LeaveType: Text) availabledays: Text
    begin
        CLEAR(availabledays);
        CLEAR(daysInteger);
        LeaveLE.Reset();
        LeaveLE.SETRANGE(LeaveLE."Employee No", EmployeeNo);
        //LeaveLE.SETRANGE(LeaveLE."Leave Period",Year);
        IF LeaveLE.FIND('-') THEN
            REPEAT
            BEGIN
                daysInteger := daysInteger + LeaveLE."No. of Days"
                // availabledays:=FORMAT(LeaveLE."No. of Days");
            END;
            UNTIL LeaveLE.NEXT = 0;
        availabledays := FORMAT(daysInteger);
    end;
     procedure HRMLeaveApplication(username: Text; leaveType: Text;  appliedDays: Decimal;  startDate: Date; endDate: Date; returnDate: Date; purpose: Text;reliever: Text; responsibilityCenter: Text;offDays: Integer; myOffDay: Integer; department: Text) Message: Text
    var
        NextLeaveNo: Text;
        FullName: Text;
        NameParts: List of [Text];
        TrimmedName: Text;
    begin
        HRSetup.Get();
        NextLeaveNo := NoSeriesMgt.GetNextNo(HRSetup."Leave Application Nos.", 0D, true);
        LeaveT.Init();
        LeaveT."No." := NextLeaveNo;
        LeaveT."No. Series" := HRSetup."Leave Application Nos.";
        LeaveT."Employee No" := username;
        LeaveT.Validate("Employee No");
        LeaveT."Reliever No." := reliever;
        LeaveT.Validate("Reliever No.");
        LeaveT."Leave Type" := leaveType;
        LeaveT."Applied Days" := appliedDays;
        LeaveT."Starting Date" := startDate;
        LeaveT."End Date" := endDate;
        LeaveT."Return Date" := returnDate;
        LeaveT.Purpose := purpose;
        LeaveT."Responsibility Center" := responsibilityCenter;
       // LeaveT."User ID" := ;
        LeaveT."No. Series" := HRSetup."Leave Application Nos.";
        LeaveT.Date := TODAY;
        LeaveT."Department Code" := department;
       LeaveT."Employee Name" := getEmployeeName(username);
        EmployeeCard.Reset();
        EmployeeCard.SetRange(EmployeeCard."No.", username);
        if EmployeeCard.Find('-') then begin
            FullName := getEmployeeName(username); // Get full name
           TrimmedName := CopyStr(FullName, 1, 1) + GetLastWord(FullName); // Extract first letter and last name
            LeaveT."User ID":= TrimmedName;
           
            SupervisorCard.Reset();
            SupervisorCard.SETRANGE(SupervisorCard."User ID", EmployeeCard."User ID");
            IF SupervisorCard.FIND('-')
            THEN BEGIN
                SupervisorId := SupervisorCard."Approver ID";
            END;
        end;


        // if LeaveT.Insert() then begin
        //     Message := 'SUCCESS' + '::' + LeaveT."No.";
        // end else begin
        //     Message := 'FAILED' + '::';
        // end;
        //  LeaveT.Reset();
        // LeaveT.SETRANGE(LeaveT."No.", NextLeaveApplicationNo);
        // IF LeaveT.FIND('-')
        // THEN BEGIN
            if (myOffDay = 0) then
                LeaveT."Off Day" := LeaveT."Off Day"::Monday;
            if (myOffDay = 1) then
                LeaveT."Off Day" := LeaveT."Off Day"::Tuesday;
            if (myOffDay = 2) then
                LeaveT."Off Day" := LeaveT."Off Day"::Wednesday;
            if (myOffDay = 3) then
                LeaveT."Off Day" := LeaveT."Off Day"::Thursday;
            if (myOffDay = 4) then
                LeaveT."Off Day" := LeaveT."Off Day"::Friday;
            if (myOffDay = 5) then
                LeaveT."Off Day" := LeaveT."Off Day"::Saturday;
            if (myOffDay = 6) then
                LeaveT."Off Day" := LeaveT."Off Day"::Sunday;
            LeaveT."Total Off Days" := offDays;
            LeaveT.Validate("Total Off Days");
            //LeaveT.Modify();
            LeaveT.Insert();
            
       // END;
       if ApprovalMgnt.IsLeaveEnabled(LeaveT) then begin
            ApprovalMgnt.OnSendLeaveforApproval(LeaveT);
            Message := 'SUCCESS';
        end else begin
            Message := 'FAILED';
        end;

    end;
    procedure GetLastWord(Name: Text): Text;
        var
            Words: List of [Text];
        begin
            Words := Name.Split(' '); // Split full name by spaces
            exit(Words.Get(Words.Count)); // Return last word
        end;

    procedure getEmployeeName(StaffNum: Text) Msg: Text;
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange("No.", StaffNum);
        if EmployeeCard.Find('-') then
            Msg := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name"
        else
            Msg := 'Not found';
    end;

    procedure HRLeaveApplication(EmployeeNo: Text; LeaveType: Text; AppliedDays: Decimal; StartDate: Date; EndDate: Date; ReturnDate: Date; SenderComments: Text; Reliever: Text; RelieverName: Text; rCentre: Text; offDays: Integer; myOffDay: Integer; department: Text) successMessage: Text
    var
    
    HRSetup: Record "HRM-Setup";
        t: Page "HRM-Leave Requisition";
    begin
        LeaveT.INIT;
        HRSetup.GET;
        // NextLeaveApplicationNo := NoSeriesMgt.GetNextNo('LEAVE', 0D, TRUE);
        NextLeaveApplicationNo := NoSeriesMgt.GetNextNo(HRSetup."Leave Application Nos.", 0D, true);
        LeaveT.Init();
        LeaveT."Employee No" := EmployeeNo;
        LeaveT."Reliever No." := Reliever;
        LeaveT.Validate("Reliever No.");
        LeaveT."Reliever Name" := RelieverName;
        LeaveT."No." := NextLeaveApplicationNo;
        LeaveT."Leave Type" := LeaveType;
        LeaveT.VALIDATE("Leave Type");
        LeaveT."Applied Days" := AppliedDays;
        LeaveT.Date := TODAY;
        LeaveT."Off Day" := myOffDay;
        LeaveT."Total Off Days" := offDays;
        LeaveT."Starting Date" := StartDate;
        LeaveT."End Date" := EndDate;
        LeaveT."Return Date" := ReturnDate;
        LeaveT.Purpose := SenderComments;
        LeaveT."No. Series" := HRSetup."Leave Application Nos.";
        LeaveT.Status := HRLeave.Status::Open;
        LeaveT."Responsibility Center" := rCentre;
        LeaveT. "Department Code" := department;
         EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No." , EmployeeNo);

        IF EmployeeCard.FIND('-')
        THEN BEGIN
       
            LeaveT."User ID" := EmployeeCard."User ID";
            EmployeeUserId := EmployeeCard."User ID";
            LeaveT."Employee No" := EmployeeNo;
            LeaveT."Employee Name" := EmployeeCard.FullName;
            SupervisorCard.Reset();
            SupervisorCard.SETRANGE(SupervisorCard."User ID", EmployeeCard."User ID");
            IF SupervisorCard.FIND('-')
            THEN BEGIN
                SupervisorId := SupervisorCard."Approver ID";
            END;
        END;
       if LeaveT.INSERT() then
       successMessage := 'SUCCESS' + '::' + LeaveT."No."
        //send request for approval
        else
            successMessage := 'FAILED' + '::';
        LeaveT.Reset();
        LeaveT.SETRANGE(LeaveT."No.", NextLeaveApplicationNo);
        IF LeaveT.FIND('-')
        THEN BEGIN
            if (myOffDay = 0) then
                LeaveT."Off Day" := LeaveT."Off Day"::Monday;
            if (myOffDay = 1) then
                LeaveT."Off Day" := LeaveT."Off Day"::Tuesday;
            if (myOffDay = 2) then
                LeaveT."Off Day" := LeaveT."Off Day"::Wednesday;
            if (myOffDay = 3) then
                LeaveT."Off Day" := LeaveT."Off Day"::Thursday;
            if (myOffDay = 4) then
                LeaveT."Off Day" := LeaveT."Off Day"::Friday;
            if (myOffDay = 5) then
                LeaveT."Off Day" := LeaveT."Off Day"::Saturday;
            if (myOffDay = 6) then
                LeaveT."Off Day" := LeaveT."Off Day"::Sunday;
            LeaveT."Total Off Days" := offDays;
            LeaveT.Validate("Total Off Days");
            LeaveT.Modify();

            ApprovalMgnt.OnSendLeaveforApproval(LeaveT);
        end
    end;
    procedure OnsendLeaveRequisitionForApproval(leaveNo: Text) Message: Text
    begin
        LeaveT.Reset();
        LeaveT.SetRange(LeaveT."No.", leaveNo);
        if LeaveT.Find('-') then begin
             ApprovalMgnt.OnSendLeaveforApproval(LeaveT)  
            
        end;
    end;
    procedure HRCancelLeaveApplication(LeaveApplicationNo: Text)
    begin
        LeaveT.Reset();
        LeaveT.SETRANGE(LeaveT."No.", LeaveApplicationNo);

        IF LeaveT.FIND('-') THEN BEGIN
            ApprovalMgnt.OnCancelLeaveforApproval(LeaveT);
        END;


        ApprovalEntry.Reset();
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", LeaveApplicationNo);

        IF ApprovalEntry.FIND('-') THEN BEGIN
            REPEAT
                ApprovalEntry.Status := ApprovalEntry_2.Status::Canceled;
                ApprovalEntry.Modify();
            UNTIL ApprovalEntry.NEXT = 0
        END;
    end;

 procedure OnCancelLeaveApplication(leaveNo: Text) Message: Text
    begin
        LeaveT.Reset();
        LeaveT.SetRange(LeaveT."No.", leaveNo);
        if LeaveT.Find('-') then begin
            ApprovalMgnt.OnCancelLeaveforApproval(LeaveT);
        end;
    end;


    procedure CalcReturnDate(EndDate: Date; "Leave Type": Text) RDate: Date
    begin
        IF ltype.GET("Leave Type") THEN BEGIN
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
                    ltype.Reset();
                    ltype.SETRANGE(ltype.Code, "Leave Type");
                    IF ltype.FIND('-') THEN BEGIN
                        IF ltype."Inclusive of Sunday" = FALSE THEN ItsNonWorking := TRUE;
                    END;
                END ELSE
                    IF dates."Period Name" = 'Saturday' THEN BEGIN
                        //check if Leave includes sato
                        ltype.Reset();
                        ltype.SETRANGE(ltype.Code, "Leave Type");
                        IF ltype.FIND('-') THEN BEGIN
                            IF ltype."Inclusive of Saturday" = FALSE THEN ItsNonWorking := TRUE;
                        END;
                    END;

            END;
        END;
    end;

    procedure DetermineLeaveReturnDate(fBeginDate: Date; fDays: Decimal; "Leave Type": Text) fReturnDate: Date
    begin
        ltype.Reset();
        IF ltype.GET("Leave Type") THEN BEGIN
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
        IF ltype.GET(fLeaveCode) THEN BEGIN
            IF ltype."Inclusive of Non Working Days" = TRUE THEN
                EXIT(TRUE);
        END;
    end;

    procedure GetApprovalStatus(DocumentNo: Text) Message: Text
    begin
        ApprovalEntry.Reset();
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", DocumentNo);
        IF ApprovalEntry.FIND('-') THEN BEGIN
            Message := FORMAT(ApprovalEntry.Status);
        END
    end;

    procedure PurchaseHeaderCreate(BusinessCode: Code[50]; DepartmentCode: Code[50]; ResponsibilityCentre: Code[50]; UserID: Text; Purpose: Text)
    begin
        NextLeaveApplicationNo := NoSeriesMgt.GetNextNo('PREQ', 0D, TRUE);
        PurchaseRN.INIT;
        PurchaseRN."No." := NextLeaveApplicationNo;
        PurchaseRN."Document Type" := PurchaseRN."Document Type"::Quote;
        PurchaseRN."Document Type 2" := PurchaseRN."Document Type 2"::Requisition;
        //PurchaseRN.Department:=DepartmentCode;
        PurchaseRN."Buy-from Vendor No." := 'SUPP_0000';
        PurchaseRN."Pay-to Vendor No." := 'SUPP_0000';
        PurchaseRN."Invoice Disc. Code" := 'SUPP_0000';
        PurchaseRN."Shortcut Dimension 1 Code" := DepartmentCode;
        PurchaseRN."Shortcut Dimension 2 Code" := BusinessCode;
        PurchaseRN."Responsibility Center" := ResponsibilityCentre;
        PurchaseRN."Assigned User ID" := UserID;
        PurchaseRN."Order Date" := TODAY;
        PurchaseRN."Due Date" := TODAY;
        PurchaseRN."Expected Receipt Date" := TODAY;
        PurchaseRN."Posting Description" := Purpose;
        PurchaseRN."No. Series" := 'PREQ';
        PurchaseRN.INSERT;
    end;

    procedure SubmitPurchaseLine(DocumentType: Integer; DocumentNo: Text; FunctionNo: Code[50]; LocationID: Text; ExpectedDate: Date; FunctionDesc: Text; UnitsOfMeasure: Text; Quantityz: Decimal)
    begin
        PurchaseRN.SetRange("No.", DocumentNo);
        if PurchaseRN.Find('-') then begin
            PurchaseLines.INIT;
            PurchaseLines."Document Type" := PurchaseLines."Document Type"::Quote;
            PurchaseLines."Document No." := DocumentNo;
            PurchaseLines."Line No." := PurchaseLines.COUNT + 1;
            PurchaseLines."No." := FunctionNo;
            PurchaseLines."Location Code" := LocationID;
            PurchaseLines."Expected Receipt Date" := ExpectedDate;
            PurchaseLines."Shortcut Dimension 1 Code" := PurchaseRN."Shortcut Dimension 1 Code";
            PurchaseLines."Shortcut Dimension 2 Code" := PurchaseRN."Shortcut Dimension 2 Code";
            PurchaseLines.Description := FunctionDesc;
            PurchaseLines."Unit of Measure" := UnitsOfMeasure;
            PurchaseLines.Quantity := Quantityz;
            //PurchaseLines."Line Amount":=
            if DocumentType = 1 then
                PurchaseLines.Type := PurchaseLines.Type::"G/L Account";
            if DocumentType = 2 then
                PurchaseLines.Type := PurchaseLines.Type::Item;
            if DocumentType = 3 then
                PurchaseLines.Type := PurchaseLines.Type::"Fixed Asset";
            if DocumentType = 4 then
                PurchaseLines.Type := PurchaseLines.Type::"Charge (Item)";
            PurchaseLines.INSERT;
        end
    end;

    procedure RemoveJobQualiReqLine(QualCode: Code[20]; AppNo: Code[20]) rtnMsg: Text
    begin
        ApplicantQualifications.Reset();

        ApplicantQualifications.SetRange("Application No", AppNo);
        ApplicantQualifications.SetRange("Qualification Code", QualCode);

        if ApplicantQualifications.Find('-') then begin
            ApplicantQualifications.DELETE;
            rtnMsg := 'Qualification Deleted Successfully';
        END;
    end;

    procedure GetLastPRNNo(username: Code[30]) Message: Text
    begin
        PurchaseRN.Reset();
        PurchaseRN.SETRANGE(PurchaseRN."Assigned User ID", username);
        IF PurchaseRN.FIND('+') THEN BEGIN
            Message := PurchaseRN."No.";
        END
    end;

    procedure GetPRNHeaderDetails(PurchaseNo: Text) Message: Text
    begin
        PurchaseRN.Reset();
        PurchaseRN.SETRANGE(PurchaseRN."No.", PurchaseNo);
        IF PurchaseRN.FIND('-') THEN BEGIN
            Message := FORMAT(PurchaseRN."Expected Receipt Date");
        END
    end;

    procedure PRNApprovalRequest(ReqNo: Text) Msg: Text
    var
        t: Page "PROC-Internal Requisitions";
    begin
        PurchaseRN.Reset();
        PurchaseRN.SETRANGE(PurchaseRN."No.", ReqNo);
        IF PurchaseRN.FIND('-')
        THEN BEGIN
            if ApprovalsMgmt.IsPurchaseApprovalsWorkflowEnabled(PurchaseRN) = true then
                ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseRN)
            else
                Msg := 'No approval workflow for this record type is enabled.';
            /* State := State::Open;
            IF PurchaseRN.Status <> PurchaseRN.Status::"Pending Approval" THEN State := State::Open;

            DocType := DocType::Quote;
            CLEAR(tableNo);
            tableNo := 38; */
            //IF Approvals.SendApproval(tableNo, PurchaseRN."No.", DocType, State, PurchaseRN."Responsibility Center", 0) THEN;
        END;
    end;

    procedure RemoveStoreReqLine(LineNo: Integer)
    begin
        StoreReqLines.Reset();
        StoreReqLines.SETRANGE(StoreReqLines."Line No.", LineNo);
        IF StoreReqLines.FIND('-') THEN BEGIN
            StoreReqLines.DELETE;
            MESSAGE('Line Deleted Successfully');
        END;
    end;

    procedure RemoveImprestReqLine(ReqNo: Code[20]; AdvanceType: Code[20])
    begin
        ImprestReqLines.Reset();
        ImprestReqLines.SETRANGE(ImprestReqLines.No, ReqNo);
        ImprestReqLines.SETRANGE(ImprestReqLines."Advance Type", AdvanceType);
        IF ImprestReqLines.FIND('-') THEN BEGIN
            ImprestReqLines.DELETE;
            MESSAGE('Line Deleted Successfully');
        END;
    end;

    procedure RemovePurchaseLine(LineNo: Integer)
    begin
        PurchaseLines.Reset();
        PurchaseLines.SETRANGE(PurchaseLines."Line No.", LineNo);
        IF PurchaseLines.FIND('-') THEN BEGIN
            PurchaseLines.DELETE;
            MESSAGE('Line Deleted Successfully');
        END;
    end;

    procedure ClaimRequisitionCreate(Campusz: Code[30]; Departmentz: Code[30]; CampusName: Text; DeptName: Text; Rcentre: Code[30]; username: Code[30]; Reason: Text) LastNum: Text
    begin
        ClaimRequisition.INIT;
        NextClaimapplicationNo := NoSeriesMgt.GetNextNo('SCLAIM', 0D, TRUE);
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", username);

        IF EmployeeCard.FIND('-')
        THEN BEGIN
            ClaimRequisition."No." := NextClaimapplicationNo;
            ClaimRequisition.Date := TODAY;
            ClaimRequisition.Payee := EmployeeCard.Names;
            ClaimRequisition."On Behalf Of" := EmployeeCard.Names;
            ClaimRequisition.Posted := FALSE;
            ClaimRequisition."Global Dimension 1 Code" := Campusz;
            ClaimRequisition.Status := ClaimRequisition.Status::Pending;
            ClaimRequisition."Payment Type" := ClaimRequisition."Payment Type"::Imprest;
            ClaimRequisition."Shortcut Dimension 2 Code" := Departmentz;
            ClaimRequisition."Function Name" := CampusName;
            ClaimRequisition."Budget Center Name" := DeptName;
            ClaimRequisition."No. Series" := 'SCLAIM';
            ClaimRequisition."Responsibility Center" := Rcentre;
            ClaimRequisition."Account No." := username;
            ClaimRequisition.Purpose := Reason;
            ClaimRequisition.Cashier := username;
            ClaimRequisition.INSERT;
            LastNum := NextClaimapplicationNo;
        END;
    end;

    procedure ClaimRequisitionApprovalRequest(ReqNo: Text)
    begin
        ClaimRequisition.Reset();
        ClaimRequisition.SETRANGE(ClaimRequisition."No.", ReqNo);
        IF ClaimRequisition.FIND('-')
        THEN BEGIN
            ApprovalMgmtFin.OnSendClaimforApproval(ClaimRequisition);
        END;
    end;

    procedure CancelClaimRequisition(ReqNo: Text)
    begin
        ClaimRequisition.Reset();
        ClaimRequisition.SETRANGE(ClaimRequisition."No.", ReqNo);
        IF ClaimRequisition.FIND('-')
        THEN BEGIN
            // ApprovalMgmtFin.OnCancelStaffClaimForApproval(ClaimRequisition);
        END;
    end;

    procedure StoreRequisitionApprovalRequest(ReqNo: Text) Msg: Text
    begin
        StoreRequisition.Reset();
        StoreRequisition.SETRANGE(StoreRequisition."No.", ReqNo);
        IF StoreRequisition.FIND('-')
        THEN BEGIN
            if ApprovalMgmtFin.IsSRNEnabled(StoreRequisition) = true then
                ApprovalMgmtFin.OnSendSRNforApproval(StoreRequisition)
            else
                Msg := 'Approval workflow not enabled';
        END;
    end;

    procedure CancelStoreRequisition(ReqNo: Text)
    begin
        StoreRequisition.Reset();
        StoreRequisition.SETRANGE(StoreRequisition."No.", ReqNo);
        IF StoreRequisition.FIND('-')
        THEN BEGIN
            // ApprovalMgmtFin.OnCancelStoreRequisitionForApproval(StoreRequisition);
        END;
    end;

    procedure StoresRequisitionCreate(EmployeeNo: Text; UserID: Text; RequiredDate: Date; Purpose: Text; Department: Code[20]; Campus: Code[20]; DepartmentName: Text[250]; CampusName: Text[250]; ReqType: Option; ResponsibilityCentre: Code[10]) LastNum: Text
    begin
        StoreRequisition.INIT;
        NextStoreqNo := NoSeriesMgt.GetNextNo('STOREREQ', TODAY, TRUE);
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", EmployeeNo);

        IF EmployeeCard.FIND('-')
        THEN BEGIN
            StoreRequisition."Requester ID" := UserID;
            SupervisorCard.Reset();
            SupervisorCard.SETRANGE(SupervisorCard."User ID", UserID);
            IF SupervisorCard.FIND('-')
            THEN BEGIN
                SupervisorId := SupervisorCard."Approver ID";
            END;
            //StoreRequisition.INIT;
            //StoreRequisition."Staff No." := EmployeeNo;
            StoreRequisition."No." := NextStoreqNo;
            StoreRequisition."Request date" := TODAY;
            StoreRequisition."Required Date" := RequiredDate;
            StoreRequisition."User ID" := UserID;
            StoreRequisition."Staff No." := UserID;
            StoreRequisition."Requester ID" := UserID;
            StoreRequisition."Request date" := TODAY;
            StoreRequisition."Request Description" := Purpose;
            StoreRequisition."No. Series" := 'STOREREQ';
            StoreRequisition.Status := StoreRequisition.Status::Open;
            StoreRequisition."Global Dimension 1 Code" := Department;
            StoreRequisition."Shortcut Dimension 2 Code" := Campus;
            StoreRequisition."Function Name" := CampusName;
            StoreRequisition."Budget Center Name" := DepartmentName;
            StoreRequisition."Responsibility Center" := ResponsibilityCentre;
            // StoreRequisition."Issuing Store" := IssueStore;
            StoreRequisition."Store Requisition Type" := ReqType;

            StoreRequisition.INSERT;
            LastNum := NextStoreqNo;
        end
    end;

    procedure ImprestRequisitionApprovalRequest(ReqNo: Text)
    begin
        ImprestRequisition.Reset();
        ImprestRequisition.SETRANGE(ImprestRequisition."No.", ReqNo);
        IF ImprestRequisition.FIND('-')
        THEN BEGIN
            ApprovalMgmtFin.OnSendImprestForApproval(ImprestRequisition);
        END;
    end;

    procedure CancelImprestRequisition(ReqNo: Text)
    begin
        ImprestRequisition.Reset();
        ImprestRequisition.SETRANGE(ImprestRequisition."No.", ReqNo);
        IF ImprestRequisition.FIND('-')
        THEN BEGIN
            //ApprovalMgmtFin.OnCancelImprestForApproval(ImprestRequisition);
        END;
    end;

    procedure ImprestRequisitionCreate(Campusz: Code[30]; Departmentz: Code[30]; CampusName: Text; DeptName: Text; RCentre: Code[20]; AccType: Integer; username: Code[30]; Reason: Text) LastNum: Text
    begin
        ImprestRequisition.INIT;
        NextImprestapplicationNo := NoSeriesMgt.GetNextNo('IMP', 0D, TRUE);
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", username);

        IF EmployeeCard.FIND('-')
        THEN BEGIN
            ImprestRequisition."No." := NextImprestapplicationNo;
            ImprestRequisition.Date := TODAY;
            ImprestRequisition.Payee := EmployeeCard.Names;
            ImprestRequisition."On Behalf Of" := EmployeeCard.Names;
            ImprestRequisition.Posted := FALSE;
            ImprestRequisition."Global Dimension 1 Code" := Departmentz;
            ImprestRequisition."Shortcut Dimension 2 Code" := Campusz;
            ImprestRequisition.Status := ImprestRequisition.Status::Pending;
            ImprestRequisition."Payment Type" := ImprestRequisition."Payment Type"::Imprest;
            ImprestRequisition."Function Name" := CampusName;
            ImprestRequisition."Budget Center Name" := DeptName;
            ImprestRequisition."No. Series" := 'IMP';
            ImprestRequisition."Responsibility Center" := RCentre;
            //ImprestRequisition."Account Type" := AccType;
            ImprestRequisition."Account No." := EmployeeCard."No.";
            ImprestRequisition.Purpose := Reason;
            ImprestRequisition.Cashier := username;
            ImprestRequisition."Requested By" := username;
            ImprestRequisition.INSERT;
            LastNum := NextImprestapplicationNo;
        END;
    end;

    procedure InsertApproverComments(DocumentNo: Code[50]; ApproverID: Code[100]; Comments: Text[250])
    begin
        ApproverComments.Reset();

        ApproverComments."Document No." := DocumentNo;
        ApproverComments."User ID" := ApproverID;
        ApproverComments.Comment := Comments;
        ApproverComments."Date and Time" := CURRENTDATETIME;

        ApproverComments.Insert();
    end;

    procedure InsertStoreRequisitionLines(ReqNo: Code[30]; ItemNo: Code[30]; AType: Integer; ItemDesc: Text; Amount: Decimal; LineAmount: Decimal; Qty: Decimal; UnitOfMsre: Code[10]; IStore: Code[30]) rtnMsg: Text
    begin
        StoreReqLines.Reset();

        StoreReqLines."Requistion No" := ReqNo;
        StoreReqLines.Validate("Requistion No");
        StoreReqLines."No." := ItemNo;
        StoreReqLines.Type := AType;
        StoreReqLines.Description := ItemDesc;
        StoreReqLines."Unit Cost" := Amount;
        StoreReqLines."Line Amount" := LineAmount;
        StoreReqLines.Quantity := Qty;
        StoreReqLines."Unit of Measure" := UnitOfMsre;
        StoreReqLines."Issuing Store" := IStore;
        StoreReqLines.Insert();

        rtnMsg := 'SUCCESS' + '::';
    end;

    procedure InsertImprestRequisitionLines(ReqNo: Code[20]; Atypes: Code[20]; AccNo: Code[20]; AccName: Code[20]; Amount: Decimal; UserId: Code[20]) rtnMsg: Text
    begin
        ImprestRequisition.Reset();
        ImprestRequisition.SetRange("No.", ReqNo);

        if ImprestRequisition.Find('-') then begin
            ImprestReqLines.Init();
            ImprestReqLines.No := ReqNo;
            ImprestReqLines."Advance Type" := Atypes;
            ImprestReqLines."Shortcut Dimension 2 Code" := ImprestRequisition."Shortcut Dimension 2 Code";
            ImprestReqLines."Account No:" := AccNo;
            ImprestReqLines."Account Name" := AccName;
            ImprestReqLines.Amount := Amount;
            ImprestReqLines."Due Date" := ImprestRequisition.Date;
            ImprestReqLines."Imprest Holder" := UserId;
            ImprestReqLines."Global Dimension 1 Code" := ImprestRequisition."Global Dimension 1 Code";
            ImprestReqLines.Purpose := ImprestRequisition.Purpose;
            ImprestReqLines."Amount LCY" := Amount;

            ImprestReqLines.Insert();

            rtnMsg := 'SUCCESS' + '::';
        end;

    end;

    procedure InsertClaimRequisitionLines(ReqNo: Code[20]; Atypes: Code[20]; Dept: Code[20]; AccNo: Code[20]; AccName: Code[20]; Amount: Decimal; ReqDate: Date; UserId: Code[20]; BussCode: Code[20]; Purpose: Text) rtnMsg: Text
    begin
        ClaimReqLines.Reset();
        ClaimReqLines.No := ReqNo;
        ClaimReqLines."Advance Type" := Atypes;
        ClaimReqLines."Shortcut Dimension 2 Code" := Dept;
        ClaimReqLines."Account No:" := AccNo;
        ClaimReqLines."Account Name" := AccName;
        ClaimReqLines.Amount := Amount;
        ClaimReqLines."Due Date" := ReqDate;
        ClaimReqLines."Imprest Holder" := UserId;
        ClaimReqLines."Global Dimension 1 Code" := BussCode;
        ClaimReqLines.Purpose := Purpose;
        ClaimReqLines."Amount LCY" := Amount;

        ClaimReqLines.Insert();

        rtnMsg := 'SUCCESS' + '::';
    end;

    procedure TransportRequisitionApprovalRequest(ReqNo: Text)
    begin
        // TransportRequisition.Reset();
        // TransportRequisition.SETRANGE(TransportRequisition."Transport Requisition No", ReqNo);
        // IF TransportRequisition.FIND('-')
        // THEN BEGIN
        //     AppMgt.SendTransportApprovalRequest(TransportRequisition, TransportRequisition."Responsibility Center");
        // END;
    end;

    procedure VenueRequisitionCreate(Department: Code[20]; BookingDate: Date; MeetingDescription: Text[150]; RequiredTime: Time; Venue: Code[20]; ContactPerson: Text[50]; ContactNo: Text[50]; ContactMail: Text[30]; RequestedBy: Text; Pax: Integer)
    begin
        // VenueRequisition.INIT;
        // NextMtoreqNo := NoSeriesMgt.GetNextNo('VB', 0D, TRUE);
        // //MealRequisition.INIT;
        // VenueRequisition."Booking Id" := NextMtoreqNo;
        // VenueRequisition.Department := Department;
        // VenueRequisition."Request Date" := TODAY;
        // VenueRequisition."Booking Date" := BookingDate;
        // VenueRequisition."Meeting Description" := MeetingDescription;
        // VenueRequisition."Required Time" := RequiredTime;
        // VenueRequisition.Venue := Venue;
        // VenueRequisition."Contact Person" := ContactPerson;
        // VenueRequisition."Contact Number" := ContactNo;
        // VenueRequisition."Contact Mail" := ContactMail;
        // VenueRequisition.Pax := Pax;
        // VenueRequisition.Status := VenueRequisition.Status::"Pending Approval";
        // //VenueRequisition."Department Name":=DepartmentName;
        // VenueRequisition."Requested By" := RequestedBy;
        // VenueRequisition."No. Series" := 'VB';
        // //VenueRequisition."Booking Time":= ;

        // VenueRequisition.INSERT;
    end;

    procedure CreateRecruitmentAccount(Initialsz: Integer; FirstName: Text; MiddleName: Text; LastName: Text; PostalAddress: Text; PostalCode: Text; IDNumber: Code[30]; Genderz: Integer; HomePhoneNumber: Code[30]; Citizenshipz: Text; MaritalStatus: Integer; EthnicOrigin: Text; Disabledz: Option; DesabilityDetails: Text; DoB: Date; KRAPINNumber: Text; ApplicantType: Integer; EmailAddress: Text; Passwordz: Text; pwdNum: Text) Message: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", EmailAddress);
        IF NOT RecAccountusers.FIND('-') THEN BEGIN
            RecAccountusers.INIT;

            RecAccountusers.Initials := Initialsz;
            RecAccountusers."First Name" := FirstName;
            RecAccountusers."Middle Name" := MiddleName;
            RecAccountusers."Last Name" := LastName;
            RecAccountusers."Postal Address" := PostalAddress;
            RecAccountusers."Postal Code" := PostalCode;
            RecAccountusers."ID Number" := IDNumber;
            RecAccountusers.Gender := Genderz;
            RecAccountusers."Home Phone Number" := HomePhoneNumber;
            //RecAccountusers."Residential Address" := ResidentialAddress;
            RecAccountusers.Citizenship := Citizenshipz;
            //RecAccountusers.County := Countyz;
            RecAccountusers."Marital Status" := MaritalStatus;
            // RecAccountusers."Ethnic Origin" := EthnicOrigin;
            //RecAccountusers.Disabled := FORMAT(Disabledz);
            RecAccountusers."Desability Details" := DesabilityDetails;
            RecAccountusers."Date of Birth" := DoB;
            //RecAccountusers."Driving License" := DrivingLicense;
            // RecAccountusers."1st Language" := stLanguage;
            // RecAccountusers."2nd Language" := ndLanguage;
            // RecAccountusers."Additional Language" := AdditionalLanguage;
            RecAccountusers."Applicant Type" := ApplicantType;
            RecAccountusers."Email Address" := EmailAddress;
            RecAccountusers.Password := Passwordz;
            RecAccountusers."Created Date" := TODAY;
            RecAccountusers.INSERT;
            IF RecAccountusers.INSERT THEN;
            Message := 'Account Created successfully' + '::' + RecAccountusers.Password;
        END ELSE BEGIN
            Message := 'Warning! We already have account created with the Email address provided.';
        END
    end;

    procedure ValidRecruitmentEmailAddress(username: Text) Message: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", username);
        IF RecAccountusers.FIND('-') THEN BEGIN
            Message := TXTCorrectDetails + '::';
        END ELSE BEGIN
            Message := TXTIncorrectDetails + '::';
        END
    end;

    procedure GetRecruitmentEmailAddress(username: Text) Message: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", username);
        IF RecAccountusers.FIND('-') THEN BEGIN
            Message := RecAccountusers."Email Address" + '::';
        END
    end;

    procedure GetCurrentRecruitmentPassword(Username: Text) Message: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", Username);
        IF RecAccountusers.FIND('-') THEN BEGIN
            Message := RecAccountusers.Password + '::';
        END
    end;

    procedure CheckRecruitmentApplicantLogin(username: Text; userpassword: Text) Message: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", username);
        IF RecAccountusers.FIND('-') THEN BEGIN
            IF (RecAccountusers.Password = userpassword) THEN BEGIN
                FullNames := RecAccountusers."First Name" + ' ' + RecAccountusers."Middle Name" + ' ' + RecAccountusers."Last Name";
                Initials := RecAccountusers.Initials;
                pAddress := RecAccountusers."Postal Address";
                pCode := RecAccountusers."Postal Code";
                IDNum := RecAccountusers."ID Number";
                Gender := RecAccountusers.Gender;
                Phone := RecAccountusers."Home Phone Number";
                rAddress := RecAccountusers."Residential Address";
                Citizenship := RecAccountusers.Citizenship;
                County := RecAccountusers.County;
                Mstatus := RecAccountusers."Marital Status";
                Eorigin := RecAccountusers."Ethnic Origin";
                Disabled := Format(RecAccountusers.Disabled);
                dDetails := RecAccountusers."Desability Details";
                DOB := RecAccountusers."Date of Birth";
                // //          Dlicense:=RecAccountusers."Driving License";		
                KRA := RecAccountusers."KRA PIN Number";
                // //          firstLang	:= RecAccountusers."1st Language";		
                // //          secondLang:=RecAccountusers."2nd Language";			
                // //          AdditionalLang:=RecAccountusers."Additional Language";	 
                ApplicantType := RecAccountusers."Applicant Type";

                Message := TXTCorrectDetails + '::' + RecAccountusers."Email Address" + '::' + RecAccountusers."First Name" + '::' + RecAccountusers."Middle Name" + '::' + RecAccountusers."Last Name" + '::' + FORMAT(Initials) + '::' + pAddress + '::' + pCode + '::' + IDNum
                + '::' + FORMAT(Gender) + '::' + Phone + '::' + rAddress + '::' + Citizenship + '::' + County + '::' + FORMAT(Mstatus) + '::' + FORMAT(Eorigin) + '::' + FORMAT(Disabled) + '::' + dDetails + '::' + FORMAT(DOB) + '::' + Dlicense
                + '::' + KRA + '::' + firstLang + '::' + secondLang + '::' + AdditionalLang + '::' + FORMAT(ApplicantType);
            END ELSE BEGIN
                FullNames := RecAccountusers."First Name" + ' ' + RecAccountusers."Middle Name" + ' ' + RecAccountusers."Last Name";
                Message := TXTIncorrectDetails + '::' + RecAccountusers."Email Address" + '::' + FullNames;
            END
        END
    end;

    procedure SubmitJobApplication(EMail: Text; FirstName: Text; MiddletName: Text; LastName: Text; JobID: Text; JobDescription: Text; RefNo: Text) Message: Text
    begin

        JobApplications.RESET;

        JobApplications.SETRANGE(JobApplications."E-Mail", EMail);
        JobApplications.SETRANGE(JobApplications."Job Applied For", JobID);
        IF NOT JobApplications.FIND('-') THEN BEGIN
            NextJobapplicationNo := NoSeriesMgt.GetNextNo('JOBAPP', 0D, TRUE);

            RecAccountusers.RESET;
            RecAccountusers.SETRANGE(RecAccountusers."Email Address", EMail);
            IF RecAccountusers.FIND('-') THEN BEGIN
                JobApplications.INIT;

                JobApplications."Application No" := NextJobapplicationNo;
                JobApplications."Employee Requisition No" := RefNo;
                JobApplications."Applicant Type" := RecAccountusers."Applicant Type";
                JobApplications.Initials := FORMAT(RecAccountusers.Initials);
                JobApplications."First Name" := FirstName;
                JobApplications."Middle Name" := MiddletName;
                JobApplications."Last Name" := LastName;
                JobApplications."Postal Address" := RecAccountusers."Postal Address";
                JobApplications."Residential Address" := RecAccountusers."Residential Address";
                JobApplications."Post Code" := RecAccountusers."Postal Code";
                JobApplications.County := RecAccountusers.County;
                JobApplications."Home Phone Number" := RecAccountusers."Home Phone Number";
                JobApplications."Cell Phone Number" := RecAccountusers."Home Phone Number";
                JobApplications."Work Phone Number" := RecAccountusers."Home Phone Number";
                JobApplications."E-Mail" := EMail;
                JobApplications."ID Number" := RecAccountusers."ID Number";
                JobApplications.Gender := RecAccountusers.Gender;
                JobApplications."Country Code" := RecAccountusers.Citizenship;
                JobApplications."Marital Status" := RecAccountusers."Marital Status";
                JobApplications."Ethnic Origin" := RecAccountusers."Ethnic Origin";
                JobApplications."First Language (R/W/S)" := RecAccountusers."1st Language";
                JobApplications."Driving Licence" := RecAccountusers."Driving License";
                //JobApplications.Disabled := RecAccountusers.Disabled;
                JobApplications."Date Of Birth" := RecAccountusers."Date of Birth";
                JobApplications."Second Language (R/W/S)" := RecAccountusers."2nd Language";
                JobApplications."Additional Language" := RecAccountusers."Additional Language";
                JobApplications.Citizenship := RecAccountusers.Citizenship;
                JobApplications."Ethnic Origin" := RecAccountusers."Ethnic Origin";
                JobApplications."Disabling Details" := RecAccountusers."Desability Details";
                JobApplications."Passport Number" := RecAccountusers."ID Number";
                JobApplications."PIN Number" := RecAccountusers."KRA PIN Number";
                JobApplications."Job Applied For" := JobID;
                JobApplications."Job Applied for Description" := JobDescription;
                JobApplications.Status := JobApplications.Status::Normal;
                JobApplications."Date Applied" := TODAY;
                JobApplications."No. Series" := 'JOBAPP';
                //JobApplications.CVPath := MyCVPath;
                //JobApplications."Good Conduct Cert Path" := GoodConductPath;
                JobApplications.INSERT;
                IF JobApplications.INSERT THEN;
                Message := 'SUCCESS' + '::' + JobApplications."Application No";
            END

        END ELSE begin
            Message := 'FAILED' + '::' + JobApplications."Application No";
        end;

    end;

    procedure InsertJobApplicantQualifications(AppNo: Code[30]; QualType: Code[30]; QualCode: Code[30]; Institution: Code[50]; FromDate: Date; ToDate: Date) rtnMsg: Text
    begin
        ApplicantQualifications.Reset();

        ApplicantQualifications.SetRange("Application No", AppNo);
        ApplicantQualifications.SetRange("Qualification Type", QualType);
        ApplicantQualifications.SetRange("Qualification Code", QualCode);

        if not ApplicantQualifications.Find('-') then begin
            ApplicantQualifications.Init();

            ApplicantQualifications."Application No" := AppNo;
            ApplicantQualifications."Qualification Type" := QualType;
            ApplicantQualifications."Qualification Code" := QualCode;
            ApplicantQualifications.Validate("Qualification Code");
            ApplicantQualifications."Institution/Company" := Institution;
            ApplicantQualifications."From Date" := FromDate;
            ApplicantQualifications."To Date" := ToDate;

            ApplicantQualifications.Insert();

            rtnMsg := 'SUCCESS' + '::';
        end else begin
            rtnMsg := 'FAILED' + '::';
        end;
    end;

    procedure SubmitJobApplicationAttachments(AppNo: Code[30]; CvPath: Text[250]; CoverLetterPath: Text[250]) Message: Text
    begin

        // JobApplications.RESET;

        // JobApplications.SETRANGE(JobApplications."Application No", AppNo);
        // IF JobApplications.FIND('-') THEN BEGIN

        //     if (JobApplications.Submitted = false) then begin
        //         JobApplications."CV Path" := CvPath;
        //         JobApplications."Cover Letter Path" := CoverLetterPath;
        //         JobApplications.Submitted := true;
        //         JobApplications.Modify();
        //         IF JobApplications.Modify() THEN;
        //         Message := 'SUCCESS' + '::';
        //     end else begin
        //         Message := 'FAIL 1' + '::';
        //     end



        // END ELSE begin
        //     Message := 'FAIL 2' + '::';
        // end
    end;

    procedure CheckValidVendorNo(username: Text) Message: Text
    begin
        Vendors.RESET;
        Vendors.SETRANGE(Vendors."No.", username);
        IF Vendors.FIND('-') THEN BEGIN
            Message := 'Yes' + '::';
        END ELSE BEGIN
            Message := 'No' + '::';
        END
    end;

    procedure CheckVendorLogin(username: Text; userpassword: Text) Message: Text
    begin
        Vendors.RESET;
        Vendors.SETRANGE(Vendors."No.", username);
        IF Vendors.FIND('-') THEN BEGIN
            IF (Vendors."Changed Password" = TRUE) THEN BEGIN
                IF (Vendors.Password = userpassword) THEN BEGIN
                    FullNames := Vendors.Name;
                    Message := TXTCorrectDetails + '::' + FORMAT(Vendors."Changed Password") + '::' + Vendors."No." + '::' + FullNames;
                END ELSE BEGIN
                    FullNames := Vendors.Name;
                    Message := TXTIncorrectDetails + '::' + FORMAT(Vendors."Changed Password") + '::' + Vendors."No." + '::' + FullNames;
                END
            END ELSE BEGIN
                IF (Vendors.Password = userpassword) THEN BEGIN
                    FullNames := Vendors.Name;
                    Message := TXTCorrectDetails + '::' + FORMAT(Vendors."Changed Password") + '::' + Vendors."No." + '::' + FullNames;
                END ELSE BEGIN
                    Message := TXTIncorrectDetails + '::' + FORMAT(Vendors."Changed Password");
                END
            END
        END ELSE BEGIN
            Message := TXTIncorrectDetails + '::';
        END
    end;

    procedure GetVendorProfileDetails(username: Text) Message: Text
    begin
        Vendors.RESET;
        Vendors.SETRANGE(Vendors."No.", username);
        IF Vendors.FIND('-') THEN BEGIN
            Message := Vendors."E-Mail" + '::' + Vendors."Phone No." + '::' + Vendors.Address + '::' + Vendors."Post Code" + '::' + Vendors.City;

        END
    end;

    procedure GenerateVendorStatement(VendorNo: Text; filenameFromApp: Text)
    begin
        filename := FILESPATH_V + filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);
        Vendors.RESET;
        Vendors.SETRANGE(Vendors."No.", VendorNo);
        Vendors.SetRange("Date Filter", Today);

        IF Vendors.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(321, filename, Vendors);
        END
    end;

    procedure GenerateVendorRFQ(VendorNo: Text; RFQNo: Text; filenameFromApp: Text)
    begin
        filename := FILESPATH_V + filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);
        QuotationRequestVendors.RESET;
        QuotationRequestVendors.SETRANGE(QuotationRequestVendors."Vendor No.", VendorNo);
        QuotationRequestVendors.SETRANGE(QuotationRequestVendors."Document No.", RFQNo);

        IF Vendors.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(52178714, filename, QuotationRequestVendors);
        END
    end;

    procedure GenerateVendorLPO(VendorNo: Text; LPONo: Text; filenameFromApp: Text)
    begin
        filename := FILESPATH_V + filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);
        PurchaseHeader.RESET;
        PurchaseHeader.SETRANGE(PurchaseHeader."Pay-to Vendor No.", VendorNo);
        PurchaseHeader.SETRANGE(PurchaseHeader."No.", LPONo);

        IF Vendors.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(52178731, filename, PurchaseHeader);
        END
    end;

    procedure CreateBidderAccount(CompName: Text; PostalAddress: Text; PostalCode: Text; Location: Text; CompPhone: Text; CompEmail: Text; ContactPerson: Text; ContactPersonPhone: Text; ContactPersonEmail: Text; VatPin: Text; CertificateOfIncorporation: Text; VATCertificate: Text; PinRegistrationCertificate: Text; TaxCompliaceCertificate: Text; Password: Text) Message: Text
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", VatPin);

        IF NOT tblBidder.FIND('-') THEN BEGIN
            tblBidder."No." := VatPin;
            tblBidder.Name := CompName;
            tblBidder."E-Mail" := CompEmail;
            tblBidder."Phone No." := CompPhone;
            tblBidder.Address := PostalAddress + '-' + PostalCode;
            //tblBidder."Territory Code" := Country;
            tblBidder."Contact Person" := ContactPerson;
            //tblBidder."Phone No." := ContactPersonPhone;
            tblBidder."Contact Person Email" := ContactPersonEmail;
            tblBidder."VAT Registration No." := VatPin;
            tblBidder."Certificate of Incoporation" := CertificateOfIncorporation;
            tblBidder."VAT Registration Certificate" := VATCertificate;
            tblBidder."Pin Registration Certificate" := PinRegistrationCertificate;
            tblBidder."Tax Compliance Certificate" := TaxCompliaceCertificate;
            tblBidder.Password := Password;
            tblBidder.INSERT;
            Message := 'SUCCESS' + '::';
        END
        ELSE BEGIN
            Message := 'FAIL' + '::';
        END;
    end;

    procedure CheckBidderLogin(username: Text; userpassword: Text) Message: Text
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE("No.", username);
        IF tblBidder.FIND('-') THEN BEGIN
            IF (tblBidder.Password = userpassword) THEN BEGIN
                FullNames := tblBidder.Name;
                Message := 'Login' + '::' + tblBidder."No." + '::' + FullNames;
            END ELSE BEGIN
                Message := 'Invalid Password';
            END
        END ELSE BEGIN
            Message := 'Invalid Username';
        END
    end;

    procedure CheckBidderPasswordChanged(username: Code[30]) Message: Text
    begin
        tblBidder.Reset();
        tblBidder.SETRANGE("No.", username);
        IF tblBidder.FIND('-') THEN BEGIN
            IF (tblBidder."Changed Password" = TRUE) THEN BEGIN
                Message := 'Yes' + '::' + FORMAT(tblBidder."Changed Password");
            END ELSE BEGIN
                Message := 'No' + '::' + FORMAT(tblBidder."Changed Password");
            END
        END ELSE BEGIN
            Message := 'No' + '::';
        END
    end;

    procedure GetBidderProfileDetails(username: Text) Message: Text
    begin
        tblBidder.RESET;
        tblBidder.SETRANGE(tblBidder."No.", username);
        IF tblBidder.FIND('-') THEN BEGIN
            Message := tblBidder.Name + '::' + tblBidder."E-Mail" + '::' + tblBidder."Contact Person" + '::' + tblBidder."Contact Person Email" + '::' + tblBidder."Phone No." + '::' + tblBidder.Address + '::' + tblBidder.City;

        END
    end;

    procedure ChangeBidderPassword(username: Code[30]; password: Text) ReturnMsg: Text[200];
    begin
        tblBidder.Reset();
        tblBidder.SETRANGE(tblBidder."No.", username);
        IF tblBidder.FIND('-') THEN BEGIN
            tblBidder."Password" := password;
            tblBidder."Changed Password" := TRUE;
            tblBidder.Modify();
            ReturnMsg := 'SUCCESS' + '::';
        END;
    end;

    procedure CheckBidderLoginForUnchangedPass(Username: Code[20]; password: Text[50]) ReturnMsg: Text[200];
    begin
        tblBidder.Reset();

        tblBidder.SetRange(tblBidder."No.", Username);

        if (tblBidder.Find('-')) then begin
            if (tblBidder.Password = password) then begin
                ReturnMsg := 'Login' + '::' + tblBidder."No." + '::' + tblBidder."E-Mail";
            end
            else begin
                ReturnMsg := 'Invalid Password' + '::';
            end;
        end
        else begin
            ReturnMsg := 'Invalid Username' + '::';
        end

    end;

    procedure IsTenderBiddingPeriodOpened(TenderNo: Code[30]) Message: Text
    begin
        tblTenders.RESET;
        tblTenders.SETRANGE(tblTenders."No.", TenderNo);

        IF tblTenders.FIND('-') THEN BEGIN
            if ((Today < tblTenders."Expected Closing Date")) then begin
                Message := 'Yes';
            end
            else begin
                Message := 'No';
            end;
        END
    end;

    procedure InsertTenderBid(BidderNo: Code[30]; TenderNo: Code[30]; TechDocPath: Text; FinDocPath: Text) Message: Text
    begin
        NextBidApplicationNo := NoSeriesMgt.GetNextNo('BID NO', 0D, TRUE);
        tblTenderBids.RESET;
        tblTenderBids.SETRANGE("Bidder No", BidderNo);
        tblTenderBids.SETRANGE("Tender No.", TenderNo);

        IF NOT tblTenderBids.FIND('-') THEN BEGIN
            tblTenderBids."No." := NextBidApplicationNo;
            tblTenderBids."Bidder No" := BidderNo;
            tblTenderBids."Tender No." := TenderNo;
            tblTenderBids."Bid Status" := tblTenderBids."Bid Status"::Submitted;
            tblTenderBids.Status := tblTenderBids.Status::"Pending Approval";
            tblTenderBids."Technical Proposal Path" := TechDocPath;
            tblTenderBids."Financial Proposal Path" := FinDocPath;
            tblTenderBids."No. Series" := 'BID NO';
            tblTenderBids.INSERT;
            Message := 'SUCCESS' + '::' + NextBidApplicationNo;
        END
        ELSE BEGIN
            Message := 'FAILED' + '::' + NextBidApplicationNo;
        END;
    end;

    procedure InsertQuotedAmount(BidderNo: Code[30]; TenderNo: Code[30]; BidNo: Code[30]; LineCode: Code[30]; Desciption: Text; QuotedValue: Decimal) Message: Text
    begin
        tblTenderBidFinReq.RESET;
        tblTenderBidFinReq.SETRANGE("Tender No.", TenderNo);
        tblTenderBidFinReq.SETRANGE("Bid No.", BidNo);
        tblTenderBidFinReq.SETRANGE("Bidder No.", BidderNo);
        tblTenderBidFinReq.SETRANGE(Code, LineCode);

        IF NOT tblTenderBidFinReq.FIND('-') THEN BEGIN
            tblTenderBidFinReq.Init();
            tblTenderBidFinReq."Tender No." := TenderNo;
            tblTenderBidFinReq."Bid No." := BidNo;
            tblTenderBidFinReq."Bidder No." := BidderNo;
            tblTenderBidFinReq.Description := Desciption;
            tblTenderBidFinReq.Code := LineCode;
            tblTenderBidFinReq."Quoted Amount" := QuotedValue;
            tblTenderBidFinReq.Insert();
            Message := 'SUCCESS: Your bid has been submitted successfully!';
        END;
    end;

    procedure GenerateTenderAwardLetter(TenderNo: Code[30]; BidNo: Code[30]; filenameFromApp: Text)
    begin
        filename := FILESPATH_EPROC + filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);
        tblTenderBids.RESET;
        tblTenderBids.SETRANGE(tblTenderBids."No.", BidNo);
        tblTenderBids.SetRange(tblTenderBids."Tender No.", TenderNo);

        IF tblTenderBids.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(52178801, filename, tblTenderBids);
        END
    end;

}

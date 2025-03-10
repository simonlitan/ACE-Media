dotnet
{
    assembly(mscorlib)
    {
        type(System.Array; BCBytes) { }
    }
    assembly(mscorlib)
    {
        type(System.Convert; BCConvert) { }
    }
    assembly(mscorlib)
    {
        type(System.IO.MemoryStream; BCMemoryStream) { }
    }
    assembly(mscorlib)
    {
        type(System.Array; BCArray) { }
    }
}
/// <summary>
/// Codeunit Webportals (ID 52178876).
/// </summary>
/// <summary>
/// Codeunit Webportals (ID 52178876).
/// </summary>
codeunit 52178876 "Webportals"
{
    var
        //test: Record "FIN-Receipts and Payment Types";
        PurchPaySetup: Record "Purchases & Payables Setup";
        HRApprovals: Codeunit "Work Flow Code2";
        usersetup: Record "User Setup";
        CashOfficeSetup: Record "Cash Office Setup";
        AppEnt: Page "Approval Entries";
        EmployeeCard: Record "HRM-Employee C";
        LeaveLE: Record "HRM-Leave Ledger";
        LeaveT: Record "HRM-Leave Requisition";
        HRLeave: Record "HRM-Leave Requisition";
        ltype: Record "HRM-Leave Types";
        HRSetup: Record "HRM-Setup";
        HRMEmployeeD: Record "HRM-Employee C";
        TrainingApplication: Record "HRM-Training Applications";
        back2office: Record "HRM-Return To Office(Leave)";
        SupervisorCard: Record "User Setup";
        ApprovalMgmtFin: Codeunit "Init Code";
        ApprovalMgmtHr: Codeunit "IntCodeunit2";
        //ApprovalSetup: Record "Approval Setup";
        PurchaseRN: Record "Purchase Header";
        PurchaseLines: Record "Purchase Line";
        ClaimRequisition: Record "FIN-Staff Claims Header";
        SalaryAdvanceHeader: Record "FIN-Staff Advance Header";
        SalaryAdvanceLines: Record "FIN-Staff Advance Lines";
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
        JobQualification: Record "HRM-Job Requirement";
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
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        TXTCorrectDetails: Label 'Login';
        TXTIncorrectDetails: Label 'Incorrect Username or Password';
        FILESPATH_S: Label 'C:\inetpub\wwwroot\NEPAD_PORTAL\Staff\PublishedStaff\Downloads\';
        FILESPATH_S2: Label 'C:\inetpub\wwwroot\NEPAD_PORTAL\Staff\PublishedStaff\Downloads\';
        //FILESPATH_S: Label 'C:\Users\Administrator\Documents\AL\PORTALS\KEFRIstaff\KEFRIstaff\Downloads\';
        FILESPATH_V: Label 'C:\inetpub\wwwroot\NEPAD_PORTAL\Procurement\Downloads\';//'C:\inetpub\wwwroot\ARAVendorsPortal\Downloads\';
        FILESPATH_EPROC: Label 'C:\inetpub\wwwroot\NEPAD_PORTAL\Procurement\Downloads\';
        Text004: Label 'Approval Setup not found.';
        TblCustomer: Record Customer;
        daysInteger: Decimal;
        NextLeaveApplicationNo: Text;
        NextLeaveRosterNo: Text;
        NextTrainingApplicationNo: Text;
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
        Eorigin: Text;
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
        Bytes: DotNet BCBytes;
        // Convert: DotNet Convert;
        // MemStream: DotNet MemoryStream;
        tblBidder: Record "Tender Applicants Registration";
        tblTenders: Record "Tender Header";
        tblTenderBids: Record "Tender Submission Header";
        tblTenderBidFinReq: Record "Tender Bidder Fin Reqs";

        Customer: Record Customer;
        NextOderNo: Code[20];
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        lineNo: integer;
        //prequalified: Record "Pre-Qualified Supplier";
        NextPreQualNo: Text;
        NoOfDaysdtFormula: DateFormula;
        EvaluationComittee: Record "Tender Evaluation Committee";
        /* Complaint: Record "Complaint";
        Directors: Record "SUPP-Director Details";
        SupSpecialGroup: Record "SUPP-Special Group";
        ProductCategory: Record "SUPP-Supplier ProdCat"; */
        ImprestSurrHeader: Record "FIN-Imprest Surr. Header";
        ImprestSurrDetails: Record "FIN-Imprest Surrender Details";
        ImprestRequisitionLines: Record "FIN-Imprest Lines";
        Attchemnets: Record GeneralDocumentAttachment;
        MemoImprestHead: Record "FIN-Memo Header";
        /* LeaveRosterHeader: Record "Leave Roaster";
        LeaveRosterLines: Record "Leave RoasterMonth suggestion";
        Conference: Record "Gen-Venue Booking";
        GroundsBooking: Record "Gen-Ground Booking"; */
        Users: Record User;
        //tblguest: Record tblguest;
        bankStructure: Record "PRL-Bank Structure";
        //GoodsServiceCategories: Record "Categories of Goods & Services";
        /* GoodsServiceCategories: Record "Vendor ProdService Category";
        GoodsServiceCategories2: Record "Categories of Goods & Services";
        MealRequisition: Record "CAT-Meal Booking Header"; */
        NextMtoreqNo: Text;
        /* mealsSetup: Record "CAT-Meals Setup";
        MealLinesCreate: Record "CAT-Meal Booking Lines";
        ApprovalMgts: Codeunit Initialize; */
        ApproveOnlyOpenRequestsErr: Label 'You can only approve open approval requests.';
        BudgetaryControl: Codeunit "Budgetary Control";
        BCSetup: Record "FIN-Budgetary Control Setup";
        BudgetGL: Code[50];
        Receipting: Record "FIN-Receipts Header";
        /* custApprovalEnt: Record "Customized Approval Entry";
        TransportReq: Record "FLT-Transport Requisition";
        TransportReqLines: Record "FLT-Travel Requisition Staff"; */
        rfqHeader: Record "PROC-Purchase Quote Header";
        RevCommDocNo: Code[60];
        Commitments: Record "FIN-Budget Entries";

    procedure getEmployeeName(StaffNum: Text) Msg: Text;
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange("No.", StaffNum);
        if EmployeeCard.Find('-') then
            Msg := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name"
        else
            Msg := 'Not found';
    end;

    /* procedure RemoveTransEmpLine(reqNum: Text; lineNum: Integer) Msg: Text
    begin
        TransportReqLines.Reset();
        TransportReqLines.SetRange("Req No", ReqNum);
        TransportReqLines.SetRange(EntryNo, lineNum);
        if TransportReqLines.Find('-') then begin
            TransportReqLines.Delete();
            Msg := 'Deleted successfully';
        end;
    end;

    procedure TransportCreateLines(empNum: Text; ReqNum: Text) Msg: Text
    begin
        TransportReqLines.Reset();
        TransportReqLines.SetRange("Req No", ReqNum);
        TransportReqLines.SetRange("Employee No", empNum);
        if not TransportReqLines.Find('-') then begin
            TransportReqLines."Employee No" := empNum;
            TransportReqLines."Req No" := ReqNum;
            TransportReqLines.Validate("Employee No");
            TransportReqLines.Insert();
            Msg := 'Inserted successfully';
        end else
            Msg := 'Already added';
    end;

    procedure InsertTransportRequisition(NatureofTrip: Integer; region: Text; costCenter: Text; commencement: Text; Destination: Text; mileage: Decimal; DateofTrip: Date; timeOut: Time; returnDate: Date; timeIn: Time; txtDays: Integer; Passengers: Integer; Purpose: Text; requestedBy: Text) Msg: Text
    begin
        TransportReq.Init();
        NextMtoreqNo := NoSeriesMgt.GetNextNo('TR', TODAY, TRUE);
        TransportReq."Transport Requisition No" := NextMtoreqNo;
        if NatureofTrip = 1 then
            TransportReq."Nature of Trip" := TransportReq."Nature of Trip"::Local;
        if NatureofTrip = 2 then
            TransportReq."Nature of Trip" := TransportReq."Nature of Trip"::"Field Trip";
        TransportReq."Cost center" := costCenter;
        TransportReq.Commencement := commencement;
        TransportReq.Destination := Destination;
        TransportReq.Mileage := mileage;
        TransportReq."Date of Trip" := DateofTrip;
        TransportReq."Expected Time out" := timeOut;
        TransportReq."Expected Time In" := timeIn;
        TransportReq."Return Date" := returnDate;
        TransportReq."No of Days Requested" := txtDays;
        TransportReq."No Of Passangers" := Passengers;
        TransportReq."Purpose of Trip" := Purpose;
        TransportReq."Administration Officer" := requestedBy;
        TransportReq."No. Series" := 'TR';
        TransportReq."Date of Request" := Today;
        TransportReq."Requested By" := requestedBy;
        TransportReq.Insert();
        Msg := NextMtoreqNo;
    end; */

    procedure GetStaffRegion(staffNum: Text) Msg: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange("No.", staffNum);
        if EmployeeCard.Find('-') then begin
            Msg := EmployeeCard.Region;
        end;
    end;

    procedure CreateReceipt(receipNum: Text; Name: Text; amount: Text; service: Text)
    begin
        Receipting.Init();
        Receipting.Cashier := UserId;
        //Receipting."Amount Recieved" :=
    end;

    procedure CreateEnterpriseOrder(customer_id: Text; customer_name: Text; customer_email: Text; payment_date: Text; txnid: Text; paid_amount: Text; bank_transaction_info: Text; payment_method: Text; payment_status: Text; shipping_status: Text; payment_id: Text; mpesa_num: Text; Type: Text)
    begin
        if Type = 'Hospitality' then begin

        end;
    end;

    /* procedure CheckMeal(var ReqHeader: Record "CAT-Meal Booking Header")
    var
        Mline: Record "CAT-Meal Booking Lines";
        Commitments: Record "FIN-Committment";
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record "CAT-Meals Setup";
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "G/L Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
        "G/L Entry": Record "G/L Entry";
    begin
        //First Update Analysis View
        BudgetaryControl.UpdateAnalysisView();

        //get the budget control setup first to determine if it mandatory or not
        BCSetup.RESET;
        BCSetup.GET();
        IF BCSetup.Mandatory THEN//budgetary control is mandatory
          BEGIN
            //check if the dates are within the specified range in relation to the payment header table
            IF (ReqHeader."Request Date" < BCSetup."Current Budget Start Date") THEN BEGIN
                ERROR('The Current Date %1 for the Requisition Does Not Fall Within Budget Dates %2 - %3', ReqHeader."Request Date",
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            END
            ELSE
                IF (ReqHeader."Request Date" > BCSetup."Current Budget End Date") THEN BEGIN
                    ERROR('The Current Date %1 for the Requisition Does Not Fall Within Budget Dates %2 - %3', ReqHeader."Request Date",
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");

                END;
            //Is budget Available
            BudgetaryControl.CheckIfBlocked(BCSetup."Current Budget Code");

            //Get Commitment Lines
            IF Commitments.FIND('+') THEN
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            Mline.RESET;
            Mline.SETRANGE(Mline."Booking Id", ReqHeader."Booking Id");
            // SRNLine.SETRANGE(SRNLine."Budgetary Control A/C",TRUE);
            IF Mline.FINDFIRST THEN BEGIN
                REPEAT
                    //check the votebook now
                    FirstDay := DMY2DATE(1, DATE2DMY(ReqHeader."Request Date", 2), DATE2DMY(ReqHeader."Request Date", 3));
                    CurrMonth := DATE2DMY(ReqHeader."Request Date", 2);
                    IF CurrMonth = 12 THEN BEGIN
                        LastDay := DMY2DATE(1, 1, DATE2DMY(ReqHeader."Request Date", 3) + 1);
                        LastDay := CALCDATE('-1D', LastDay);
                    END
                    ELSE BEGIN
                        CurrMonth := CurrMonth + 1;
                        LastDay := DMY2DATE(1, CurrMonth, DATE2DMY(ReqHeader."Request Date", 3));
                        LastDay := CALCDATE('-1D', LastDay);
                    END;

                    //The GL Account
                    //  if SRNLine.Type=SRNLine.Type::item then
                    IF Item.GET(Mline."Meal Code") THEN BEGIN
                        Item.TESTFIELD(Item."Meal G/L Budget Account");
                        BudgetGL := Item."Meal G/L Budget Account";
                    END;

                    BudgetAmount := 0;
                    Budget.RESET;
                    Budget.SETRANGE(Budget."Budget Name", BCSetup."Current Budget Code");
                    Budget.SETFILTER(Budget.Date, '%1..%2', BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
                    Budget.SETRANGE(Budget."G/L Account No.", BudgetGL);
                    Budget.SETRANGE(Budget."Global Dimension 1 Code", 'REVENUE');
                    Budget.SETRANGE(Budget."Global Dimension 2 Code", Mline."Cost Center");

                    IF Budget.FIND('-') THEN BEGIN
                        REPEAT
                            BudgetAmount := BudgetAmount + Budget.Amount;
                        UNTIL Budget.NEXT = 0;
                    END;
                    //  error(format(Budgetamount));
                    //get the summation on the actuals
                    ActualsAmount := 0;
                    "G/L Entry".RESET;
                    "G/L Entry".SETRANGE("G/L Entry"."G/L Account No.", BudgetGL);
                    "G/L Entry".SETRANGE("G/L Entry"."Posting Date", BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
                    "G/L Entry".SETRANGE("G/L Entry"."Global Dimension 1 Code", 'REVENUE');
                    "G/L Entry".SETRANGE("G/L Entry"."Global Dimension 2 Code", Mline."Cost Center");
                    IF "G/L Entry".FIND('-') THEN BEGIN
                        REPEAT
                            ActualsAmount := ActualsAmount + "G/L Entry".Amount;
                        UNTIL "G/L Entry".NEXT = 0;
                    END;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.RESET;
                    Commitments.SETCURRENTKEY(Commitments.Budget, Commitments."G/L Account No.",
                    Commitments."Posting Date", Commitments."Shortcut Dimension 1 Code", Commitments."Shortcut Dimension 2 Code");
                    Commitments.SETRANGE(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SETRANGE(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SETRANGE(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SETRANGE(Commitments."Shortcut Dimension 1 Code", 'REVENUE');
                    Commitments.SETRANGE(Commitments."Shortcut Dimension 2 Code", Mline."Cost Center");
                    Commitments.CALCSUMS(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;
                    //check if there is any budget
                    IF (BudgetAmount <= 0) THEN BEGIN
                        ERROR('No Budget To Check Against');
                    END;

                    //check if the actuals plus the amount is greater then the budget amount
                    IF (CommitmentAmount + Mline.Cost) > BudgetAmount THEN BEGIN
                        ERROR('The Amount Meal No %1  %2 %3  Exceeds The Budget By %4',
                        Mline."Booking Id", 'SRN', Mline."Booking Id",
                          FORMAT(ABS(BudgetAmount - (CommitmentAmount + ActualsAmount + Mline.Cost))));
                    END ELSE BEGIN

                        Commitments.RESET;
                        Commitments.INIT;
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments.Date := TODAY;
                        Commitments."Posting Date" := ReqHeader."Request Date";
                        Commitments."Document Type" := Commitments."Document Type"::Meal;
                        Commitments."Document No." := ReqHeader."Booking Id";
                        Commitments.Amount := Mline.Cost;
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := TRUE;
                        Commitments."Committed By" := USERID;
                        Commitments."Committed Date" := ReqHeader."Request Date";
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := TIME;
                        //Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments."Shortcut Dimension 1 Code" := 'REVENUE';
                        Commitments."Shortcut Dimension 2 Code" := Mline."Cost Center";
                        //Commitments."Shortcut Dimension 3 Code":=SRNLine."Shortcut Dimension 3 Code";
                        //Commitments."Shortcut Dimension 4 Code":=SRNLine."Shortcut Dimension 4 Code";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        // Commitments.Type:=Commitments.Type::item;
                        Commitments."Vendor/Cust No." := Mline."Booking Id";
                        Commitments.INSERT;
                        //Tag the Imprest Line as Committed
                        Mline.Commited := TRUE;
                        Mline.MODIFY;
                        //End Tagging Imprest Lines as Committed
                    END;

                UNTIL Mline.NEXT = 0;
            END;
        END
        ELSE//budget control not mandatory
          BEGIN

        END;
        MESSAGE('Budgetary Checking Completed Successfully');

        ReqHeader.RESET;
        ReqHeader.SETRANGE(ReqHeader."Booking Id", Mline."Booking Id");
        IF ReqHeader.FIND('-') THEN BEGIN
            ReqHeader."Budgeted Amount" := BudgetAmount;
            ReqHeader."Actual Expenditure" := ActualsAmount;
            ReqHeader."Committed Amount" := CommitmentAmount;
            //ReqHeader.CALCFIELDS("Total Cost");
            ReqHeader."Budget Balance" := BudgetAmount - (ActualsAmount + CommitmentAmount + ReqHeader."Total Cost");
            ReqHeader.MODIFY;
        END;

    end;

    procedure getMealsApprovalStatus(ReqNum: Text) Msg: Text
    begin
        MealRequisition.SetRange("Booking Id", ReqNum);
        if MealRequisition.Find('-') then begin
            if MealRequisition.Status = MealRequisition.Status::"Pending Approval" then
                Msg := 'Pending';
            if MealRequisition.Status = MealRequisition.Status::Rejected then
                Msg := 'Rejected';
        end
    end;



    procedure getMealsPurpose(impNum: Text) Msg: Text
    begin
        MealRequisition.SetRange("Booking Id", impNum);
        if MealRequisition.Find('-') then begin
            Msg := MealRequisition."Meeting Name" + '::' + MealRequisition."Contact Person";
        end
    end;

    procedure RemoveMealBookingReqLine(reqNo: Text; lineNum: integer)
    begin
        MealLinesCreate.SetRange("Booking Id", reqNo);
        MealLinesCreate.SetRange("Line No.", lineNum);
        if MealLinesCreate.Find('-') then begin
            MealLinesCreate.Delete();
        end;
    end;

    procedure MealReqLines(BookingId: Code[20]; MealCode: Code[20]; MealName: Text[250]; Quantity: Decimal; UnitPrice: Decimal; Cost: Decimal)
    begin
        MealRequisition.SETRANGE(MealRequisition."Booking Id", BookingId);
        if MealRequisition.Find('-') then begin
            MealLinesCreate.INIT;
            MealLinesCreate."Booking Id" := BookingId;
            MealLinesCreate."Meal Code" := MealCode;
            MealLinesCreate."Meal Name" := MealName;
            MealLinesCreate.Quantity := Quantity;
            MealLinesCreate."Budget Line Code" := MealRequisition."Budget Line Code";
            MealLinesCreate.Validate("Budget Line Code");
            MealLinesCreate."Unit Price" := UnitPrice;
            MealLinesCreate.Cost := Quantity * UnitPrice * MealRequisition."No. of Days";
            MealLinesCreate."No. of Days" := MealRequisition."No. of Days";
            MealLinesCreate."Cost Center" := MealRequisition."Cost Center";
            MealLinesCreate.Region := MealRequisition.Region;
            MealLinesCreate.INSERT;
        end;
    end; */
    /* MealLinesCreate.RESET;
    MealLinesCreate.SETRANGE(MealLinesCreate."Booking Id",BookingId);
    IF  MealLinesCreate.FIND('-')
    THEN
        BEGIN
          {ApprovalEntry.INIT;
          ApprovalEntry."Table ID":=39004336;
          ApprovalEntry."Document Type" :=ApprovalEntry."Document Type"::"Staff Claim";
          ApprovalEntry."Document No.":=NextTransportApplicationNo;
          ApprovalEntry."Sequence No.":=1;
          ApprovalEntry."Approval Code":='TRANS';
          ApprovalEntry.Status:=ApprovalEntry_2.Status::Open;
          ApprovalEntry."Sender ID":=EmployeeUserId;
          ApprovalEntry."Approver ID":=SupervisorId;
          ApprovalEntry."Date-Time Sent for Approval":=CURRENTDATETIME;
          ApprovalEntry."Last Date-Time Modified":=CURRENTDATETIME;
          ApprovalEntry."Last Modified By ID":=USERID;
          ApprovalEntry.INSERT;
          LastTransportReqInsert:=TransportRequisition."Transport Requisition No";}
        END; */



    /* procedure DeleteVendorCategory(Num: Integer) Msg: Text
    begin
        GoodsServiceCategories.Reset();
        GoodsServiceCategories.SetRange(No, Num);
        if GoodsServiceCategories.Find('-') then begin
            if GoodsServiceCategories.Delete(true) then
                Msg := 'Entry deleted successfully'
            else
                Msg := 'Failed to delete, please try again later';
        end;
    end;

    procedure GoodsAndServicesCategory(vendNum: Text; prodCt: Integer; regCat: Text) Msg: Text
    begin
        GoodsServiceCategories.init();
        //GoodsServiceCategories.SetRange("Vendor Num", vendNum);
        //if GoodsServiceCategories.Find('-') then begin
        GoodsServiceCategories."Vendor Num" := vendNum;
        GoodsServiceCategories."Registration Category" := regCat;
        if prodCt = 0 then
            GoodsServiceCategories."Category Class" := GoodsServiceCategories."Category Class"::Goods;
        if prodCt = 1 then
            GoodsServiceCategories."Category Class" := GoodsServiceCategories."Category Class"::Works;
        if prodCt = 2 then
            GoodsServiceCategories."Category Class" := GoodsServiceCategories."Category Class"::"Consultancy Services";
        if prodCt = 3 then
            GoodsServiceCategories."Category Class" := GoodsServiceCategories."Category Class"::"Non-Consultancy Services";
        GoodsServiceCategories2.SetRange("Registration Category", regCat);
        GoodsServiceCategories2.SetRange("Category Class", prodCt);
        if GoodsServiceCategories2.Find('-') then begin
            GoodsServiceCategories.Description := GoodsServiceCategories2.Description;
            GoodsServiceCategories."Eligiblity Type" := GoodsServiceCategories2."Eligiblity Type";
        end;
        if GoodsServiceCategories.Insert(true, true) then
            Msg := 'Success'
        else
            Msg := 'Fail';
        //end;
    end; */

    procedure getClaimHeaderDetails(ImpNum: Text) Msg: Text
    var
        claimType: Text;
        payMode: Text;
    begin
        ClaimRequisition.Reset();
        ClaimRequisition.SetRange("No.", ImpNum);
        if ClaimRequisition.Find('-') then begin
            Msg := ClaimRequisition."Global Dimension 1 Code" +
            '::' + ClaimRequisition."Shortcut Dimension 2 Code" +
            '::' + ClaimRequisition."Shortcut Dimension 3 Code" +
            '::' + ClaimRequisition."Shortcut Dimension 4 Code" +
            '::' + ClaimRequisition."Account No." +
            '::' + Format(ClaimRequisition.Date) +
            '::' + ClaimRequisition.Purpose +
            '::' + ClaimRequisition."Account No." +
            '::' + Format(ClaimRequisition.Status) +
            '::' + ClaimRequisition."Responsibility Center";
        end;
    end;

    procedure getImprestHeaderDetails(ImpNum: Text) Msg: Text
    var
        imprestType: Text;
        payMode: Text;
    begin
        ImprestRequisition.Reset();
        ImprestRequisition.SetRange("No.", ImpNum);
        if ImprestRequisition.Find('-') then begin
            /* if ImprestRequisition."Imprest Type" = 0 then
                imprestType := '0';
            if ImprestRequisition."Imprest Type" = 1 then
                imprestType := '1';
            if ImprestRequisition."Imprest Type" = 2 then
                imprestType := '2';
            if ImprestRequisition."Imprest Type" = 3 then
                imprestType := '3'; */
            //paymode
            if ImprestRequisition."Pay Mode" = 0 then
                payMode := '0';
            if ImprestRequisition."Pay Mode" = 1 then
                payMode := '1';
            if ImprestRequisition."Pay Mode" = 2 then
                payMode := '2';
            if ImprestRequisition."Pay Mode" = 3 then
                payMode := '3';
            if ImprestRequisition."Pay Mode" = 4 then
                payMode := '4';
            Msg := ImprestRequisition."Global Dimension 1 Code" + '::' + ImprestRequisition."Shortcut Dimension 2 Code" + '::' + ImprestRequisition."Shortcut Dimension 3 Code" + '::' + ImprestRequisition."Shortcut Dimension 4 Code" + '::' + '' + '::' + ImprestRequisition."payees bank code" + '::' + ImprestRequisition."payees bank name" + '::' + ImprestRequisition."Account No." + '::' + ImprestRequisition."Mobile No" + '::' + imprestType + '::' + Format(ImprestRequisition.Date) + '::' + Format(ImprestRequisition."Payment Release Date") + '::' + ImprestRequisition."Requested By" + '::' + payMode + '::' + ImprestRequisition.Purpose + '::' + ImprestRequisition."payees Branch code" + '::' + Format(ImprestRequisition.Status);
        end;
    end;

    procedure getBankName(BankCode: Text) Msg: Text
    begin
        bankStructure.Reset();
        bankStructure.SetRange("KBA Branch Code", BankCode);
        if bankStructure.Find('-') then begin
            Msg := bankStructure."Bank Name";
        end;
    end;

    procedure getStaffAccountDetails(No: Text) Msg: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange("No.", No);
        if EmployeeCard.Find('-') then begin
            Msg := EmployeeCard."Main Bank" + '::' + EmployeeCard."Branch Bank" + '::' + EmployeeCard."Bank Account Number" + '::' + EmployeeCard."Main Bank Name" + '::' + EmployeeCard."Home Phone Number";
        end;
    end;

    procedure getEmployeeSalaryGrade(username: Text) Msg: Text
    begin
        EmployeeCard.Reset();
        EmployeeCard.SetRange("No.", username);
        if EmployeeCard.Find('-') then begin
            Msg := EmployeeCard."Salary Grade";
        end;
    end;

    procedure SubmitMemoHeader(MemoNo: Text; Username: Text; UserID: Text) Message: Text
    begin


        ImprestRequisition.RESET;
        //ImprestRequisition.SETRANGE(ImprestRequisition."No.",MemoNo);
        //ImprestRequisition.SETRANGE(ImprestRequisition."Requested By",UserID); new
        /*the change below was made so that staff can only raise one imprest from memo*/
        ImprestRequisition.SETRANGE("Memo No.", MemoNo); //new
        ImprestRequisition.SETRANGE("Account No.", Username);

        IF NOT ImprestRequisition.FIND('-') THEN BEGIN
            MemoImprestHead.RESET;
            MemoImprestHead.GET(MemoNo);

            /*Copy the details to the user interface*/
            ImprestRequisition.INIT;
            CashOfficeSetup.Reset();
            CashOfficeSetup.FindLast();

            NextLeaveApplicationNo := NoSeriesMgt.GetNextNo(CashOfficeSetup."Imprest Req No", 0D, TRUE);
            ImprestRequisition."No." := NextLeaveApplicationNo;
            ImprestRequisition."Memo No." := MemoNo;
            ImprestRequisition.Date := TODAY;
            //ImprestRequisition."GL Account" := MemoImprestHead."Budget Account";
            //ImprestRequisition.Payee:=Username;
            //ImprestRequisition."On Behalf Of":=Username;
            ImprestRequisition.Cashier := UserID;
            ImprestRequisition."Global Dimension 1 Code" := MemoImprestHead."Global Dimension 1 Code";
            ImprestRequisition.Status := ImprestRequisition.Status::Pending;
            //ImprestRequisition."Shortcut Dimension 2 Code" := MemoImprestHead.short;
            //ImprestRequisition."Shortcut Dimension 4 Code" := MemoImprestHead."Activity Code";
            /* ImprestRequisition."Budget Line Name" := MemoImprestHead."Budget Line Name";
            ImprestRequisition."Cost Center Name" := MemoImprestHead."Cost Centre Name"; */
            ImprestRequisition."No. Series" := 'IMP';
            ImprestRequisition."Responsibility Center" := MemoImprestHead."Responsibility Centre";
            ImprestRequisition."Account Type" := ImprestRequisition."Account Type"::Customer;
            ImprestRequisition."Account No." := Username;
            ImprestRequisition.VALIDATE("Account No.");
            ImprestRequisition.Purpose := MemoImprestHead."Title/Ref.";
            ImprestRequisition."Requested By" := UserID;
            ImprestRequisition.INSERT;

            IF ImprestRequisition.INSERT THEN;
            Message := NextLeaveApplicationNo;
        END ELSE BEGIN
            Message := ImprestRequisition."No.";
        END;

    end;

    procedure SubmitMemoLines(MemoNo: Text; DocumentNo: Text; Type: Text; Amount: Decimal) Message: Text
    begin
        ImprestRequisition.RESET;
        ImprestRequisition.GET(DocumentNo);
        ImprestRequisitionLines.INIT;
        ImprestRequisitionLines.No := DocumentNo;
        ImprestRequisitionLines."Advance Type" := Type;
        ImprestRequisitionLines."Shortcut Dimension 2 Code" := ImprestRequisition."Shortcut Dimension 2 Code";
        //ImprestRequisitionLines."Account No." := ImprestRequisition."GL Account";
        ImprestRequisitionLines.VALIDATE("Account No.");
        ImprestRequisitionLines."Amount LCY" := Amount;
        ImprestRequisitionLines.Amount := Amount;
        ImprestRequisitionLines."Due Date" := ImprestRequisition.Date;
        ImprestRequisitionLines."Imprest Holder" := ImprestRequisition."Account No.";
        ImprestRequisitionLines."Global Dimension 1 Code" := ImprestRequisition."Global Dimension 1 Code";
        ImprestRequisitionLines.Purpose := ImprestRequisition.Purpose;
        ImprestRequisitionLines.INSERT;
    end;

    procedure SaveMemoAttchmnts(DocumentsNoz: Text; Attachmentz: Text; Decriptionz: Text; Username: Text)
    begin
        Attchemnets.RESET;
        Attchemnets.INIT;
        Attchemnets."Document No" := DocumentsNoz;
        Attchemnets.Attachment := Attachmentz;
        Attchemnets.Description := Decriptionz;
        Attchemnets.UserID := Username;
        Attchemnets.INSERT;
    end;


    procedure SubmitImprestSurrHeader(ImprestNo: Text; Rcenter: Text) Message: Text
    begin

        ImprestSurrHeader.RESET;
        ImprestSurrHeader.SETRANGE(ImprestSurrHeader."Imprest Issue Doc. No", ImprestNo);
        IF NOT ImprestSurrHeader.FIND('-') THEN BEGIN
            //NextJobapplicationNo := NoSeriesMgt.GetNextNo('SURR', 0D, TRUE);
            CashOfficeSetup.Reset();
            CashOfficeSetup.FindLast();
            NextJobapplicationNo := NoSeriesMgt.GetNextNo(CashOfficeSetup."Imprest Surrender No", 0D, TRUE);
            ImprestRequisition.RESET;
            ImprestRequisition.GET(ImprestNo);

            /*Copy the details to the user interface*/
            ImprestSurrHeader.No := NextJobapplicationNo;
            ImprestSurrHeader."Imprest Issue Doc. No" := ImprestNo;
            ImprestSurrHeader."Paying Bank Account" := ImprestRequisition."Paying Bank Account";
            ImprestSurrHeader.Payee := ImprestRequisition.Payee;
            ImprestSurrHeader."Surrender Date" := TODAY;
            ImprestSurrHeader."Account Type" := ImprestSurrHeader."Account Type"::Customer;
            ImprestSurrHeader."Account No." := ImprestRequisition."Account No.";

            ImprestSurrHeader."No. Series" := CashOfficeSetup."Imprest Surrender No";

            ImprestRequisition.CALCFIELDS(ImprestRequisition."Total Net Amount");
            ImprestSurrHeader.Amount := ImprestRequisition."Total Net Amount";
            ImprestSurrHeader."Amount Surrendered LCY" := ImprestRequisition."Total Net Amount LCY";
            //Currencies
            ImprestSurrHeader."Currency Factor" := ImprestRequisition."Currency Factor";
            ImprestSurrHeader."Currency Code" := ImprestRequisition."Currency Code";

            ImprestSurrHeader."Date Posted" := ImprestRequisition."Date Posted";
            ImprestSurrHeader."Global Dimension 1 Code" := ImprestRequisition."Global Dimension 1 Code";
            ImprestSurrHeader."Shortcut Dimension 2 Code" := ImprestRequisition."Shortcut Dimension 2 Code";
            ImprestSurrHeader."Shortcut Dimension 3 Code" := ImprestRequisition."Shortcut Dimension 3 Code";
            ImprestSurrHeader.Dim3 := ImprestRequisition.Dim3;
            ImprestSurrHeader."Shortcut Dimension 4 Code" := ImprestRequisition."Shortcut Dimension 4 Code";
            ImprestSurrHeader.Dim4 := ImprestRequisition.Dim4;
            ImprestSurrHeader."Imprest Issue Date" := ImprestRequisition.Date;
            ImprestSurrHeader."Responsibility Center" := Rcenter;
            ImprestSurrHeader.INSERT;
            IF ImprestSurrHeader.INSERT THEN;
            Message := NextJobapplicationNo;
        END ELSE BEGIN
            Message := ImprestSurrHeader.No;
        END;

    end;


    procedure SubmitImprestSurrDetails(DocumentNo: Text; ActualSpent: Decimal; CashAmount: Decimal; ImprestNo: Text) Message: Text
    begin

        /*Copy the detail lines from the imprest details table in the database*/
        ImprestRequisitionLines.RESET;
        ImprestRequisitionLines.SETRANGE(ImprestRequisitionLines.No, ImprestNo);
        IF ImprestRequisitionLines.FIND('-') THEN /*Copy the lines to the line table in the database*/
          BEGIN
            ImprestSurrDetails.INIT;
            ImprestSurrDetails."Surrender Doc No." := DocumentNo;
            ImprestSurrDetails."Account No:" := ImprestRequisitionLines."Account No.";
            ImprestSurrDetails."Imprest Type" := ImprestRequisitionLines."Advance Type";
            ImprestSurrDetails.VALIDATE(ImprestSurrDetails."Account No:");
            ImprestSurrDetails."Account Name" := ImprestRequisitionLines."Account Name";
            ImprestSurrDetails.Amount := ImprestRequisitionLines.Amount;
            ImprestSurrDetails."Due Date" := ImprestRequisitionLines."Due Date";
            ImprestSurrDetails."Imprest Holder" := ImprestRequisitionLines."Imprest Holder";
            ImprestSurrDetails."Actual Spent" := ActualSpent;
            ImprestSurrDetails.Validate("Actual Spent");
            ImprestSurrDetails."Cash Receipt Amount" := CashAmount;
            ImprestSurrDetails.Validate("Cash Receipt Amount");
            ImprestSurrDetails."Apply to" := ImprestRequisitionLines."Apply to";
            ImprestSurrDetails."Apply to ID" := ImprestRequisitionLines."Apply to ID";
            ImprestSurrDetails."Surrender Date" := ImprestRequisitionLines."Surrender Date";
            ImprestSurrDetails.Surrendered := ImprestRequisitionLines.Surrendered;
            ImprestSurrDetails."Cash Receipt No" := ImprestRequisitionLines."M.R. No";
            ImprestSurrDetails."Date Issued" := ImprestRequisitionLines."Date Issued";
            ImprestSurrDetails."Type of Surrender" := ImprestRequisitionLines."Type of Surrender";
            ImprestSurrDetails."Dept. Vch. No." := ImprestRequisitionLines."Dept. Vch. No.";
            ImprestSurrDetails."Currency Factor" := ImprestRequisitionLines."Currency Factor";
            ImprestSurrDetails."Currency Code" := ImprestRequisitionLines."Currency Code";
            ImprestSurrDetails."Imprest Req Amt LCY" := ImprestRequisitionLines."Amount LCY";
            ImprestSurrDetails."Shortcut Dimension 1 Code" := ImprestRequisitionLines."Global Dimension 1 Code";
            ImprestSurrDetails."Shortcut Dimension 2 Code" := ImprestRequisitionLines."Shortcut Dimension 2 Code";
            ImprestSurrDetails."Shortcut Dimension 3 Code" := ImprestRequisitionLines."Shortcut Dimension 3 Code";
            ImprestSurrDetails."Shortcut Dimension 4 Code" := ImprestRequisitionLines."Shortcut Dimension 4 Code";
            ImprestSurrDetails.INSERT;

            ImprestSurrDetails.RESET;
            ImprestSurrDetails.SETRANGE(ImprestSurrDetails."Surrender Doc No.", DocumentNo);
            IF ImprestSurrDetails.FIND('-') THEN BEGIN
                REPEAT
                    IF (ImprestSurrDetails."Cash Receipt Amount" + ImprestSurrDetails."Actual Spent") <> ImprestSurrDetails.Amount THEN
                        ERROR('Receipt Amount and Imprest Should be equal to Imprest Amount..');
                UNTIL ImprestSurrDetails.NEXT = 0;
            END;
            if ApprovalMgmtFin.IsImprestAccEnabled(ImprestSurrHeader) = true then
                ApprovalMgmtFin.OnSendImprestAccforApproval(ImprestSurrHeader);

        END;

    end;

    /* procedure SubmitImprestSurrDetails(DocumentNo: Text; LineNo: Integer; ActualSpent: Decimal; CashAmount: Decimal; ImprestNo: Text; createdat: DateTime) Msg: DateTime
    begin

        /*Copy the detail lines from the imprest details table in the database*/
    /*ImprestRequisitionLines.RESET;
    ImprestRequisitionLines.SETRANGE(ImprestRequisitionLines.No, ImprestNo);
    ImprestRequisitionLines.SETRANGE(ImprestRequisitionLines."Line No.", LineNo);
    IF ImprestRequisitionLines.FIND('-') THEN /*Copy the lines to the line table in the database*/
    /* BEGIN
         ImprestSurrDetails.SetRange("Surrender Doc No.", DocumentNo);
         ImprestSurrDetails.SetFilter("Actual Spent", '=%1', ImprestSurrDetails."Cash Receipt Amount");
         ImprestSurrDetails.SetFilter("Cash Receipt Amount", '>%1', 1);
         IF ImprestSurrDetails.Find('-') then begin

             ImprestSurrDetails."Surrender Doc No." := DocumentNo;
             ImprestSurrDetails."Account No." := ImprestRequisitionLines."Account No.";
             ImprestSurrDetails."Imprest Type" := ImprestRequisitionLines."Advance Type";
             ImprestSurrDetails.VALIDATE(ImprestSurrDetails."Account No.");
             ImprestSurrDetails."Account Name" := ImprestRequisitionLines."Account Name";
             ImprestSurrDetails.Amount := ImprestRequisitionLines.Amount;
             ImprestSurrDetails."Due Date" := ImprestRequisitionLines."Due Date";
             ImprestSurrDetails."Imprest Holder" := ImprestRequisitionLines."Imprest Holder";
             ImprestSurrDetails."Actual Spent" := ActualSpent;
             ImprestSurrDetails."Cash Receipt Amount" := CashAmount;
             ImprestSurrDetails."Apply to" := ImprestRequisitionLines."Apply to";
             ImprestSurrDetails."Apply to ID" := ImprestRequisitionLines."Apply to ID";
             ImprestSurrDetails."Surrender Date" := ImprestRequisitionLines."Surrender Date";
             ImprestSurrDetails.Surrendered := ImprestRequisitionLines.Surrendered;
             ImprestSurrDetails."Cash Receipt No" := ImprestRequisitionLines."M.R. No";
             ImprestSurrDetails."Date Issued" := ImprestRequisitionLines."Date Issued";
             ImprestSurrDetails."Type of Surrender" := ImprestRequisitionLines."Type of Surrender";
             ImprestSurrDetails."Dept. Vch. No." := ImprestRequisitionLines."Dept. Vch. No.";
             ImprestSurrDetails."Currency Factor" := ImprestRequisitionLines."Currency Factor";
             ImprestSurrDetails."Currency Code" := ImprestRequisitionLines."Currency Code";
             ImprestSurrDetails."Imprest Req Amt LCY" := ImprestRequisitionLines."Amount LCY";
             ImprestSurrDetails."Shortcut Dimension 1 Code" := ImprestRequisitionLines."Global Dimension 1 Code";
             ImprestSurrDetails."Shortcut Dimension 2 Code" := ImprestRequisitionLines."Shortcut Dimension 2 Code";
             ImprestSurrDetails."Shortcut Dimension 3 Code" := ImprestRequisitionLines."Shortcut Dimension 3 Code";
             ImprestSurrDetails."Shortcut Dimension 4 Code" := ImprestRequisitionLines."Shortcut Dimension 4 Code";
             ImprestSurrDetails.Modify();
             Msg := ImprestSurrDetails.SystemCreatedAt;


         end else begin
             ImprestSurrDetails.INIT;
             ImprestSurrDetails."Surrender Doc No." := DocumentNo;
             ImprestSurrDetails."Account No." := ImprestRequisitionLines."Account No.";
             ImprestSurrDetails."Imprest Type" := ImprestRequisitionLines."Advance Type";
             //ImprestSurrDetails.VALIDATE(ImprestSurrDetails."Account No.");
             ImprestSurrDetails."Account Name" := ImprestRequisitionLines."Account Name";
             ImprestSurrDetails.Amount := ImprestRequisitionLines.Amount;
             ImprestSurrDetails."Due Date" := ImprestRequisitionLines."Due Date";
             ImprestSurrDetails."Imprest Holder" := ImprestRequisitionLines."Imprest Holder";
             ImprestSurrDetails."Actual Spent" := ActualSpent;
             ImprestSurrDetails."Cash Receipt Amount" := CashAmount;
             ImprestSurrDetails."Apply to" := ImprestRequisitionLines."Apply to";
             ImprestSurrDetails."Apply to ID" := ImprestRequisitionLines."Apply to ID";
             ImprestSurrDetails."Surrender Date" := ImprestRequisitionLines."Surrender Date";
             ImprestSurrDetails.Surrendered := ImprestRequisitionLines.Surrendered;
             ImprestSurrDetails."Cash Receipt No" := ImprestRequisitionLines."M.R. No";
             ImprestSurrDetails."Date Issued" := ImprestRequisitionLines."Date Issued";
             ImprestSurrDetails."Type of Surrender" := ImprestRequisitionLines."Type of Surrender";
             ImprestSurrDetails."Dept. Vch. No." := ImprestRequisitionLines."Dept. Vch. No.";
             ImprestSurrDetails."Currency Factor" := ImprestRequisitionLines."Currency Factor";
             ImprestSurrDetails."Currency Code" := ImprestRequisitionLines."Currency Code";
             ImprestSurrDetails."Imprest Req Amt LCY" := ImprestRequisitionLines."Amount LCY";
             ImprestSurrDetails."Shortcut Dimension 1 Code" := ImprestRequisitionLines."Global Dimension 1 Code";
             ImprestSurrDetails."Shortcut Dimension 2 Code" := ImprestRequisitionLines."Shortcut Dimension 2 Code";
             ImprestSurrDetails."Shortcut Dimension 3 Code" := ImprestRequisitionLines."Shortcut Dimension 3 Code";
             ImprestSurrDetails."Shortcut Dimension 4 Code" := ImprestRequisitionLines."Shortcut Dimension 4 Code";
             ImprestSurrDetails.INSERT();
             Msg := ImprestSurrDetails.SystemCreatedAt;
         end;
     END;*/

    /* ImprestSurrHeader.RESET;
    ImprestSurrHeader.SETRANGE(ImprestSurrHeader."Imprest Issue Doc. No", ImprestNo);
    IF ImprestSurrHeader.FIND('-') THEN begin
        ImprestSurrHeader.Validate("Imprest Issue Doc. No");
    end */

    /*end; */

    procedure sendforApprovalImprestSurrender(ImpNo: Text) Msg: Text
    var
        total: Decimal;
    begin
        ImprestSurrHeader.SetRange(No, ImpNo);
        if ImprestSurrHeader.Find('-') then begin
            total := 0;
            ImprestSurrDetails.RESET;
            ImprestSurrDetails.SETRANGE(ImprestSurrDetails."Surrender Doc No.", ImpNo);
            IF ImprestSurrDetails.FIND('-') THEN BEGIN
                REPEAT
                    //total := ImprestSurrDetails."Cash Receipt Amount" + ImprestSurrDetails."Actual Spent";
                    IF (ImprestSurrDetails."Cash Receipt Amount" + ImprestSurrDetails."Actual Spent") <> ImprestSurrDetails.Amount THEN
                        ERROR('Receipt Amount and Imprest Should be equal to Imprest Amount..');
                UNTIL ImprestSurrDetails.NEXT = 0;
                //IF total <> ImprestSurrDetails.Amount THEN
                //ERROR('Receipt Amount and Imprest Should be equal to Imprest Amount..');
            END;

            if ApprovalMgmtFin.IsImprestAccEnabled(ImprestSurrHeader) then
                ApprovalMgmtFin.OnSendImprestAccforApproval(ImprestSurrHeader)
            else
                Msg := 'Approval workflow not enabled';
        end
    end;

    procedure CheckCommiteeMember(staffNo: Text[30]) Msg: Text[100]
    begin
        EvaluationComittee.SetRange("Employee no", staffNo);
        if EvaluationComittee.Find('-') then begin
            Msg := 'true';
        end else
            Msg := 'false';
    end;

    procedure OpenTender(bidNumber: Text[30]) Msg: Text[100]
    begin
        tblTenderBids.SetRange("No.", bidNumber);
        if tblTenderBids.Find('-') then begin
            //tblTenderBids."Tender Opened" := true;
            //tblTenderBids.Modify();
            Msg := 'Success';
        end else
            Msg := 'Fail';
    end;

    // Staff Portal Functions
    procedure CheckStaffLogin(username: Code[20]; userpassword: Text[50]) ReturnMsg: Text[200];
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SetRange(HRMEmployeeD."No.", username);

        if (HRMEmployeeD.Find('-')) then begin
            //if (HRMEmployeeD.Status = 0) then begin
            if (HRMEmployeeD.Status = HRMEmployeeD.Status::Active) then begin
                if (HRMEmployeeD."Changed Password" = true) then begin
                    if (HRMEmployeeD."Portal Password" = userpassword) then begin
                        ReturnMsg := 'SUCCESS' + '::' + Format(HRMEmployeeD."Changed Password") + '::' + HRMEmployeeD."No." + '::' + HRMEmployeeD.FullName();
                    end else begin
                        FullNames := HRMEmployeeD."First Name" + ' ' + HRMEmployeeD."Middle Name" + ' ' + HRMEmployeeD."Last Name";
                        ReturnMsg := 'Invalid Password' + '::' + Format(HRMEmployeeD."Changed Password") + '::' + HRMEmployeeD."No." + '::' + FullNames;
                    end
                end else begin
                    if (HRMEmployeeD."Portal Password" = userpassword) then begin
                        ReturnMsg := 'SUCCESS' + '::' + Format(HRMEmployeeD."Changed Password") + '::' + HRMEmployeeD."No." + '::' + FullNames;
                    end else begin
                        ReturnMsg := 'Invalid Password' + '::' + Format(HRMEmployeeD."Changed Password");
                    end
                end
            end else begin
                //ReturnMsg := 'Your Account Status Is Inactive. Please Contact Administrator.' + '::';
                ReturnMsg := 'INACTIVE' + '::';
            end
        end else begin
            ReturnMsg := 'Invalid Staff Number' + '::';
        end

    end;

    procedure CheckStaffLoginForUnchangedPass(Username: Code[20]; password: Text[50]) ReturnMsg: Text[200];
    begin
        HRMEmployeeD.Reset();

        HRMEmployeeD.SetRange(HRMEmployeeD."No.", Username);
        HRMEmployeeD.SetRange(HRMEmployeeD."No.", password);

        if (HRMEmployeeD.Find('-')) then begin
            if (HRMEmployeeD.Status = 0) then begin
                ReturnMsg := 'SUCCESS' + '::' + HRMEmployeeD."No." + '::' + HRMEmployeeD."Company E-Mail";
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
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);
        IF HRMEmployeeD.FIND('-') THEN BEGIN
            HRMEmployeeD."Portal Password" := genpass;
            HRMEmployeeD."Changed Password" := TRUE;
            HRMEmployeeD.Modify();
            ReturnMsg := 'SUCCESS' + '::';
        END
    end;

    procedure VerifyCurrentPassword(username: Code[20]; oldpass: Text[100]) ReturnMsg: Text[200];
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SetRange(HRMEmployeeD."No.", username);
        HRMEmployeeD.SetRange(HRMEmployeeD."Portal Password", oldpass);

        if (HRMEmployeeD.Find('-')) then begin
            ReturnMsg := 'SUCCESS' + '::';
        end
    end;

    procedure ChangeStaffPassword(username: Code[30]; password: Text) ReturnMsg: Text[200];
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);
        IF HRMEmployeeD.FIND('-') THEN BEGIN

            HRMEmployeeD."Portal Password" := password;
            HRMEmployeeD."Changed Password" := TRUE;
            HRMEmployeeD.Modify();
            ReturnMsg := 'SUCCESS' + '::';
        END;
    end;

    procedure CheckStaffPasswordChanged(username: Code[30]) Message: Text
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);
        IF HRMEmployeeD.FIND('-') THEN BEGIN
            IF (HRMEmployeeD."Changed Password" = true) THEN BEGIN
                Message := 'SUCCESS' + '::' + FORMAT(HRMEmployeeD."Changed Password");
            END ELSE BEGIN
                Message := 'FAILED' + '::' + FORMAT(HRMEmployeeD."Changed Password");
            END
        END ELSE BEGIN
            Message := 'FAILED' + '::';
        END
    end;

    procedure CheckValidStaffNo(username: Code[30]) Message: Text
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);
        IF HRMEmployeeD.FIND('-') THEN BEGIN
            Message := 'SUCCESS' + '::';
        END ELSE BEGIN
            Message := 'FAILED' + '::';
        END
    end;

    procedure GetStaffProfileDetails(username: Code[30]) Message: Text
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);
        IF HRMEmployeeD.FIND('-') THEN BEGIN
            Message := HRMEmployeeD."ID Number" + '::' + HRMEmployeeD.Citizenship + '::' + HRMEmployeeD."Postal Address" + '::' +
  HRMEmployeeD."Job Title" + '::' + HRMEmployeeD."Company E-Mail" + '::' + HRMEmployeeD.Initials + '::' + FORMAT(HRMEmployeeD."Date Of Birth") + '::' + FORMAT(HRMEmployeeD.Gender) + '::' + HRMEmployeeD."Cellular Phone Number" + '::' + HRMEmployeeD.Initials + '::' + HRMEmployeeD."E-Mail";

        END
    end;

    procedure GetStaffMail(username: Code[30]) Message: Text
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);
        IF HRMEmployeeD.FIND('-') THEN BEGIN
            Message := HRMEmployeeD."Company E-Mail" + '::' + HRMEmployeeD."E-Mail";
        END
    end;

    procedure GetProfilePicture(StaffNo: Text) BaseImage: Text
    var
        Bytes: DotNet BCArray;
        Convert: DotNet BCConvert;
        MemoryStream: DotNet BCMemoryStream;
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", StaffNo);

        IF HRMEmployeeD.FIND('-') THEN BEGIN
            IF HRMEmployeeD.Picture.HASVALUE THEN BEGIN
                HRMEmployeeD.CALCFIELDS(Picture);
                HRMEmployeeD.Picture.CREATEINSTREAM(IStream);
                MemoryStream := MemoryStream.MemoryStream();
                COPYSTREAM(MemoryStream, IStream);
                Bytes := MemoryStream.GetBuffer();
                BaseImage := Convert.ToBase64String(Bytes);
            END;
        END;
    end;

    procedure GetCurrentPassword(username: Code[30]) Message: Text
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);
        IF HRMEmployeeD.FIND('-') THEN BEGIN
            Message := HRMEmployeeD."Portal Password" + '::';
        END
    end;

    procedure GenerateLeaveStatement(StaffNo: Text; filenameFromApp: Text)
    var
        filename2: Text;
    begin
        filename := FILESPATH_S + filenameFromApp;
        filename2 := FILESPATH_S2 + filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);
        IF EXISTS(filename2) THEN
            ERASE(filename2);
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", StaffNo);

        IF HRMEmployeeD.FIND('-') THEN BEGIN
            //REPORT.SAVEASPDF(Report::"HR Leave Statement", filename, HRMEmployeeD);
            //REPORT.SAVEASPDF(Report::"HR Leave Statement", filename2, HRMEmployeeD);
            REPORT.SAVEASPDF(Report::"Standard Leave Balance Report", filename, HRMEmployeeD);
        END
    end;

    procedure GetStaffDetails(username: Code[30]) Message: Text
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);
        IF HRMEmployeeD.FIND('-') THEN BEGIN
            Message := HRMEmployeeD."ID Number" + '::' + HRMEmployeeD.Citizenship + '::' + HRMEmployeeD."Postal Address" + '::' +
  HRMEmployeeD."Job Title" + '::' + HRMEmployeeD."Company E-Mail" + '::' + HRMEmployeeD.Initials + '::' + FORMAT(HRMEmployeeD."Date Of Birth");

        END
    end;

    procedure GetStaffGender(username: Code[30]) Message: Text
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);
        IF HRMEmployeeD.FIND('-') THEN BEGIN
            Message := FORMAT(HRMEmployeeD.Gender) + '::' + HRMEmployeeD."Cellular Phone Number";

        END
    end;

    procedure GeneratePaySlipReport(EmployeeNo: Text; Period: Date; filenameFromApp: Text) filename: Text[100]
    var
        filename2: Text;
    begin

        filename := FILESPATH_S + filenameFromApp;
        //filename2 := FILESPATH_S2 + filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);

        IF EXISTS(filename2) THEN
            ERASE(filename2);
        //MESSAGE('OK');
        PRLPeriodTransactions.RESET;
        PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code", EmployeeNo);
        PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period", Period);

        IF PRLPeriodTransactions.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(52179115, filename, PRLPeriodTransactions);
            //REPORT.SAVEASPDF(Report::"PRL-Payslips V 1.1.1", filename2, PRLPeriodTransactions);
        END;
        EXIT(filename);
        EXIT(filename2);

    end;

    procedure Generatep9Report(SelectedPeriod: Integer; EmployeeNo: Text; filenameFromApp: Text) filename: Text[100]
    var
        filename2: Text;
    begin
        filename := FILESPATH_S + filenameFromApp;
        //filename2 := FILESPATH_S2 + filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);
        /*
                IF EXISTS(filename2) THEN
                    ERASE(filename2);*/
        //MESSAGE('OK');
        P9.Reset();
        P9.SETRANGE(P9."Period Year", SelectedPeriod);
        P9.SETRANGE(P9."Employee Code", EmployeeNo);

        IF P9.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(52179122, filename, P9);
            //REPORT.SAVEASPDF(Report::"P9 Report (Final)", filename2, P9);
        END;
        EXIT(filename);
    end;


    //Approve Document

    [IntegrationEvent(false, false)]
    local procedure OnBeforeApproveApprovalRequests(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeApproveSelectedApprovalRequest(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    begin
    end;

    procedure ApproveApprovalRequests(var ApprovalEntry: Record "Approval Entry")
    var
        ApprovalEntryToUpdate: Record "Approval Entry";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeApproveApprovalRequests(ApprovalEntry, IsHandled);
        if IsHandled then
            exit;

        if ApprovalEntry.FindSet() then
            repeat
                ApprovalEntryToUpdate := ApprovalEntry;
                ApproveSelectedApprovalRequest(ApprovalEntryToUpdate);
            until ApprovalEntry.Next() = 0;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckStatus(var ApprovalEntry: Record "Approval Entry"; ApprovalAction: Enum "Approval Action"; var IsHandled: Boolean)
    begin
    end;

    local procedure CheckOpenStatus(ApprovalEntry: Record "Approval Entry"; ApprovalAction: Enum "Approval Action"; ErrorMessage: Text)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckStatus(ApprovalEntry, ApprovalAction, IsHandled);
        if IsHandled then
            exit;
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", ApprovalEntry."Approver ID");
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", ApprovalEntry."Document No.");
        if ApprovalEntry.Find('-') then;
        /* if ApprovalEntry.Status <> ApprovalEntry.Status::Open then
            Error(ErrorMessage); */
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckUserAsApprovalAdministrator(ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    begin
    end;

    local procedure CheckUserAsApprovalAdministrator(ApprovalEntry: Record "Approval Entry")
    var
        UserSetup: Record "User Setup";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckUserAsApprovalAdministrator(ApprovalEntry, IsHandled);
        if IsHandled then
            exit;

        UserSetup.Get(ApprovalEntry."Approver ID");
        UserSetup.TestField("Approval Administrator");
    end;

    local procedure ApproveSelectedApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeApproveSelectedApprovalRequest(ApprovalEntry, IsHandled);
        if IsHandled then
            exit;
        CheckOpenStatus(ApprovalEntry, "Approval Action"::Approve, ApproveOnlyOpenRequestsErr);

        if ApprovalEntry."Approver ID" <> ApprovalEntry."Approver ID" then
            CheckUserAsApprovalAdministrator(ApprovalEntry);

        ApprovalEntry.Validate(Status, ApprovalEntry.Status::Approved);
        ApprovalEntry.Modify(true);
        OnApproveApprovalRequest(ApprovalEntry);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    begin
    end;


    //approve
    procedure ApproveDocument2(DocumentNo: Text; ApproverID: Text)
    var
        //  ApprovalEntryProc: Record "Approval Entry-proc";
        reqtappPage: Page "Requests to Approve";
        ApprovalEntry: Record "Approval Entry";

    begin
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", ApproverID);
        if ApprovalEntry.find('-') then begin
            ApproveApprovalRequests(ApprovalEntry);
        end;
        // ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", DocumentNo);
        // ApprovalEntry.SETRANGE(ApprovalEntry."Approver ID", ApproverID);

        // IF ApprovalEntry.FIND('-') THEN BEGIN

        //     REPEAT
        //         //IF NOT ApprovalSetup.GET THEN
        //         //ERROR(Text004);

        //         ApprovalsMgmt.ApproveApprovalRequests(ApprovalEntry);

        //     UNTIL ApprovalEntry.NEXT = 0;
        // END
    end;

    procedure RejectDocument(DocumentNo: Text; ApproverID: Text)
    var
        reqtappPage: Page "Requests to Approve";
        ApprovalEntry: Record "Approval Entry";
        Appmng2: Codeunit "Approvals Mgmt.";

    begin
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", ApproverID);
        if ApprovalEntry.find('-') then begin
            Appmng2.RejectApprovalRequests(ApprovalEntry);
        end;
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



    procedure ApproveDocument(DocumentNo: Text; ApproverID: Text)
    var
        // Appmng2: Codeunit "Approvals Mgmt2";
        Appmng2: Codeunit "Approvals Mgmt.";
    begin
        /* ApprovalEntry.Reset();
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", ApproverID);


        ApprovalEntry.Reset(); */
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", ApproverID);
        if ApprovalEntry.Find('-') then begin

            /*  ApprovalEntry."Portal Time" := CurrentDateTime();
             ApprovalEntry."Portal User ID" := ApproverID; */
            ApprovalEntry.Modify();

            ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Open);
            if ApprovalEntry.find('-') then begin
                Appmng2.ApproveApprovalRequests(ApprovalEntry);

                /* custApprovalEnt."Entry No." := ApprovalEntry."Entry No.";
                custApprovalEnt."Portal Time" := CurrentDateTime;
                custApprovalEnt."Portal User ID" := ApproverID;
                custApprovalEnt.Insert(); */
            end;

        end;
    end;

    //procedure ApproveDocument3(DocumentNo: Text; DocumentType: Text)



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
    var
    //leaveperiod: Record "HRM-Leave Periods";
    //Year: Integer;
    begin
        CLEAR(availabledays);
        CLEAR(daysInteger);
        LeaveLE.Reset();
        LeaveLE.SETRANGE(LeaveLE."Employee No", EmployeeNo);
        LeaveLE.SETRANGE(LeaveLE."Leave Type", LeaveType);
        //LeaveLE.SETRANGE(LeaveLE."Leave Period", Year);
        IF LeaveLE.FIND('-') THEN
            REPEAT
            BEGIN
                daysInteger := daysInteger + LeaveLE."No. of Days"
                // availabledays:=FORMAT(LeaveLE."No. of Days");
            END;
            UNTIL LeaveLE.NEXT = 0;
        availabledays := FORMAT(daysInteger);
    end;

    procedure HRCheckLeaveStatus(StaffNum: Text) Msg: Integer
    begin
        LeaveT.Reset();
        LeaveT.SetRange("No.", StaffNum);
        if LeaveT.Find('-') then
            Msg := LeaveT.Status;
    end;

    procedure HRCheckPendingLeave(StaffNum: Text) Msg: Integer
    begin
        LeaveT.Reset();
        LeaveT.SetRange("Employee No", StaffNum);
        LeaveT.SetRange(Status, LeaveT.Status::"Pending Approval");
        if LeaveT.Find('-') then
            //Msg := LeaveT.Status
            Msg := 2
        else
            Msg := 0;
    end;

    procedure EmployeeResponsibilityCenter(EmployeeNo: Text) Msg: Text
    begin
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", EmployeeNo);
        IF HRMEmployeeD.FIND('-') then begin
            // Msg := HRMEmployeeD."Responsibility Center";
        end;
    end;

    procedure HRLeaveApplication(EmployeeNo: Text; LeaveType: Text; AppliedDays: Decimal; StartDate: Date; EndDate: Date; ReturnDate: Date; SenderComments: Text; Reliever: Text; RelieverName: Text; rCentre: Text; depart: Text; division: Text) successMessage: Text
    var
        Recipients: List of [Text];
        Subject: Text;
        TaskMessage1: Label 'LEAVE RELIEVER';
        Body: Text;
        enddate2: date;
        TaskSubject1: Label 'Dear <b> %1</b> <br> <br> This is to inform you that you have been chosen as the reliever by:<b> %2 </b> in leave No: <b> %3 </b> for a number of<b> %5 <b> days <br><br>Expected return date is %4.<br></br> Kindly Login in to the system to accept.';
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
    begin
        LeaveT.INIT;
        HRSetup.GET;
        HRSetup.FindLast();
        NextLeaveApplicationNo := NoSeriesMgt.GetNextNo(HRSetup."Leave Application Nos.", 0D, TRUE);

        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", EmployeeNo);
        IF HRMEmployeeD.FIND('-')
        THEN BEGIN
            LeaveT."Employee No" := EmployeeNo;
            LeaveT.Validate("Employee No");
            //LeaveT."Employee Name" := HRMEmployeeD.FullName;
        END;
        LeaveT."Reliever No." := Reliever;
        LeaveT."Reliever Name" := RelieverName;

        usersetup.Reset();
        usersetup.SetRange("Employee No.", Reliever);
        if usersetup.Find('-') then begin
            // LeaveT."Reliever User Name" := usersetup."User ID";
        end;

        LeaveT."No." := NextLeaveApplicationNo;
        LeaveT."Leave Type" := LeaveType;
        LeaveT.VALIDATE("Leave Type");
        LeaveT."Applied Days" := AppliedDays;
        LeaveT.Date := TODAY;
        LeaveT."Starting Date" := StartDate;
        LeaveT."End Date" := EndDate;
        LeaveT."Return Date" := ReturnDate;
        LeaveT.Purpose := SenderComments;
        LeaveT."No. Series" := HRSetup."Leave Application Nos.";
        LeaveT.Status := HRLeave.Status::Open;
        LeaveT."Institution Code" := depart;
        // LeaveT."Shortcut Dimension 3 Code" := division;
        usersetup.Reset();
        usersetup.SetRange("Employee No.", LeaveT."Reliever No.");
        if usersetup.Find('-') then begin
            LeaveT."User ID" := usersetup."User ID";
        end;
        //LeaveT."Responsibility Center" := rCentre;
        LeaveT.INSERT;
        //send request for approval
        LeaveT.Reset();
        LeaveT.SETRANGE(LeaveT."No.", NextLeaveApplicationNo);
        IF LeaveT.FIND('-')
        THEN BEGIN
            ApprovalMgmtHr.IsLeaveEnabled(LeaveT);
            ApprovalMgmtHr.OnSendLeaveforApproval(LeaveT);
        end;
        //ApprovalMgmtHr.(LeaveT);
        /*
                if (LeaveT.Status = LeaveT.Status::Open) and (LeaveT."Reliever Accepted" = LeaveT."Reliever Accepted"::" ") then begin
                    LeaveT.TestField("Reliever No.");
                    LeaveT.TestField("Applied Days");
                    LeaveT.TestField("Starting Date");
                    if LeaveT."Reliever No." <> '' then begin
                        LeaveT.Reset();
                        LeaveT.SetRange("No.", LeaveT."No.");
                        if LeaveT.FindSet(true, true) then begin
                            repeat
                                usersetup.Reset();
                                usersetup.SetRange("Employee No.", LeaveT."Reliever No.");
                                if usersetup.Find('-') then begin
                                    Recipients.Add(usersetup."E-Mail");
                                end;
                            until LeaveT.Next() = 0;
                            Subject := StrSubstNo(TaskMessage1, LeaveT."No.");
                            Body := StrSubstNo(TaskSubject1, LeaveT."Reliever Name", LeaveT."Employee Name", LeaveT."No.", LeaveT."Return Date", LeaveT."Applied Days");
                            EmailMessage.Create(Recipients, Subject, Body, true);
                            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                            LeaveT."Reliever Accepted" := LeaveT."Reliever Accepted"::"Sent To Reliever";
                            LeaveT.Modify();
                            successMessage := 'Your application has been sent to the choosen reliever';
                        end;
                    end
                    else
                        Error('Reliever not set')
                end else
                    Error('The leave application is either in the approval process or its posted');*/

    end;

    procedure HRCancelLeaveApplication(LeaveApplicationNo: Text)
    begin
        LeaveT.Reset();
        LeaveT.SETRANGE(LeaveT."No.", LeaveApplicationNo);

        IF LeaveT.FIND('-') THEN BEGIN
            //pprovalMgmtHr.OnCancelLeaveforApproval(LeaveT);
            HRApprovals.RunWorkflowOnCancelLEAVEApproval(LeaveT);
        END;


        /* ApprovalEntry.Reset();
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", LeaveApplicationNo);

        IF ApprovalEntry.FIND('-') THEN BEGIN
            REPEAT
                ApprovalEntry.Status := ApprovalEntry_2.Status::Canceled;
                ApprovalEntry.Modify();
            UNTIL ApprovalEntry.NEXT = 0
        END; */
    end;

    procedure TestService(Name: Text; Age: Integer) RMessage: Text
    begin
        rMessage := 'Hello ' + Name + ' You have ' + Format(Age) + ' Years';
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

    procedure ValidateStartDate("Starting Date": Date) Msg: Text
    begin
        dates.Reset();
        dates.SETRANGE(dates."Period Start", "Starting Date");
        dates.SETFILTER(dates."Period Type", '=%1', dates."Period Type"::Date);
        IF dates.FIND('-') THEN
            IF ((dates."Period Name" = 'Sunday') OR (dates."Period Name" = 'Saturday')) THEN BEGIN
                IF (dates."Period Name" = 'Sunday') THEN
                    Msg := 'You can not start your leave on a Sunday'
                ELSE
                    IF (dates."Period Name" = 'Saturday') THEN Msg := 'You can not start your leave on a Saturday';
                exit;
            END;

        BaseCalendar.Reset();
        BaseCalendar.SETFILTER(BaseCalendar."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendar.SETRANGE(BaseCalendar.Date, "Starting Date");
        IF BaseCalendar.FIND('-') THEN BEGIN
            REPEAT
                IF BaseCalendar.Nonworking = TRUE THEN BEGIN
                    IF BaseCalendar.Description <> '' THEN
                        Msg := 'You can not start your Leave on a Holiday : ''' + BaseCalendar.Description + ''''
                    ELSE
                        Msg := 'You can not start your Leave on a Holiday';
                END;
            UNTIL BaseCalendar.NEXT = 0;
            exit;
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
                            Msg := 'You can not start your Leave on a Holiday : ''' + BaseCalendar.Description + ''''
                        ELSE
                            Msg := 'You can not start your Leave on a Holiday';
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

    procedure CheckVendorQuoteExists(vendor: Text; RfqNum: Text) Msg: Text
    begin
        rfqHeader.Reset();
        rfqHeader.SetRange("No.", RfqNum);
        if rfqHeader.Find('-') then begin
            PurchaseHeader.Reset();
            PurchaseHeader.SetRange("Buy-from Vendor No.", vendor);
            PurchaseHeader.SetRange("Request for Quote No.", RfqNum);
            if PurchaseHeader.Find('-') then
                Msg := PurchaseHeader."No."
            else
                Msg := 'False';
        end
    end;

    procedure RemoveQuoteLine(LineNo: Integer)
    begin
        PurchaseLines.Reset();
        PurchaseLines.SETRANGE(PurchaseLines."Line No.", LineNo);
        IF PurchaseLines.FIND('-') THEN BEGIN
            PurchaseLines.DELETE;
            MESSAGE('Line Deleted Successfully');
        END;
    end;

    procedure CreateVendorRFQquote(RfqNum: Text; RfqPath: Text; vendor: Text; Purpose: Text) Msg: Text
    begin
        rfqHeader.Reset();
        rfqHeader.SetRange("No.", RfqNum);
        if rfqHeader.Find('-') then begin
            PurchaseHeader.Reset();
            PurchaseHeader.SetRange("Buy-from Vendor No.", vendor);
            PurchaseHeader.SetRange("Request for Quote No.", RfqNum);
            if PurchaseHeader.Find('-') then begin
                Msg := 'Failed';
            end else begin
                NextLeaveApplicationNo := NoSeriesMgt.GetNextNo('PRN', 0D, TRUE);
                PurchaseRN.INIT;
                PurchaseRN."No." := NextLeaveApplicationNo;
                PurchaseRN."Document Type" := PurchaseRN."Document Type"::Quote;
                PurchaseRN.DocApprovalType := PurchaseRN.DocApprovalType::Quote;
                //PurchaseRN.Department := DepartmentCode;
                PurchaseRN."Buy-from Vendor No." := vendor;
                PurchaseRN.Validate("Buy-from Vendor No.");
                PurchaseRN."Pay-to Vendor No." := vendor;
                PurchaseRN.Validate("Pay-to Vendor No.");
                PurchaseRN."Invoice Disc. Code" := 'DEPART';
                //PurchaseRN."Shortcut Dimension 1 Code" := BusinessCode;
                //PurchaseRN."Shortcut Dimension 2 Code" := DepartmentCode;
                //PurchaseRN."Responsibility Center" := ResponsibilityCentre;
                PurchaseRN."Assigned User ID" := UserID;
                PurchaseRN."Order Date" := TODAY;
                PurchaseRN."Due Date" := TODAY;
                PurchaseRN."Expected Receipt Date" := TODAY;
                PurchaseRN."Posting Description" := Purpose;
                PurchaseRN."No. Series" := 'PRN';
                PurchaseRN."Request for Quote No." := RfqNum;
                if PurchaseRN.INSERT(true, true) then
                    Msg := NextLeaveApplicationNo
                else
                    Msg := 'Failed';
            end;
        end else
            Msg := 'Failed';
    end;


    procedure CreateVendorRFQquoteLines(quoteNum: Text; rfqNum: Text; itemNum: Text; UnitsOfMeasure: Text; Quantityz: Decimal; estmatedUnitCost: Decimal; vendor: Text; Purpose: Text; DocumentType: Integer) Msg: Text
    begin
        //Create header first
        rfqHeader.Reset();
        rfqHeader.SetRange("No.", RfqNum);
        if rfqHeader.Find('-') then begin
            PurchaseHeader.Reset();
            PurchaseHeader.SetRange("Buy-from Vendor No.", vendor);
            PurchaseHeader.SetRange("Request for Quote No.", RfqNum);
            if not PurchaseHeader.Find('-') then begin
                NextLeaveApplicationNo := NoSeriesMgt.GetNextNo('P-QUO', 0D, TRUE);
                PurchaseRN.INIT;
                PurchaseRN."No." := NextLeaveApplicationNo;
                PurchaseRN."Document Type" := PurchaseRN."Document Type"::Quote;
                PurchaseRN.DocApprovalType := PurchaseRN.DocApprovalType::Quote;
                //PurchaseRN.Department := DepartmentCode;
                PurchaseRN."Buy-from Vendor No." := vendor;
                PurchaseRN.Validate("Buy-from Vendor No.");
                PurchaseRN."Pay-to Vendor No." := vendor;
                PurchaseRN.Validate("Pay-to Vendor No.");
                PurchaseRN."Invoice Disc. Code" := 'DEPART';
                //PurchaseRN."Shortcut Dimension 1 Code" := BusinessCode;
                //PurchaseRN."Shortcut Dimension 2 Code" := DepartmentCode;
                //PurchaseRN."Responsibility Center" := ResponsibilityCentre;
                PurchaseRN."Assigned User ID" := UserID;
                PurchaseRN."Order Date" := TODAY;
                PurchaseRN."Due Date" := TODAY;
                PurchaseRN."Expected Receipt Date" := TODAY;
                PurchaseRN."Posting Description" := Purpose;
                PurchaseRN."No. Series" := 'P-QUO';
                PurchaseRN."Request for Quote No." := RfqNum;
                if PurchaseRN.INSERT(true, true) then
                    Msg := NextLeaveApplicationNo
                else begin
                    Msg := 'Failed';
                    exit;
                end;
            end;



            //Create Lines -----------------------
            PurchaseLines.INIT;
            PurchaseLines."Document Type" := PurchaseLines."Document Type"::Quote;
            PurchaseLines.Type := PurchaseLines.Type::Item;
            if DocumentType = 1 then
                PurchaseLines.Type := PurchaseLines.Type::"G/L Account";
            if DocumentType = 2 then
                PurchaseLines.Type := PurchaseLines.Type::Item;
            if DocumentType = 3 then
                PurchaseLines.Type := PurchaseLines.Type::"Fixed Asset";
            if DocumentType = 4 then
                PurchaseLines.Type := PurchaseLines.Type::"Charge (Item)";
            PurchaseLines."Document No." := PurchaseHeader."No.";
            PurchaseLines."Request for Quote No." := rfqNum;
            PurchaseLines."Line No." := PurchaseLines.COUNT + 1;
            PurchaseLines."No." := itemNum;
            PurchaseLines.Validate("No.");
            //PurchaseLines."Location Code" := LocationID;
            PurchaseLines."Expected Receipt Date" := Today;
            //PurchaseLines.Description := FunctionDesc;
            PurchaseLines."Unit of Measure" := UnitsOfMeasure;
            PurchaseLines.Quantity := Quantityz;
            PurchaseLines.Amount := estmatedUnitCost;
            PurchaseLines."Amount Including VAT" := estmatedUnitCost;
            PurchaseLines."Line Amount" := estmatedUnitCost * Quantityz;
            PurchaseLines."Unit Cost" := estmatedUnitCost;
            PurchaseLines."Direct Unit Cost" := estmatedUnitCost;
            PurchaseLines."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
            PurchaseLines.Validate("Buy-from Vendor No.");
            PurchaseLines."Pay-to Vendor No." := PurchaseHeader."Pay-to Vendor No.";
            PurchaseLines.Validate("Pay-to Vendor No.");
            if PurchaseLines.INSERT(true, true) then
                Msg := 'SUCCESS' + '::' + PurchaseHeader."No."
            else
                Msg := 'FAIL';
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
            TrainingApplication."Global Dimension 1 Code" := department;
            TrainingApplication.Validate("Global Dimension 1 Code");
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

    procedure SalaryAdvanceCreate(Campusz: Code[30]; Departmentz: Code[30]; CampusName: Text; DeptName: Text; Rcentre: Code[30]; username: Code[30]; Reason: Text) LastNum: Text
    begin
        SalaryAdvanceHeader.INIT;
        NextClaimapplicationNo := NoSeriesMgt.GetNextNo('STAFFADV', 0D, TRUE);
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);

        IF HRMEmployeeD.FIND('-')
        THEN BEGIN
            SalaryAdvanceHeader."No." := NextClaimapplicationNo;
            SalaryAdvanceHeader.Date := TODAY;
            SalaryAdvanceHeader.Payee := HRMEmployeeD.FullName();
            SalaryAdvanceHeader."On Behalf Of" := HRMEmployeeD.FullName();
            SalaryAdvanceHeader.Posted := FALSE;
            SalaryAdvanceHeader."Global Dimension 1 Code" := Campusz;
            SalaryAdvanceHeader.Status := SalaryAdvanceHeader.Status::Pending;
            //SalaryAdvanceHeader."Payment Type" := SalaryAdvanceHeader."Payment Type"::Imprest;
            SalaryAdvanceHeader."Shortcut Dimension 2 Code" := Departmentz;
            SalaryAdvanceHeader."Function Name" := CampusName;
            SalaryAdvanceHeader."Budget Center Name" := DeptName;
            SalaryAdvanceHeader."No. Series" := 'STAFFADV';
            SalaryAdvanceHeader."Responsibility Center" := Rcentre;
            SalaryAdvanceHeader."Account No." := username;
            SalaryAdvanceHeader.Purpose := Reason;
            SalaryAdvanceHeader.Cashier := username;
            SalaryAdvanceHeader."Paying Bank Account" := HRMEmployeeD."Bank Account Number";
            SalaryAdvanceHeader."Pay Mode" := SalaryAdvanceHeader."Pay Mode"::EFT;
            SalaryAdvanceHeader.INSERT;
            LastNum := NextClaimapplicationNo;
        END;
    end;

    procedure InsertSalaryAdvanceLines(ReqNo: Code[20]; Atypes: Code[50]; AccNo: Code[50]; AccName: Code[50]; Amount: Decimal; UserId: Code[50]) rtnMsg: Text
    begin
        SalaryAdvanceHeader.Reset();
        SalaryAdvanceHeader.SetRange("No.", ReqNo);

        if SalaryAdvanceHeader.Find('-') then begin
            SalaryAdvanceLines.Init();
            SalaryAdvanceLines."Document No." := ReqNo;
            SalaryAdvanceLines."Advance Type" := Atypes;
            SalaryAdvanceLines."Shortcut Dimension 2 Code" := SalaryAdvanceHeader."Shortcut Dimension 2 Code";
            SalaryAdvanceLines."Account No." := AccNo;
            SalaryAdvanceLines."Account Name" := AccName;
            SalaryAdvanceLines.Amount := Amount;
            SalaryAdvanceLines."Due Date" := SalaryAdvanceHeader.Date;
            //SalaryAdvanceLines."Imprest Holder" := UserId;
            SalaryAdvanceLines."Global Dimension 1 Code" := SalaryAdvanceHeader."Global Dimension 1 Code";
            SalaryAdvanceLines.Purpose := SalaryAdvanceHeader.Purpose;
            SalaryAdvanceLines."Amount LCY" := Amount;

            SalaryAdvanceLines.Insert();

            rtnMsg := 'SUCCESS' + '::';
        end;
    end;

    procedure SalaryAdvanceApprovalRequest(ReqNo: Text)
    begin
        SalaryAdvanceHeader.Reset();
        SalaryAdvanceHeader.SETRANGE(SalaryAdvanceHeader."No.", ReqNo);
        IF SalaryAdvanceHeader.FIND('-')
        THEN BEGIN
            /* if ApprovalMgmtFin.IsAdvanceEnabled(SalaryAdvanceHeader) = true then
                ApprovalMgmtFin.OnSendAdvanceforApproval(SalaryAdvanceHeader)
            else
                Error('Worflow approval for %1 is not set', SalaryAdvanceHeader."Responsibility Center"); */
        END;
    end;

    procedure SalaryAdvanceRequisition(ReqNo: Text)
    begin
        SalaryAdvanceHeader.Reset();
        SalaryAdvanceHeader.SETRANGE(SalaryAdvanceHeader."No.", ReqNo);
        IF SalaryAdvanceHeader.FIND('-')
        THEN BEGIN
            // ApprovalMgmtFin.OnCancelStaffClaimForApproval(SalaryAdvanceHeader);
        END;
    end;

    procedure getPRHeaderDetails(PRNum: Text) Msg: Text
    begin
        PurchaseRN.Reset();
        PurchaseRN.SetRange("No.", PRNum);
        if PurchaseRN.Find('-') then begin
            Msg := PurchaseRN."Shortcut Dimension 1 Code" +
            '::' + PurchaseRN."Shortcut Dimension 2 Code" +
            '::' + PurchaseRN."Shortcut Dimension  3" +
            '::' + PurchaseRN."Project Code" +
            '::' + PurchaseRN."Responsibility Center" +
            '::' + PurchaseRN."Posting Description" +
            '::' + FORMAT(PurchaseRN."Requested Receipt Date");
        end;
    end;

    procedure PurchaseHeaderUpdate(Depart: Text; Activity: Text; Division: Text; ResponsibilityCentre: Code[10]; UserIDs: Text; Purpose: Text; reqdate: Date; num: Text) Msg: Text
    begin
        PurchaseRN.Reset();
        PurchaseRN.SetRange("No.", num);
        if PurchaseRN.Find('-') then begin
            PurchaseRN."Document Type" := PurchaseRN."Document Type"::Quote;
            PurchaseRN.DocApprovalType := PurchaseRN.DocApprovalType::Requisition;
            PurchaseRN."Responsibility Center" := ResponsibilityCentre;
            PurchaseRN."Shortcut Dimension 1 Code" := Depart;
            PurchaseRN."Shortcut Dimension 2 Code" := Activity;
            PurchaseRN."Shortcut Dimension  3" := Division;
            PurchaseRN."Assigned User ID" := UserIDs;
            //PurchaseRN."Assign Staff" := UserIDs;
            PurchaseRN.Department := Depart;
            PurchaseRN."Buy-from Vendor No." := 'DEPART1';
            //PurchaseRN.Validate("Buy-from Vendor No.");
            PurchaseRN."Pay-to Vendor No." := 'DEPART1';
            PurchaseRN."Invoice Disc. Code" := 'DEPART1';
            PurchaseRN."Order Date" := TODAY();
            PurchaseRN."Due Date" := TODAY();
            PurchaseRN."Document Date" := TODAY();
            PurchaseRN."Expected Receipt Date" := TODAY();
            PurchaseRN."Posting Description" := Purpose;
            PurchaseRN."Requested Receipt Date" := reqdate;
            //PurchaseRN."Project Code"
            PurchaseRN.Modify();
            Msg := NextLeaveApplicationNo;
        end
    end;

    procedure PurchaseHeaderCreate(Depart: Text; Activity: Text; Division: Text; ResponsibilityCentre: Code[10]; UserIDs: Text; Purpose: Text; reqdate: Date; num: Text) Msg: Text
    begin
        PurchPaySetup.Reset();
        PurchPaySetup.FindLast();
        NextLeaveApplicationNo := NoSeriesMgt.GetNextNo(PurchPaySetup."Internal Requisition No.", 0D, TRUE);
        //NextLeaveApplicationNo := NoSeriesMgt.GetNextNo('PURCHREQ', 0D, TRUE);

        PurchaseRN.INIT;
        PurchaseRN."No." := NextLeaveApplicationNo;
        PurchaseRN."No. Series" := PurchPaySetup."Internal Requisition No.";
        PurchaseRN."Document Type" := PurchaseRN."Document Type"::Quote;
        PurchaseRN.DocApprovalType := PurchaseRN.DocApprovalType::Requisition;
        PurchaseRN."Responsibility Center" := ResponsibilityCentre;
        PurchaseRN."Shortcut Dimension 1 Code" := Depart;
        PurchaseRN."Shortcut Dimension 2 Code" := Activity;
        PurchaseRN."Shortcut Dimension  3" := Division;
        PurchaseRN."Assigned User ID" := UserIDs;
        PurchaseRN.Status := PurchaseRN.Status::Open;
        //PurchaseRN."Assign Staff" := UserIDs;
        PurchaseRN.Department := Depart;
        PurchaseRN."Pay-to Name" := 'DEPART';
        PurchaseRN.Validate("Pay-to Name");
        //PurchaseRN."Buy-from Vendor No." := 'DEPART';
        //PurchaseRN.Validate("Buy-from Vendor No.");
        //PurchaseRN."Pay-to Vendor No." := 'DEPART';
        //PurchaseRN.Validate("Pay-to Vendor No.");
        PurchaseRN."Invoice Disc. Code" := 'DEPART';
        PurchaseRN."Order Date" := TODAY();
        PurchaseRN."Due Date" := TODAY();
        PurchaseRN."Document Date" := TODAY();
        PurchaseRN."Expected Receipt Date" := TODAY();
        PurchaseRN."Posting Description" := Purpose;
        PurchaseRN."Requested Receipt Date" := reqdate;

        PurchaseRN.INSERT();
        Msg := NextLeaveApplicationNo;

    end;

    procedure SubmitPurchaseLine(DocumentType: Integer; DocumentNo: Text; FunctionNo: Code[50]; LocationID: Text; ExpectedDate: Date; FunctionDesc: Text; UnitsOfMeasure: Text; Quantityz: Decimal; amount: Decimal; Budgetline: Text; CostCenter: Text) Msg: Text
    var
        //WACT: Record "Workplan Activities";
        MyInteger: integer;
    begin
        PurchaseRN.Reset();
        PurchaseRN.SetRange("No.", DocumentNo);
        if PurchaseRN.Find('-') then begin
            PurchaseLines.INIT;
            PurchaseLines."Document Type" := PurchaseLines."Document Type"::Quote;
            PurchaseLines."Document No." := DocumentNo;
            PurchaseLines."Line No." := PurchaseLines.COUNT + 1;

            PurchaseLines."Shortcut Dimension 1 Code" := CostCenter;//dept
            PurchaseLines."Shortcut Dimension 2 Code" := Budgetline;//activity
            PurchaseLines.Validate("Shortcut Dimension 1 Code");
            PurchaseLines.Validate("Shortcut Dimension 2 Code");

            PurchaseLines."Location Code" := LocationID;
            PurchaseLines."Expected Receipt Date" := ExpectedDate;
            PurchaseLines.Description := FunctionDesc;
            PurchaseLines."Unit of Measure" := UnitsOfMeasure;
            PurchaseLines.Quantity := Quantityz;
            PurchaseLines."Line Amount" := Quantityz * amount;
            PurchaseLines."Outstanding Amt. Ex. VAT (LCY)" := Quantityz * amount;
            PurchaseLines.Validate("Outstanding Amt. Ex. VAT (LCY)");
            //PurchaseLines."Procurement Plan Code" := '2022-2023';
            //PurchaseLines."VAT Calculation Type" := PurchaseLines."VAT Calculation Type"::"Normal VAT";

            //PurchaseLines."Direct Unit Cost" := amount;
            PurchaseLines."Direct Unit Cost" := amount;
            PurchaseLines."No." := FunctionNo;
            if DocumentType = 1 then
                PurchaseLines.Type := PurchaseLines.Type::"G/L Account";
            if DocumentType = 2 then
                PurchaseLines.Type := PurchaseLines.Type::Item;
            if DocumentType = 3 then
                PurchaseLines.Type := PurchaseLines.Type::"Fixed Asset";
            if DocumentType = 4 then
                PurchaseLines.Type := PurchaseLines.Type::"Charge (Item)";

            if PurchaseLines.INSERT = false then
                exit('Unable to insert');
        end else
            exit('Could not find your application, please try again later');
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
    begin
        PurchaseRN.Reset();
        PurchaseRN.SETRANGE(PurchaseRN."No.", ReqNo);
        IF PurchaseRN.FIND('-')
        THEN BEGIN
            //ApprovalMgmtFin.OnSendPurchQuoteforApproval(PurchaseRN);
            ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseRN);
        END else
            Msg := 'Fail';
    end;

    procedure CancelPrnApprovalRequest(ReqNo: Text)
    begin
        PurchaseRN.Reset();
        PurchaseRN.SETRANGE(PurchaseRN."No.", ReqNo);
        IF PurchaseRN.FIND('-')
        THEN BEGIN
            //  ApprovalMgmtExt.OnCancelPurchaseRequisitionForApproval(PurchaseRN);
            ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseRN);
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

    procedure RemoveClaimReqLine(ReqNo: Code[20]; AdvanceType: Code[20])
    begin
        ClaimReqLines.Reset();
        ClaimReqLines.SETRANGE(ClaimReqLines."Document No.", ReqNo);
        ClaimReqLines.SETRANGE(ClaimReqLines."Advance Type", AdvanceType);
        IF ClaimReqLines.FIND('-') THEN BEGIN
            ClaimReqLines.DELETE;
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

    procedure RemoveSalaryAdvanceLine(ReqNo: Code[20]; AdvanceType: Code[20])
    begin
        SalaryAdvanceLines.Reset();
        SalaryAdvanceLines.SETRANGE(SalaryAdvanceLines."Document No.", ReqNo);
        SalaryAdvanceLines.SETRANGE(SalaryAdvanceLines."Advance Type", AdvanceType);
        IF SalaryAdvanceLines.FIND('-') THEN BEGIN
            SalaryAdvanceLines.DELETE;
            MESSAGE('Line Deleted Successfully');
        END;
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

    procedure ClaimRequisitionCreate(Departmentz: Text; Division: Text; rCenter: Text; Activity: Text; username: Code[30]; purpose: Text; ActDate: Date; ReqNum: Text) LastNum: Text
    begin
        ClaimRequisition.Reset();
        ClaimRequisition.SetRange("No.", ReqNum);
        if not ClaimRequisition.Find('-') then begin
            ClaimRequisition.INIT;
            CashOfficeSetup.Reset();
            CashOfficeSetup.FindLast();

            NextClaimapplicationNo := NoSeriesMgt.GetNextNo('CLAIM', 0D, TRUE);
            HRMEmployeeD.Reset();
            HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);

            IF HRMEmployeeD.FIND('-')
            THEN BEGIN
                ClaimRequisition."No." := NextClaimapplicationNo;
                ClaimRequisition.Date := TODAY;
                ClaimRequisition.Payee := HRMEmployeeD.FullName();
                ClaimRequisition."On Behalf Of" := HRMEmployeeD.FullName();
                ClaimRequisition.Posted := FALSE;

                ClaimRequisition."Global Dimension 1 Code" := Departmentz;
                ClaimRequisition.Validate("Global Dimension 1 Code");
                ClaimRequisition."Shortcut Dimension 2 Code" := Activity;
                ClaimRequisition.Validate("Shortcut Dimension 2 Code");
                ClaimRequisition."Shortcut Dimension 3 Code" := Division;
                ClaimRequisition.Validate("Shortcut Dimension 3 Code");
                ClaimRequisition."Responsibility Center" := rCenter;
                ClaimRequisition.Purpose := purpose;
                ClaimRequisition.Date := Today;

                ClaimRequisition.Status := ClaimRequisition.Status::Pending;
                ClaimRequisition."Payment Type" := ClaimRequisition."Payment Type"::Imprest;
                /* ClaimRequisition."Function Name" := CampusName;
                ClaimRequisition."Budget Center Name" := DeptName; */
                ClaimRequisition."No. Series" := CashOfficeSetup."Staff Claim No";
                ClaimRequisition."Account No." := username;
                ClaimRequisition.Cashier := username;
                ClaimRequisition.INSERT;
                LastNum := NextClaimapplicationNo;
            END;
        end else begin
            //ClaimRequisition.Date := TODAY;
            //ClaimRequisition.Payee := HRMEmployeeD.FullName();
            //ClaimRequisition."On Behalf Of" := HRMEmployeeD.FullName();
            //ClaimRequisition.Posted := FALSE;

            ClaimRequisition."Global Dimension 1 Code" := Departmentz;
            ClaimRequisition.Validate("Global Dimension 1 Code");
            ClaimRequisition."Shortcut Dimension 2 Code" := Activity;
            ClaimRequisition.Validate("Shortcut Dimension 2 Code");
            ClaimRequisition."Shortcut Dimension 3 Code" := Division;
            ClaimRequisition.Validate("Shortcut Dimension 3 Code");
            ClaimRequisition."Responsibility Center" := rCenter;

            ClaimRequisition."Account No." := username;
            ClaimRequisition.Purpose := purpose;
            ClaimRequisition.Cashier := username;
            ClaimRequisition.Modify();
            LastNum := ReqNum;
        end;
    end;

    procedure ClaimRequisitionApprovalRequest(ReqNo: Text) Msg: Text
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        FINBudgetEntries: Record "FIN-Budget Entries";
    begin
        ClaimRequisition.Reset();
        ClaimRequisition.SETRANGE(ClaimRequisition."No.", ReqNo);
        IF ClaimRequisition.FIND('-')
        THEN BEGIN


            if ApprovalMgmtFin.IsClaimsEnabled(ClaimRequisition) = false then begin
                Msg := 'Approval workflow not enabled';
                exit;
            end;


            /* Msg := CommitBudgetClaim(ReqNo);
            if Msg <> '' then exit; */








            IF LinesExistsClaim(ReqNo) = False THEN begin
                Msg := 'There are no Lines created for this Document';
                exit;
            end;

            IF AllFieldsEnteredClaim(ReqNo) = False THEN begin
                Msg := 'Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT] Have not been Entered please RECHECK your entries';
                exit;
            end;

            //Ensure No Items That should be committed that are not
            //IF LinesCommitmentStatus THEN
            // ERROR('There are some lines that have not been committed');

            ApprovalMgmtFin.OnSendClaimforApproval(ClaimRequisition);
            //ApprovalMgmtFin.OnSendClaimforApproval(ClaimRequisition);
        END;
    end;

    procedure AllFieldsEnteredClaim(DocNum: Text): Boolean
    var
        PayLines: Record "FIN-Staff Claim Lines";
        AllKeyFieldsEntered: Boolean;
    begin
        AllKeyFieldsEntered := TRUE;
        PayLines.RESET;
        PayLines.SETRANGE(PayLines."Document No.", DocNum);
        IF PayLines.FIND('-') THEN BEGIN
            REPEAT
                IF (PayLines."Account No." = '') OR (PayLines.Amount <= 0) THEN
                    AllKeyFieldsEntered := FALSE;
            UNTIL PayLines.NEXT = 0;
            EXIT(AllKeyFieldsEntered);
        END;
    end;

    procedure LinesExistsClaim(DocNum: Text): Boolean
    var
        PayLines: Record "FIN-Staff Claim Lines";
        HasLines: Boolean;
    begin
        HasLines := FALSE;
        PayLines.RESET;
        PayLines.SETRANGE(PayLines."Document No.", DocNum);
        IF PayLines.FIND('-') THEN BEGIN
            HasLines := TRUE;
            EXIT(HasLines);
        END;
    end;

    local procedure CommitBudgetClaim(DocNum: Text) Msg: Text
    var

    begin

    end;

    procedure CancelClaimRequisition(ReqNo: Text)
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        FINStaffClaimLines: Record "FIN-Staff Claim Lines";
        Commitments: Record "FIN-Committment";
    begin
        ClaimRequisition.Reset();
        ClaimRequisition.SETRANGE(ClaimRequisition."No.", ReqNo);
        IF ClaimRequisition.FIND('-')
        THEN BEGIN
            //Cancel Budget Commitment
            BCSetup.GET;
            IF NOT ((BCSetup.Mandatory) AND (BCSetup."Claims Budget mandatory")) THEN EXIT;
            BCSetup.TESTFIELD("Current Budget Code");
            ClaimRequisition.TESTFIELD("Shortcut Dimension 2 Code");
            //Get Current Lines to loop through
            FINStaffClaimLines.RESET;
            FINStaffClaimLines.SETRANGE("Document No.", ClaimRequisition."No.");
            IF FINStaffClaimLines.FIND('-') THEN BEGIN
                REPEAT
                BEGIN
                    // Expense Budget Here
                    FINStaffClaimLines.TESTFIELD("Account No.");
                    GLAccount.RESET;
                    GLAccount.SETRANGE("No.", FINStaffClaimLines."Account No.");
                    IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                    DimensionValue.RESET;
                    DimensionValue.SETRANGE(Code, ClaimRequisition."Shortcut Dimension 2 Code");
                    DimensionValue.SETRANGE("Global Dimension No.", 2);
                    IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                    IF (FINStaffClaimLines.Amount > 0) THEN BEGIN
                        // Commit Budget Here
                        PostBudgetEnties.CancelBudgetCommitment(FINStaffClaimLines."Account No.", ClaimRequisition.Date, ClaimRequisition."Global Dimension 1 Code",
                        ClaimRequisition."Shortcut Dimension 2 Code", ClaimRequisition."Shortcut Dimension 3 Code",
                        FINStaffClaimLines.Amount, FINStaffClaimLines."Account Name", USERID, 'CLAIM',
                        ClaimRequisition."No." + FINStaffClaimLines."Account No." + '-' + Format(FINStaffClaimLines."Line No."), ClaimRequisition.Purpose);
                    END;
                END;
                UNTIL FINStaffClaimLines.NEXT = 0;

                Commitments.RESET;
                Commitments.SETRANGE(Commitments."Document Type", Commitments."Document Type"::StaffClaim);
                Commitments.SETRANGE(Commitments."Document No.", ClaimRequisition."No.");
                Commitments.DELETEALL;

                FINStaffClaimLines.RESET;
                FINStaffClaimLines.SETRANGE(FINStaffClaimLines."Document No.", ClaimRequisition."No.");
                IF FINStaffClaimLines.FIND('-') THEN BEGIN
                    REPEAT
                        FINStaffClaimLines.Committed := FALSE;
                        FINStaffClaimLines.MODIFY;
                    UNTIL FINStaffClaimLines.NEXT = 0;
                END;
            END;





            ApprovalMgmtFin.OnCancelClaimForApproval(ClaimRequisition);
        END;
    end;

    procedure StoreRequisitionApprovalRequest(ReqNo: Text)
    begin
        StoreRequisition.Reset();
        StoreRequisition.SETRANGE(StoreRequisition."No.", ReqNo);
        IF StoreRequisition.FIND('-')
        THEN BEGIN
            if ApprovalMgmtFin.IsSRNEnabled(StoreRequisition) then
                ApprovalMgmtFin.OnSendSRNforApproval(StoreRequisition)
            else
                Error('Approval setup not configured');
        END;
    end;

    procedure CancelStoreRequisition(ReqNo: Text)
    begin
        StoreRequisition.Reset();
        StoreRequisition.SETRANGE(StoreRequisition."No.", ReqNo);
        IF StoreRequisition.FIND('-')
        THEN BEGIN
            ApprovalMgmtFin.OnCancelSRNforApproval(StoreRequisition);
        END;
    end;

    procedure EnterpriseRequisitionCreate(userName: Text; usersID: Text; RequiredDate: Date; Purpose: Text; CostCenterCode: Text; BudgetLine: Text; CostCenterName: Text; BudgetLine2: Text; ReqType: Integer; Rcentre: Text) Msg: Text
    begin
        CLEAR(NextOderNo);
        IF Customer.GET('DEPART') THEN BEGIN
            NextOderNo := NoSeriesMgt.GetNextNo('SALES ORD', 0D, TRUE);
            SalesHeader.INIT;
            SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
            SalesHeader."No." := NextOderNo;
            SalesHeader."Sell-to Customer No." := 'DEPART';
            SalesHeader.VALIDATE(SalesHeader."Sell-to Customer No.");
            SalesHeader."Bill-to Customer No." := 'DEPART';
            SalesHeader.VALIDATE(SalesHeader."Bill-to Customer No.");
            SalesHeader."Document Date" := TODAY;
            SalesHeader."Posting Date" := TODAY;
            SalesHeader."Shortcut Dimension 1 Code" := BudgetLine;
            SalesHeader."Shortcut Dimension 2 Code" := CostCenterCode;
            SalesHeader."Responsibility Center" := Rcentre;
            SalesHeader."Assigned User ID" := username;
            SalesHeader."Posting Description" := COPYSTR('Enterprise sales-' + SalesHeader."Sell-to Customer Name", 1, 50);
            SalesHeader."Order Date" := TODAY;
            SalesHeader."Due Date" := TODAY;
            //SalesHeader."Location Code":='HOTEL';
            //SalesHeader.VALIDATE("Location Code");
            SalesHeader.INSERT(TRUE);
            Msg := SalesHeader."No.";

        END;
    end;

    procedure EnterpriseReqLines(ReqNo: Code[30]; ItemNo: Code[30]; AType: Integer; ItemDesc: Text; Amount: Decimal; LineAmount: Decimal; Qty: Decimal; UnitOfMsre: Code[10]; IStore: Code[30]) rtnMsg: Text
    var
        linenum: Integer;
    begin
        SalesLine.Reset();
        linenum := SalesLine.Count();
        SalesHeader.Reset();
        SalesHeader.SetRange("No.", ReqNo);
        if SalesHeader.FindLast() then begin
            SalesLine."Document No." := ReqNo;
            SalesLine."Document Type" := SalesLine."Document Type"::Order;
            SalesLine."Line No." := linenum + 10;
            //SalesLine.Validate("Document No.");
            SalesLine."No." := ItemNo;
            SalesLine.Type := SalesLine.Type::Item;
            SalesLine.Description := ItemDesc;
            SalesLine."Unit Cost" := Amount;
            SalesLine."Line Amount" := LineAmount;
            SalesLine.Quantity := Qty;
            SalesLine.Validate(Quantity);
            SalesLine."Line Amount" := LineAmount * Qty;
            SalesLine."Unit of Measure" := UnitOfMsre;
            SalesLine."Location Code" := IStore;
            SalesLine.Insert();

            rtnMsg := 'SUCCESS' + '::';
        end;
    end;

    procedure StoresRequisitionCreate(EmployeeNo: Text; UserID: Text; RequiredDate: Date; Purpose: Text; Department: Code[20]; activity: Code[20]; division: Text[250]; ReqType: Integer; ResponsibilityCentre: Code[10]) LastNum: Text
    begin
        StoreRequisition.INIT;
        PurchPaySetup.Reset();
        PurchPaySetup.FindLast();
        NextStoreqNo := NoSeriesMgt.GetNextNo(PurchPaySetup."Stores Requisition No", 0D, TRUE);
        //NextStoreqNo := NoSeriesMgt.GetNextNo('STOREREQ', TODAY, TRUE);
        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", EmployeeNo);

        IF HRMEmployeeD.FIND('-')
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
            StoreRequisition."No. Series" := PurchPaySetup."Stores Requisition No";
            StoreRequisition.Status := StoreRequisition.Status::Open;
            StoreRequisition."Global Dimension 1 Code" := Department;
            StoreRequisition.Validate("Global Dimension 1 Code");
            StoreRequisition."Shortcut Dimension 2 Code" := activity;
            StoreRequisition.Validate("Shortcut Dimension 2 Code");
            StoreRequisition."Shortcut Dimension 3 Code" := division;
            StoreRequisition.Validate("Shortcut Dimension 3 Code");
            //StoreRequisition."Function Name" := CampusName;
            // StoreRequisition."Budget Center Name" := DepartmentName;
            StoreRequisition."Responsibility Center" := ResponsibilityCentre;
            StoreRequisition."Requisition Type" := ReqType;
            StoreRequisition."Store Requisition Type" := StoreRequisition."Store Requisition Type"::Item;

            StoreRequisition.INSERT;
            LastNum := NextStoreqNo;
        end
    end;

    procedure InsertStoreRequisitionLines(ReqNo: Code[30]; ItemNo: Code[30]; AType: Integer; ItemDesc: Text; Amount: Decimal; LineAmount: Decimal; Qty: Decimal; UnitOfMsre: Code[10]; IStore: Code[30]) rtnMsg: Text
    begin
        StoreReqLines.Reset();
        StoreRequisition.Reset();
        StoreRequisition.SetRange("No.", ReqNo);
        if StoreRequisition.Find('-') then begin
            StoreReqLines."Requistion No" := ReqNo;
            StoreReqLines.Validate("Requistion No");
            StoreReqLines."No." := ItemNo;
            if AType = 0 then
                StoreReqLines.Type := StoreReqLines.Type::Item
            else
                StoreReqLines.Type := StoreReqLines.Type::"Minor Asset";
            StoreReqLines.Description := ItemDesc;
            StoreReqLines."Unit Cost" := Amount;
            StoreReqLines."Line Amount" := LineAmount;
            StoreReqLines.Quantity := Qty;
            StoreReqLines."Quantity Requested" := Qty;
            StoreReqLines."Quantity To Issue" := Qty;
            StoreReqLines."Unit of Measure" := UnitOfMsre;
            StoreReqLines."Issuing Store" := IStore;
            StoreReqLines."Shortcut Dimension 1 Code" := StoreRequisition."Global Dimension 1 Code";
            StoreReqLines."Shortcut Dimension 2 Code" := StoreRequisition."Shortcut Dimension 2 Code";
            StoreReqLines."Shortcut Dimension 3 Code" := StoreRequisition."Shortcut Dimension 3 Code";
            StoreReqLines.Insert();

            rtnMsg := 'SUCCESS' + '::';
        end
    end;

    procedure ImprestRequisitionApprovalRequest(ReqNo: Text) Msg: Text
    begin
        ImprestRequisition.Reset();
        ImprestRequisition.SETRANGE(ImprestRequisition."No.", ReqNo);
        IF ImprestRequisition.FIND('-')
        THEN BEGIN
            ApprovalMgmtFin.OnSendImprestForApproval(ImprestRequisition);

        END;
    end;

    procedure LinesCommitmentStatus(DocNum: Text): Boolean
    var
        BCsetup: Record "FIN-Budgetary Control Setup";
        PayLine: Record "FIN-Imprest Lines";
        Exists: Boolean;
    begin
        IF BCsetup.GET() THEN BEGIN
            IF NOT BCsetup.Mandatory THEN BEGIN
                Exists := FALSE;
                EXIT(Exists);
            END;
        END ELSE BEGIN
            Exists := FALSE;
            EXIT(Exists);
        END;
        Exists := FALSE;
        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, DocNum);
        PayLine.SETRANGE(PayLine.Committed, FALSE);
        PayLine.SETRANGE(PayLine."Budgetary Control A/C", TRUE);
        IF PayLine.FIND('-') THEN
            Exists := TRUE;
        exit(Exists);
    end;

    Procedure ImprestRequisitionEdit(ImpNo: Code[30]; Currency: Code[30]; Payee: Text; Campus: Code[10]; Dept: Code[10]; CampusName: Text; DeptName: Text; RecCenter: Code[30]; AccType: enum "Gen. Journal Account Type"; UserID: Code[30]; UserName: Text; Reason: Text) Message: Text
    begin
        ImprestRequisition.INIT;
        ImprestRequisition."No." := ImpNo;
        ImprestRequisition.Date := TODAY;
        ImprestRequisition."Account No." := UserID;
        ImprestRequisition.Payee := Payee;
        ImprestRequisition.Cashier := UserName;
        //ImprestRequisition.Currency:=Currency;
        ImprestRequisition.Payee := Payee;
        ImprestRequisition."On behalf of" := Payee;
        ImprestRequisition."No. Series" := 'IMPREST';
        ImprestRequisition.Status := ImprestRequisition.Status::Pending;
        ImprestRequisition."Global Dimension 1 Code" := Campus;
        ImprestRequisition."Shortcut Dimension 2 Code" := Dept;
        //ImprestRequisition."Responsibility Center":=CampusName;
        //ImprestRequisition."User Department":=DeptName;
        ImprestRequisition."Responsibility Center" := RecCenter;
        ImprestRequisition."Account Type" := AccType;
        //ImprestRequisition.r:=Reason;

        ImprestRequisition.MODIFY;
    end;

    Procedure GetImprestHeaderDetailss(ReqNo: Text) Message: Text
    begin
        ImprestRequisition.RESET;
        ImprestRequisition.SETRANGE(ImprestRequisition."No.", ReqNo);
        IF ImprestRequisition.FIND('-') THEN BEGIN
            Message := ImprestRequisition."No." + '::' + ImprestRequisition."Responsibility Center" + '::' +
          FORMAT(ImprestRequisition.Date);
        END
    end;

    Procedure GetLeaveApplicationDetails(ReqNo: Text) Message: Text
    begin
        LeaveT.RESET;
        LeaveT.SETRANGE(LeaveT."No.", ReqNo);
        IF LeaveT.FIND('-') THEN BEGIN
            Message := LeaveT."Leave Type" + '::' + LeaveT."Reliever Name" + '::' + LeaveT."Responsibility Center" + '::' +
          FORMAT(LeaveT."Applied Days") + '::' + FORMAT(LeaveT."Leave Balance") + '::' + FORMAT(LeaveT."Starting Date") + '::' + FORMAT(LeaveT."End Date") + '::' + FORMAT(LeaveT."Return Date");

        END
    end;

    Procedure SubmitbacktoOffice(LeaveNo: Code[10]; empno: Code[20]; empname: Text[100]; leavedate: Date; applieddays: Integer; startingdate: Date; enddate: Date; purpose: Text; leavetype: Code[20]; returndate: Date; userid: Code[30]; relieverno: Code[30]; relievername: Text[250]; shortcutdim3: Code[20]) Message: Text
    begin
        back2office.RESET;
        //back2office.SETRANGE(back2office."No.", LeaveNo);
        //if back2office.FIND('-') THEN BEGIN
        NextJobapplicationNo := NoSeriesMgt.GetNextNo('BAO', 0D, TRUE);
        back2office.RESET;
        //back2office.GET(LeaveNo);
        back2office."No." := NextJobapplicationNo;
        back2office."Employee No" := empno;
        back2office."Employee Name" := empname;
        back2office."Leave No" := LeaveNo;
        back2office."Date" := TODAY;
        back2office."Applied Days" := applieddays;
        back2office."Starting Date" := startingdate;
        back2office."End Date" := enddate;
        back2office."Return Date" := returndate;
        back2office."Shortcut Dimension 3 Code" := shortcutdim3;
        //back2office."Department Code" := LeaveT."Department Code";
        back2office."Leave Type" := leavetype;
        //back2office."Leave Balance" := LeaveT."Leave Balance";
        back2office."Reliever No." := relieverno;
        back2office."Reliever Name" := relievername;
        back2office.INSERT;

        //send for approval
        /*
        back2office.RESET;
        back2office.SETRANGE("No.", NextJobapplicationNo);
        IF back2office.FIND('-') THEN BEGIN
        ApprovalMgmtHr.OnSendBackOfficeTxtforApproval(VAR BackOfficeTxt: Record "HRM-Back To Office Form");
        END
        Message := NextJobapplicationNo;*/
    end;

    Procedure Back2officedetails(DocumentNo: Text; Actual: Date; returndt: Date; LeaveNo: Text) Message: Text
    begin
        back2office.RESET;
        back2office.SETRANGE(back2office."No.", LeaveNo);
        if back2office.FIND('-') THEN BEGIN
            //NextJobapplicationNo := NoSeriesMgt.GetNextNo('L_RELIEVER', 0D, TRUE);
            back2office.RESET;
            back2office.INIT;

            back2office."No." := NextJobapplicationNo;
            back2office."Employee No" := LeaveT."Employee No";
            back2office."Employee Name" := LeaveT."Employee Name";
            back2office."Leave No" := LeaveT."No.";
            back2office."Date" := returndt;
            back2office."Applied Days" := LeaveT."Applied Days";
            back2office."Starting Date" := LeaveT."Starting Date";
            back2office."End Date" := LeaveT."End Date";
            //back2office."Campus Code" := LeaveT."Campus Code";
            //back2office."Department Code" := LeaveT."Department Code";
            back2office."Leave Type" := LeaveT."Leave Type";
            back2office."Return Date" := Actual;
            back2office."Leave Balance" := LeaveT."Leave Balance";
            back2office.INSERT
            //THEN;
            // Message := NextJobapplicationNo;
            //END ELSE BEGIN
            //Message := back2office."No.";
        END

    end;

    procedure GetLeaveDetails(LeaveNo: Code[20]) ReturnMsg: Text;
    begin
        LeaveT.Reset();
        LeaveT.SetRange(LeaveT."No.", LeaveNo);

        if (LeaveT.Find('-')) then begin
            ReturnMsg := LeaveT."Employee No" + ':' + LeaveT."Employee Name" + ':' + FORMAT(LeaveT."Date") + ':' + FORMAT(LeaveT."Applied Days") + ':' + FORMAT(LeaveT."Starting Date") + ':' + FORMAT(LeaveT."End Date") + ':' + LeaveT."Purpose" + ':' + LeaveT."Leave Type" + ':' + FORMAT(LeaveT."Return Date") + ':' + LeaveT."User ID" + ':' + LeaveT."Reliever No." + ':' + LeaveT."Reliever Name";
        end else begin
            ReturnMsg := 'Leave Does Not Exist' + '::';
        end

    end;

    Procedure EditHRLeaveApplication(ReqNo: Text; EmployeeNo: Text; LeaveType: Text; AppliedDays: Decimal; StartDate: Date; EndDate: Date; ReturnDate: Date; SenderComments: Text; Reliever: Text; RelieverName: Text; rCentre: Code[30]; user: Text) successMessage: Text
    begin
        LeaveT.INIT;
        HRSetup.GET;
        NextLeaveApplicationNo := NoSeriesMgt.GetNextNo('LEAVE CODE', 0D, TRUE);
        EmployeeCard.Reset();
        EmployeeCard.SETRANGE(EmployeeCard."No.", EmployeeNo);

        IF EmployeeCard.FIND('-')
        THEN BEGIN

            LeaveT."User ID" := EmployeeCard."User ID";
            EmployeeUserId := EmployeeCard."User ID";
            LeaveT."Employee No" := EmployeeNo;
            LeaveT."Employee Name" := EmployeeCard.FullName;
            /*SupervisorCard.Reset();
            SupervisorCard.SETRANGE(SupervisorCard."User ID", EmployeeCard."User ID");
            IF SupervisorCard.FIND('-')
            THEN BEGIN
                SupervisorId := SupervisorCard."Approver ID";
            END;*/
        END;
        LeaveT."Reliever No." := Reliever;
        LeaveT."Reliever Name" := RelieverName;
        LeaveT."No." := NextLeaveApplicationNo;
        LeaveT."Leave Type" := LeaveType;
        LeaveT.VALIDATE("Leave Type");
        LeaveT."Applied Days" := AppliedDays;
        LeaveT.Date := TODAY;
        LeaveT."Starting Date" := StartDate;
        LeaveT."End Date" := EndDate;
        LeaveT."Return Date" := ReturnDate;
        LeaveT.Purpose := SenderComments;
        LeaveT."No. Series" := 'LEAVE';
        LeaveT.Status := HRLeave.Status::Open;
        LeaveT."Responsibility Center" := rCentre;
        //LeaveT."Department Code" := department;
        LeaveT."User ID" := UserID;
        LeaveT."Employee Name" := EmployeeNo;
        LeaveT."Employee Name" := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";

        LeaveT.MODIFY;
        //send request for approval
        LeaveT.Reset();
        LeaveT.SETRANGE(LeaveT."No.", NextLeaveApplicationNo);
        IF LeaveT.FIND('-')
        THEN BEGIN
            ApprovalMgmtHr.IsLeaveEnabled(LeaveT);
            ApprovalMgmtHr.OnSendLeaveforApproval(LeaveT);
        END;
    end;

    procedure AllFieldsEntered(DocNum: Text): Boolean
    var
        PayLines: Record "FIN-Imprest Lines";
        AllKeyFieldsEntered: Boolean;
    begin
        AllKeyFieldsEntered := TRUE;
        PayLines.RESET;
        PayLines.SETRANGE(PayLines.No, DocNum);
        IF PayLines.FIND('-') THEN BEGIN
            REPEAT
                IF (PayLines."Account No." = '') OR (PayLines.Amount <= 0) THEN
                    AllKeyFieldsEntered := FALSE;
            UNTIL PayLines.NEXT = 0;
            EXIT(AllKeyFieldsEntered);
        END;
    end;

    local procedure CommitBudget(DocNum: Text) Msg: Text
    var

    begin

    end;

    procedure LinesExists(DocNum: Text): Boolean
    var
        PayLines: Record "FIN-Imprest Lines";
        HasLines: Boolean;
    begin
        HasLines := FALSE;
        PayLines.RESET;
        PayLines.SETRANGE(PayLines.No, DocNum);
        IF PayLines.FIND('-') THEN BEGIN
            HasLines := TRUE;
            EXIT(HasLines);
        END;
    end;

    procedure onCancelIprestApproval(ReqNo: Text) Msg: Text
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        FINImprestLines: Record "FIN-Imprest Lines";
    begin
        ImprestRequisition.Reset();
        ImprestRequisition.SETRANGE(ImprestRequisition."No.", ReqNo);
        IF ImprestRequisition.FIND('-')
        THEN BEGIN
            //CANCEL COMMITMENT
            BCSetup.GET;
            IF NOT ((BCSetup.Mandatory) AND (BCSetup."Imprest Budget mandatory")) THEN EXIT;
            BCSetup.TESTFIELD("Current Budget Code");
            ImprestRequisition.TESTFIELD("Shortcut Dimension 2 Code");
            //Get Current Lines to loop through
            FINImprestLines.RESET;
            FINImprestLines.SETRANGE(No, ImprestRequisition."No.");
            IF FINImprestLines.FIND('-') THEN BEGIN
                REPEAT
                BEGIN
                    // Expense Budget Here
                    FINImprestLines.TESTFIELD("Account No.");
                    GLAccount.RESET;
                    GLAccount.SETRANGE("No.", FINImprestLines."Account No.");
                    IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                    DimensionValue.RESET;
                    DimensionValue.SETRANGE(Code, ImprestRequisition."Shortcut Dimension 2 Code");
                    DimensionValue.SETRANGE("Global Dimension No.", 2);
                    IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                    IF (FINImprestLines.Amount > 0) THEN BEGIN
                        // Commit Budget Here
                        PostBudgetEnties.CancelBudgetCommitment(FINImprestLines."Account No.", ImprestRequisition.Date, ImprestRequisition."Global Dimension 1 Code",
                        ImprestRequisition."Shortcut Dimension 2 Code", ImprestRequisition."Shortcut Dimension 3 Code",
                        FINImprestLines.Amount, FINImprestLines."Account Name", USERID, 'IMPREST',
                        ImprestRequisition."No." + FINImprestLines."Account No." + '-' + Format(FINImprestLines."Line No."), ImprestRequisition.Purpose);
                    END;
                END;
                UNTIL FINImprestLines.NEXT = 0;
            END;



            ApprovalMgmtFin.OnCancelImprestForApproval(ImprestRequisition);
            Msg := 'success';
        END;
    end;

    procedure getPRNPurpose(reqNum: Text) Msg: Text
    begin
        PurchaseRN.SetRange("No.", reqNum);
        if PurchaseRN.Find('-') then begin
            Msg := PurchaseRN."Posting Description" + '::' + PurchaseRN."Assigned User ID";
        end
    end;

    procedure getImprestPurpose(impNum: Text) Msg: Text
    begin
        ImprestRequisition.SetRange("No.", impNum);
        if ImprestRequisition.Find('-') then begin
            Msg := ImprestRequisition.Purpose + '::' + ImprestRequisition.Payee;
        end
    end;

    procedure getImprestAccountingPurpose(SurrNo: Text) Msg: Text
    begin
        ImprestSurrHeader.Reset();
        ImprestSurrHeader.SetRange(No, SurrNo);
        if ImprestSurrHeader.Find('-') then begin
            ImprestRequisition.SetRange("No.", ImprestSurrHeader."Imprest Issue Doc. No");
            if ImprestRequisition.Find('-') then begin
                //ImprestSurrHeader.CalcFields(Amount);
                Msg := ImprestRequisition.Purpose + '::' + ImprestRequisition.Payee + '::' + 'Impsurr' + '::' + ImprestRequisition."No." + '::' + Format(ImprestSurrHeader.Amount);
            end else
                Msg := 'Imprest details not found!';
        end else
            Msg := 'Surrender not found!';

    end;

    procedure getClaimPurpose(impNum: Text) Msg: Text
    begin
        ClaimRequisition.SetRange("No.", impNum);
        if ClaimRequisition.Find('-') then begin
            Msg := ClaimRequisition.Purpose + '::' + ClaimRequisition.Payee;
        end
    end;

    procedure ImprestRequisitionCreate(Campusz: Code[30]; Departmentz: Code[30]; CampusName: Text; DeptName: Text; RCentre: Code[20]; AccType: Integer; username: Code[30]; Reason: Text; ReqDate: Date; ReqEndDate: Date; ImprestType: Integer; phonez: Text[20]; days: Integer; bankcode: Text; branchCode: Text; bankName: Text; accNum: Text; activityCode: Text; projectCode: Text; payMode: Integer) LastNum: Text
    begin
        //NoOfDaysdtFormula
        ImprestRequisition.INIT;

        //NextImprestapplicationNo := NoSeriesMgt.GetNextNo('IMP', 0D, TRUE);
        CashOfficeSetup.Reset();
        CashOfficeSetup.FindLast();

        NextImprestapplicationNo := NoSeriesMgt.GetNextNo(CashOfficeSetup."Imprest Req No", 0D, TRUE);

        /* HRMEmployeeD.Reset();
        HRMEmployeeD.SetRange("No.", username); */

        HRMEmployeeD.Reset();
        HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);

        IF HRMEmployeeD.FIND('-')
        THEN BEGIN
            /* ImprestRequisition."Activity Start Date" := ReqDate;
            ImprestRequisition."Activity Ending Date" := ReqEndDate; */
            ImprestRequisition."No." := NextImprestapplicationNo;
            ImprestRequisition.Date := TODAY;
            ImprestRequisition.Payee := HRMEmployeeD.FullName();
            ImprestRequisition."On Behalf Of" := HRMEmployeeD.FullName();
            ImprestRequisition.Posted := FALSE;
            ImprestRequisition."Global Dimension 1 Code" := Campusz;
            ImprestRequisition.Status := ImprestRequisition.Status::Pending;
            ImprestRequisition."Payment Type" := ImprestRequisition."Payment Type"::Imprest;
            ImprestRequisition."Shortcut Dimension 2 Code" := Departmentz;
            /* ImprestRequisition."Budget Line Name" := CampusName;
            ImprestRequisition."Cost Center Name" := DeptName; */
            ImprestRequisition."No. Series" := 'IMP';
            ImprestRequisition."Responsibility Center" := RCentre;
            ImprestRequisition."Account Type" := ImprestRequisition."Account Type"::Customer;

            //ImprestRequisition."Imprest Type" := ImprestType;
            ImprestRequisition."Account No." := HRMEmployeeD."No.";
            ImprestRequisition.Purpose := Reason;
            ImprestRequisition.Cashier := username;
            ImprestRequisition."Requested By" := username;
            /* ImprestRequisition."Applicant Mpesa No." := phonez;
            ImprestRequisition."Applicant Bank Code" := bankcode;
            ImprestRequisition."Applicant Branch Code" := branchCode;
            ImprestRequisition."Applicant Bank No." := accNum; */

            //ImprestRequisition."Activity Code" := activityCode;
            ImprestRequisition."Shortcut Dimension 4 Code" := activityCode;
            ImprestRequisition."Shortcut Dimension 3 Code" := projectCode;
            if payMode = 0 then
                ImprestRequisition."Pay Mode" := ImprestRequisition."Pay Mode"::" ";
            /* if payMode = 1 then
                ImprestRequisition."Pay Mode" := ImprestRequisition."Pay Mode"::MPESA; */
            if payMode = 2 then
                ImprestRequisition."Pay Mode" := ImprestRequisition."Pay Mode"::Cash;
            if payMode = 3 then
                ImprestRequisition."Pay Mode" := ImprestRequisition."Pay Mode"::Cheque;
            if payMode = 4 then
                ImprestRequisition."Pay Mode" := ImprestRequisition."Pay Mode"::EFT;

            /* ImprestRequisition."Applicant Bank Name" := bankName;
            ImprestRequisition."Applicant Mpesa No." := phonez;
            EVALUATE(ImprestRequisition."Activity Number of Days", FORMAT(days) + 'D'); */
            ImprestRequisition.INSERT;
            LastNum := NextImprestapplicationNo;
        END;
    end;

    procedure ImprestRequisitionUpdate(Campusz: Code[30]; Departmentz: Code[30]; CampusName: Text; DeptName: Text; RCentre: Code[20]; AccType: Integer; username: Code[30]; Reason: Text; ReqDate: Date; ReqEndDate: Date; ImprestType: Integer; phonez: Text[20]; days: Integer; bankcode: Text; branchCode: Text; bankName: Text; accNum: Text; activityCode: Text; projectCode: Text; payMode: Integer; ReqNum: Text) Msg: Text
    begin
        ImprestRequisition.Reset();
        ImprestRequisition.SETRANGE(ImprestRequisition."No.", ReqNum);
        IF ImprestRequisition.FIND('-')
        THEN BEGIN
            HRMEmployeeD.Reset();
            HRMEmployeeD.SETRANGE(HRMEmployeeD."No.", username);

            IF HRMEmployeeD.FIND('-')
            THEN BEGIN
                /*  ImprestRequisition."Activity Start Date" := ReqDate;
                 ImprestRequisition."Activity Ending Date" := ReqEndDate; */
                ImprestRequisition.Date := TODAY;
                //ImprestRequisition.dat
                ImprestRequisition.Payee := HRMEmployeeD.FullName();
                ImprestRequisition."On Behalf Of" := HRMEmployeeD.FullName();
                ImprestRequisition.Posted := FALSE;
                ImprestRequisition."Global Dimension 1 Code" := Campusz;
                ImprestRequisition.Status := ImprestRequisition.Status::Pending;
                ImprestRequisition."Payment Type" := ImprestRequisition."Payment Type"::Imprest;
                ImprestRequisition."Shortcut Dimension 2 Code" := Departmentz;
                /* ImprestRequisition."Budget Line Name" := CampusName;
                ImprestRequisition."Cost Center Name" := DeptName; */
                ImprestRequisition."Responsibility Center" := RCentre;
                ImprestRequisition."Account Type" := ImprestRequisition."Account Type"::Customer;

                //ImprestRequisition."Imprest Type" := ImprestType;
                ImprestRequisition."Account No." := HRMEmployeeD."No.";
                ImprestRequisition.Purpose := Reason;
                ImprestRequisition.Cashier := username;
                ImprestRequisition."Requested By" := username;
                /* ImprestRequisition."Applicant Mpesa No." := phonez;
                ImprestRequisition."Applicant Bank Code" := bankcode;
                ImprestRequisition."Applicant Branch Code" := branchCode;
                ImprestRequisition."Applicant Bank No." := accNum;

                ImprestRequisition."Activity Code" := activityCode; */
                ImprestRequisition."Shortcut Dimension 4 Code" := activityCode;
                ImprestRequisition."Shortcut Dimension 3 Code" := projectCode;
                if payMode = 0 then
                    ImprestRequisition."Pay Mode" := ImprestRequisition."Pay Mode"::" ";
                /* if payMode = 1 then
                    ImprestRequisition."Pay Mode" := ImprestRequisition."Pay Mode"::MPESA; */
                if payMode = 2 then
                    ImprestRequisition."Pay Mode" := ImprestRequisition."Pay Mode"::Cash;
                if payMode = 3 then
                    ImprestRequisition."Pay Mode" := ImprestRequisition."Pay Mode"::Cheque;
                if payMode = 4 then
                    ImprestRequisition."Pay Mode" := ImprestRequisition."Pay Mode"::EFT;

                /* ImprestRequisition."Applicant Bank Name" := bankName;
                ImprestRequisition."Applicant Mpesa No." := phonez;
                EVALUATE(ImprestRequisition."Activity Number of Days", FORMAT(days) + 'D'); */
                ImprestRequisition.Modify();
                Msg := ReqNum;
            END;
        END;
    end;

    procedure InsertApproverComments(DocumentNo: Code[50]; ApproverID: Code[100]; Comments: Text[250]; TableID: Integer)
    begin
        ApproverComments.Reset();

        if ApproverComments.find('+') then begin
            LineNo := ApproverComments."Entry No.";
        end;
        LineNo := LineNo + 100;

        ApproverComments."Document No." := DocumentNo;
        ApproverComments."User ID" := ApproverID;
        ApproverComments.Comment := Comments;
        ApproverComments."Date and Time" := CURRENTDATETIME;
        ApproverComments."Table ID" := TableID;
        ApproverComments."Entry No." := LineNo;

        ApproverComments.Insert();
    end;

    procedure InsertImprestRequisitionLines(ReqNo: Code[20]; Atypes: Code[100]; AccNo: Code[50]; AccName: Code[80]; Amount: Decimal; UserId: Code[50]; Days: Integer; DestCluster: Integer; salaryGrade: Text; daylyRate: Decimal; Budgetline: Text; CostCenter: Text) rtnMsg: Text
    begin
        ImprestRequisition.Reset();
        ImprestRequisition.SetRange("No.", ReqNo);

        if ImprestRequisition.Find('-') then begin
            ImprestReqLines.Init();
            ImprestReqLines.No := ReqNo;
            ImprestReqLines."Advance Type" := Atypes;
            ImprestReqLines."Shortcut Dimension 2 Code" := ImprestRequisition."Shortcut Dimension 2 Code";
            ImprestReqLines."Account No." := AccNo;
            ImprestReqLines."Account Name" := AccName;
            ImprestReqLines.Amount := Amount;
            ImprestReqLines."Due Date" := ImprestRequisition.Date;
            ImprestReqLines."Imprest Holder" := UserId;
            ImprestReqLines."Global Dimension 1 Code" := ImprestRequisition."Global Dimension 1 Code";
            ImprestReqLines.Purpose := ImprestRequisition.Purpose;
            ImprestReqLines."Amount LCY" := Amount;
            /* ImprestReqLines."Number Of Days" := Days;
            ImprestReqLines."Destination Cluster" := DestCluster;
            ImprestReqLines."Employee Salary Grade" := salaryGrade;
            ImprestReqLines."Destination Daily Rate" := daylyRate; */
            ImprestReqLines."Budgetary Control A/C" := true;

            ImprestReqLines.Insert();

            rtnMsg := 'SUCCESS' + '::';
        end;

    end;

    procedure InsertClaimRequisitionLines(ReqNo: Code[20]; Atypes: Code[50]; AccNo: Code[50]; AccName: Code[50]; Amount: Decimal; UserId: Code[50]) rtnMsg: Text
    begin
        ClaimRequisition.Reset();
        ClaimRequisition.SetRange("No.", ReqNo);

        if ClaimRequisition.Find('-') then begin
            ClaimReqLines.Init();
            ClaimReqLines."Document No." := ReqNo;
            ClaimReqLines."Advance Type" := Atypes;
            ClaimReqLines."Shortcut Dimension 2 Code" := ClaimRequisition."Shortcut Dimension 2 Code";
            ClaimReqLines."Account No." := AccNo;
            ClaimReqLines."Account Name" := AccName;
            ClaimReqLines.Amount := Amount;
            ClaimReqLines."Due Date" := ClaimRequisition.Date;
            ClaimReqLines."Imprest Holder" := UserId;
            ClaimReqLines."Global Dimension 1 Code" := ClaimRequisition."Global Dimension 1 Code";
            ClaimReqLines.Purpose := ClaimRequisition.Purpose;
            ClaimReqLines."Amount LCY" := Amount;
            ClaimReqLines."Budgetary Control A/C" := true;

            ClaimReqLines.Insert();

            rtnMsg := 'SUCCESS' + '::';
        end;
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

    procedure CreateRecruitmentAccount(
       firstName: Text;
       middleName: Text;
       lastName: Text;
       emailAddress: Text;
       password: Text) responseText: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", emailAddress);
        IF NOT RecAccountusers.FIND('-') THEN BEGIN
            RecAccountusers.INIT;
            //RecAccountusers.Initials := initials;
            RecAccountusers."First Name" := firstName;
            RecAccountusers."Middle Name" := middleName;
            RecAccountusers."Last Name" := lastName;
            //RecAccountusers."Postal Address" := postalAddress;
            //RecAccountusers."Postal Code" := postalCode;
            //RecAccountusers."ID Number" := idNumber;
            //RecAccountusers.Gender := gender;
            //RecAccountusers."Home Phone Number" := homePhoneNumber;
            RecAccountusers.Citizenship := citizenship;
            //RecAccountusers."Marital Status" := maritalStatus;
            //RecAccountusers."Desability Details" := disabilityDetails;
            //RecAccountusers."Date of Birth" := dateOfBirth;
            RecAccountusers."Applicant Type" := applicantType;
            RecAccountusers."Email Address" := emailAddress;
            RecAccountusers.Password := password;
            RecAccountusers."Created Date" := TODAY;
            IF RecAccountusers.INSERT THEN;
            responseText := 'success*Account created successfully*' + RecAccountusers.Password;
        END ELSE BEGIN
            responseText := 'error*Duplicate record*We already have account created with the email address provided!';
        END
    end;

    procedure UpdateRecruitmentAccount(EmailAddress: Text; Initialsz: Integer; PostalAddress: Text; PostalCode: Text; IDNumber: Code[30]; Genderz: Integer; HomePhoneNumber: Code[30]; Citizenshipz: Text; MaritalStatus: Integer; EthnicOrigin: Text; Disabledz: Integer; DesabilityDetails: Text; DoB: Date; KRAPINNumber: Text; ApplicantType: Integer; PWDNo: Text; PassportNo: Text; Religion: Text; Denomination: Text) responseText: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", EmailAddress);
        IF RecAccountusers.FIND('-') THEN BEGIN
            RecAccountusers.INIT;
            RecAccountusers.Initials := Initialsz;
            RecAccountusers."Religion" := Religion;
            RecAccountusers."Denomination" := Denomination;
            RecAccountusers."PWD No" := PWDNo;
            RecAccountusers."Passport No" := PassportNo;
            RecAccountusers."Postal Address" := PostalAddress;
            RecAccountusers."Postal Code" := PostalCode;
            //RecAccountusers."ID Number" := IDNumber;
            RecAccountusers.Gender := Genderz;
            RecAccountusers."Home Phone Number" := HomePhoneNumber;
            //RecAccountusers."Residential Address" := ResidentialAddress;
            RecAccountusers.Citizenship := Citizenshipz;
            //RecAccountusers.County := Countyz;
            RecAccountusers."Marital Status" := MaritalStatus;
            RecAccountusers."Ethnic Origin" := EthnicOrigin;
            RecAccountusers.Disabled := Disabledz;
            RecAccountusers."Desability Details" := DesabilityDetails;
            RecAccountusers."Date of Birth" := DoB;
            //RecAccountusers."Driving License" := DrivingLicense;
            //RecAccountusers."1st Language" := stLanguage;
            //RecAccountusers."2nd Language" := ndLanguage;
            //RecAccountusers."Additional Language" := AdditionalLanguage;
            RecAccountusers."Applicant Type" := ApplicantType;
            RecAccountusers."Email Address" := EmailAddress;
            //RecAccountusers.Password := Passwordz;
            //RecAccountusers."Created Date" := TODAY;
            RecAccountusers."Updated Profile" := TRUE;
            RecAccountusers.MODIFY;
            IF RecAccountusers.MODIFY THEN;
            responseText := 'success*Account Updated successfully*';
        END ELSE BEGIN
            responseText := 'error*Failed to update profile!';
        END
    end;

    procedure ResetRecPassword(email: Text[150]; password: Text) msg: boolean
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE("Email Address", email);
        if RecAccountusers.Find('-') then begin
            RecAccountusers.Password := password;
            RecAccountusers.Modify;
            msg := true;
        end;
    end;

    procedure AccountActivated(username: Text) msg: Boolean
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", username);
        RecAccountusers.SETRANGE(RecAccountusers."Account Activated", true);
        if RecAccountusers.Find('-') then begin
            msg := true;
        end;
    end;

    procedure ActivateApplicantOnlineAccount(username: Text; activationcode: Code[50]) msg: boolean
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", username);
        //RecAccountusers.SETRANGE(RecAccountusers.OTP, activationcode);
        if RecAccountusers.Find('-') then begin
            RecAccountusers."Account Activated" := true;
            RecAccountusers.Modify;
            msg := true;
        end;
    end;

    [ServiceEnabled]
    procedure CheckRecruitmentApplicantLogin(username: Text; userpassword: Text) returnText: Text
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
                Disabled := Format(RecAccountusers.Disabled);
                dDetails := RecAccountusers."Desability Details";
                DOB := RecAccountusers."Date of Birth";
                KRA := RecAccountusers."KRA PIN Number";
                ApplicantType := RecAccountusers."Applicant Type";

                returnText := 'success::' + RecAccountusers."Email Address" + '::' + RecAccountusers."First Name" + '::' + RecAccountusers."Middle Name" + '::' + RecAccountusers."Last Name" + '::' + FORMAT(Initials) + '::' + pAddress + '::' + pCode + '::' + IDNum
                + '::' + FORMAT(Gender) + '::' + Phone + '::' + rAddress + '::' + Citizenship + '::' + County + '::' + FORMAT(Mstatus) + '::' + FORMAT(Eorigin) + '::' + FORMAT(Disabled) + '::' + dDetails + '::' + FORMAT(DOB) + '::' + Dlicense
                + '::' + KRA + '::' + firstLang + '::' + secondLang + '::' + AdditionalLang + '::' + FORMAT(ApplicantType);
            END ELSE BEGIN
                FullNames := RecAccountusers."First Name" + ' ' + RecAccountusers."Middle Name" + ' ' + RecAccountusers."Last Name";
                returnText := 'success::' + RecAccountusers."Email Address" + '::' + FullNames;
            END
        END
    end;

    [ServiceEnabled]
    procedure ValidRecruitmentEmailAddress(username: Text) returnText: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", username);
        IF RecAccountusers.FIND('-') THEN BEGIN
            returnText := 'valid*Email is valid';
        END ELSE BEGIN
            returnText := 'invalid*Invalid email';
        END
    end;

    [ServiceEnabled]
    procedure SubmitJobApplication(
        EMail: Text;
        FirstName: Text;
        MiddletName: Text;
        LastName: Text;
        JobID: Text;
        JobDescription: Text;
        RefNo: Text) returnMsg: Text
    begin
        JobApplications.RESET;
        JobApplications.SETRANGE(JobApplications."E-Mail", EMail);
        JobApplications.SETRANGE(JobApplications."Job Applied For", JobID);
        HRSetup.FindLast();
        IF NOT JobApplications.FIND('-') THEN BEGIN
            NextJobapplicationNo := NoSeriesMgt.GetNextNo(HRSetup."Job Application Nos", 0D, TRUE);
            RecAccountusers.RESET;
            RecAccountusers.SETRANGE(RecAccountusers."Email Address", EMail);
            IF RecAccountusers.FIND('-') THEN BEGIN

                JobApplications.INIT;
                JobApplications."Application No" := NextJobapplicationNo;
                JobApplications."Employee Requisition No" := RefNo;
                JobApplications."Applicant Type" := RecAccountusers."Applicant Type";
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
                JobApplications."First Language (R/W/S)" := RecAccountusers."1st Language";
                JobApplications."Driving Licence" := RecAccountusers."Driving License";
                JobApplications."Date Of Birth" := RecAccountusers."Date of Birth";
                JobApplications."Second Language (R/W/S)" := RecAccountusers."2nd Language";
                JobApplications."Additional Language" := RecAccountusers."Additional Language";
                JobApplications.Citizenship := RecAccountusers.Citizenship;
                JobApplications."Disabling Details" := RecAccountusers."Desability Details";
                JobApplications."Passport Number" := RecAccountusers."ID Number";
                JobApplications."PIN Number" := RecAccountusers."KRA PIN Number";
                JobApplications."Job Applied For" := JobID;
                JobApplications."Job Applied for Description" := JobDescription;
                JobApplications.Status := JobApplications.Status::Submitted;
                JobApplications."Date Applied" := TODAY;
                JobApplications."No. Series" := HRSetup."Job Application Nos";
                //JobApplications.INSERT;
                IF JobApplications.INSERT THEN;
                returnMsg := 'success::' + JobApplications."Application No";
            END

        END ELSE begin
            returnMsg := 'failed::' + JobApplications."Application No";
        end;

    end;

    procedure GetJobApps(username: Code[20]) msg: Text
    begin
        JobApplications.Reset;
        JobApplications.SetRange("E-Mail", username);
        if JobApplications.Find('-') then begin
            repeat
                msg += JobApplications."Application No" + '::' + Format(JobApplications."Job Applied For") + ':::';
            until JobApplications.Next = 0;
        end;
    end;

    procedure GetJobRequirements(jobno: Code[20]) msg: Text
    var
        jobreq: Record "HRM-Job Requirements";
    begin
        jobreq.Reset;
        jobreq.SetRange("Job ID", jobno);
        if jobreq.Find('-') then begin
            repeat
                msg += jobreq."Qualification Category" + '::' + jobreq."Qualification Type" + ':::' + jobreq."Qualification Description" + '::' + FORMAT(jobreq."Desired Score") + '::';
            until jobreq.Next = 0;
        end;
    end;

    procedure JobApplied(username: Code[20]; appno: Code[20]) returnText: Boolean
    begin
        JobApplications.Reset;
        JobApplications.SetRange("E-Mail", username);
        JobApplications.SetRange("Application No", appno);
        if JobApplications.find('-') then begin
            returnText := true;
        end else begin
            returnText := false;
        end;
    end;

    procedure GetApplicantDetails(username: Text) msg: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", username);
        RecAccountusers.SETRANGE(RecAccountusers."Updated Profile", FALSE);
        if RecAccountusers.Find('-') then begin
            msg := RecAccountusers."First Name" + ' ::' + RecAccountusers."Email Address" + ' ::' + RecAccountusers."Cell Phone Number" + ' ::' + RecAccountusers."Postal Address" + ' ::' + RecAccountusers."Last Name" + ' ::' + RecAccountusers."Email Address" + ' ::' + RecAccountusers."Home Phone Number";
        end;
    end;

    procedure GetAdvertisedJobs() msg: Text
    var
        EmpReq: Record "HRM-Employee Requisitions";
    begin
        EmpReq.Reset;
        //EmpReq.SetRange("Job ID", EmpReq."Required Positions">0);
        EmpReq.SetRange(Status, EmpReq.Status::Approved);
        if EmpReq.Find('-') then begin
            repeat
                msg += EmpReq."Job ID" + ' ::' + EmpReq."Job Title" + ' ::' + EmpReq."Job Description" + ' ::' + Format(EmpReq."Opening Date") + ' ::' + Format(EmpReq."Closing Date") + ' :::';
            until EmpReq.Next = 0;
        end;
    end;

    procedure GetEthnicity() msg: Text
    var
        Tribes: Record "Tribes";
    begin
        Tribes.Reset;
        //Tribes.SetRange("Job ID", Tribes."Required Positions">0);
        //Tribes.SetRange(Status, Tribes.Status::Approved);
        if Tribes.Find('-') then begin
            repeat
                msg += Tribes."Tribe Code" + ' ::' + Tribes."Description" + ' ::';
            until Tribes.Next = 0;
        end;
    end;

    procedure CreateRecruitmentAccount2(Initialsz: Integer; FirstName: Text; MiddleName: Text; LastName: Text; PostalAddress: Text; PostalCode: Text; IDNumber: Code[30]; Genderz: Integer; HomePhoneNumber: Code[30]; Citizenshipz: Text; MaritalStatus: Integer; EthnicOrigin: Text; Disabledz: Option; DesabilityDetails: Text; DoB: Date; KRAPINNumber: Text; ApplicantType: Integer; EmailAddress: Text; Passwordz: Text; PwdNumber: Text[50]) Message: Text
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
            /* RecAccountusers."Ethnic Group" := EthnicOrigin;
            RecAccountusers.Disabled := Disabledz; */
            RecAccountusers."Desability Details" := DesabilityDetails;
            //RecAccountusers."PWD Number" := PwdNumber;
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
            Message := 'Warning! We already have account created with the Email address provided.' + '::' + RecAccountusers.Password;
        END
    end;

    procedure ValidRecruitmentEmailAddress2(username: Text) Message: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", username);
        IF RecAccountusers.FIND('-') THEN BEGIN
            Message := TXTCorrectDetails + '::';
        END ELSE BEGIN
            Message := TXTIncorrectDetails + '::';
        END
    end;

    procedure GetRecruitmentEmailAddress2(username: Text) Message: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", username);
        IF RecAccountusers.FIND('-') THEN BEGIN
            Message := RecAccountusers."Email Address" + '::';
        END
    end;

    procedure GetCurrentRecruitmentPassword2(Username: Text) Message: Text
    begin
        RecAccountusers.RESET;
        RecAccountusers.SETRANGE(RecAccountusers."Email Address", Username);
        IF RecAccountusers.FIND('-') THEN BEGIN
            Message := RecAccountusers.Password + '::';
        END
    end;

    procedure CheckRecruitmentApplicantLogin2(username: Text; userpassword: Text) Message: Text
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
                //Eorigin := RecAccountusers."Ethnic Group";
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

    procedure SubmitJobApplication2(EMail: Text; FirstName: Text; MiddletName: Text; LastName: Text; JobID: Text; JobDescription: Text; RefNo: Text) Message: Text
    begin

        JobApplications.RESET;

        JobApplications.SETRANGE(JobApplications."E-Mail", EMail);
        JobApplications.SETRANGE(JobApplications."Job Applied For", JobID);
        HRSetup.FindLast();

        IF NOT JobApplications.FIND('-') THEN BEGIN
            NextJobapplicationNo := NoSeriesMgt.GetNextNo(HRSetup."Job Application Nos", 0D, TRUE);

            RecAccountusers.RESET;
            RecAccountusers.SETRANGE(RecAccountusers."Email Address", EMail);
            IF RecAccountusers.FIND('-') THEN BEGIN
                JobApplications.INIT;

                JobApplications."Application No" := NextJobapplicationNo;
                JobApplications."Employee Requisition No" := RefNo;
                JobApplications."Applicant Type" := RecAccountusers."Applicant Type";
                //JobApplications.Initials := FORMAT(RecAccountusers.Initials);
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
                //JobApplications."Ethnic Group" := RecAccountusers."Ethnic Group";
                JobApplications."First Language (R/W/S)" := RecAccountusers."1st Language";
                JobApplications."Driving Licence" := RecAccountusers."Driving License";
                //JobApplications.Disabled := RecAccountusers.Disabled;
                JobApplications."Date Of Birth" := RecAccountusers."Date of Birth";
                JobApplications."Second Language (R/W/S)" := RecAccountusers."2nd Language";
                JobApplications."Additional Language" := RecAccountusers."Additional Language";
                JobApplications.Citizenship := RecAccountusers.Citizenship;
                //JobApplications."Ethnic Origin" := RecAccountusers."Ethnic Origin";
                JobApplications."Disabling Details" := RecAccountusers."Desability Details";
                JobApplications."Passport Number" := RecAccountusers."ID Number";
                JobApplications."PIN Number" := RecAccountusers."KRA PIN Number";
                JobApplications."Job Applied For" := JobID;
                JobApplications."Job Applied for Description" := JobDescription;
                JobApplications.Status := JobApplications.Status::Submitted;
                JobApplications."Date Applied" := TODAY;
                JobApplications."No. Series" := HRSetup."Job Application Nos";
                //JobApplications."CV Path" := MyCVPath;
                //JobApplications."Cover Letter Path" := GoodConductPath;
                JobApplications.INSERT;
                IF JobApplications.INSERT THEN;
                Message := 'SUCCESS' + '::' + JobApplications."Application No";
            END

        END ELSE begin
            Message := 'FAILED' + '::' + JobApplications."Application No";
        end;

    end;

    procedure InsertJobApplicantQualifications(AppNo: Code[30]; QualType: Code[30]; QualDesc: Code[30]; Institution: Code[50]; FromDate: Date; ToDate: Date) rtnMsg: Text
    begin
        ApplicantQualifications.Reset();

        ApplicantQualifications.SetRange("Application No", AppNo);
        ApplicantQualifications.SetRange("Qualification Type", QualType);
        ApplicantQualifications.SetRange("Qualification Code", QualDesc);

        if not ApplicantQualifications.Find('-') then begin
            ApplicantQualifications.Init();

            ApplicantQualifications."Application No" := AppNo;
            ApplicantQualifications."Qualification Type" := QualType;
            ApplicantQualifications."Qualification Code" := QualType;
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

        JobApplications.RESET;

        JobApplications.SETRANGE(JobApplications."Application No", AppNo);
        IF JobApplications.FIND('-') THEN BEGIN

            if (JobApplications.Submitted = '') then begin
                JobApplications."CV Path" := CvPath;
                JobApplications."Cover Letter Path" := CoverLetterPath;
                JobApplications.Submitted := 'true';
                JobApplications.Modify();
                IF JobApplications.Modify() THEN;
                Message := 'SUCCESS' + '::';
            end else begin
                Message := 'FAIL 1' + '::';
            end



        END ELSE begin
            Message := 'FAIL 2' + '::';
        end
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

    procedure CheckValidSupplierNo(email: Text) Message: Text
    begin
        /* prequalified.RESET;
        prequalified.SETRANGE(prequalified."commEmail Address", email);
        IF prequalified.FIND('-') THEN BEGIN
            Message := 'Yes' + '::';
        END ELSE BEGIN
            Message := 'No' + '::';
        END */
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

    /* procedure CheckPreQLogin(username: Text; userpassword: Text) Message: Text
    begin
        prequalified.RESET;
        prequalified.SETRANGE(prequalified."commEmail Address", username);
        IF prequalified.FIND('-') THEN BEGIN
            IF (prequalified."Changed Password" = TRUE) THEN BEGIN
                IF (prequalified.Password = userpassword) THEN BEGIN
                    FullNames := prequalified."Company Name";
                    Message := TXTCorrectDetails + '::' + FORMAT(prequalified."Changed Password") + '::' + prequalified."Num" + '::' + FullNames + '::' + prequalified."commEmail Address" + '::' + prequalified."commMobile Phone" + '::' + FORMAT(prequalified.Status);
                END ELSE BEGIN
                    FullNames := prequalified."Company Name";
                    Message := TXTIncorrectDetails + '::' + FORMAT(prequalified."Changed Password") + '::' + prequalified."Num" + '::' + FullNames + '::' + prequalified."commEmail Address" + '::' + prequalified."commMobile Phone" + '::' + FORMAT(prequalified.Status);
                END
            END ELSE BEGIN
                IF (prequalified.Password = userpassword) THEN BEGIN
                    FullNames := prequalified."Company Name";
                    Message := TXTCorrectDetails + '::' + FORMAT(prequalified."Changed Password") + '::' + prequalified."Num" + '::' + FullNames + '::' + prequalified."commEmail Address" + '::' + prequalified."commMobile Phone" + '::' + FORMAT(prequalified.Status);
                END ELSE BEGIN
                    Message := TXTIncorrectDetails + '::' + FORMAT(prequalified."Changed Password");
                END
            END
        END ELSE BEGIN
            Message := TXTIncorrectDetails + '::';
        END
    end; */

    procedure GetVendorProfileDetails(username: Text) Message: Text
    begin
        Vendors.RESET;
        Vendors.SETRANGE(Vendors."No.", username);
        IF Vendors.FIND('-') THEN BEGIN
            Message := Vendors."E-Mail" + '::' + Vendors."Phone No." + '::' + Vendors.Address + '::' + Vendors."Post Code" + '::' + Vendors.City;

        END
    end;

    /* procedure GetPreQSuppProfileDetails(username: Text) Message: Text
    begin
        prequalified.RESET;
        prequalified.SETRANGE(prequalified."Num", username);
        IF prequalified.FIND('-') THEN BEGIN
            Message := prequalified."commEmail Address" + '::' + prequalified."commMobile Phone" + '::' + prequalified."AddStreet Add" + '::' + prequalified."AddPostal Code" + '::' + prequalified.AddCity + '::' + prequalified."Company Name" + '::' + prequalified.Num + '::' + FORMAT(prequalified.Status);

        END
    end; */

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
            //REPORT.SAVEASPDF(52178714, filename, QuotationRequestVendors);
            REPORT.SAVEASPDF(Report::"RFQ Report", filename, QuotationRequestVendors);
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
            //REPORT.SAVEASPDF(52178707, filename, PurchaseHeader);
            REPORT.SAVEASPDF(Report::LPO2, filename, PurchaseHeader);
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
            //REPORT.SAVEASPDF(52179350, filename, tblTenderBids);
            REPORT.SAVEASPDF(Report::"Tender Award Letter", filename, tblTenderBids);
        END
    end;

    procedure CreateOnlineCustomer(Name: Text; Email: Text; IdNo: Text; Phone: Text; Address: Text; Town: Text; Password: Text) Message: Text
    begin
        Customer.RESET;
        Customer.SETRANGE("No.", IdNo);
        Customer.SETRANGE("E-Mail", Email);

        IF NOT Customer.FIND('-') THEN BEGIN
            Customer."No." := IdNo;
            Customer.Name := Name;
            Customer."Phone No." := Phone;
            Customer."E-Mail" := Email;
            Customer.Address := Address;
            Customer.City := Town;
            //Customer.Password := Password;
            Customer."Gen. Bus. Posting Group" := 'LOCAL';
            //Customer."Customer Posting Group" := 'KSM HOTEL';
            Customer.INSERT;

            Message := 'SUCCESS';
        END
        ELSE BEGIN
            Message := 'FAILED';
        END;
    end;

    procedure ValidateCustomerNumber(IdNo: Text) Message: Text
    begin
        Customer.RESET;
        Customer.SETRANGE("No.", IdNo);

        IF Customer.FIND('-') THEN BEGIN
            Message := 'EXIST';
        END
        ELSE BEGIN
            Message := 'DOES NOT EXIST';
        END;
    end;

    procedure Create_Order_Header(CustomerNo: Code[20]) rtnMsg: Text
    begin
        CLEAR(NextOderNo);
        IF Customer.GET(CustomerNo) THEN BEGIN
            NextOderNo := NoSeriesMgt.GetNextNo('SALES ORD', 0D, TRUE);
            SalesHeader.INIT;
            SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
            SalesHeader."No." := NextOderNo;
            SalesHeader."Sell-to Customer No." := CustomerNo;
            SalesHeader.VALIDATE(SalesHeader."Sell-to Customer No.");
            SalesHeader."Bill-to Customer No." := CustomerNo;
            SalesHeader.VALIDATE(SalesHeader."Bill-to Customer No.");
            SalesHeader."Document Date" := TODAY;
            SalesHeader."Posting Date" := TODAY;
            SalesHeader."Posting Description" := COPYSTR('Enterprise sales-' + SalesHeader."Sell-to Customer Name", 1, 50);
            SalesHeader."Order Date" := TODAY;
            SalesHeader."Due Date" := TODAY;
            //SalesHeader."Location Code":='HOTEL';
            //SalesHeader.VALIDATE("Location Code");
            SalesHeader.INSERT(TRUE);
            rtnMsg := SalesHeader."No.";

        END;
    end;

    procedure Create_Order_Lines(ItemNo: Code[20]; UnitPrice: Decimal; _Quantity: Decimal; CustomerNo: Code[20]; OrderNo: Code[20]) rtnMsg: Text
    begin
        SalesHeader.RESET;
        SalesHeader.SETRANGE("No.", OrderNo);

        IF SalesHeader.FIND('-') THEN BEGIN

            Clear(SalesLine);
            Clear(LineNo);
            SalesLine.RESET;
            SalesLine.setrange("Document No.", SalesHeader."No.");
            if SalesLine.find('+') then begin
                LineNo := SalesLine."Line No.";
            end;
            LineNo := LineNo + 100;

            SalesLine.INIT;
            SalesLine."Document Type" := SalesLine."Document Type"::Order;
            SalesLine."Document No." := SalesHeader."No.";
            SalesLine."Line No." := LineNo;
            SalesLine.Type := SalesLine.Type::Item;
            SalesLine."No." := ItemNo;
            SalesLine.VALIDATE("No.");
            SalesLine."Unit Price" := UnitPrice;
            // SalesLine.VALIDATE("Location Code");
            SalesLine.Quantity := _Quantity;
            SalesLine.VALIDATE(Quantity);

            SalesLine.INSERT(TRUE);
            // MESSAGE(SalesHeader."No.")
            rtnMsg := SalesHeader."No.";

        END;

    end;

    procedure UpdateMemoImpresetResCenter(No: Code[20]; resCenter: Code[50])
    begin
        ImprestRequisition.RESET;
        ImprestRequisition.SETRANGE("No.", No);
        if ImprestRequisition.Find('-') then begin
            ImprestRequisition."Responsibility Center" := resCenter;
            ImprestRequisition.MODIFY;
        end;
    end;

    procedure ApproveMemoImprest(No: Text) Msg: Text
    var
        imprst: Page "FIN-Travel Advance Req. UP";
    begin
        ImprestRequisition.Reset;
        ImprestRequisition.SETRANGE("No.", No);
        if ImprestRequisition.Find('-') then begin
            if ApprovalMgmtFin.IsImprestEnabled(ImprestRequisition) = true then
                ApprovalMgmtFin.OnSendImprestforApproval(ImprestRequisition)
            else
                Msg := 'Failed';
        end;
    end;

    procedure GetMemoImprestNo(No: Code[20]) Msg: Text
    begin
        ImprestRequisition.RESET;
        ImprestRequisition.SETRANGE("No.", No);
        if ImprestRequisition.Find('-') then begin
            Msg := ImprestRequisition."Payment Voucher No";
        end;
    end;
}

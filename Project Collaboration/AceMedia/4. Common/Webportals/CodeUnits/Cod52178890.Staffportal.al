// codeunit 52178890 Staffportal
// {
//     var
//         EmployeeCard: Record "HRM-Employee C";
//         MemoHeader: Record "FIN-Memo Header";
//         MemoPrnLines: Record "Memo PRN Details";
//         ApprovalEntry: Record "Approval Entry";
//         ApprovalComments: Record "Approval Comment Line";
//         JobCard: Record "HRM-Jobs";
//         ResponsibilityCenter: Record "Responsibility Center";
//         NoSeriesMngnt: Codeunit NoSeriesManagement;
//         PurchasePayables: Record "Purchases & Payables Setup";
//         CashOfficeSetup: Record "Cash Office Setup";
//         DimensionValues: Record "Dimension Value";
//         BCSetup:Record "FIN-Budgetary Control Setup";
//         FINBudgetEntries: Record "FIN-Budget Entries";
//         FINImprestLines: Record "FIN-Imprest Lines";
//         GlAccount: Record "G/L Account";
//         ItemCard: Record Item;
//         FixedAsset: Record "Fixed Asset";
//         Location: Record Location;
//         ApprovalMgt: Codeunit "Init Code";
//         ApprovalMgt2: Codeunit IntCodeunit;
//         MemoRegions: Record "Fin Memo Regions";
//         MemoLines: Record "FIN-Memo Details";
//         ReceiptPaymentTypes: Record "FIN-Receipts and Payment Types";
//         DocumentAttachment: Record "Document Attachment";
//         ImprestHeader: Record "FIN-Imprest Header";
//         ImprestLines: Record "FIN-Imprest Lines";
//         ImprestSurrenderHeader: Record "FIN-Imprest Surr. Header";
//         ImprestSurrenderLines: Record "FIN-Imprest Surrender Details";
//         ReceiptHeader: Record "FIN-Receipts Header";
//         ReceiptLines: Record "FIN-Receipt Line q";
//         ClaimHeader: Record "FIN-Staff Claims Header";
//         ClaimLines: Record "FIN-Staff Claim Lines";
//         PurchaseHeader: Record "Purchase Header";
//         PurchaseLines: Record "Purchase Line";
//         FixedAssets: Record "Fixed Asset";
//         UserSetup: Record "User Setup";
//         PettyCashHeader: Record "Advance PettyCash Header";
//         PettyCashLines: Record "Advance PettyCash Lines";
//         PettyCashSurrenderHeader: Record "PettyCash Surrender Header";
//         PettyCashSurrenderLines: Record "PettyCash Surrender Details";
//         BudgetCommitment: Codeunit "Budget Commitment";
//         StoreHeader: Record "PROC-Store Requistion Header";
//         StoreLines: Record "PROC-Store Requistion Lines";
//         ItemLedgerEntry: Record "Item Ledger Entry";
//         ReimbursmentHeader: Record "Reimbursement Header";
//         ReimbursmentLines: Record "Reimbursement Lines";
//         LeaveRequisition: Record "HRM-Leave Requisition";
//         LeaveTypes: Record "HRM-Leave Types";
//         Dates: Record Date;
//         EndLeave: Boolean;
//         DayCount: Integer;
//         varDaysApplied: Decimal;
//         availableDays: Decimal;
//         BaseCalendar: Record "Base Calendar Change";
//         HRSetup: Record "HRM-Setup";
//         HRMLeaveLedger: Record "HRM-Leave Ledger";
//         HRMLeavePeriod: Record "HRM-Leave Periods";
//         FILEPATH: Label 'C:\inetpub\wwwroot\NMKStaff\Downloads\';

//     procedure ValidStaffNo(username: Text) Message: Boolean
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             Message := true;
//         end;
//     end;

//     procedure CheckChangedPassword(username: Text) Message: Boolean
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             Message := EmployeeCard."Changed Password";
//         end;
//     end;

//     procedure LoginForChangedPassword(username: Text; password: Text) Message: Text
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             if EmployeeCard.Status = EmployeeCard.Status::Active then begin
//                 if EmployeeCard."Portal Password" = password then begin
//                     Message := 'SUCCESS' + '::' + EmployeeCard."No." + '::' + EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
//                 end else begin
//                     Message := 'Incorrect password' + '::';
//                 end;
//             end else begin
//                 Message := 'Your account is not active. Please contact the system administrator' + '::';
//             end;
//         end;
//     end;

//     procedure LoginForUnchangedPassword(username: Text) Message: Text
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             if EmployeeCard.Status = EmployeeCard.Status::Active then begin
//                 Message := 'SUCCESS' + '::' + EmployeeCard."No." + '::' + EmployeeCard."Company E-Mail" + '::' + EmployeeCard."E-Mail";
//             end else begin
//                 Message := 'Your account is not active. Please contact the system administrator' + '::';
//             end;
//         end;
//     end;

//     procedure UpdateStaffPassword(username: Text; genpass: Text) Message: Boolean
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             EmployeeCard."Portal Password" := genpass;
//             EmployeeCard."Changed Password" := true;
//             if EmployeeCard.Modify() then Message := true;
//         end;
//     end;

//     procedure ValidateOldPassword(username: Text; password: Text) Message: Boolean
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             if EmployeeCard."Portal Password" = password then Message := true;
//         end;
//     end;

//     procedure GetStaffDetails(username: Text) Message: Text
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             Message := EmployeeCard."No." + '::' + EmployeeCard."Job Id" + '::' + EmployeeCard."Job Title" + '::' + Format(EmployeeCard.Gender) + '::' + EmployeeCard."ID Number" + '::' + EmployeeCard."Company E-Mail" + '::' + EmployeeCard."Phone Number" + '::' + EmployeeCard."Postal Address";
//         end;
//     end;

//     procedure GetStaffGender(username: Text) Message: Text
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             Message := Format(EmployeeCard.Gender);
//         end;
//     end;

//     procedure GetMemoRequisitions(username: Text) Message: Text
//     begin
//         MemoHeader.Reset();
//         MemoHeader.SetRange("From No.", username);
//         if MemoHeader.Find('-') then begin
//             repeat
//                 Message += MemoHeader."No." + '::' + Format(MemoHeader."Date/Time") + '::' + Format(MemoHeader.PRN) + '::' + Format(MemoHeader."To") + '::' + Format(MemoHeader."Memo Status") + '[]';
//             until MemoHeader.Next() = 0;
//         end;
//     end;

//     procedure GetApprovalEntries(documentNo: Text) Message: Text
//     begin
//         ApprovalEntry.Reset();
//         ApprovalEntry.SetRange("Document No.", documentNo);
//         if ApprovalEntry.Find('-') then begin
//             repeat
//                 Message += Format(ApprovalEntry."Entry No.") + '::' + Format(ApprovalEntry."Sequence No.") + '::' + Format(ApprovalEntry."Date-Time Sent for Approval") + '::' + ApprovalEntry."Sender ID" + '::' + ApprovalEntry."Approver ID" + '::' + GetApproverComments(ApprovalEntry."Workflow Step Instance ID") + '::' + Format(ApprovalEntry.Status) + '[]';
//             until ApprovalEntry.Next() = 0;
//         end;
//     end;

//     procedure GetApproverComments(workFlowSetupIntance: Text) Message: Text
//     begin
//         ApprovalComments.Reset();
//         ApprovalComments.SetRange("Workflow Step Instance ID", workFlowSetupIntance);
//         if ApprovalComments.Find('-') then begin
//             Message := ApprovalComments.Comment;
//         end;
//     end;

//     procedure GetStaffDepartmentalDetails(username: Text) Message: Text
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             Message := EmployeeCard."Global Dimension 1 Code" + '::' + EmployeeCard."Global Dimension 2 Code";
//         end;
//     end;

//     procedure GetJobs() Message: Text
//     begin
//         JobCard.Reset();
//         JobCard.SetFilter("Job ID", '<>%1', '');
//         if JobCard.Find('-') then begin
//             repeat
//                 Message += JobCard."Job ID" + '::' + JobCard."Job Title" + '[]';
//             until JobCard.Next() = 0;
//         end;
//     end;

//     procedure GetResponsibilityCenter(grouping: Text) Message: Text
//     begin
//         ResponsibilityCenter.Reset();
//         ResponsibilityCenter.SetRange(Grouping, grouping);
//         if ResponsibilityCenter.Find('-') then begin
//             repeat
//                 Message += ResponsibilityCenter.Code + '::' + ResponsibilityCenter.Name + '[]';
//             until ResponsibilityCenter.Next() = 0;
//         end;
//     end;

//     procedure GetDirectorates() Message: Text
//     begin
//         DimensionValues.Reset();
//         DimensionValues.SetRange("Dimension Code", 'DIRECTORATE');
//         if DimensionValues.Find('-') then begin
//             repeat
//                 Message += DimensionValues.Code + '::' + DimensionValues.Name + '[]';
//             until DimensionValues.Next() = 0;
//         end;
//     end;

//     procedure GetDepartments() Message: Text
//     begin
//         DimensionValues.Reset();
//         DimensionValues.SetRange("Dimension Code", 'DEPARTMENT');
//         if DimensionValues.Find('-') then begin
//             repeat
//                 Message += DimensionValues.Code + '::' + DimensionValues.Name + '[]';
//             until DimensionValues.Next() = 0;
//         end;
//     end;

//     procedure GetProjects() Message: Text
//     begin
//         DimensionValues.Reset();
//         DimensionValues.SetRange("Dimension Code", 'PROJECTS');
//         if DimensionValues.Find('-') then begin
//             repeat
//                 Message += DimensionValues.Code + '::' + DimensionValues.Name + '[]';
//             until DimensionValues.Next() = 0;
//         end;
//     end;

//     procedure GetActivities(project: Text) Message: Text
//     begin
//         DimensionValues.Reset();
//         DimensionValues.SetRange("Dimension Code", 'ACTIVITIES');
//         DimensionValues.SetRange("Falls Under", project);
//         if DimensionValues.Find('-') then begin
//             repeat
//                 Message += DimensionValues.Code + '::' + DimensionValues.Name + '[]';
//             until DimensionValues.Next() = 0;
//         end;
//     end;

//     procedure GetGlAccounts() Message: Text
//     begin
//         GlAccount.Reset();
//         GlAccount.SetRange("Direct Posting", true);
//         GlAccount.SetRange("Account Type", GlAccount."Account Type"::Posting);
//         if GlAccount.Find('-') then begin
//             repeat
//                 Message += GlAccount."No." + '::' + GlAccount.Name + '[]';
//             until GlAccount.Next() = 0;
//         end;
//     end;

//     procedure GetItems() Message: Text
//     begin
//         ItemCard.Reset();
//         ItemCard.SetFilter("No.", '<>%1', '');
//         if ItemCard.Find('-') then begin
//             repeat
//                 Message += ItemCard."No." + '::' + ItemCard.Description + '[]';
//             until ItemCard.Next() = 0;
//         end;
//     end;

//     procedure GetFixedAssets() Message: Text
//     begin
//         FixedAsset.Reset();
//         FixedAsset.SetRange(Acquired, true);
//         if FixedAsset.Find('-') then begin
//             repeat
//                 Message += FixedAsset."No." + '::' + FixedAsset.Description + '[]';
//             until FixedAsset.Next() = 0;
//         end;
//     end;

//     procedure GetLocations() Message: Text
//     begin
//         Location.Reset();
//         Location.SetFilter(Code, '<>%1', '');
//         if Location.Find('-') then begin
//             repeat
//                 Message += Location.Code + '::' + Location.Name + '[]';
//             until Location.Next() = 0;
//         end;
//     end;

//     procedure CreateMemoHeader(username: Text; toJob: Text; through: Text; resCenter: Text; subject: Text; startDate: Date; endDate: Date; prn: Boolean; description: Text; purpose: Text) Message: Text
//     var
//         NextMemoNo: Text;
//         fullName: Text;
//     begin
//         CashOfficeSetup.Get();
//         NextMemoNo := NoSeriesMngnt.GetNextNo(CashOfficeSetup."Memo Nos.", 0D, true);
//         MemoHeader.Init();
//         MemoHeader."No." := NextMemoNo;
//         MemoHeader."Date/Time" := Today();
//         MemoHeader."To" := toJob;
//         MemoHeader.Through := through;
//         MemoHeader."From No." := username;
//         MemoHeader.Validate("To");
//         MemoHeader.Validate(Through);

//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             fullName := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
//             MemoHeader.From := fullName;
//             MemoHeader."Created by" := fullName;
//             MemoHeader."Salary Grade" := EmployeeCard."Salary Grade";
//             MemoHeader."Global Dimension 1 Code" := EmployeeCard."Global Dimension 1 Code";
//             MemoHeader."Global Dimension 2 Code" := EmployeeCard."Global Dimension 2 Code";
//         end;

//         MemoHeader.Title := subject;
//         MemoHeader."Start Date" := startDate;
//         MemoHeader."End Date" := endDate;
//         MemoHeader."Responsibility Centre" := resCenter;
//         MemoHeader."Paragraph 1" := description;
//         MemoHeader."Paragraph 2" := purpose;
//         MemoHeader.PRN := prn;
//         MemoHeader."Memo Requestor No" := username;
//         UserSetup.Reset();
//         UserSetup.SetRange("Employee No.", username);
//         if UserSetup.Find('-') then MemoHeader."Created by" := UserSetup."User ID"
//         else MemoHeader."Created by" := UserId;

//         if MemoHeader.Insert() then begin
//             Message := 'SUCCESS' + '::' + MemoHeader."No.";
//         end else begin
//             Message := 'FAILED' + '::';
//         end;
//     end;

//     procedure GetMemoPrnLines(memoNo: Text) Message: Text
//     begin
//         MemoPrnLines.Reset();
//         MemoPrnLines.SetRange("Document No.", memoNo);
//         if MemoPrnLines.Find('-') then begin
//             repeat
//                 Message += MemoPrnLines."No." + '::' + MemoPrnLines.Description + '::' + Format(MemoPrnLines.Quantity) + '::' + Format(MemoPrnLines."Line Amount") + '::' + MemoPrnLines.SystemId + '[]';
//             until MemoPrnLines.Next() = 0;
//         end;
//     end;

//     procedure InsertMemoPrnLine(memoNo: Text; type: Integer; itemNo: Text; quantity: Decimal; amount: Decimal; directorate: Text; department: Text; project: Text; activity: Text; issuingStore: Text; purpose: Text)
//     begin
//         MemoPrnLines.Reset();
//         MemoPrnLines.SetRange("No.", itemNo);
//         MemoPrnLines.SetRange("Document No.", memoNo);
//         if MemoPrnLines.Find('-') then begin
//             Error('Memo prn line with memo number %1 and item number %2 already exists!', memoNo, itemNo);
//         end else begin
//             MemoPrnLines.Init();
//             MemoPrnLines."Document No." := memoNo;
//             MemoPrnLines."No." := itemNo;

//             if type = 0 then begin
//                 MemoPrnLines.Type := MemoPrnLines.Type::"G/L Account";
//                 GlAccount.Reset();
//                 GlAccount.SetRange("No.", itemNo);
//                 if GlAccount.Find('-') then begin
//                     MemoPrnLines.Description := GlAccount.Name;
//                 end;
//             end;

//             if type = 1 then begin
//                 MemoPrnLines.Type := MemoPrnLines.Type::Item;
//                 ItemCard.Reset();
//                 ItemCard.SetRange("No.", itemNo);
//                 if ItemCard.Find('-') then begin
//                     MemoPrnLines.Description := ItemCard.Description;
//                     MemoPrnLines."Description 2" := ItemCard."Description 2";
//                     MemoPrnLines."Unit of Measure" := ItemCard."Base Unit of Measure";
//                 end;
//             end;

//             if type = 2 then begin
//                 MemoPrnLines.Type := MemoPrnLines.Type::"Fixed Asset";
//                 FixedAsset.Reset();
//                 FixedAsset.SetRange("No.", itemNo);
//                 if FixedAsset.Find('-') then begin
//                     MemoPrnLines.Description := FixedAsset.Description;
//                     MemoPrnLines."Description 2" := FixedAsset."Description 2";
//                 end;
//             end;

//             MemoPrnLines.Quantity := quantity;
//             MemoPrnLines."Unit Cost" := amount;
//             MemoPrnLines."Line Amount" := quantity * amount;
//             MemoPrnLines."Global Dimension 1 Code" := directorate;
//             MemoPrnLines."Global Dimension 2 Code" := department;
//             MemoPrnLines."Shortcut Dimension 3 Code" := project;
//             MemoPrnLines."Shortcut Dimension 4 Code" := activity;
//             MemoPrnLines."Location Code" := issuingStore;
//             MemoPrnLines."Description 2" := purpose;
//             MemoPrnLines.Insert();
//         end;
//     end;

//     procedure RemoveMemoPrnLine(systemId: Text)
//     begin
//         MemoPrnLines.Reset();
//         MemoPrnLines.SetRange(SystemId, systemId);
//         if MemoPrnLines.Find('-') then begin
//             MemoPrnLines.Delete();
//         end;
//     end;

//     procedure OnSendMemoForApproval(memoNo: Text)
//     begin
//         MemoHeader.Reset();
//         MemoHeader.SetRange("No.", memoNo);
//         if MemoHeader.Find('-') then begin
//             if ApprovalMgt.IsMemoEnabled(MemoHeader) = false then Error('No approval workflow enabled');
//             ApprovalMgt.OnSendMemoforApproval(MemoHeader);
//         end;
//     end;

//     procedure OnCancelMemoApproval(memoNo: Text)
//     begin
//         MemoHeader.Reset();
//         MemoHeader.SetRange("No.", memoNo);
//         if MemoHeader.Find('-') then begin
//             ApprovalMgt.OnCancelMemoForApproval(MemoHeader);
//         end;
//     end;

//     procedure GetEmployees() Message: Text
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange(Status, EmployeeCard.Status::Active);
//         if EmployeeCard.Find('-') then begin
//             repeat
//                 Message += EmployeeCard."No." + '::' + EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name" + '[]';
//             until EmployeeCard.Next() = 0;
//         end;
//     end;

//     procedure GetJobGrade(username: Text) Message: Text
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             Message := EmployeeCard."Salary Grade";
//         end;
//     end;

//     procedure GetMemoRegions(grade: Text) Message: Text
//     begin
//         MemoRegions.Reset();
//         MemoRegions.SetRange(Grade, grade);
//         if MemoRegions.Find('-') then begin
//             repeat
//                 Message += MemoRegions."No." + '::' + MemoRegions.Regions + '[]';
//             until MemoRegions.Next() = 0;
//         end;
//     end;

//     procedure GetImprestTypes() Message: Text
//     begin
//         ReceiptPaymentTypes.Reset();
//         ReceiptPaymentTypes.SetRange(Type, ReceiptPaymentTypes.Type::Imprest);
//         if ReceiptPaymentTypes.Find('-') then begin
//             repeat
//                 Message += ReceiptPaymentTypes.Code + '::' + ReceiptPaymentTypes.Description + '[]';
//             until ReceiptPaymentTypes.Next() = 0;
//         end;
//     end;

//     procedure InsertDsaMemoLines(memoNo: Text; staffNo: Text; expenseCode: Text; region: Text; imprestType: Text; directorate: Text; department: Text; days: Decimal; project: Text; activity: Text)
//     begin
//         MemoLines.Init();
//         MemoLines."Memo No." := memoNo;
//         MemoLines."Staff no." := staffNo;
//         MemoLines.Validate("Staff no.");

//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", staffNo);
//         if EmployeeCard.Find('-') then begin
//             MemoLines."Staff Name" := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
//         end;

//         MemoLines."Expense Code" := expenseCode;
//         MemoRegions.Reset();
//         MemoRegions.SetRange("No.", region);
//         if MemoRegions.Find('-') then begin
//             MemoLines.Region := MemoRegions.Regions;
//             MemoLines.Rate := MemoRegions.Amount;
//             MemoLines."Job Grade" := MemoRegions.Grade;
//         end;

//         MemoLines."Item No." := imprestType;
//         ReceiptPaymentTypes.Reset();
//         ReceiptPaymentTypes.SetRange(Code, imprestType);
//         ReceiptPaymentTypes.SetRange(Type, ReceiptPaymentTypes.Type::Imprest);
//         if ReceiptPaymentTypes.Find('-') then begin
//             MemoLines."Gl Account" := ReceiptPaymentTypes."G/L Account";
//             MemoLines.Description := ReceiptPaymentTypes.Description;
//         end;
//         MemoLines."Global Dimension 1 Code" := directorate;
//         MemoLines."Global Dimension 2 Code" := department;
//         MemoLines."Shortcut Dimension 3 Code" := project;
//         MemoLines."Shortcut Dimension 4 Code" := activity;
//         MemoLines.Days := days;
//         MemoLines.Amount := MemoLines.Rate * days;
//         MemoLines."Payee Type" := MemoLines."Payee Type"::Staff;
//         MemoLines.Type := expenseCode;
//         MemoLines.Insert();
//     end;

//     procedure DeleteDsaMemoLine(systemId: Text)
//     begin
//         MemoLines.Reset();
//         MemoLines.SetRange(SystemId, systemId);
//         if MemoLines.Find('-') then begin
//             MemoLines.Delete();
//         end;
//     end;

//     procedure GetMemoDsaLines(memoNo: Text) Message: Text
//     begin
//         MemoLines.Reset();
//         MemoLines.SetRange("Memo No.", memoNo);
//         MemoLines.SetRange("Expense Code", 'DSA');
//         if MemoLines.Find('-') then begin
//             repeat
//                 Message += MemoLines."Staff Name" + '::' + MemoLines.Region + '::' + MemoLines."Item No." + '::' + MemoLines."Gl Account" + '::' + Format(MemoLines.Rate) + '::' + Format(MemoLines.Days) + '::' + Format(MemoLines.Amount) + '::' + MemoLines.SystemId + '[]';
//             until MemoLines.Next() = 0;
//         end;
//     end;

//     procedure GetOtherCostLines(memoNo: Text) Message: Text
//     begin
//         MemoLines.Reset();
//         MemoLines.SetRange("Memo No.", memoNo);
//         MemoLines.SetRange("Expense Code", 'OTHER COSTS');
//         if MemoLines.Find('-') then begin
//             repeat
//                 Message += MemoLines."Staff Name" + '::' + MemoLines.Region + '::' + MemoLines."Item No." + '::' + MemoLines."Gl Account" + '::' + Format(MemoLines.Rate) + '::' + Format(MemoLines.Days) + '::' + Format(MemoLines.Amount) + '::' + MemoLines.SystemId + '[]';
//             until MemoLines.Next() = 0;
//         end;
//     end;

//     procedure InsertOtherCostsMemoLines(memoNo: Text; staffNo: Text; expenseCode: Text; imprestType: Text; directorate: Text; department: Text; amount: Decimal; project: Text; activity: Text; description: Text)
//     begin
//         MemoLines.Init();
//         MemoLines."Memo No." := memoNo;
//         MemoLines."Staff no." := staffNo;
//         MemoLines.Validate("Staff no.");

//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", staffNo);
//         if EmployeeCard.Find('-') then begin
//             MemoLines."Staff Name" := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
//         end;

//         MemoLines."Expense Code" := expenseCode;

//         MemoLines."Item No." := imprestType;
//         ReceiptPaymentTypes.Reset();
//         ReceiptPaymentTypes.SetRange(Code, imprestType);
//         ReceiptPaymentTypes.SetRange(Type, ReceiptPaymentTypes.Type::Imprest);
//         if ReceiptPaymentTypes.Find('-') then begin
//             MemoLines."Gl Account" := ReceiptPaymentTypes."G/L Account";
//             MemoLines.Description := ReceiptPaymentTypes.Description;
//         end;
//         MemoLines."Global Dimension 1 Code" := directorate;
//         MemoLines."Global Dimension 2 Code" := department;
//         MemoLines."Shortcut Dimension 3 Code" := project;
//         MemoLines."Shortcut Dimension 4 Code" := activity;
//         MemoLines.Description := description;
//         MemoLines."Payee Type" := MemoLines."Payee Type"::Staff;
//         MemoLines.Amount := amount;
//         MemoLines.Type := expenseCode;
//         MemoLines.Insert();
//     end;

//     procedure CheckPendingImprests(username: Text)
//     var ImprestHeader: Record "FIN-Imprest Header";
//     begin
//         ImprestHeader.Reset();
//         ImprestHeader.SetRange("Account No.", username);
//         ImprestHeader.SetRange("Surrender Status", ImprestHeader."Surrender Status"::" ");
//         ImprestHeader.Setfilter(Status, '<>%1', ImprestHeader.Status::Cancelled);
//         if ImprestHeader.Count > 1 then Error('The selected staff number %1 has some pending imprests', username);
//     end;

//     procedure GenerateMemoReport(memoNo: Text; fileNameFromApp: Text)
//     var filename: Text;
//     begin
//         filename := FILEPATH + fileNameFromApp;
//         if Exists(filename) then Erase(filename);

//         MemoHeader.Reset();
//         MemoHeader.SetRange("No.", memoNo);
//         if MemoHeader.Find('-') then Report.SaveAsPdf(Report::"FIN-Memo Report", filename, MemoHeader);
//     end;

//     procedure UploadDocument(retNo: Code[50]; FileName: Text; attachment: BigText; tableId: Integer)
//     var
//         FromRecRef: RecordRef;
//         FileManagement: Codeunit "File Management";
//         Bytes: dotnet Array;
//         Convert: dotnet Convert;
//         MemoryStream: dotnet MemoryStream;
//         Ostream: OutStream;
//         tableFound: Boolean;
//         ImprestSurrenderHeader: Record "FIN-Imprest Surr. Header";
//         ClaimRequisition: Record "FIN-Staff Claims Header";
//         ImprestRequisition: Record "FIN-Imprest Header";
//         PettyCashHeader: Record "Advance PettyCash Header";
//         PettyCashSurrender: Record "PettyCash Surrender Header";
//         MemoHeader: Record "FIN-Memo Header";
//         DocAttachment: Record "Document Attachment";
//         ReimbursmentHeader: Record "Reimbursement Header";
//     begin

//         tableFound := false;
//         if TableID = Database::"FIN-Imprest Surr. Header" then begin
//             ImprestSurrenderHeader.RESET;
//             if ImprestSurrenderHeader.FIND('-') then begin
//                 FromRecRef.GETTABLE(ImprestSurrenderHeader);
//             end;
//             tableFound := true;
//         end;

//         if TableId = Database::"FIN-Staff Claims Header" then begin
//             ClaimRequisition.Reset();
//             if ClaimRequisition.Find('-') then begin
//                 FromRecRef.GetTable(ClaimRequisition);
//             end;
//             tableFound := true;
//         end;

//         if TableId = Database::"FIN-Imprest Header" then begin
//             ImprestRequisition.Reset();
//             if ImprestRequisition.Find('-') then begin
//                 FromRecRef.GetTable(ImprestRequisition);
//             end;
//             tableFound := true;
//         end;

//         if tableId = Database::"Advance PettyCash Header" then begin
//             PettyCashHeader.Reset();
//             if PettyCashHeader.Find('-') then begin
//                 FromRecRef.GetTable(PettyCashHeader);
//             end;
//             tableFound := true;
//         end;

//         if tableId = Database::"Advance PettyCash Header" then begin
//             PettyCashHeader.Reset();
//             if PettyCashHeader.Find('-') then begin
//                 FromRecRef.GetTable(PettyCashHeader);
//             end;
//             tableFound := true;
//         end;

//         if tableId = Database::"PettyCash Surrender Header" then begin
//             PettyCashSurrender.Reset();
//             if PettyCashSurrender.Find('-') then begin
//                 FromRecRef.GetTable(PettyCashSurrender);
//             end;
//             tableFound := true;
//         end;

//         if tableId = Database::"FIN-Memo Header" then begin
//             MemoHeader.Reset();
//             if MemoHeader.Find('-') then begin
//                 FromRecRef.GetTable(MemoHeader);
//             end;
//             tableFound := true;
//         end;

//         if tableId = Database::"Reimbursement Header" then begin
//             ReimbursmentHeader.Reset();
//             if ReimbursmentHeader.Find('-') then begin
//                 FromRecRef.GetTable(ReimbursmentHeader);
//             end;
//             tableFound := true;
//         end;

//         if tableFound = true then begin
//             if FileName <> '' then begin
//                 Clear(DocAttachment);
//                 DocAttachment.Init();
//                 DocAttachment."File Extension" := FileManagement.GetExtension(FileName);
//                 DocAttachment."File Name" := CopyStr(FileManagement.GetFileNameWithoutExtension(FileName), 1, MaxStrLen(FileName));
//                 DocAttachment.Validate("File Extension", FileManagement.GetExtension(FileName));
//                 DocAttachment.Validate("File Name", CopyStr(FileManagement.GetFileNameWithoutExtension(FileName), 1, MaxStrLen(FileName)));
//                 DocAttachment."Table ID" := FromRecRef.Number;
//                 DocAttachment."No." := retNo;
//                 DocAttachment.Validate("Table ID", FromRecRef.Number);
//                 DocAttachment.Validate("No.", retNo);
//                 Bytes := Convert.FromBase64String(Attachment);
//                 MemoryStream := MemoryStream.MemoryStream(Bytes);
//                 DocAttachment."Document Reference ID".ImportStream(MemoryStream, '', FileName);
//                 DocAttachment.Insert();
//             end;
//         end;
//     end;

//     procedure GetMyAttachments(documentNo: Text) Message: Text
//     begin
//         DocumentAttachment.Reset();
//         DocumentAttachment.SetRange("No.", documentNo);
//         if DocumentAttachment.Find('-') then begin
//             repeat
//                 Message += DocumentAttachment."No." + '::' + DocumentAttachment."File Name" + '::' + DocumentAttachment."File Extension" + '::' + Format(DocumentAttachment.SystemCreatedAt) + '::' + DocumentAttachment.SystemId + '[]';
//             until DocumentAttachment.Next() = 0;
//         end;
//     end;

//     procedure RemoveAttachment(systemId: Text)
//     begin
//         DocumentAttachment.Reset();
//         DocumentAttachment.SetRange(SystemId, systemId);
//         if DocumentAttachment.Find('-') then DocumentAttachment.Delete();
//     end;

//     procedure IsMemoPrn(memoNo: Text) Message: Boolean
//     begin
//         MemoHeader.Reset();
//         MemoHeader.SetRange("No.", memoNo);
//         if MemoHeader.Find('-') then Message := MemoHeader.PRN;
//     end;

//     procedure GetMyImprests(username: Text) Message: Text
//     begin
//         ImprestHeader.Reset();
//         ImprestHeader.SetRange("Account No.", username);
//         if ImprestHeader.Find('-') then begin
//             repeat
//                 Message += ImprestHeader."No." + '::' + Format(ImprestHeader.Date) + '::' + ImprestHeader.Payee + '::' + Format(GetTotalImprestAmount(ImprestHeader."No.")) + '::' + Format(ImprestHeader.Status) + '::' + ImprestHeader."Memo No." + '[]';
//             until ImprestHeader.Next() = 0;
//         end;
//     end;

//     procedure GetTotalImprestAmount(documentNo: Text) Message: Decimal
//     begin
//         ImprestLines.Reset();
//         ImprestLines.SetRange(No, documentNo);
//         if ImprestLines.Find('-') then begin
//             repeat
//                 Message := Message + ImprestLines.Amount;
//             until ImprestLines.Next() = 0;
//         end;
//     end;

//     procedure GetImprestLines(documentNo: Text) Message: Text
//     begin
//         ImprestLines.Reset();
//         ImprestLines.SetRange(No, documentNo);
//         if ImprestLines.Find('-') then begin
//             repeat
//                 Message += ImprestLines."Advance Type" + '::' + ImprestLines."Account No:" + '::' + ImprestLines."Account Name" + '::' + Format(ImprestLines.Amount) + '[]'
//             until ImprestLines.Next() = 0;
//         end;
//     end;

//     procedure GetImprestResponsibilityCenter(imprestNo: Text) Message: Text
//     begin
//         ImprestHeader.Reset();
//         ImprestHeader.SetRange("No.", imprestNo);
//         if ImprestHeader.Find('-') then Message := ImprestHeader."Responsibility Center";
//     end;

//     procedure UpdateImprestHeader(imprestNo: Text; resCenter: Text; amount: Decimal)
//     begin
//         ImprestHeader.Reset();
//         ImprestHeader.SetRange("No.", imprestNo);
//         if ImprestHeader.Find('-') then begin
//             ImprestHeader."Responsibility Center" := resCenter;
//             ImprestHeader."Total Net Amount" := amount;
//             ImprestHeader."Total Net Amount LCY" := amount;
//             ImprestHeader.Modify();

//             if ApprovalMgt.IsImprestEnabled(ImprestHeader) = false then Error('No approval workflow enabled');
//             BudgetCommitment.CommitImprestBudget(imprestNo);
//             ApprovalMgt.OnSendImprestforApproval(ImprestHeader);
//         end;
//     end;

//     procedure OnCancelImprestApprovalRequest(imprestNo: Text)
//     begin
//         ImprestHeader.Reset();
//         ImprestHeader.SetRange("No.", imprestNo);
//         if ImprestHeader.Find('-') then begin
//             BudgetCommitment.CancelImprestCommitment(imprestNo);
//             ApprovalMgt.OnCancelImprestForApproval(ImprestHeader);
//         end;
//     end;

//     procedure GetPostedImprests(username: Text) Message: Text
//     begin
//         ImprestHeader.Reset();
//         ImprestHeader.SetRange("Account No.", username);
//         ImprestHeader.SetRange("Surrender Status", ImprestHeader."Surrender Status"::" ");
//         ImprestHeader.SetRange(Status, ImprestHeader.Status::Posted);
//         if ImprestHeader.Find('-') then begin
//             repeat
//                 Message += ImprestHeader."No." + '::' + Format(ImprestHeader.Date) + '::' + ImprestHeader.Payee + '::' + Format(GetTotalImprestAmount(ImprestHeader."No.")) + '::' + Format(ImprestHeader.Status) + '[]';
//             until ImprestHeader.Next() = 0;
//         end;
//     end;

//     procedure GetMyImprestSurrenders(username: Text) Message: Text
//     begin
//         ImprestSurrenderHeader.Reset();
//         ImprestSurrenderHeader.SetRange("Account No.", username);
//         if ImprestSurrenderHeader.Find('-') then begin
//             repeat
//                 Message += ImprestSurrenderHeader.No + '::' + Format(ImprestSurrenderHeader."Surrender Date") + '::' + ImprestSurrenderHeader.Payee + '::' + Format(GetTotalImprestSurrenderAmount(ImprestSurrenderHeader.No)) + '::' + Format(ImprestSurrenderHeader.Status) + '::' + ImprestSurrenderHeader."Imprest Issue Doc. No" + '[]';
//             until ImprestSurrenderHeader.Next() = 0;
//         end;
//     end;

//     procedure GetTotalImprestSurrenderAmount(surrenderNo: Text) Message: Decimal
//     begin
//         ImprestSurrenderLines.Reset();
//         ImprestSurrenderLines.SetRange("Surrender Doc No.", surrenderNo);
//         if ImprestSurrenderLines.Find('-') then begin
//             repeat
//                 Message := Message + ImprestSurrenderLines.Amount;
//             until ImprestSurrenderLines.Next() = 0;
//         end;
//     end;

//     procedure GetNextImprestSurrenderNo() Message: Text
//     begin
//         CashOfficeSetup.Get();
//         Message := NoSeriesMngnt.GetNextNo(CashOfficeSetup."Imprest Surrender No", 0D, true);
//     end;

//     procedure GetImprestSurrenderResponsibilityCenter(surrenderNo: Text) Message: Text
//     begin
//         ImprestSurrenderHeader.Reset();
//         ImprestSurrenderHeader.SetRange(No, surrenderNo);
//         if ImprestSurrenderHeader.Find('-') then Message := ImprestSurrenderHeader."Responsibility Center";
//     end;

//     procedure CreateImprestSurrenderHeader(surrenderNo: Text; imprestNo: Text; resCenter: Text)
//     begin
//         ImprestHeader.Reset();
//         ImprestHeader.SetRange(ImprestHeader."No.", imprestNo);
//         if ImprestHeader.Find('-') then begin
//             ImprestSurrenderHeader.Reset();
//             ImprestSurrenderHeader.SetRange(No, surrenderNo);
//             if ImprestSurrenderHeader.Find('-') then begin
//                 ImprestSurrenderHeader."Imprest Issue Doc. No" := imprestNo;
//                 ImprestSurrenderHeader."Responsibility Center" := resCenter;
//                 ImprestSurrenderHeader.Modify();
//             end else begin
//                 CashOfficeSetup.Get();
//                 ImprestSurrenderHeader.Init();
//                 ImprestSurrenderHeader.No := surrenderNo;
//                 ImprestSurrenderHeader."Imprest Issue Doc. No" := imprestNo;
//                 ImprestSurrenderHeader."Responsibility Center" := resCenter;
//                 ImprestSurrenderHeader."Surrender Date" := Today();
//                 ImprestSurrenderHeader."Imprest Issue Date" := ImprestHeader."Date Posted";
//                 ImprestSurrenderHeader."User ID" := UserId;
//                 ImprestSurrenderHeader."Received From" := ImprestHeader.Payee;
//                 ImprestSurrenderHeader."On Behalf Of" := ImprestHeader."On Behalf Of";
//                 ImprestSurrenderHeader.Cashier := ImprestHeader.Cashier;
//                 ImprestSurrenderHeader."Account Type" := ImprestSurrenderHeader."Account Type"::Customer;
//                 ImprestSurrenderHeader."Account No." := ImprestHeader."Account No.";
//                 ImprestSurrenderHeader."Account Name" := ImprestHeader.Payee;
//                 ImprestSurrenderHeader."No. Series" := CashOfficeSetup."Imprest Surrender No";
//                 ImprestHeader.CalcFields("Total Net Amount");
//                 ImprestSurrenderHeader.Amount := ImprestHeader."Total Net Amount";
//                 ImprestHeader.CalcFields("Total Net Amount LCY");
//                 ImprestSurrenderHeader."Amount Surrendered LCY" := ImprestHeader."Total Net Amount LCY";
//                 ImprestSurrenderHeader.Payee := ImprestHeader.Payee;
//                 ImprestSurrenderHeader."Global Dimension 1 Code" := ImprestHeader."Global Dimension 1 Code";
//                 ImprestSurrenderHeader."Global Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";
//                 ImprestSurrenderHeader."Shortcut Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";
//                 ImprestSurrenderHeader.Validate("Global Dimension 1 Code");
//                 ImprestSurrenderHeader.Validate("Global Dimension 2 Code");
//                 ImprestSurrenderHeader.Validate("Shortcut Dimension 2 Code");
//                 ImprestSurrenderHeader."No. Series" := CashOfficeSetup."Imprest Surrender No";
//                 ImprestSurrenderHeader.Insert();
//             end;
//             ImprestHeader."Surrender Status" := ImprestHeader."Surrender Status"::Full;
//             ImprestHeader.Modify();
//         end;
//     end;

//     procedure InsertImprestSurrenderLines(documentNo: Text; imprestNo: Text; accountNo: Text; actualSpent: Decimal; receiptNo: Text; amount: Decimal)
//     begin
//         ImprestLines.Reset();
//         ImprestLines.SetRange(ImprestLines.No, imprestNo);
//         ImprestLines.SetRange(ImprestLines."Account No:", accountNo);
//         ImprestLines.SetRange(Amount, amount);
//         IF ImprestLines.Find('-') then begin
//             ImprestSurrenderLines.Reset();
//             ImprestSurrenderLines.SetRange("Surrender Doc No.", documentNo);
//             ImprestSurrenderLines.SetRange("Account No:", accountNo);
//             ImprestSurrenderLines.SetRange(Amount, ImprestLines.Amount);
//             if ImprestSurrenderLines.Find('-') then begin
//                 if receiptNo <> '' then begin
//                     ImprestSurrenderLines."Cash Receipt No" := receiptNo;
//                     ReceiptLines.Reset();
//                     ReceiptLines.SetRange(No, receiptNo);
//                     if ReceiptLines.Find('-') then begin
//                         ImprestSurrenderLines."Cash Receipt Amount" := ReceiptLines.Amount;
//                         ImprestSurrenderLines."Actual Spent" := ImprestLines.Amount - ReceiptLines.Amount;
//                         ImprestSurrenderLines.Amount := ImprestLines.Amount;
//                     end;
//                 end else begin
//                     ImprestSurrenderLines."Actual Spent" := actualSpent;
//                 end;
//                 ImprestSurrenderLines.Modify();
//             end else begin
//                 ImprestSurrenderLines.Init();
//                 ImprestSurrenderLines."Surrender Doc No." := documentNo;
//                 ImprestSurrenderLines."Account No:" := ImprestLines."Account No:";
//                 ImprestSurrenderLines."Imprest Type" := ImprestLines."Advance Type";
//                 ImprestSurrenderLines.Validate(ImprestSurrenderLines."Account No:");
//                 ImprestSurrenderLines."Account Name" := ImprestLines."Account Name";
//                 //ImprestSurrenderLines.Amount := ImprestLines.Amount;
//                 ImprestSurrenderLines."Due Date" := ImprestLines."Due Date";
//                 ImprestSurrenderLines."Imprest Holder" := ImprestLines."Imprest Holder";
//                 ImprestSurrenderLines."Apply to" := ImprestLines."Apply to";
//                 ImprestSurrenderLines."Apply to ID" := ImprestLines."Apply to ID";
//                 ImprestSurrenderLines."Surrender Date" := ImprestLines."Surrender Date";
//                 ImprestSurrenderLines.Surrendered := ImprestLines.Surrendered;
//                 ImprestSurrenderLines."Cash Receipt No" := ImprestLines."M.R. No";
//                 ImprestSurrenderLines."Date Issued" := ImprestLines."Date Issued";
//                 ImprestSurrenderLines."Type of Surrender" := ImprestLines."Type of Surrender";
//                 ImprestSurrenderLines."Dept. Vch. No." := ImprestLines."Dept. Vch. No.";
//                 ImprestSurrenderLines."Currency Factor" := ImprestLines."Currency Factor";
//                 ImprestSurrenderLines."Currency Code" := ImprestLines."Currency Code";
//                 ImprestSurrenderLines."Imprest Req Amt LCY" := ImprestLines."Amount LCY";
//                 ImprestSurrenderLines."Shortcut Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
//                 ImprestSurrenderLines."Shortcut Dimension 2 Code" := ImprestLines."Shortcut Dimension 2 Code";
//                 ImprestSurrenderLines."Shortcut Dimension 3 Code" := ImprestLines."Shortcut Dimension 3 Code";
//                 ImprestSurrenderLines."Shortcut Dimension 4 Code" := ImprestLines."Shortcut Dimension 4 Code";
//                 if receiptNo <> '' then begin
//                     ImprestSurrenderLines."Cash Receipt No" := receiptNo;
//                     ReceiptLines.Reset();
//                     ReceiptLines.SetRange(No, receiptNo);
//                     if ReceiptLines.Find('-') then begin
//                         ImprestSurrenderLines."Cash Receipt Amount" := ReceiptLines.Amount;
//                         ImprestSurrenderLines."Actual Spent" := ImprestLines.Amount - ReceiptLines.Amount;
//                         ImprestSurrenderLines.Amount := ImprestLines.Amount;
//                     end;
//                 end else begin
//                     ImprestSurrenderLines."Actual Spent" := actualSpent;
//                     ImprestSurrenderLines.Amount := actualSpent;
//                 end;
//                 ImprestSurrenderLines.Insert();
//             end;
//         end;
//     end;

//     procedure GetReceiptAmount(receiptNo: Text) Message: Decimal
//     begin
//         ReceiptLines.Reset();
//         ReceiptLines.SetRange(No, receiptNo);
//         if ReceiptLines.Find('-') then Message := ReceiptLines.Amount;
//     end;

//     procedure OnSendImprestSurrenderForApproval(surrenderNo: Text)
//     begin
//         ImprestSurrenderHeader.Reset();
//         ImprestSurrenderHeader.SetRange(No, surrenderNo);
//         if ImprestSurrenderHeader.Find('-') then begin
//             if ApprovalMgt.IsImprestSurrenderEnabled(ImprestSurrenderHeader) = false then Error('No approval workflow enabled');
//             ApprovalMgt.OnSendImprestSurrenderforApproval(ImprestSurrenderHeader);
//         end;
//     end;

//     procedure OnCancelImprestSurrenderApprovalRequest(surrenderNo: Text)
//     begin
//         ImprestSurrenderHeader.Reset();
//         ImprestSurrenderHeader.SetRange(No, surrenderNo);
//         if ImprestSurrenderHeader.Find('-') then begin
//             ApprovalMgt.OnCancelImprestSurrenderforApproval(ImprestSurrenderHeader);
//         end;
//     end;

//     procedure GetImprestReceipts(username: Text) Message: Text
//     var ReceiptLine: Record "FIN-Receipt Line q";
//     begin
//         ReceiptHeader.Reset();
//         ReceiptHeader.SetRange("Received From", username);
//         if ReceiptHeader.Find('-') then begin
//             repeat
//                 ReceiptLine.Reset();
//                 ReceiptLine.SetRange(No, ReceiptHeader."No.");
//                 if ReceiptLine.Find('-') then begin
//                     Message += ReceiptLine.No + '::' + Format(ReceiptLine.Amount) + '[]';
//                 end;
//             until ReceiptHeader.Next() = 0;
//         end;
//     end;

//     procedure GetImprestSurrenderDetails(surrenderNo: Text; accountNo: Text) Message: Text
//     begin
//         ImprestSurrenderLines.Reset();
//         ImprestSurrenderLines.SetRange("Surrender Doc No.", surrenderNo);
//         ImprestSurrenderLines.SetRange("Account No:", accountNo);
//         //ImprestSurrenderLines.SetRange(Amount, amount);
//         if ImprestSurrenderLines.Find('-') then begin
//             Message := ImprestSurrenderLines."Cash Receipt No" + '::' + Format(ImprestSurrenderLines."Actual Spent") + '::' + Format(ImprestSurrenderLines."Cash Receipt Amount");
//         end;
//     end;

//     procedure GetMyClaims(username: Text) Message: Text
//     begin
//         ClaimHeader.Reset();
//         ClaimHeader.SetRange("Account No.", username);
//         if ClaimHeader.Find('-') then begin
//             repeat
//                 Message += ClaimHeader."No." + '::' + Format(ClaimHeader.Date) + '::' + ClaimHeader.Payee + '::' + Format(GetClaimTotalAmount(ClaimHeader."No.")) + '::' + Format(ClaimHeader.Status) + '[]';
//             until ClaimHeader.Next() = 0;
//         end;
//     end;

//     procedure GetClaimTotalAmount(claimNo: Text) Message: Decimal
//     begin
//         ClaimLines.Reset();
//         ClaimLines.SetRange(No, claimNo);
//         if ClaimLines.Find('-') then begin
//             repeat
//                 Message := Message + ClaimLines.Amount;
//             until ClaimLines.Next() = 0;
//         end;
//     end;

//     procedure CreateClaimHeader(username: Text; resCenter: Text; purpose: Text) Message: Text
//     var NextClaimNo: Text;
//     begin
//         ClaimHeader.Init();
//         CashOfficeSetup.Get();
//         NextClaimNo := NoSeriesMngnt.GetNextNo(CashOfficeSetup."Staff Claim No", 0D, true);
//         ClaimHeader."No." := NextClaimNo;
//         ClaimHeader.Date := Today();
//         ClaimHeader."Account No." := username;
//         ClaimHeader.Validate("Account No.");
//         ClaimHeader."Account Type" := ClaimHeader."Account Type"::Customer;
//         ClaimHeader."Responsibility Center" := resCenter;
//         ClaimHeader.Cashier := UserId;
//         ClaimHeader.Purpose := purpose;
//         ClaimHeader."No. Series" := CashOfficeSetup."Staff Claim No";
//         ClaimHeader.Insert();
//         Message := NextClaimNo;
//     end;

//     procedure GetClaimTypes() Message: Text
//     begin
//         ReceiptPaymentTypes.Reset();
//         ReceiptPaymentTypes.SetRange(Type, ReceiptPaymentTypes.Type::Claim);
//         if ReceiptPaymentTypes.Find('-') then begin
//             repeat
//                 Message += ReceiptPaymentTypes.Code + '::' + ReceiptPaymentTypes.Description + '[]';
//             until ReceiptPaymentTypes.Next() = 0;
//         end;
//     end;

//     procedure InsertClaimLines(claimNo: Text; claimType: Text; directorate: Text; department: Text; project: Text; activity: Text; amount: Decimal)
//     begin
//         ClaimHeader.Reset();
//         ClaimHeader.SetRange("No.", claimNo);
//         if ClaimHeader.Find('-') then begin
//             ClaimLines.Reset();
//             ClaimLines.SetRange(No, claimNo);
//             ClaimLines.SetRange("Advance Type", claimType);
//             if not ClaimLines.Find('-') then begin
//                 ClaimLines.Init();
//                 ClaimLines.No := claimNo;
//                 ClaimLines."Advance Type" := claimType;

//                 ReceiptPaymentTypes.Reset();
//                 ReceiptPaymentTypes.SetRange(Code, claimType);
//                 ReceiptPaymentTypes.SetRange(Type, ReceiptPaymentTypes.Type::Claim);
//                 if ReceiptPaymentTypes.Find('-') then begin
//                     ClaimLines."Account No:" := ReceiptPaymentTypes."G/L Account";
//                     ClaimLines.Validate("Account No:");
//                 end;

//                 ClaimLines."Global Dimension 1 Code" := directorate;
//                 ClaimLines."Shortcut Dimension 2 Code" := department;
//                 ClaimLines."Shortcut Dimension 3 Code":= project;
//                 ClaimLines."Shortcut Dimension 4 Code" := activity;
//                 ClaimLines.Amount := amount;
//                 ClaimLines."Amount LCY" := amount;
//                 ClaimLines.Purpose := ClaimHeader.Purpose;
//                 ClaimLines."Imprest Holder" := ClaimHeader."Account No.";
//                 ClaimLines.Insert();
//             end else Error('Claim line with Claim No %1 and Claim Type %2 already exists.', claimNo, claimType);
//         end;
//     end;

//     procedure GetClaimLines(claimNo: Text) Message: Text
//     begin
//         ClaimLines.Reset();
//         ClaimLines.SetRange(No, claimNo);
//         if ClaimLines.Find('-') then begin
//             repeat
//                 Message += ClaimLines."Advance Type" + '::' + ClaimLines."Account No:" + '::' + ClaimLines."Account Name" + '::' + Format(ClaimLines.Amount) + '::' + ClaimLines.SystemId + '[]';
//             until ClaimLines.Next() = 0;
//         end;
//     end;

//     procedure RemoveClaimLine(systemId: Text)
//     begin
//         ClaimLines.Reset();
//         ClaimLines.SetRange(SystemId, systemId);
//         if ClaimLines.Find('-') then ClaimLines.Delete();
//     end;

//     procedure OnSendClaimForApproval(claimNo: Text)
//     begin
//         ClaimHeader.Reset();
//         ClaimHeader.SetRange("No.", claimNo);
//         if ClaimHeader.Find('-') then begin
//             if ApprovalMgt.IsClaimEnabled(ClaimHeader) = false then Error('No approval workflow enabled');
//             BudgetCommitment.CommitClaimBudget(claimNo);
//             ApprovalMgt.OnSendClaimforApproval(ClaimHeader);
//         end;
//     end;

//     procedure CancelClaimApprovalRequest(claimNo: Text)
//     begin
//         ClaimHeader.Reset();
//         ClaimHeader.SetRange("No.", claimNo);
//         if ClaimHeader.Find('-') then begin
//             BudgetCommitment.CancelClaimCommitment(claimNo);
//             ApprovalMgt.OnCancelClaimForApproval(ClaimHeader);
//         end;
//     end;

//     procedure GetStaffPettyCashNo(username: Text) Message: Text
//     begin
//         UserSetup.Reset();
//         UserSetup.SetRange("Employee No.", username);
//         if UserSetup.Find('-') then Message := UserSetup."Staff PettyC No";
//     end;

//     procedure GetMyPettyCashRequests(username: Text) Message: Text
//     begin
//         PettyCashHeader.Reset();
//         PettyCashHeader.SetRange("Account No.", username);
//         if PettyCashHeader.Find('-') then begin
//             repeat
//                 if PettyCashHeader."Account No." <> '' then Message += PettyCashHeader."No." + '::' + Format(PettyCashHeader.Date) + '::' + PettyCashHeader.payee + '::' + Format(GetTotalPettyCashAmount(PettyCashHeader."No.")) + '::' + Format(PettyCashHeader.Status) + '[]';
//             until PettyCashHeader.Next() = 0;
//         end;
//     end;

//     procedure GetTotalPettyCashAmount(pettyCashNo: Text) Message: Decimal
//     begin
//         PettyCashLines.Reset();
//         PettyCashLines.SetRange("Document No.", pettyCashNo);
//         if PettyCashLines.Find('-') then begin
//             repeat
//                 Message := Message + PettyCashLines.Amount;
//             until PettyCashLines.Next() = 0;
//         end;
//     end;

//     procedure CreatePettyCashHeader(accountNo: Text; resCenter: Text; purpose: Text) Message: Text
//     var NextPettyCashNo: Text;
//     begin
//         CashOfficeSetup.Get();
//         NextPettyCashNo := NoSeriesMngnt.GetNextNo(CashOfficeSetup."Advance Petty Cash", 0D, true);
//         PettyCashHeader.Init();
//         PettyCashHeader."No." := NextPettyCashNo;
//         PettyCashHeader.Date := Today();
//         PettyCashHeader."Account Type" := PettyCashHeader."Account Type"::Customer;
//         PettyCashHeader."Account No." := accountNo;
//         PettyCashHeader.Validate("Account No.");
//         PettyCashHeader."Responsibility Center" := resCenter;
//         UserSetup.Reset();
//         UserSetup.SetRange("Staff PettyC No", accountNo);
//         if UserSetup.Find('-') then begin
//             PettyCashHeader.Cashier := UserSetup."User ID";
//         end;
//         PettyCashHeader.Purpose := purpose;
//         PettyCashHeader."No. Series" := CashOfficeSetup."Advance Petty Cash";
//         PettyCashHeader.Insert();
//         Message := NextPettyCashNo;
//     end;

//     procedure GetPettyCashLines(pettyCashNo: Text) Message: Text
//     begin
//         PettyCashLines.Reset();
//         PettyCashLines.SetRange("Document No.", pettyCashNo);
//         if PettyCashLines.Find('-') then begin
//             repeat
//                 Message += PettyCashLines."Advance Type" + '::' + PettyCashLines."Account No." + '::' + PettyCashLines."Account Name" + '::' + Format(PettyCashLines.Amount) + '::' + PettyCashLines.SystemId + '[]';
//             until PettyCashLines.Next() = 0;
//         end;
//     end;

//     procedure HasPendingPettyCash(accountNo: Text) Message: Boolean
//     begin
//         PettyCashHeader.Reset();
//         PettyCashHeader.SetRange("Account No.", accountNo);
//         if PettyCashHeader.Find('-') then begin
//             if PettyCashHeader."Surrender Status" = PettyCashHeader."Surrender Status"::" " then Message := true;
//         end;
//     end;

//     procedure GetPettyCashTypes() Message: Text
//     begin
//         ReceiptPaymentTypes.Reset();
//         ReceiptPaymentTypes.SetRange(Type, ReceiptPaymentTypes.Type::"Petty Cash");
//         if ReceiptPaymentTypes.Find('-') then begin
//             repeat
//                 Message += ReceiptPaymentTypes.Code + '::' + ReceiptPaymentTypes.Description + '[]';
//             until ReceiptPaymentTypes.Next() = 0;
//         end;
//     end;

//     procedure InsertPettyCashLine(pettyCashNo: Text; advanceType: Text; accountNo: Text; directorate: Text; department: Text; project: Text; activity: Text; amount: Decimal)
//     begin
//         PettyCashHeader.Reset();
//         PettyCashHeader.SetRange("No.", pettyCashNo);
//         if PettyCashHeader.Find('-') then begin
//             PettyCashLines.Reset();
//             PettyCashLines.SetRange("Document No.", pettyCashNo);
//             PettyCashLines.SetRange("Advance Type", advanceType);
//             PettyCashLines.SetRange("Account No.", accountNo);
//             if not PettyCashLines.Find('-') then begin
//                 PettyCashLines.Init();
//                 PettyCashLines."Document No." := PettyCashHeader."No.";
//                 PettyCashLines."Advance Type" := advanceType;
//                 PettyCashLines."Gloabl Dimension 1 Code" := directorate;
//                 PettyCashLines."Global Dimension 2 Code" := department;
//                 PettyCashLines."Shortcut Dimension 3 Code" := project;
//                 PettyCashLines."Shortcut Dimension 4 Code" := activity;
//                 PettyCashLines.Amount := amount;
//                 PettyCashLines.Purpose := PettyCashHeader.Purpose;
//                 PettyCashLines."Account No." := accountNo;
//                 PettyCashLines.Validate("Account No.");
//                 PettyCashLines.Insert();
//             end else Error('Petty cash line with advance type %1 and account no %2 already exxist.', advanceType, accountNo);
//         end;
//     end;

//     procedure RemovePettyCashLine(systemId: Text)
//     begin
//         PettyCashLines.Reset();
//         PettyCashLines.SetRange(SystemId, systemId);
//         if PettyCashLines.Find('-') then PettyCashLines.Delete();
//     end;

//     procedure OnSendPettyCashForApproval(pettyCashNo: Text)
//     begin
//         PettyCashHeader.Reset();
//         PettyCashHeader.SetRange("No.", pettyCashNo);
//         if PettyCashHeader.Find('-') then begin
//             if ApprovalMgt.IsPettyCashEnabled(PettyCashHeader) = false then Error('No approval workflow enabled');
//             BudgetCommitment.CommitPettyCashBudget(pettyCashNo);
//             ApprovalMgt.OnSendPettyCashforApproval(PettyCashHeader);
//         end;
//     end;

//     procedure OnCancelPettyCashApprovalRequest(pettyCashNo: Text)
//     begin
//         PettyCashHeader.Reset();
//         PettyCashHeader.SetRange("No.", pettyCashNo);
//         if PettyCashHeader.Find('-') then begin
//             BudgetCommitment.CancelPettyCashCommitment(pettyCashNo);
//             ApprovalMgt.OnCancelPettyCashForApproval(PettyCashHeader);
//         end;
//     end;

//     procedure GetMyPettyCashSurrenders(username: Text) Message: Text
//     begin
//         PettyCashSurrenderHeader.Reset();
//         PettyCashSurrenderHeader.SetRange("Account No.", username);
//         if PettyCashSurrenderHeader.Find('-') then begin
//             repeat
//                 Message += PettyCashSurrenderHeader."No." + '::' + PettyCashSurrenderHeader."Advance No." + '::' + Format(PettyCashSurrenderHeader."Surrender Date") + '::' + PettyCashSurrenderHeader.Payee + '::' + Format(GetTotalPettyCashSurrenderAmount(PettyCashSurrenderHeader."No.")) + '::' + Format(PettyCashSurrenderHeader.Status) + '[]';
//             until PettyCashSurrenderHeader.Next() = 0;
//         end;
//     end;

//     procedure GetTotalPettyCashSurrenderAmount(surrenderNo: Text) Message: Decimal
//     begin
//         PettyCashSurrenderLines.Reset();
//         PettyCashSurrenderLines.SetRange("Surrender No.", surrenderNo);
//         if PettyCashSurrenderLines.Find('-') then begin
//             repeat
//                 Message := Message + PettyCashSurrenderLines.Amount;
//             until PettyCashSurrenderLines.Next() = 0;
//         end;
//     end;

//     procedure GetPettyCashReceipts(username: Text) Message: Text
//     begin
//         ReceiptHeader.Reset();
//         ReceiptHeader.SetRange("Received From", username);
//         if ReceiptHeader.Find('-') then begin
//             repeat
//                 Message += ReceiptHeader."No." + '::';
//             until ReceiptHeader.Next() = 0;
//         end;
//     end;

//     procedure GetPettyCashSurrenderLines(surrenderNo: Text) Message: Text
//     begin
//         PettyCashSurrenderLines.Reset();
//         PettyCashSurrenderLines.SetRange("Surrender No.", surrenderNo);
//         if PettyCashSurrenderLines.Find('-') then begin
//             repeat
//                 Message += PettyCashSurrenderLines."Account No." + '::' + PettyCashSurrenderLines."Account Name" + '::' + Format(PettyCashSurrenderLines.Amount) + '[]';
//             until PettyCashSurrenderLines.Next() = 0;
//         end;
//     end;

//     procedure GetPettyCashSurrenderDetails(surrenderNo: Text; accountNo: Text) Message: Text
//     begin
//         PettyCashSurrenderLines.Reset();
//         PettyCashSurrenderLines.SetRange("Surrender No.", surrenderNo);
//         PettyCashSurrenderLines.SetRange("Account No.", accountNo);
//         if PettyCashSurrenderLines.Find('-') then begin
//             Message += Format(PettyCashSurrenderLines."Actual Spent") + '::' + Format(PettyCashSurrenderLines."Cash Receipt Amount") + '::' + PettyCashSurrenderLines."Cash Receipt No";
//         end;
//     end;

//     procedure UpdatePettyCashHeader(pettyCashNo: Text)
//     begin
//         PettyCashHeader.Reset();
//         PettyCashHeader.SetRange("No.", pettyCashNo);
//         if PettyCashHeader.Find('-') then begin
//             PettyCashHeader."Surrender Status" := PettyCashHeader."Surrender Status"::Full;
//             PettyCashHeader.Modify();
//         end;
//     end;

//     procedure UpdatePettyCashSurrenderHeader(surrenderNo: Text; resCenter: Text)
//     begin
//         PettyCashSurrenderHeader.Reset();
//         PettyCashSurrenderHeader.SetRange("No.", surrenderNo);
//         if PettyCashSurrenderHeader.Find('-') then begin
//             PettyCashSurrenderHeader."Responsibility Center" := resCenter;
//             PettyCashSurrenderHeader.Modify();
//         end;
//     end;

//     procedure UpdatePettyCashSurrenderLines(pettyCashNo: Text; accountNo: Text; actualSpent: Decimal; cashReturned: Decimal; receiptNo: Text)
//     begin
//         PettyCashSurrenderLines.Reset();
//         PettyCashSurrenderLines.SetRange("Surrender No.", pettyCashNo);
//         PettyCashSurrenderLines.SetRange("Account No.", accountNo);
//         if PettyCashSurrenderLines.Find('-') then begin
//             PettyCashSurrenderLines."Actual Spent" := actualSpent;
//             PettyCashSurrenderLines."Cash Receipt Amount" := cashReturned;
//             PettyCashSurrenderLines."Cash Receipt No" := receiptNo;
//             PettyCashSurrenderLines.Modify();
//         end;
//     end;

//     procedure OnSendPettyCashSurrenderForApproval(surrenderNo: Text)
//     begin
//         PettyCashSurrenderHeader.Reset();
//         PettyCashSurrenderHeader.SetRange("No.", surrenderNo);
//         if PettyCashSurrenderHeader.Find('-') then begin
//             if ApprovalMgt.IsPettyCashSurrenderEnabled(PettyCashSurrenderHeader) = false then Error('No approval workflow enabled');
//             ApprovalMgt.OnSendPettyCashSurrenderforApproval(PettyCashSurrenderHeader);
//         end;
//     end;

//     procedure OnCancelPettyCashSurrenderApprovalRequest(surrenderNo: Text)
//     begin
//         PettyCashSurrenderHeader.Reset();
//         PettyCashSurrenderHeader.SetRange("No.", surrenderNo);
//         if PettyCashSurrenderHeader.Find('-') then begin
//             ApprovalMgt.OnCancelPettyCashSurrenderForApproval(PettyCashSurrenderHeader);
//         end;
//     end;

//     procedure GetMyStoresRequests(username: Text) Message: Text
//     begin
//         StoreHeader.Reset();
//         StoreHeader.SetRange("Requester ID", username);
//         if StoreHeader.Find('-') then begin
//             repeat
//                 Message += StoreHeader."No." + '::' + Format(StoreHeader."Request date") + '::' + Format(StoreHeader."Requisition Type") + '::' + StoreHeader."Request Description" + '::' + Format(StoreHeader.Status) + '[]';
//             until StoreHeader.Next() = 0;
//         end;
//     end;

//     procedure CreateStoreRequisitionHeader(username: Text; requiredDate: Date; issuingStore: Text; resCenter: Text; description: Text) Message: Text
//     var NextStoreNo: Text;
//     begin
//         StoreHeader.Init();
//         PurchasePayables.Get();
//         NextStoreNo := NoSeriesMngnt.GetNextNo(PurchasePayables."Stores Requisition No", 0D, true);
//         StoreHeader."No." := NextStoreNo;
//         StoreHeader."Request date" := Today();
//         StoreHeader."Responsibility Center" := resCenter;
//         StoreHeader."Required Date" := requiredDate;
//         StoreHeader."Request Description" := description;
//         StoreHeader."Requester ID" := username;
//         StoreHeader."Issuing Store" := issuingStore;        
//         StoreHeader."Requester ID" := username;
//         StoreHeader."No. Series" := PurchasePayables."Stores Requisition No";

//         EmployeeCard.Reset();
//         EmployeeCard.SetRange("No.", username);
//         if EmployeeCard.Find('-') then begin
//             StoreHeader."Global Dimension 1 Code" := EmployeeCard."Global Dimension 1 Code";
//             StoreHeader."Shortcut Dimension 2 Code" := EmployeeCard."Global Dimension 2 Code";
//             StoreHeader."User ID" := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
//         end;
//         StoreHeader.Insert();
//         Message := NextStoreNo;
//     end;

//     procedure GetMyStoreLines(requisitionNo: Text) Message: Text
//     begin
//         StoreLines.Reset();
//         StoreLines.SetRange("Requistion No", requisitionNo);
//         if StoreLines.Find('-') then begin
//             repeat
//                 Message += Format(StoreLines.Type) + '::' + StoreLines."No." + '::' + StoreLines.Description + '::' + Format(StoreLines."Quantity Requested") + '::' + StoreLines.SystemId + '[]';
//             until StoreLines.Next() = 0;
//         end;
//     end;

//     procedure InsertStoreRequisitionLine(requisitionNo: Text; type: Integer; itemNo: Text; quantity: Decimal; issuingStore: Text)
//     begin
//         StoreHeader.Reset();
//         StoreHeader.SetRange("No.", requisitionNo);
//         if StoreHeader.Find('-') then begin
//             StoreLines.Reset();
//             StoreLines.SetRange("Requistion No", requisitionNo);
//             StoreLines.SetRange("No.", itemNo);
//             if not StoreLines.Find('-') then begin
//                 StoreLines.Init();
//                 StoreLines."Requistion No" := requisitionNo;
//                 StoreLines.Type := type;
//                 StoreLines."No." := itemNo;
//                 StoreLines.Quantity := quantity;
//                 StoreLines."Quantity Requested" := quantity;
//                 StoreLines."Issuing Store" := issuingStore;
//                 StoreLines."Quantity To Issue" := quantity;
//                 StoreLines."Shortcut Dimension 1 Code" := StoreHeader."Global Dimension 1 Code";
//                 StoreLines."Shortcut Dimension 2 Code" := StoreHeader."Shortcut Dimension 2 Code";
//                 StoreLines."Qty in store" := GetQuantityInStore(itemNo) - quantity;

//                 if type = 1 then begin
//                     ItemCard.Reset();
//                     ItemCard.SetRange("No.", itemNo);
//                     if ItemCard.Find('-') then begin
//                         StoreLines.Description := ItemCard.Description;
//                         StoreLines."Description 2" := ItemCard."Description 2";
//                         StoreLines."Unit of Measure" := ItemCard."Base Unit of Measure";
//                         StoreLines."Unit Cost" := ItemCard."Unit Cost";
//                     end;
//                 end else begin
//                     FixedAssets.Reset();
//                     FixedAssets.SetRange("No.", itemNo);
//                     if FixedAssets.Find('-') then begin
//                         StoreLines.Description := FixedAssets.Description;
//                         StoreLines."Description 2" := FixedAssets."Description 2";
//                     end;
//                 end;
//                 StoreLines.Insert();
//             end else begin
//                 Error('Record with requisition %1 and Item %2 already exists. Please select a different item',requisitionNo, itemNo);
//             end;
//         end;
//     end;

//     procedure GetQuantityInStore(itemNo: Text) Message: Decimal
//     begin
//         ItemLedgerEntry.Reset();
//         ItemLedgerEntry.SetRange("Item No.", itemNo);
//         if ItemLedgerEntry.Find('-') then begin
//             repeat
//                 Message := Message + ItemLedgerEntry.Quantity;
//             until ItemLedgerEntry.Next() = 0;
//         end;
//     end;

//     procedure DeleteStoreLine(systemId: Text) Message: Boolean
//     begin
//         StoreLines.Reset();
//         StoreLines.SetRange(SystemId, systemId);
//         if StoreLines.Find('-') then begin
//             if StoreLines.Delete() then Message := true;
//         end;
//     end;

//     procedure OnSendSRNForSApproval(storeNo: Text)
//     begin
//         StoreHeader.Reset();
//         StoreHeader.SetRange("No.", storeNo);
//         if StoreHeader.Find('-') then begin
//             if ApprovalMgt.IsStoreRequisitionEnabled(StoreHeader) = false then Error('No approval workflow enabled')
//             else ApprovalMgt.OnSendStoreRequisitionforApproval(StoreHeader);
//         end;
//     end;

//     procedure OnCancelSRNApprovalRequest(storeNo: Text)
//     begin
//         StoreHeader.Reset();
//         StoreHeader.SetRange("No.", storeNo);
//         if StoreHeader.Find('-') then begin
//             ApprovalMgt.OnCancelStoreRequisitionForApproval(StoreHeader);
//         end;
//     end;

//     procedure GetReimbursmentListing(username: Text) Message: Text
//     begin
//         ReimbursmentHeader.Reset();
//         ReimbursmentHeader.SetRange("Account No", username);
//         if ReimbursmentHeader.Find('-') then begin
//             repeat
//                 Message += ReimbursmentHeader."No." + '::' + Format(ReimbursmentHeader.Date) + '::' + ReimbursmentHeader."Account Name" + '::' + Format(GetReimbursmentAmount(ReimbursmentHeader."No.")) + '::' + Format(ReimbursmentHeader.Status) + '[]';
//             until ReimbursmentHeader.Next() = 0;
//         end
//     end;

//     procedure GetReimbursmentAmount(reimbursmentNo: Text) Message: Decimal
//     begin
//         ReimbursmentLines.Reset();
//         ReimbursmentLines.SetRange("No.", reimbursmentNo);
//         if ReimbursmentLines.Find('-') then begin
//             repeat
//                 Message := Message + ReimbursmentLines.Amount;
//             until ReimbursmentLines.Next() = 0;
//         end;
//     end;

//     procedure GetPettyCashToReimburse(pettyCashNo: Text) Message: Text
//     begin
//         PettyCashHeader.Reset();
//         PettyCashHeader.SetRange("Account No.", pettyCashNo);
//         PettyCashHeader.SetRange(Status, PettyCashHeader.Status::Posted);
//         if PettyCashHeader.Find('-') then begin
//             repeat
//                 if PettyCashHeader."Surrender Status" = PettyCashHeader."Surrender Status"::" " then Message += PettyCashHeader."No." + '::';
//             until PettyCashHeader.Next() = 0;
//         end;
//     end;

//     procedure CreatePettyCashReimbursmentHeader(username: Text; pettyCashNo: Text; resCenter: Text; pettyCashDoc: Text) Message: Text
//     var NextReimburamentNo: Text;
//     begin
//         CashOfficeSetup.Get();
//         NextReimburamentNo := NoSeriesMngnt.GetNextNo(CashOfficeSetup."Disbursement Nos,", 0D, true);
//         ReimbursmentHeader.Init();;
//         ReimbursmentHeader."No." := NextReimburamentNo;
//         ReimbursmentHeader.Date := Today();
//         ReimbursmentHeader."Account No" := pettyCashNo;
//         ReimbursmentHeader.Validate("Account No");
//         ReimbursmentHeader."Responsibility Centre" := resCenter;
//         ReimbursmentHeader."Petty Cash Doc" := pettyCashDoc;
//         UserSetup.Reset();
//         UserSetup.SetRange("Employee No.", username);
//         if UserSetup.Find('-') then ReimbursmentHeader."Requested By" := UserSetup."User ID";
//         ReimbursmentHeader.Insert();
//         Message := NextReimburamentNo;
//     end;

//     procedure GetReimbursmentLines(reimbursmentNo: Text) Message: Text
//     begin
//         ReimbursmentLines.Reset();
//         ReimbursmentLines.SetRange("No.", reimbursmentNo);
//         if ReimbursmentLines.Find('-') then begin
//             repeat
//                 Message += ReimbursmentLines."Advance Type" + '::' + ReimbursmentLines.Vote + '::' + ReimbursmentLines."Vote Name" + '::' + Format(ReimbursmentLines.Amount) + '::' + ReimbursmentLines.SystemId + '[]';
//             until ReimbursmentLines.Next() = 0;
//         end;
//     end;

//     procedure InsertReimbursmentLine(reimbursmentNo: Text; advanceType: Text; vote: Text; directorate: Text; department: Text; project: Text; activity: Text; amount: Decimal; purpose: Text)
//     begin
//         ReimbursmentLines.Reset();
//         ReimbursmentLines.SetRange("No.", reimbursmentNo);
//         ReimbursmentLines.SetRange(Vote, vote);
//         if not ReimbursmentLines.Find('-') then begin
//             ReimbursmentLines.Init();
//             ReimbursmentLines."No." := reimbursmentNo;
//             ReimbursmentLines."Advance Type" := advanceType;
//             ReimbursmentLines.Vote := vote;
//             ReimbursmentLines.Validate(Vote);
//             ReimbursmentLines."Global Dimension 1" := directorate;
//             ReimbursmentLines."Global Dimension 2" := department;
//             ReimbursmentLines."Global Dimension 3" := project;
//             ReimbursmentLines."Global Dimension 4" := activity;
//             ReimbursmentLines.Amount := amount;
//             ReimbursmentLines.Purpose := purpose;
//             ReimbursmentLines.Insert();
//         end else Error('Reimbursment line with No %1 and Vote %2 already exists',reimbursmentNo,vote);
//     end;

//     procedure RemovePettyCashReimbursmentLine(systemId: Text)
//     begin
//         ReimbursmentLines.Reset();
//         ReimbursmentLines.SetRange(SystemId, systemId);
//         if ReimbursmentLines.Find('-') then ReimbursmentLines.Delete();
//     end;

//     procedure OnSendPettyCashReimbursmentForApproval(reimbursmentNo: Text)
//     begin
//         ReimbursmentHeader.Reset();
//         ReimbursmentHeader.SetRange("No.", reimbursmentNo);
//         if ReimbursmentHeader.Find('-') then begin
//             if ApprovalMgt.IsReimbursementEnabled(ReimbursmentHeader) = false then Error('No approval workflow enabled');
//             ApprovalMgt.OnSendReimbursementforApproval(ReimbursmentHeader);
//         end;
//     end;

//     procedure OnCancellPettyCashReimbursmentForApproval(reimbursmentNo: Text)
//     begin
//         ReimbursmentHeader.Reset();
//         ReimbursmentHeader.SetRange("No.", reimbursmentNo);
//         if ReimbursmentHeader.Find('-') then begin
//             ApprovalMgt.OnCancelReimbursementForApproval(ReimbursmentHeader);
//         end;
//     end;

//     procedure GetMyLeaveRequests(username: Text) Message: Text
//     begin
//         LeaveRequisition.Reset();
//         LeaveRequisition.SetRange("Employee No", username);
//         if LeaveRequisition.Find('-') then begin
//             repeat
//                 Message += LeaveRequisition."No." + '::' + Format(LeaveRequisition.Date) + '::' + Format(LeaveRequisition."Applied Days") + '::' + Format(LeaveRequisition."Starting Date") + '::' + Format(LeaveRequisition."End Date") + '::' + Format(LeaveRequisition."Return Date") + '::' + LeaveRequisition."Leave Type" + '::' + Format(LeaveRequisition.Status) + '[]';
//             until LeaveRequisition.Next() = 0;
//         end;
//     end;

//     procedure GetLeaveTypes(gender: Text) Message: Text
//     begin
//         if gender = 'Male' then begin
//             LeaveTypes.Reset();
//             LeaveTypes.SetFilter(LeaveTypes.Code, '<>%1', '');
//             if LeaveTypes.Find('-') then begin
//                 repeat
//                     if (LeaveTypes.Gender = LeaveTypes.Gender::Both) or (LeaveTypes.Gender = LeaveTypes.Gender::Male) then Message += LeaveTypes.Code + '::' + LeaveTypes.Description + '[]';
//                 until LeaveTypes.Next() = 0;
//             end
//         end else begin
//             LeaveTypes.Reset();
//             LeaveTypes.SetFilter(LeaveTypes.Code, '<>%1', '');
//             if LeaveTypes.Find('-') then begin
//                 repeat
//                     if (LeaveTypes.Gender = LeaveTypes.Gender::Both) or (LeaveTypes.Gender = LeaveTypes.Gender::Female) then Message += LeaveTypes.Code + '::' + LeaveTypes.Description + '[]';
//                 until LeaveTypes.Next() = 0;
//             end
//         end;
//     end;

//     procedure CalcReturnDate(EndDate: Date; "Leave Type": Text) RDate: Date
//     begin
//         IF LeaveTypes.GET("Leave Type") THEN BEGIN
//         END;
//         RDate := EndDate + 1;
//         WHILE DetermineIfIsNonWorking(RDate, "Leave Type") = TRUE DO BEGIN
//             RDate := RDate + 1;
//         END;
//     end;

//     procedure ValidateStartDate("Starting Date": Date) Msg: Text
//     begin
//         dates.Reset();
//         dates.SETRANGE(dates."Period Start", "Starting Date");
//         dates.SETFILTER(dates."Period Type", '=%1', dates."Period Type"::Date);
//         IF dates.FIND('-') THEN
//             IF ((dates."Period Name" = 'Sunday') OR (dates."Period Name" = 'Saturday')) THEN BEGIN
//                 IF (dates."Period Name" = 'Sunday') THEN
//                     Msg := 'You can not start your leave on a Sunday'
//                 ELSE
//                     IF (dates."Period Name" = 'Saturday') THEN Msg := 'You can not start your leave on a Saturday'
//             END;

//         BaseCalendar.Reset();
//         BaseCalendar.SETFILTER(BaseCalendar."Base Calendar Code", HRSetup."Base Calendar");
//         BaseCalendar.SETRANGE(BaseCalendar.Date, "Starting Date");
//         IF BaseCalendar.FIND('-') THEN BEGIN
//             REPEAT
//                 IF BaseCalendar.Nonworking = TRUE THEN BEGIN
//                     IF BaseCalendar.Description <> '' THEN
//                         Msg := 'You can not start your Leave on a Holiday - ''' + BaseCalendar.Description + ''''
//                     ELSE
//                         Msg := 'You can not start your Leave on a Holiday';
//                 END;
//             UNTIL BaseCalendar.NEXT = 0;
//         END;

//         // For Annual Holidays
//         BaseCalendar.Reset();
//         BaseCalendar.SETFILTER(BaseCalendar."Base Calendar Code", HRSetup."Base Calendar");
//         BaseCalendar.SETRANGE(BaseCalendar."Recurring System", BaseCalendar."Recurring System"::"Annual Recurring");
//         IF BaseCalendar.FIND('-') THEN BEGIN
//             REPEAT
//                 IF ((DATE2DMY("Starting Date", 1) = BaseCalendar."Date Day") AND (DATE2DMY("Starting Date", 2) = BaseCalendar."Date Month")) THEN BEGIN
//                     IF BaseCalendar.Nonworking = TRUE THEN BEGIN
//                         IF BaseCalendar.Description <> '' THEN
//                             Msg := 'You can not start your Leave on a Holiday - ''' + BaseCalendar.Description + ''''
//                         ELSE
//                             Msg := 'You can not start your Leave on a Holiday';
//                     END;
//                 END;
//             UNTIL BaseCalendar.NEXT = 0;
//         END;
//     end;

//     procedure CalcEndDate(SDate: Date; LDays: Integer; "Leave Type": Text) LEndDate: Date
//     begin
//         SDate := SDate;
//         EndLeave := FALSE;
//         DayCount := 1;
//         WHILE EndLeave = FALSE DO BEGIN
//             IF NOT DetermineIfIsNonWorking(SDate, "Leave Type") THEN
//                 DayCount := DayCount + 1;
//             SDate := SDate + 1;
//             IF DayCount > LDays THEN
//                 EndLeave := TRUE;
//         END;
//         LEndDate := SDate - 1;

//         WHILE DetermineIfIsNonWorking(LEndDate, "Leave Type") = TRUE DO BEGIN
//             LEndDate := LEndDate + 1;
//         END;
//     end;

//     procedure DetermineIfIsNonWorking(VAR bcDate: Date; VAR "Leave Type": Text) ItsNonWorking: Boolean
//     begin
//         CLEAR(ItsNonWorking);
//         HRSetup.FIND('-');
//         //One off Hollidays like Good Friday
//         BaseCalendar.Reset();
//         BaseCalendar.SETFILTER(BaseCalendar."Base Calendar Code", HRSetup."Base Calendar");
//         BaseCalendar.SETRANGE(BaseCalendar.Date, bcDate);
//         IF BaseCalendar.FIND('-') THEN BEGIN
//             IF BaseCalendar.Nonworking = TRUE THEN
//                 ItsNonWorking := TRUE;
//         END;

//         // For Annual Holidays
//         BaseCalendar.Reset();
//         BaseCalendar.SETFILTER(BaseCalendar."Base Calendar Code", HRSetup."Base Calendar");
//         BaseCalendar.SETRANGE(BaseCalendar."Recurring System", BaseCalendar."Recurring System"::"Annual Recurring");
//         IF BaseCalendar.FIND('-') THEN BEGIN
//             REPEAT
//                 IF ((DATE2DMY(bcDate, 1) = BaseCalendar."Date Day") AND (DATE2DMY(bcDate, 2) = BaseCalendar."Date Month")) THEN BEGIN
//                     IF BaseCalendar.Nonworking = TRUE THEN
//                         ItsNonWorking := TRUE;
//                 END;
//             UNTIL BaseCalendar.NEXT = 0;
//         END;
//         IF ItsNonWorking = FALSE THEN BEGIN
//             // Check if its a weekend
//             dates.Reset();
//             dates.SETRANGE(dates."Period Type", dates."Period Type"::Date);
//             dates.SETRANGE(dates."Period Start", bcDate);
//             IF dates.FIND('-') THEN BEGIN
//                 //if date is a sunday
//                 IF dates."Period Name" = 'Sunday' THEN BEGIN
//                     //check if Leave includes sunday
//                     LeaveTypes.Reset();
//                     LeaveTypes.SETRANGE(LeaveTypes.Code, "Leave Type");
//                     IF LeaveTypes.FIND('-') THEN BEGIN
//                         IF LeaveTypes."Inclusive of Sunday" = FALSE THEN ItsNonWorking := TRUE;
//                     END;
//                 END ELSE
//                     IF dates."Period Name" = 'Saturday' THEN BEGIN
//                         //check if Leave includes sato
//                         LeaveTypes.Reset();
//                         LeaveTypes.SETRANGE(LeaveTypes.Code, "Leave Type");
//                         IF LeaveTypes.FIND('-') THEN BEGIN
//                             IF LeaveTypes."Inclusive of Saturday" = FALSE THEN ItsNonWorking := TRUE;
//                         END;
//                     END;

//             END;
//         END;
//     end;

//     procedure DetermineLeaveReturnDate(fBeginDate: Date; fDays: Decimal; "Leave Type": Text) fReturnDate: Date
//     begin
//         LeaveTypes.Reset();
//         IF LeaveTypes.GET("Leave Type") THEN BEGIN
//         END;
//         varDaysApplied := fDays;
//         fReturnDate := fBeginDate;
//         REPEAT
//             IF DetermineIfIncludesNonWorking("Leave Type") = FALSE THEN BEGIN
//                 fReturnDate := CALCDATE('1D', fReturnDate);
//                 IF DetermineIfIsNonWorking(fReturnDate, "Leave Type") THEN BEGIN
//                     varDaysApplied := varDaysApplied + 1;
//                 END ELSE
//                     varDaysApplied := varDaysApplied;
//                 varDaysApplied := varDaysApplied + 1
//             END
//             ELSE BEGIN
//                 fReturnDate := CALCDATE('1D', fReturnDate);
//                 varDaysApplied := varDaysApplied - 1;
//             END;
//         UNTIL varDaysApplied = 0;
//         EXIT(fReturnDate);
//     end;

//     procedure DetermineIfIncludesNonWorking(VAR fLeaveCode: Text): Boolean
//     begin
//         IF LeaveTypes.GET(fLeaveCode) THEN BEGIN
//             IF LeaveTypes."Inclusive of Non Working Days" = TRUE THEN
//                 EXIT(TRUE);
//         END;
//     end;

//     procedure HasPendingLeaveApplication(username: Text) Message: Boolean
//     begin
//         LeaveRequisition.Reset();
//         LeaveRequisition.SetRange(LeaveRequisition."Employee No", username);
//         LeaveRequisition.SetRange(LeaveRequisition.Status, LeaveRequisition.Status::"Pending Approval");
//         if LeaveRequisition.Find('-') then begin
//             Message := true;
//         end;
//     end;

//     procedure DefaultDays(leaveType: Text) Message: Text
//     begin
//         LeaveTypes.Reset();
//         LeaveTypes.SetRange(LeaveTypes.Code, leaveType);
//         if LeaveTypes.Find('-') then begin
//             Message := Format(LeaveTypes.Days);
//         end;
//     end;

//     procedure AvailableLeaveDays(username: Text; leaveType: Text) Message: Text
//     var
//         Year: Code[20];
//     begin
//         HRMLeavePeriod.Reset();
//         HRMLeavePeriod.SetRange(HRMLeavePeriod.Current, true);
//         HRMLeavePeriod.SetRange(HRMLeavePeriod.Closed, false);
//         if HRMLeavePeriod.Find('-') then begin
//             HRMLeaveLedger.Reset();
//             HRMLeaveLedger.SetRange(HRMLeaveLedger."Employee No", username);
//             HRMLeaveLedger.SetRange(HRMLeaveLedger."Leave Type", leaveType);
//             HRMLeaveLedger.SetRange(HRMLeaveLedger."Current Leave Period", HRMLeavePeriod.Year);
//             if HRMLeaveLedger.Find('-') then begin
//                 Clear(availableDays);
//                 repeat
//                     availableDays := availableDays + HRMLeaveLedger."No. of Days";
//                 until HRMLeaveLedger.Next() = 0;
//             end;
//             Message := Format(availableDays);
//         end;
//     end;

//     procedure HRMLeaveApplication(username: Text; reliever: Text; leaveType: Text; appliedDays: Decimal; startDate: Date; endDate: Date; returnDate: Date; purpose: Text; responsibilityCenter: Text; leaveBalance: Decimal) Message: Text
//     var
//         NextLeaveNo: Text;
//     begin
//         HRSetup.Get();
//         NextLeaveNo := NoSeriesMngnt.GetNextNo(HRSetup."Leave Application Nos.", 0D, true);
//         LeaveRequisition.Init();
//         LeaveRequisition."No." := NextLeaveNo;
//         LeaveRequisition.Date := Today();
//         LeaveRequisition."No. Series" := HRSetup."Leave Application Nos.";
//         LeaveRequisition."Employee No" := username;
//         LeaveRequisition.Validate("Employee No");
//         LeaveRequisition."Reliever No." := reliever;
//         LeaveRequisition."Leave Type" := leaveType;
//         LeaveRequisition."Applied Days" := appliedDays;
//         LeaveRequisition."Starting Date" := startDate;
//         // LeaveRequisition."End Date" := endDate;
//         // LeaveRequisition."Return Date" := returnDate;
//         LeaveRequisition.Validate("Starting Date");
//         LeaveRequisition.Purpose := purpose;
//         LeaveRequisition."Responsibility Center" := responsibilityCenter;
//         LeaveRequisition."User ID" := UserId;
//         LeaveRequisition."No. Series" := HRSetup."Leave Application Nos.";
//         LeaveRequisition."Leave Balance" := leaveBalance;

//         EmployeeCard.Reset();
//         EmployeeCard.SetRange(EmployeeCard."No.", reliever);
//         if EmployeeCard.Find('-') then begin
//             LeaveRequisition."Reliever Name" := EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
//         end;

//         EmployeeCard.Reset();
//         EmployeeCard.SetRange(EmployeeCard."No.", username);
//         if EmployeeCard.Find('-') then begin
//             LeaveRequisition."Global Dimension 1 Code" := EmployeeCard."Global Dimension 1 Code";
//             LeaveRequisition."Global Dimension 2 Code" := EmployeeCard."Global Dimension 2 Code";
//         end;

//        LeaveRequisition.Insert();
//        Message := NextLeaveNo;
//     end;

//     procedure OnsendLeaveRequisitionForApproval(leaveNo: Text) Message: Text
//     begin
//         LeaveRequisition.Reset();
//         LeaveRequisition.SetRange(LeaveRequisition."No.", leaveNo);
//         if LeaveRequisition.Find('-') then begin
//             if ApprovalMgt2.IsLeaveRequisitionEnabled(LeaveRequisition) = false then Error('No approval workflow enabled!');
//             ApprovalMgt2.OnSendLeaveRequisitionforApproval(LeaveRequisition);
//         end;
//     end;

//     procedure OnCancelLeaveApplication(leaveNo: Text) Message: Text
//     begin
//         LeaveRequisition.Reset();
//         LeaveRequisition.SetRange(LeaveRequisition."No.", leaveNo);
//         if LeaveRequisition.Find('-') then begin
//             ApprovalMgt2.OnCancelSendLeaveRequisitionforApproval(LeaveRequisition);
//         end;
//     end;

//     procedure GetLeaveDetails(leaveNo: Text) Message: Text
//     begin
//         LeaveRequisition.Reset();
//         LeaveRequisition.SetRange("No.", leaveNo);
//         if LeaveRequisition.Find('-') then begin
//             Message := LeaveRequisition."No." + '::' + LeaveRequisition."Employee Name" + '::' + LeaveRequisition."Leave Type" + '::' + Format(LeaveRequisition."Applied Days") + '::' + Format(LeaveRequisition."Starting Date") + '::' + Format(LeaveRequisition."End Date") + '::' + Format(LeaveRequisition."Return Date") + '::' + LeaveRequisition.Purpose;
//         end;
//     end;
//     procedure GetRelieverDetails(relieverNo: Text) Message: Text
//     begin
//         EmployeeCard.Reset();
//         EmployeeCard.SetRange(EmployeeCard."No.", relieverNo);
//         if EmployeeCard.Find('-') then begin
//             Message := EmployeeCard."No." + '::' + EmployeeCard."E-Mail" + '::' + EmployeeCard."Company E-Mail" + '::' + EmployeeCard."First Name" + ' ' + EmployeeCard."Middle Name" + ' ' + EmployeeCard."Last Name";
//         end;
//     end;

//     procedure GenerateStaffLeaveStatement(username: Text; fileNameFromApp: Text)
//     var
//         fileName: Text;
//     begin
//         fileName := FILEPATH + fileNameFromApp;
//         if Exists(fileName) then Erase(fileName);

//         EmployeeCard.Reset();
//         EmployeeCard.SetRange(EmployeeCard."No.", username);
//         if EmployeeCard.Find('-') then begin
//             Report.SaveAsPdf(Report::"Standard Leave Balance Report", fileName, EmployeeCard);
//         end;
//     end;

//     // procedure GetLeaveTransactions(username: Text) Message: Text
//     // begin
//     //     HRMLeavePeriod.Reset();
//     //     HRMLeavePeriod.SetRange(Current, true);
//     //     HRMLeavePeriod.SetRange(Closed, false);
//     //     if HRMLeavePeriod.Find('-') then begin
//     //         HRMLeaveLedger.Reset();
//     //         HRMLeaveLedger.SetRange("Employee No", username);
//     //         HRMLeaveLedger.SetRange("Current Leave Period", HRMLeavePeriod.Year);
//     //         if HRMLeaveLedger.Find('-') then begin
//     //             repeat
//     //                 Message += HRMLeaveLedger."Leave Type" + '::' + Format(HRMLeaveLedger."Transaction Date") + '::' + Format(HRMLeaveLedger."Transaction Type") + '::' + Format(HRMLeaveLedger."No. of Days") + '::' + HRMLeaveLedger."Transaction Description" + '::' + HRMLeaveLedger."Current Leave Period" + '[]';
//     //             until HRMLeaveLedger.Next() = 0;
//     //         end;
//     //     end;
//     // end;

//     // procedure GetBudgetComparisonSummary(username: Text; budgetName: Text) Message: Text
//     // var
//     //     ProjectManagers: Record "Project Managers";
//     //     ProjectHeader: Record "Grant Header";
//     //     BudgetEntries: Record "FIN-Budget Entries Summary";
//     //     TransactionType: Option Allocation,Expense,Commitment;
//     // begin
//     //     ProjectManagers.Reset();
//     //     ProjectManagers.SetRange("No.", username);
//     //     if ProjectManagers.Find('-') then begin
//     //         ProjectHeader.Reset();
//     //         ProjectHeader.SetRange("Project No", ProjectManagers."Project No");
//     //         ProjectHeader.SetRange("Grant Status", ProjectHeader."Grant Status"::Approved);
//     //         if ProjectHeader.Find('-') then begin
//     //             BudgetEntries.Reset();
//     //             BudgetEntries.SetRange("Shortcut Dimension 3 Code", ProjectHeader."Project No");
//     //             BudgetEntries.SetRange("Budget Name", budgetName);
//     //             if BudgetEntries.Find('-') then begin
//     //                 repeat
//     //                     Message += BudgetEntries."Budget Name" + '::' + BudgetEntries."G/L Account No." + '::' + Format(GetTotalAllocations(BudgetEntries."Budget Name", BudgetEntries."G/L Account No.", BudgetEntries."Shortcut Dimension 3 Code", BudgetEntries."Shortcut Dimension 4 Code")) + '::' + Format(GetTotalCommitments(BudgetEntries."Budget Name", BudgetEntries."G/L Account No.", BudgetEntries."Shortcut Dimension 3 Code", BudgetEntries."Shortcut Dimension 4 Code")) + '::' + Format(GetTotalExpenses(BudgetEntries."Budget Name", BudgetEntries."G/L Account No.", BudgetEntries."Shortcut Dimension 3 Code", BudgetEntries."Shortcut Dimension 4 Code")) + '::' + Format(GetTotalBalance(BudgetEntries."Budget Name", BudgetEntries."G/L Account No.", BudgetEntries."Shortcut Dimension 3 Code")) + '::' + BudgetEntries."Shortcut Dimension 3 Code" + '::' + BudgetEntries."Shortcut Dimension 4 Code" + '::' + GetActivityName(BudgetEntries."Shortcut Dimension 4 Code") + '[]';
//     //                 until BudgetEntries.Next() = 0;
//     //             end;
//     //         end;
//     //     end;
//     // end;

//     procedure GetActivityName(activityNo: Text) Message: Text
//     var DimensionValue: Record "Dimension Value";
//     begin
//         DimensionValue.Reset();
//         DimensionValue.SetRange("Dimension Code", 'ACTIVITIES');
//         DimensionValue.SetRange(Code, activityNo);
//         if DimensionValue.Find('-') then Message := DimensionValue.Name;
//     end;


//     procedure GetTotalAllocations(budgetName: Text; glAccount: Text; project: Text; activity: Text) Message: Decimal
//     var
//         BudgetEntries: Record "FIN-Budget Entries";
//     begin
//         BudgetEntries.Reset();
//         BudgetEntries.SetRange("Budget Name", budgetName);
//         BudgetEntries.SetRange("G/L Account No.", glAccount);
//         BudgetEntries.SetRange("Budget Dimension 3 Code", project);
//         BudgetEntries.SetRange("Budget Dimension 4 Code", activity);
//         BudgetEntries.SetRange("Transaction Type", BudgetEntries."Transaction Type"::Allocation);
//         if BudgetEntries.Find('-') then begin
//             repeat
//                 Message := Message + BudgetEntries.Amount;
//             until BudgetEntries.Next() = 0;
//         end;
//     end;

//     procedure GetTotalCommitments(budgetName: Text; glAccount: Text; project: Text; activity: Text) Message: Decimal
//     var
//         BudgetEntries: Record "FIN-Budget Entries";
//     begin
//         BudgetEntries.Reset();
//         BudgetEntries.SetRange("Budget Name", budgetName);
//         BudgetEntries.SetRange("G/L Account No.", glAccount);
//         BudgetEntries.SetRange("Budget Dimension 3 Code", project);
//         BudgetEntries.SetRange("Budget Dimension 4 Code", activity);
//         BudgetEntries.SetRange("Transaction Type", BudgetEntries."Transaction Type"::Commitment);
//         if BudgetEntries.Find('-') then begin
//             repeat
//                 Message := Message + BudgetEntries.Amount;
//             until BudgetEntries.Next() = 0;
//         end;
//     end;

//     procedure GetTotalExpenses(budgetName: Text; glAccount: Text; project: Text; activity: Text) Message: Decimal
//     var
//         BudgetEntries: Record "FIN-Budget Entries";
//     begin
//         BudgetEntries.Reset();
//         BudgetEntries.SetRange("Budget Name", budgetName);
//         BudgetEntries.SetRange("G/L Account No.", glAccount);
//         BudgetEntries.SetRange("Budget Dimension 3 Code", project);
//         BudgetEntries.SetRange("Budget Dimension 4 Code", activity);
//         BudgetEntries.SetRange("Transaction Type", BudgetEntries."Transaction Type"::Expense);
//         if BudgetEntries.Find('-') then begin
//             repeat
//                 Message := Message + BudgetEntries.Amount;
//             until BudgetEntries.Next() = 0;
//         end;
//     end;

//     procedure GetTotalBalance(budgetName: Text; glAccount: Text; project: Text) Message: Decimal
//     var
//         BudgetEntries: Record "FIN-Budget Entries";
//     begin
//         BudgetEntries.Reset();
//         BudgetEntries.SetRange("Budget Name", budgetName);
//         BudgetEntries.SetRange("G/L Account No.", glAccount);
//         BudgetEntries.SetRange("Budget Dimension 3 Code", project);
//         BudgetEntries.SetFilter("Transaction Type", '%1|%2|%3', BudgetEntries."Transaction Type"::Allocation, BudgetEntries."Transaction Type"::Commitment, BudgetEntries."Transaction Type"::Expense);
//         if BudgetEntries.Find('-') then begin
//             repeat
//                 Message := Message + BudgetEntries.Amount;
//             until BudgetEntries.Next() = 0;
//         end;
//     end;

//     procedure GetGlBudgets() Message: Text
//     var BudgetName: Record "G/L Budget Name";
//     begin
//         BudgetName.Reset();
//         BudgetName.SetFilter(Name, '<>%1', '');
//         if BudgetName.Find('-') then begin
//             repeat
//                 Message += BudgetName.Name + '::';
//             until BudgetName.Next() = 0;
//         end
//     end;

//     // procedure GetApprovedProjects(username: Text) Message: Text
//     // var
//     //     ProjectHeader: Record "Grant Header";
//     //     ProjectManagers: Record "Project Managers";
//     // begin
//     //     ProjectManagers.Reset();
//     //     ProjectManagers.SetRange("No.", username);
//     //     if ProjectManagers.Find('-') then begin
//     //         repeat
//     //             ProjectHeader.Reset();
//     //             ProjectHeader.SetRange("Project No", ProjectManagers."Project No");
//     //             ProjectHeader.SetRange("Grant Status", ProjectHeader."Grant Status"::Approved);
//     //             if ProjectHeader.Find('-') then Message += ProjectHeader."Project No" + '::';
//     //         until ProjectManagers.Next() = 0;
//     //     end;
//     // end;
// }
codeunit 52178542 "User Management 2"
{
    Permissions = TableData "G/L Entry" = rm,
                  TableData "Cust. Ledger Entry" = rm,
                  TableData "Vendor Ledger Entry" = rm,
                  TableData "G/L Register" = rm,
                  TableData "Item Register" = rm,
                  TableData "G/L Budget Entry" = rm,
                  TableData "Sales Shipment Header" = rm,
                  TableData "Sales Invoice Header" = rm,
                  TableData "Sales Cr.Memo Header" = rm,
                  TableData "Purch. Rcpt. Header" = rm,
                  TableData "Purch. Inv. Header" = rm,
                  TableData "Purch. Cr. Memo Hdr." = rm,
                  TableData "Job Ledger Entry" = rm,
                  TableData "Res. Ledger Entry" = rm,
                  TableData "Resource Register" = rm,
                  TableData "Job Register" = rm,
                  TableData "VAT Entry" = rm,
                  TableData "Bank Account Ledger Entry" = rm,
                  TableData "Check Ledger Entry" = rm,
                  TableData "Phys. Inventory Ledger Entry" = rm,
                  TableData "Issued Reminder Header" = rm,
                  TableData "Reminder/Fin. Charge Entry" = rm,
                  TableData "Issued Fin. Charge Memo Header" = rm,
                  TableData "Reservation Entry" = rm,
                  TableData "Item Application Entry" = rm,
                  TableData "Detailed Cust. Ledg. Entry" = rm,
                  TableData "Detailed Vendor Ledg. Entry" = rm,
                  TableData "Change Log Entry" = rm,
                  TableData "Approval Entry" = rm,
                  TableData "Approval Comment Line" = rm,
                  TableData "Posted Approval Entry" = rm,
                  TableData "Posted Approval Comment Line" = rm,
                  TableData "Posted Assembly Header" = rm,
                  TableData "Cost Entry" = rm,
                  TableData "Cost Register" = rm,
                  TableData "Cost Budget Entry" = rm,
                  TableData "Cost Budget Register" = rm,
                  TableData "Interaction Log Entry" = rm,
                  TableData "Campaign Entry" = rm,
                  TableData "FA Ledger Entry" = rm,
                  TableData "FA Register" = rm,
                  TableData "Maintenance Ledger Entry" = rm,
                  TableData "Ins. Coverage Ledger Entry" = rm,
                  TableData "Insurance Register" = rm,
                  TableData "Value Entry" = rm,
                  TableData "Service Ledger Entry" = rm,
                  TableData "Service Register" = rm,
                  TableData "Contract Gain/Loss Entry" = rm,
                  TableData "Filed Service Contract Header" = rm,
                  TableData "Service Shipment Header" = rm,
                  TableData "Service Invoice Header" = rm,
                  TableData "Service Cr.Memo Header" = rm,
                  TableData "Return Shipment Header" = rm,
                  TableData "Return Receipt Header" = rm,
                  TableData "Item Budget Entry" = rm,
                  TableData "Warehouse Entry" = rm,
                  TableData "Warehouse Register" = rm;


    trigger OnRun()
    begin
    end;

    var
        Text000: Label 'The user name %1 does not exist.';
        Text001: Label 'You are renaming an existing user. This will also update all related records. Are you sure that you want to rename the user?';
        Text002: Label 'The account %1 already exists.';
        Text003: Label 'You do not have permissions for this action.';
        UnsupportedLicenseTypeOnSaasErr: Label 'Only users of type %1 and %2 are supported in the SaaS environment.', Comment = '%1= license type, %2= license type';

    procedure ValidateUserID(UserName: Code[50])
    var
        User: Record Users;
    begin
        IF UserName <> '' THEN BEGIN
            User.SETCURRENTKEY("User Name");
            User.SETRANGE("User Name", UserName);
            IF NOT User.FINDFIRST THEN BEGIN
                User.RESET;
                IF NOT User.ISEMPTY THEN
                    ERROR(Text000, UserName);
            END;
        END;
    end;

    procedure LookupUserID(var UserName: Code[50]): Boolean
    var
        SID: Guid;
    begin
        EXIT(LookupUser(UserName, SID));
    end;

    procedure LookupUser(var UserName: Code[50]; var SID: Guid): Boolean
    var
        User: Record Users;
    begin
        User.RESET;
        User.SETCURRENTKEY("User Name");
        User."User Name" := UserName;
        IF User.FIND('=><') THEN;
        IF PAGE.RUNMODAL(PAGE::Users, User) = ACTION::LookupOK THEN BEGIN
            UserName := User."User Name";
            SID := User."User Security ID";
            EXIT(TRUE);
        END;

        EXIT(FALSE);
    end;

    procedure ValidateUserName(NewUser: Record Users; OldUser: Record Users; WindowsUserName: Text)
    var
        User: Record Users;
        ConfirmManagement: Codeunit "Confirm Management 2";
    begin
        IF NewUser."User Name" <> OldUser."User Name" THEN BEGIN
            User.SETRANGE("User Name", NewUser."User Name");
            User.SETFILTER("User Security ID", '<>%1', OldUser."User Security ID");
            IF User.FINDFIRST THEN
                ERROR(Text002, NewUser."User Name");

            IF NewUser."Windows Security ID" <> '' THEN
                NewUser.TESTFIELD("User Name", WindowsUserName);

            // IF OldUser."User Name" <> '' THEN
            //     IF ConfirmManagement.ConfirmProcess(Text001, FALSE) THEN
            //         RenameUser(OldUser."User Name", NewUser."User Name")
            //     ELSE
            //         ERROR('');
        END;
    end;

    local procedure IsPrimaryKeyField(TableID: Integer; FieldID: Integer; var NumberOfPrimaryKeyFields: Integer): Boolean
    var
        ConfigValidateMgt: Codeunit "Config. Validate Management";
        RecRef: RecordRef;
        KeyRef: KeyRef;
    begin
        RecRef.OPEN(TableID);
        KeyRef := RecRef.KEYINDEX(1);
        NumberOfPrimaryKeyFields := KeyRef.FIELDCOUNT;
        EXIT(ConfigValidateMgt.IsKeyField(TableID, FieldID));
    end;

    local procedure RenameRecord(var RecRef: RecordRef; TableNo: Integer; NumberOfPrimaryKeyFields: Integer; UserName: Code[50]; Company: Text[30])
    var
        UserTimeRegister: Record "User Time Register";
        PrinterSelection: Record "Printer Selection";
        SelectedDimension: Record "Selected Dimension";

        FAJournalSetup: Record "FA Journal Setup";
        AnalysisSelectedDimension: Record "Analysis Selected Dimension";
        WarehouseEmployee: Record "Warehouse Employee";
        MyCustomer: Record "My Customer";
        MyVendor: Record "My Vendor";
        MyItem: Record "My Item";
        MyAccount: Record "My Account";
        //CueSetup: Record 9701;
        ApplicationAreaSetup: Record "Application Area Setup";
        MyJob: Record "My Job";
        MyTimeSheets: Record "My Time Sheets";
    begin
        IF NumberOfPrimaryKeyFields = 1 THEN
            RecRef.RENAME(UserName)
        ELSE
            CASE TableNo OF
                DATABASE::"User Time Register":
                    BEGIN
                        UserTimeRegister.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(UserTimeRegister);
                        UserTimeRegister.RENAME(UserName, UserTimeRegister.Date);
                    END;
                DATABASE::"Printer Selection":
                    BEGIN
                        RecRef.SETTABLE(PrinterSelection);
                        PrinterSelection.RENAME(UserName, PrinterSelection."Report ID");
                    END;
                DATABASE::"Selected Dimension":
                    BEGIN
                        SelectedDimension.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(SelectedDimension);
                        SelectedDimension.RENAME(UserName, SelectedDimension."Object Type", SelectedDimension."Object ID",
                          SelectedDimension."Analysis View Code", SelectedDimension."Dimension Code");
                    END;

                DATABASE::"FA Journal Setup":
                    BEGIN
                        FAJournalSetup.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(FAJournalSetup);
                        FAJournalSetup.RENAME(FAJournalSetup."Depreciation Book Code", UserName);
                    END;
                DATABASE::"Analysis Selected Dimension":
                    BEGIN
                        AnalysisSelectedDimension.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(AnalysisSelectedDimension);
                        AnalysisSelectedDimension.RENAME(UserName, AnalysisSelectedDimension."Object Type", AnalysisSelectedDimension."Object ID",
                          AnalysisSelectedDimension."Analysis Area", AnalysisSelectedDimension."Analysis View Code",
                          AnalysisSelectedDimension."Dimension Code");
                    END;
                // DATABASE::"Cue Setup":
                //     BEGIN
                //         CueSetup.CHANGECOMPANY(Company);
                //         RecRef.SETTABLE(CueSetup);
                //         CueSetup.RENAME(UserName, CueSetup."Table ID", CueSetup."Field No.");
                //     END;
                DATABASE::"Warehouse Employee":
                    BEGIN
                        WarehouseEmployee.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(WarehouseEmployee);
                        WarehouseEmployee.RENAME(UserName, WarehouseEmployee."Location Code");
                    END;
                DATABASE::"My Customer":
                    BEGIN
                        MyCustomer.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(MyCustomer);
                        MyCustomer.RENAME(UserName, MyCustomer."Customer No.");
                    END;
                DATABASE::"My Vendor":
                    BEGIN
                        MyVendor.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(MyVendor);
                        MyVendor.RENAME(UserName, MyVendor."Vendor No.");
                    END;
                DATABASE::"My Item":
                    BEGIN
                        MyItem.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(MyItem);
                        MyItem.RENAME(UserName, MyItem."Item No.");
                    END;
                DATABASE::"My Account":
                    BEGIN
                        MyAccount.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(MyAccount);
                        MyAccount.RENAME(UserName, MyAccount."Account No.");
                    END;
                DATABASE::"Application Area Setup":
                    BEGIN
                        ApplicationAreaSetup.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(ApplicationAreaSetup);
                        ApplicationAreaSetup.RENAME('', '', UserName);
                    END;
                DATABASE::"My Job":
                    BEGIN
                        MyJob.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(MyJob);
                        MyJob.RENAME(UserName, MyJob."Job No.");
                    END;
                DATABASE::"My Time Sheets":
                    BEGIN
                        MyTimeSheets.CHANGECOMPANY(Company);
                        RecRef.SETTABLE(MyTimeSheets);
                        MyTimeSheets.RENAME(UserName, MyTimeSheets."Time Sheet No.");
                    END;
            END;
        OnAfterRenameRecord(RecRef, TableNo, NumberOfPrimaryKeyFields, UserName, Company);
    end;

    // local procedure RenameUser(OldUserName: Code[50]; NewUserName: Code[50])
    // var
    //     User: Record 52178737;
    //     "Field": Record "2000000041";
    //     TableInformation: Record "2000000028";
    //     Company: Record "2000000006";
    //     RecRef: RecordRef;
    //     FieldRef: FieldRef;
    //     FieldRef2: FieldRef;
    //     NumberOfPrimaryKeyFields: Integer;
    //     IsHandled: Boolean;
    // begin
    //     OnBeforeRenameUser(OldUserName, NewUserName);

    //     Field.SETFILTER(ObsoleteState, '<>%1', Field.ObsoleteState::Removed);
    //     Field.SETRANGE(RelationTableNo, DATABASE::User);
    //     Field.SETRANGE(RelationFieldNo, User.FIELDNO("User Name"));
    //     Field.SETFILTER(Type, '%1|%2', Field.Type::Code, Field.Type::Text);
    //     IF Field.FINDSET THEN
    //         REPEAT
    //             Company.FINDSET;
    //             REPEAT
    //                 IsHandled := FALSE;
    //                 OnRenameUserOnBeforeProcessField(Field.TableNo, Field."No.", OldUserName, NewUserName, IsHandled);
    //                 IF NOT IsHandled THEN BEGIN
    //                     RecRef.OPEN(Field.TableNo, FALSE, Company.Name);
    //                     IF RecRef.READPERMISSION THEN BEGIN
    //                         FieldRef := RecRef.FIELD(Field."No.");
    //                         FieldRef.SETRANGE(COPYSTR(OldUserName, 1, Field.Len));
    //                         IF RecRef.FINDSET(TRUE) THEN
    //                             REPEAT
    //                                 IF IsPrimaryKeyField(Field.TableNo, Field."No.", NumberOfPrimaryKeyFields) THEN
    //                                     RenameRecord(RecRef, Field.TableNo, NumberOfPrimaryKeyFields, NewUserName, Company.Name)
    //                                 ELSE BEGIN
    //                                     FieldRef2 := RecRef.FIELD(Field."No.");
    //                                     FieldRef2.VALUE := COPYSTR(NewUserName, 1, Field.Len);
    //                                     RecRef.MODIFY;
    //                                 END;
    //                             UNTIL RecRef.NEXT = 0;
    //                     END ELSE BEGIN
    //                         TableInformation.SETFILTER("Company Name", '%1|%2', '', Company.Name);
    //                         TableInformation.SETRANGE("Table No.", Field.TableNo);
    //                         TableInformation.FINDFIRST;
    //                         IF TableInformation."No. of Records" > 0 THEN
    //                             ERROR(Text003);
    //                     END;
    //                     RecRef.CLOSE;
    //                 END;
    //             UNTIL Company.NEXT = 0;
    //         UNTIL Field.NEXT = 0;

    //     OnAfterRenameUser(OldUserName, NewUserName);
    // end;

    [EventSubscriber(ObjectType::Table, Database::Users, 'OnAfterValidateEvent', 'Application ID', false, false)]
    local procedure SetLicenseTypeOnValidateApplicationID(var Rec: Record Users; var xRec: Record Users; CurrFieldNo: Integer)
    var
        PermissionManager: Codeunit "Permission Manager";
    begin
        //IF PermissionManager.SoftwareAsAService THEN
        IF ISNULLGUID(Rec."Application ID") THEN
            Rec."License Type" := Rec."License Type"::"Full User"
        ELSE
            Rec."License Type" := Rec."License Type"::"External User";
    end;

    [EventSubscriber(ObjectType::Table, Database::Users, 'OnAfterModifyEvent', '', false, true)]
    local procedure ValidateLicenseTypeOnAfterModifyUser(var Rec: Record Users; var xRec: Record Users; RunTrigger: Boolean)
    begin
        ValidateLicenseTypeOnSaaS(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::Users, 'OnAfterInsertEvent', '', false, true)]
    local procedure ValidateLicenseTypeOnAfterInsertUser(var Rec: Record Users; RunTrigger: Boolean)
    begin
        ValidateLicenseTypeOnSaaS(Rec);
    end;

    local procedure ValidateLicenseTypeOnSaaS(User: Record Users)
    var
        PermissionManager: Codeunit "Permission Manager";
    begin
        //IF PermissionManager.SoftwareAsAService THEN BEGIN
        IF NOT (User."License Type" IN [User."License Type"::"Full User", User."License Type"::"External User"]) THEN
            ERROR(UnsupportedLicenseTypeOnSaasErr, User."License Type"::"Full User", User."License Type"::"External User");
    END;
    //end;

    [IntegrationEvent(false, false)]
    procedure OnAfterRenameRecord(var RecRef: RecordRef; TableNo: Integer; NumberOfPrimaryKeyFields: Integer; UserName: Code[50]; Company: Text[30])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterRenameUser(OldUserName: Code[50]; NewUserName: Code[50])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeRenameUser(OldUserName: Code[50]; NewUserName: Code[50])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnRenameUserOnBeforeProcessField(TableID: Integer; FieldID: Integer; OldUserName: Code[50]; NewUserName: Code[50]; var IsHandled: Boolean)
    begin
    end;
}
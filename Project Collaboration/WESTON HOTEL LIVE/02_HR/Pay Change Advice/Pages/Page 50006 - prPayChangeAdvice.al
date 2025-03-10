page 55001 prPayChangeAdvice
{
    PageType = Card;
    SourceTable = "prBasic pay PCA";
    Caption = 'Payroll PayChange Advice';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Change Advice Serial No."; Rec."Change Advice Serial No.")
                {
                    ApplicationArea = All;
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = All;
                }
                field("Pays NSSF"; Rec."Pays NSSF")
                {
                    ApplicationArea = All;
                }
                field("Pays NHIF"; Rec."Pays NHIF")
                {
                    ApplicationArea = All;
                }
                field("Pays PAYE"; Rec."Pays PAYE")
                {
                    ApplicationArea = All;
                }
                field(Comments; Rec.Comments)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                }
                field("New Employee?"; Rec."New Employee?")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Employee? field.';
                }

                field("Present Grade"; Rec."Present Grade")
                {
                    ApplicationArea = All;

                }
                field("New Grade"; Rec."New Grade")
                {
                    ApplicationArea = All;

                }
                field("New Grade Terms"; Rec."New Grade Terms")
                {
                    ApplicationArea = All;

                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = All;

                }
                field("Payrate p.a"; Rec."Payrate p.a")
                {
                    ApplicationArea = All;

                }
                field("Region Code"; Rec."Region Code")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Department Code"; Rec."Department Code")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                // field("School Code"; Rec."School Code")
                // {
                //     Visible = false;
                // }
                field("Section Code"; Rec."Section Code")
                {
                    visible = false;
                    ApplicationArea = All;
                }
                field("Transfer/Appointment No"; Rec."Transfer/Appointment No")
                {
                    ApplicationArea = All;
                }
            }
            part(Lines; "prEmployee Trans PCA")
            {
                SubPageLink = "Employee Code" = FIELD("Employee Code"),
                              "Change Advice Serial No." = FIELD("Change Advice Serial No."),
                              "Payroll Period" = FIELD("Payroll Period");
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }
            systempart(MyNotes; MyNotes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {

            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Fin-Approval Entries";
                begin
                    ApprovalEntries.Setfilters(DATABASE::"prBasic pay PCA", 6, Rec."Change Advice Serial No.");
                    ApprovalEntries.Run;
                end;
            }
            action(sendApproval)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit IntCodeunit2;
                    // showmessage: Boolean;
                    // ManualCancel: Boolean;
                    // State: Option Open,"Pending Approval",Cancelled,Approved;
                    DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                // tableNo: Integer;
                begin

                    Rec.TESTFIELD(Status, Rec.Status::Open);
                    VarVariant := Rec;
                    IF ApprovalMgt.IsPCAEnabled(VarVariant) THEN
                        ApprovalMgt.OnSendPCAforApproval(Rec);

                end;
            }
            action(cancellsApproval)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit IntCodeunit2;

                begin
                    VarVariant := Rec;
                    IF ApprovalMgt.IsPCAEnabled(VarVariant) THEN
                        ApprovalMgt.OnCancelPCAforApproval(Rec);
                end;
            }



            action(Posts)
            {
                Caption = 'Post The Changes';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    IF Rec.Status <> Rec.Status::Approved THEN ERROR('PCA must be approved to continue');

                    //Get
                    // mPayrollCode := '';
                    // dim1 := '';
                    // dim2 := '';
                    // dim3 := '';
                    // dim4 := '';

                    //-------------------------------------------
                    mPayrollCode := '';

                    UserSetup.RESET;
                    UserSetup.SETRANGE(UserSetup."User ID", USERID);
                    IF UserSetup.FIND('-') THEN BEGIN
                        mPayrollCode := UserSetup."Payroll Code";
                    END;

                    objEmp.RESET;
                    objEmp.SETRANGE(objEmp."No.", Rec."Employee Code");
                    IF objEmp.FIND('-') THEN BEGIN
                        mPayrollCode := objEmp."Payroll Code";
                        dim1 := objEmp."Region";
                        dim2 := objEmp."Department Code";
                        // dim3 := objEmp.Schools;
                        // dim4 := objEmp.Section;
                    END;

                    objPayrollPeriod.RESET;
                    objPayrollPeriod.SETRANGE(objPayrollPeriod.Closed, FALSE);
                    IF objPayrollPeriod.FIND('-') THEN BEGIN
                        intMonth := objPayrollPeriod."Period Month";
                        intYear := objPayrollPeriod."Period Year";
                        dtPAyrollPeriod := objPayrollPeriod."Date Opened";
                    END;

                    IF CONFIRM('Are you Sure you want to post these change for employee ' + Rec."Employee Code" + '-' + Rec."Employee Name") THEN BEGIN
                        objEmpTrans.RESET;
                        objEmpTrans.SETRANGE(objEmpTrans."Employee Code", rec."Employee Code");
                        objEmpTrans.SETRANGE(objEmpTrans."Payroll Period", Rec."Payroll Period");
                        IF objEmpTrans.FIND('-') THEN BEGIN
                            objEmpTrans.DELETEALL(TRUE);
                        END;


                        objSalCard.RESET;
                        objSalCard.SETRANGE(objSalCard."Employee Code", Rec."Employee Code");
                        IF objSalCard.FIND('-') THEN BEGIN //-------------if old employee then Check changes to the basic pay and update-------------
                            objSalCard."Basic Pay" := Rec."Basic Pay";
                            objSalCard."Pays NSSF" := Rec."Pays NSSF";
                            objSalCard."Pays NHIF" := Rec."Pays NHIF";
                            objSalCard."Pays PAYE" := Rec."Pays PAYE";

                            Rec.Effected := TRUE;
                            objSalCard.MODIFY;
                            fnTrackChanges('Change in Basic Salary', FORMAT(xRec."Basic Pay"), FORMAT(Rec."Basic Pay"));
                        END ELSE BEGIN                     //-------------if new employee insert prsalary card---------------------------------------
                            objSalCard.INIT;
                            objSalCard."Employee Code" := Rec."Employee Code";
                            objSalCard."Basic Pay" := Rec."Basic Pay";
                            objSalCard."Payment Mode" := objSalCard."Payment Mode"::"Bank Transfer";
                            objSalCard."Pays NSSF" := TRUE;
                            objSalCard."Pays NHIF" := TRUE;
                            objSalCard."Pays PAYE" := TRUE;
                            objSalCard."Suspend Pay" := FALSE;
                            objSalCard."Suspension Date" := 0D;
                            objSalCard."Suspension Reasons" := '';
                            objSalCard."Posting Group" := 'PAYROLL';

                            objSalCard.INSERT;
                            fnTrackChanges('Change in Basic Salary', FORMAT(xRec."Basic Pay"), FORMAT(Rec."Basic Pay"));
                        END;
                        //-------------if transaction is new insert new-------------------------------------------
                        objEmpTransPCA.RESET;
                        objEmpTransPCA.SETRANGE(objEmpTransPCA."Employee Code", Rec."Employee Code");
                        objEmpTransPCA.SETRANGE(objEmpTransPCA."Payroll Period", Rec."Payroll Period");
                        objEmpTransPCA.SETRANGE(objEmpTransPCA."Change Advice Serial No.", Rec."Change Advice Serial No.");
                        IF objEmpTransPCA.FIND('-') THEN BEGIN
                            REPEAT
                            BEGIN

                                dim1 := objEmpTransPCA."Global Dimension 1 Code";
                                dim2 := objEmpTransPCA."Global Dimension 2 Code";
                                dim3 := objEmpTransPCA."Shortcut Dimension 3 Code";
                                dim4 := objEmpTransPCA."Shortcut Dimension 4 Code";

                                IF dim1 = '' THEN dim1 := objEmp.Region;
                                IF dim2 = '' THEN dim2 := objEmp."Department Code";
                                // IF dim3 = '' THEN dim3 := objEmp.Schools;
                                // IF dim4 = '' THEN dim4 := objEmp.Section;

                                /* objEmpTrans.RESET;
                                objEmpTrans.SETRANGE(objEmpTrans."Employee Code", objEmpTransPCA."Employee Code");
                                objEmpTrans.SETRANGE(objEmpTrans."Payroll Period", objEmpTransPCA."Payroll Period");
                                objEmpTrans.SETRANGE(objEmpTrans."Transaction Code", objEmpTransPCA."Transaction Code");
                                objEmpTrans.SETRANGE(objEmpTrans."Payroll Code", mPayrollCode);
                                //objEmpTrans.SETRANGE(objEmpTrans."Department Code", dim2);
                                IF objEmpTrans.FIND('-') THEN BEGIN
                                    //   objEmpTrans.CALCFIELDS(objEmpTrans."PI Approval Status");
                                    //    IF objEmpTrans."PI Approval Status"<>objEmpTrans."Status"::Open THEN ERROR('You cannot post changes to since the is NOT open');
                                END; */

                                objEmpTrans.RESET;
                                objEmpTrans.SETRANGE(objEmpTrans."Employee Code", objEmpTransPCA."Employee Code");
                                objEmpTrans.SETRANGE(objEmpTrans."Payroll Period", objEmpTransPCA."Payroll Period");
                                objEmpTrans.SETRANGE(objEmpTrans."Transaction Code", objEmpTransPCA."Transaction Code");
                                objEmpTrans.SETRANGE(objEmpTrans."Payroll Code", mPayrollCode);
                                IF objEmpTrans.FIND('-') THEN BEGIN
                                    objEmpTrans."Employee Code" := objEmpTransPCA."Employee Code";
                                    objEmpTrans."Transaction Code" := objEmpTransPCA."Transaction Code";
                                    objEmpTrans."Period Month" := intMonth;
                                    objEmpTrans."Period Year" := intYear;
                                    objEmpTrans."Payroll Period" := dtPAyrollPeriod;
                                    objEmpTrans."Transaction Name" := objEmpTransPCA."Transaction Name";
                                    objEmpTrans.Amount := objEmpTransPCA.Amount;
                                    objEmpTrans.Balance := objEmpTransPCA.Balance;
                                    objEmpTrans."Payroll Period" := objEmpTransPCA."Payroll Period";
                                    objEmpTrans."Payroll Code" := mPayrollCode;
                                    //objEmpTrans."Department Code" := dim2;
                                    //objEmpTrans."Global Dimension 2 Code":=dim2;
                                    //objEmpTrans."Shortcut Dimension 3 Code":=dim3;
                                    //objEmpTrans."Shortcut Dimension 4 Code":=dim4;
                                    // objEmpTrans."Start Date" := objEmpTransPCA."Start Date";
                                    //objEmpTrans."End Date" := objEmpTransPCA."End Date";
                                    objEmpTrans.MODIFY;
                                    MESSAGE('objEmpTrans Modified: ' + Format(objEmpTrans."Employee Code"));
                                END ELSE BEGIN
                                    objEmpTrans.INIT;
                                    objEmpTrans."Employee Code" := objEmpTransPCA."Employee Code";
                                    objEmpTrans."Transaction Code" := objEmpTransPCA."Transaction Code";
                                    objEmpTrans."Period Month" := intMonth;
                                    objEmpTrans."Period Year" := intYear;
                                    objEmpTrans."Payroll Period" := dtPAyrollPeriod;
                                    objEmpTrans."Transaction Name" := objEmpTransPCA."Transaction Name";
                                    objEmpTrans.Amount := objEmpTransPCA.Amount;
                                    objEmpTrans.Balance := objEmpTransPCA.Balance;
                                    objEmpTrans."Payroll Period" := objEmpTransPCA."Payroll Period";
                                    objEmpTrans."Payroll Code" := mPayrollCode;
                                    //objEmpTrans."Department Code" := dim2;
                                    //objEmpTrans."Global Dimension 2 Code":=dim2;
                                    //objEmpTrans."Shortcut Dimension 3 Code":=dim3;
                                    //objEmpTrans."Shortcut Dimension 4 Code":=dim4;
                                    objEmpTrans."Start Date" := objEmpTransPCA."Start Date";
                                    objEmpTrans."End Date" := objEmpTransPCA."End Date";
                                    objEmpTrans.INSERT;
                                    MESSAGE('objEmpTrans Inserted: ' + Format(objEmpTrans."Transaction Code"));
                                END;
                            END;
                            UNTIL objEmpTransPCA.NEXT = 0;
                        END;


                        Rec.Effected := TRUE;
                        Rec.Status := Rec.Status::Posted;
                        Rec.MODIFY;
                        if (Rec.MODIFY) then begin
                            MESSAGE('The changes has been uploaded to the current payroll');
                        end;



                    END;

                    if Confirm('Update Payroll Data?', true) = false then exit;

                    HREmp.Reset;
                    HREmp.SetRange(HREmp."No.", Rec."Employee Code");

                    if HREmp.Find('-') then begin

                        repeat

                        begin
                            //CHECK IF EMPLOYEE IS ALREADY IN THE PAYROLL TABLE
                            //IF HE IS MODIFY INFORMATION TO REFLECT ANY CHANGES MADE
                            prEmployees.Reset;
                            prEmployees.SetRange(prEmployees."No.", HREmp."No.");
                            if prEmployees.Find('-') then begin
                                if HREmp."First Name" <> '' then
                                    prEmployees."First Name" := HREmp."First Name";
                                if HREmp."Middle Name" <> '' then
                                    prEmployees."Middle Name" := HREmp."Middle Name";
                                if HREmp."Last Name" <> '' then
                                    prEmployees."Last Name" := HREmp."Last Name";
                                if HREmp."Search Name" <> '' then
                                    prEmployees."Search Name" := HREmp."Search Name";
                                if HREmp."Postal Address" <> '' then
                                    prEmployees."Postal Address" := HREmp."Postal Address";
                                if HREmp."Residential Address" <> '' then
                                    prEmployees."Residential Address" := HREmp."Residential Address";
                                if HREmp."Employee Category" <> '' then
                                    prEmployees."Employee Category" := HREmp."Employee Category";
                                if HREmp.City <> '' then
                                    prEmployees.City := HREmp.City;
                                if HREmp."Post Code" <> '' then
                                    prEmployees."Post Code" := HREmp."Post Code";
                                if HREmp.County <> '' then
                                    prEmployees.County := HREmp.County;
                                if HREmp."Home Phone Number" <> '' then
                                    prEmployees."Home Phone Number" := HREmp."Home Phone Number";
                                if HREmp."Work Phone Number" <> '' then
                                    prEmployees."Work Phone Number" := HREmp."Work Phone Number";
                                if HREmp."Ext." <> '' then
                                    prEmployees."Ext." := HREmp."Ext.";
                                if HREmp."E-Mail" <> '' then
                                    prEmployees."E-Mail" := HREmp."E-Mail";
                                if HREmp."ID Number" <> '' then
                                    prEmployees."ID Number" := HREmp."ID Number";
                                //    IF HREmp."First Name"<>'' THEN
                                //   HREmp.GET(HREmp."No.");
                                // IF HREmp."First Name"<>'' THEN
                                HREmp.CalcFields(HREmp.Picture);
                                if HREmp.Picture.HasValue then
                                    prEmployees.Picture := HREmp.Picture;
                                if HREmp."Union Code" <> '' then
                                    prEmployees."Union Code" := HREmp."Union Code";
                                if HREmp."UIF Number" <> '' then
                                    prEmployees."UIF Number" := HREmp."UIF Number";
                                //    IF HREmp.Gender<>HREmp.Gender:: THEN
                                prEmployees.Gender := HREmp.Gender;
                                //  IF HREmp.Status<>'' THEN
                                prEmployees.Status := HREmp.Status;
                                if HREmp."Resource No." <> '' then
                                    prEmployees."Resource No." := HREmp."Resource No.";
                                // IF HREmp."Last Date Modified"<>'' THEN
                                //prEmployees."Last Date Modified":=HREmp."Last Date Modified";
                                if HREmp."Fax Number" <> '' then
                                    prEmployees."Fax Number" := HREmp."Fax Number";
                                if HREmp."Company E-Mail" <> '' then
                                    prEmployees."Company E-Mail" := HREmp."Company E-Mail";
                                //  IF HREmp.Title<>'' THEN
                                prEmployees.Title := HREmp.Title;
                                if HREmp."Salespers./Purch. Code" <> '' then
                                    prEmployees."Salespers./Purch. Code" := HREmp."Salespers./Purch. Code";
                                if HREmp."No. Series" <> '' then
                                    prEmployees."No. Series" := HREmp."No. Series";
                                if HREmp."Known As" <> '' then
                                    prEmployees."Known As" := HREmp."Known As";
                                //   IF HREmp."Full / Part Time"<>'' THEN
                                prEmployees."Full / Part Time" := HREmp."Full / Part Time";
                                if HREmp."Contract End Date" <> 0D then
                                    prEmployees."Contract End Date" := HREmp."Contract End Date";
                                if HREmp."Notice Period" <> '' then
                                    prEmployees."Notice Period" := HREmp."Notice Period";
                                // IF HREmp."Union Member?"<>'' THEN
                                prEmployees."Union Member?" := HREmp."Union Member?";
                                //  IF HREmp."Shift Worker?"<>'' THEN
                                prEmployees."Shift Worker?" := HREmp."Shift Worker?";
                                //   IF HREmp."Contracted Hours"<>'' THEN
                                prEmployees."Contracted Hours" := HREmp."Contracted Hours";
                                //  IF HREmp."Pay Period"<>'' THEN
                                prEmployees."Pay Period" := HREmp."Pay Period";
                                // IF HREmp."Pay Per Period"<>'' THEN
                                prEmployees."Pay Per Period" := HREmp."Pay Per Period";
                                if HREmp."Cost Code" <> '' then
                                    prEmployees."Cost Code" := HREmp."Cost Code";
                                if HREmp."PAYE Number" <> '' then
                                    prEmployees."PAYE Number" := HREmp."PAYE Number";
                                //IF HREmp."Marital Status"<>'' THEN
                                prEmployees."Marital Status" := HREmp."Marital Status";
                                //IF HREmp."Ethnic Origin"<>'' THEN
                                prEmployees."Ethnic Origin" := HREmp."Ethnic Origin";
                                if HREmp."First Language (R/W/S)" <> '' then
                                    prEmployees."First Language (R/W/S)" := HREmp."First Language (R/W/S)";
                                if HREmp."Vehicle Registration Number" <> '' then
                                    prEmployees."Vehicle Registration Number" := HREmp."Vehicle Registration Number";
                                //IF HREmp.Disabled<>'' THEN
                                prEmployees.Disabled := HREmp.Disabled;
                                //IF HREmp."Health Assesment?"<>'' THEN
                                prEmployees."Health Assesment?" := HREmp."Health Assesment?";
                                //IF HREmp."Health Assesment Date"<>'' THEN
                                prEmployees."Health Assesment Date" := HREmp."Health Assesment Date";
                                //IF HREmp."Date Of Birth"<>'' THEN
                                prEmployees."Date Of Birth" := HREmp."Date Of Birth";
                                if HREmp.Age <> '' then
                                    prEmployees.Age := HREmp.Age;
                                //IF HREmp."Date Of Join"<>'' THEN
                                prEmployees."Date Of Join" := HREmp."Date Of Join";
                                if HREmp."Length Of Service" <> '' then
                                    prEmployees."Length Of Service" := HREmp."Length Of Service";
                                //IF HREmp."End Of Probation Date"<>'' THEN
                                prEmployees."End Of Probation Date" := HREmp."End Of Probation Date";
                                if HREmp."Main Bank" <> '' then
                                    prEmployees."Branch Bank" := HREmp."Main Bank";
                                if HREmp."Main Bank" <> '' then
                                    prEmployees."Main Bank" := HREmp."Main Bank";
                                if HREmp."Bank Account Number" <> '' then
                                    prEmployees."Bank Account Number" := HREmp."Bank Account Number";
                                //IF HREmp."Per Annum"<>'' THEN
                                prEmployees."Per Annum" := HREmp."Per Annum";
                                if HREmp."Medical Scheme No." <> '' then
                                    //prEmployees."Allow Overtime":=HREmp."Medical Scheme No.";
                                    if HREmp."Medical Scheme No." <> '' then
                                        prEmployees."Medical Scheme No." := HREmp."Medical Scheme No.";
                                if HREmp."Medical Scheme Head Member" <> '' then
                                    prEmployees."Medical Scheme Head Member" := HREmp."Medical Scheme Head Member";
                                //IF HREmp."Number Of Dependants"<>'' THEN
                                prEmployees."Number Of Dependants" := HREmp."Number Of Dependants";
                                if HREmp."Medical Scheme Name" <> '' then
                                    prEmployees."Medical Scheme Name" := HREmp."Medical Scheme Name";
                                //IF HREmp."Amount Paid By Employee"<>'' THEN
                                prEmployees."Amount Paid By Employee" := HREmp."Amount Paid By Employee";
                                //IF HREmp."Amount Paid By Company"<>'' THEN
                                prEmployees."Amount Paid By Company" := HREmp."Amount Paid By Company";
                                if HREmp."Second Language (R/W/S)" <> '' then
                                    prEmployees."Second Language (R/W/S)" := HREmp."Second Language (R/W/S)";
                                if HREmp."Additional Language" <> '' then
                                    prEmployees."Additional Language" := HREmp."Additional Language";
                                if HREmp."First Name" <> '' then
                                    prEmployees."UIF Country" := HREmp."UIF Country";
                                //IF HREmp."Primary Skills Category"<>'' THEN
                                prEmployees."Primary Skills Category" := HREmp."Primary Skills Category";
                                //IF HREmp.Level<>'' THEN
                                prEmployees.Level := HREmp.Level;
                                //IF HREmp."Termination Category"<>'' THEN
                                prEmployees."Termination Category" := HREmp."Termination Category";
                                if HREmp."Job Title" <> '' then
                                    prEmployees."Job Specification" := HREmp."Job Title";
                                if HREmp."Postal Address2" <> '' then
                                    prEmployees."Postal Address2" := HREmp."Postal Address2";
                                if HREmp."Postal Address3" <> '' then
                                    prEmployees."Postal Address3" := HREmp."Postal Address3";
                                if HREmp."Residential Address2" <> '' then
                                    prEmployees."Residential Address2" := HREmp."Residential Address2";
                                if HREmp."Residential Address3" <> '' then
                                    prEmployees."Residential Address3" := HREmp."Residential Address3";
                                if HREmp."Post Code2" <> '' then
                                    prEmployees."Post Code2" := HREmp."Post Code2";
                                if HREmp.Citizenship <> '' then
                                    prEmployees.Citizenship := HREmp.Citizenship;
                                if HREmp."Name Of Manager" <> '' then
                                    prEmployees."Name Of Manager" := HREmp."Name Of Manager";
                                if HREmp."User ID" <> '' then
                                    prEmployees."User ID" := HREmp."User ID";
                                if HREmp."Disabling Details" <> '' then
                                    prEmployees."Disabling Details" := HREmp."Disabling Details";
                                if HREmp."Passport Number" <> '' then
                                    prEmployees."Passport Number" := HREmp."Passport Number";
                                //IF HREmp."2nd Skills Category"<>'' THEN
                                prEmployees."2nd Skills Category" := HREmp."2nd Skills Category";
                                //IF HREmp."3rd Skills Category"<>'' THEN
                                prEmployees."3rd Skills Category" := HREmp."3rd Skills Category";
                                if HREmp.PensionJoin <> '' then
                                    prEmployees.PensionJoin := HREmp.PensionJoin;
                                if HREmp.Temp <> '' then
                                    prEmployees.Temp := HREmp.Temp;
                                if HREmp."Contract Location" <> '' then
                                    prEmployees."Contract Location" := HREmp."Contract Location";
                                //IF HREmp."First Language Read"<>'' THEN
                                prEmployees."First Language Read" := HREmp."First Language Read";
                                //IF HREmp."First Language Write"<>'' THEN
                                prEmployees."First Language Write" := HREmp."First Language Write";
                                //IF HREmp."First Language Speak"<>'' THEN
                                prEmployees."First Language Speak" := HREmp."First Language Speak";
                                //IF HREmp."Second Language Read"<>'' THEN
                                prEmployees."Second Language Read" := HREmp."Second Language Read";
                                //IF HREmp."Second Language Write"<>'' THEN
                                prEmployees."Second Language Write" := HREmp."Second Language Write";
                                //IF HREmp."Second Language Speak"<>'' THEN
                                prEmployees."Second Language Speak" := HREmp."Second Language Speak";
                                if HREmp."Custom Grading" <> '' then
                                    prEmployees."Custom Grading" := HREmp."Custom Grading";
                                if HREmp."PIN Number" <> '' then
                                    prEmployees."PIN Number" := HREmp."PIN Number";
                                if HREmp."NSSF No." <> '' then
                                    prEmployees."NSSF No." := HREmp."NSSF No.";
                                if HREmp."NHIF No." <> '' then
                                    prEmployees."NHIF No." := HREmp."NHIF No.";
                                if HREmp."Cause of Inactivity Code" <> '' then
                                    prEmployees."Cause of Inactivity Code" := HREmp."Cause of Inactivity Code";
                                // IF HREmp."No."<>'' THEN
                                prEmployees."Payroll Code" := 'PAYROLL';
                                if HREmp."HELB No" <> '' then
                                    prEmployees."HELB No" := HREmp."HELB No";
                                if HREmp."Co-Operative No" <> '' then
                                    prEmployees."Co-Operative No" := HREmp."Co-Operative No";
                                //IF HREmp."Wedding Anniversary"<>'' THEN
                                prEmployees."Wedding Anniversary" := HREmp."Wedding Anniversary";
                                if HREmp."Position To Succeed" <> '' then
                                    prEmployees."Position To Succeed" := HREmp."Position To Succeed";
                                //IF HREmp."Succesion Date"<>'' THEN
                                prEmployees."Succesion Date" := HREmp."Succesion Date";
                                if HREmp."Send Alert to" <> '' then
                                    prEmployees."Send Alert to" := HREmp."Send Alert to";
                                if HREmp.Tribe <> '' then
                                    prEmployees.Tribe := HREmp.Tribe;
                                if HREmp.Religion <> '' then
                                    prEmployees.Religion := HREmp.Religion;
                                if HREmp."Job Title" <> '' then
                                    prEmployees."Job Title" := HREmp."Job Title";
                                if HREmp."Posting Group" <> '' then
                                    prEmployees."Posting Group" := HREmp."Posting Group";
                                if HREmp."Payroll Posting Group" <> '' then
                                    prEmployees."Payroll Posting Group" := HREmp."Payroll Posting Group";
                                //IF HREmp."Served Notice Period"<>'' THEN
                                prEmployees."Served Notice Period" := HREmp."Served Notice Period";
                                //IF HREmp."Exit Interview Date"<>'' THEN
                                prEmployees."Exit Interview Date" := HREmp."Exit Interview Date";
                                if HREmp."Exit Interview Done by" <> '' then
                                    prEmployees."Exit Interview Done by" := HREmp."Exit Interview Done by";
                                //IF HREmp."Allow Re-Employment In Future"<>'' THEN
                                prEmployees."Allow Re-Employment In Future" := HREmp."Allow Re-Employment In Future";
                                if HREmp."Medical Scheme Name #2" <> '' then
                                    prEmployees."Medical Scheme Name #2" := HREmp."Medical Scheme Name #2";
                                if HREmp."Payroll Departments" <> '' then
                                    prEmployees."Payroll Departments" := HREmp."Payroll Departments";
                                //IF HREmp.Comment<>'' THEN
                                prEmployees.Comment := HREmp.Comment;
                                if HREmp."Competency Area" <> '' then
                                    prEmployees."Competency Area" := HREmp."Competency Area";
                                //IF HREmp."Employee Qty"<>'' THEN
                                prEmployees."Employee Qty" := HREmp."Employee Qty";
                                //IF HREmp."Employee Act. Qty"<>'' THEN
                                prEmployees."Employee Act. Qty" := HREmp."Employee Act. Qty";
                                //IF HREmp."Employee Arc. Qty"<>'' THEN
                                prEmployees."Employee Arc. Qty" := HREmp."Employee Arc. Qty";
                                //  IF HREmp."First Name"<>'' THEN
                                prEmployees."Payroll Code" := 'PAYROLL';
                                prEmployees.Modify;
                                prEmployees.Validate("No.");

                            end else begin
                                prEmployees.Init;
                                prEmployees."No." := HREmp."No.";
                                prEmployees."First Name" := HREmp."First Name";
                                prEmployees."Middle Name" := HREmp."Middle Name";
                                prEmployees."Last Name" := HREmp."Last Name";
                                prEmployees."Search Name" := HREmp."Search Name";
                                prEmployees."Postal Address" := HREmp."Postal Address";
                                prEmployees."Residential Address" := HREmp."Residential Address";
                                prEmployees."Employee Category" := HREmp."Employee Category";
                                prEmployees.City := HREmp.City;
                                prEmployees."Post Code" := HREmp."Post Code";
                                prEmployees.County := HREmp.County;
                                prEmployees."Home Phone Number" := HREmp."Home Phone Number";
                                prEmployees."Work Phone Number" := HREmp."Work Phone Number";
                                prEmployees."Ext." := HREmp."Ext.";
                                prEmployees."E-Mail" := HREmp."E-Mail";
                                prEmployees."ID Number" := HREmp."ID Number";
                                prEmployees.Picture := HREmp.Picture;
                                prEmployees."Union Code" := HREmp."Union Code";
                                prEmployees."UIF Number" := HREmp."UIF Number";
                                prEmployees.Gender := HREmp.Gender;
                                prEmployees.Status := HREmp.Status;
                                prEmployees."Resource No." := HREmp."Resource No.";
                                prEmployees."Last Date Modified" := HREmp."Last Date Modified";
                                prEmployees."Fax Number" := HREmp."Fax Number";
                                prEmployees."Company E-Mail" := HREmp."Company E-Mail";
                                prEmployees."Branch Bank" := HREmp."Main Bank";
                                prEmployees."Main Bank" := HREmp."Main Bank";
                                prEmployees."Bank Account Number" := HREmp."Bank Account Number";
                                prEmployees.Title := HREmp.Title;
                                prEmployees."Salespers./Purch. Code" := HREmp."Salespers./Purch. Code";
                                prEmployees."No. Series" := HREmp."No. Series";
                                prEmployees."Known As" := HREmp."Known As";
                                prEmployees."Full / Part Time" := HREmp."Full / Part Time";
                                prEmployees."Contract End Date" := HREmp."Contract End Date";
                                prEmployees."Notice Period" := HREmp."Notice Period";
                                prEmployees."Union Member?" := HREmp."Union Member?";
                                prEmployees."Shift Worker?" := HREmp."Shift Worker?";
                                prEmployees."Contracted Hours" := HREmp."Contracted Hours";
                                prEmployees."Pay Period" := HREmp."Pay Period";
                                prEmployees."Pay Per Period" := HREmp."Pay Per Period";
                                prEmployees."Cost Code" := HREmp."Cost Code";
                                prEmployees."PAYE Number" := HREmp."PAYE Number";
                                prEmployees."Marital Status" := HREmp."Marital Status";
                                prEmployees."Ethnic Origin" := HREmp."Ethnic Origin";
                                prEmployees."First Language (R/W/S)" := HREmp."First Language (R/W/S)";
                                prEmployees."Vehicle Registration Number" := HREmp."Vehicle Registration Number";
                                prEmployees.Disabled := HREmp.Disabled;
                                prEmployees."Health Assesment?" := HREmp."Health Assesment?";
                                prEmployees."Health Assesment Date" := HREmp."Health Assesment Date";
                                prEmployees."Date Of Birth" := HREmp."Date Of Birth";
                                prEmployees.Age := HREmp.Age;
                                prEmployees."Date Of Join" := HREmp."Date Of Join";
                                prEmployees."Length Of Service" := HREmp."Length Of Service";
                                prEmployees."End Of Probation Date" := HREmp."End Of Probation Date";
                                prEmployees."Per Annum" := HREmp."Per Annum";
                                prEmployees."Allow Overtime" := HREmp."Allow Overtime";
                                prEmployees."Medical Scheme No." := HREmp."Medical Scheme No.";
                                prEmployees."Medical Scheme Head Member" := HREmp."Medical Scheme Head Member";
                                prEmployees."Number Of Dependants" := HREmp."Number Of Dependants";
                                prEmployees."Medical Scheme Name" := HREmp."Medical Scheme Name";
                                prEmployees."Amount Paid By Employee" := HREmp."Amount Paid By Employee";
                                prEmployees."Amount Paid By Company" := HREmp."Amount Paid By Company";
                                prEmployees."Second Language (R/W/S)" := HREmp."Second Language (R/W/S)";
                                prEmployees."Additional Language" := HREmp."Additional Language";
                                prEmployees."UIF Country" := HREmp."UIF Country";
                                prEmployees."Primary Skills Category" := HREmp."Primary Skills Category";
                                prEmployees.Level := HREmp.Level;
                                prEmployees."Termination Category" := HREmp."Termination Category";
                                prEmployees."Job Specification" := HREmp."Job Title";
                                prEmployees."Postal Address2" := HREmp."Postal Address2";
                                prEmployees."Postal Address3" := HREmp."Postal Address3";
                                prEmployees."Residential Address2" := HREmp."Residential Address2";
                                prEmployees."Residential Address3" := HREmp."Residential Address3";
                                prEmployees."Post Code2" := HREmp."Post Code2";
                                prEmployees.Citizenship := HREmp.Citizenship;
                                prEmployees."Name Of Manager" := HREmp."Name Of Manager";
                                prEmployees."User ID" := HREmp."User ID";
                                prEmployees."Disabling Details" := HREmp."Disabling Details";
                                prEmployees."Passport Number" := HREmp."Passport Number";
                                prEmployees."2nd Skills Category" := HREmp."2nd Skills Category";
                                prEmployees."3rd Skills Category" := HREmp."3rd Skills Category";
                                prEmployees.PensionJoin := HREmp.PensionJoin;
                                prEmployees.Temp := HREmp.Temp;
                                prEmployees."Contract Location" := HREmp."Contract Location";
                                prEmployees."First Language Read" := HREmp."First Language Read";
                                prEmployees."First Language Write" := HREmp."First Language Write";
                                prEmployees."First Language Speak" := HREmp."First Language Speak";
                                prEmployees."Second Language Read" := HREmp."Second Language Read";
                                prEmployees."Second Language Write" := HREmp."Second Language Write";
                                prEmployees."Second Language Speak" := HREmp."Second Language Speak";
                                prEmployees."Custom Grading" := HREmp."Custom Grading";
                                prEmployees."PIN Number" := HREmp."PIN Number";
                                prEmployees."NSSF No." := HREmp."NSSF No.";
                                prEmployees."NHIF No." := HREmp."NHIF No.";
                                prEmployees."Cause of Inactivity Code" := HREmp."Cause of Inactivity Code";
                                prEmployees."Payroll Code" := HREmp."PAYROLL NO";
                                //prEmployees."HELB No":=HREmp."HELB No";
                                prEmployees."Co-Operative No" := HREmp."Co-Operative No";
                                prEmployees."Wedding Anniversary" := HREmp."Wedding Anniversary";
                                prEmployees."Position To Succeed" := HREmp."Position To Succeed";
                                prEmployees."Succesion Date" := HREmp."Succesion Date";
                                prEmployees."Send Alert to" := HREmp."Send Alert to";
                                prEmployees.Tribe := HREmp.Tribe;
                                prEmployees.Religion := HREmp.Religion;
                                prEmployees."Job Title" := HREmp."Job Title";
                                //prEmployees."Posting Group" := HREmp."Posting Group";
                                prEmployees."Posting Group" := 'PAYROLL';
                                prEmployees."Payroll Posting Group" := 'PAYROLL';
                                prEmployees."Payroll Posting Group" := HREmp."Payroll Posting Group";
                                prEmployees."Served Notice Period" := HREmp."Served Notice Period";
                                prEmployees."Exit Interview Date" := HREmp."Exit Interview Date";
                                prEmployees."Exit Interview Done by" := HREmp."Exit Interview Done by";
                                prEmployees."Allow Re-Employment In Future" := HREmp."Allow Re-Employment In Future";
                                prEmployees."Medical Scheme Name #2" := HREmp."Medical Scheme Name #2";
                                prEmployees."Payroll Departments" := HREmp."Payroll Departments";
                                prEmployees.Comment := HREmp.Comment;
                                prEmployees."Competency Area" := HREmp."Competency Area";
                                prEmployees."Employee Qty" := HREmp."Employee Qty";
                                prEmployees."Employee Act. Qty" := HREmp."Employee Act. Qty";
                                prEmployees."Employee Arc. Qty" := HREmp."Employee Arc. Qty";
                                prEmployees."Payroll Code" := HREmp."No.";
                                prEmployees.Insert;
                                prEmployees.Validate("No.");
                                // Create A SalaryCard Entry

                                prPayrollType.Reset;
                                prPayrollType.SetRange(prPayrollType."Payroll Code", HREmp."No.");
                                if prPayrollType.Find('-') then begin
                                    prPayrollType."Payroll Code" := HREmp."No.";
                                    prPayrollType."Payroll Name" := HREmp."First Name" + '' + HREmp."Middle Name" + '' + HREmp."Last Name";
                                    prPayrollType.Modify;
                                end else begin
                                    prPayrollType.Init;
                                    prPayrollType."Payroll Code" := HREmp."No.";
                                    prPayrollType."Payroll Name" := HREmp."First Name" + '' + HREmp."Middle Name" + '' + HREmp."Last Name";
                                    prPayrollType.Insert;
                                end;


                            end;

                        end;
                        until HREmp.Next = 0;
                    end;

                    Message('Payroll data Successfully Updated.');
                end;


            }

        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        IF Rec.Status <> Rec.Status::Open THEN ERROR('You cannot modify a PCA if status is not open');
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        objPeriod.RESET;
        objPeriod.SETRANGE(objPeriod.Closed, FALSE);
        IF objPeriod.FIND('-') THEN BEGIN
            Rec."Payroll Period" := objPeriod."Date Opened";
            //:=objPeriod."Period Name";
            Rec."Period Month" := objPeriod."Period Month";
            Rec."Period Year" := objPeriod."Period Year";
        END;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        //  IF Rec.Status = Rec.Status::Approved THEN ERROR('You cannot modify a PCA if status is not open');
    end;

    var
        objPeriod: Record "PRL-Payroll Periods";
        uSetup: Record "User Setup";
        mPayrollCode: Code[50];
        HREmp: Record "HRM-Employee C";
        prEmployees: Record "HRM-Employee C";
        objEmp: Record "HRM-Employee C";
        objSalCard: Record "PRL-Salary Card";
        objEmpTrans: Record "PRL-Employee Transactions";
        objEmpTransPCA: Record "prEmployee Trans PCA";
        objPayrollPeriod: Record "PRL-Payroll Periods";
        prPayrollType: Record "PRL-Payroll Type";
        intMonth: Integer;
        intYear: Integer;
        dtPAyrollPeriod: Date;
        dim1: Code[50];
        dim2: Code[50];
        dim3: Code[50];
        dim4: Code[50];
        UserSetup: Record "User Setup";
        CustomApprovals: Codeunit "Work Flow Code";
        VarVariant: Variant;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

    procedure fnTrackChanges(columnss: Code[250]; oldValue: Code[250]; NewValue: Code[250])
    var
        HRtracker: Record "HRM-Value Change";
    begin
        HRtracker.INIT;
        HRtracker."employee No" := Rec."Employee Code";
        HRtracker."Change Date" := TODAY;
        HRtracker."Change Description" := columnss;
        HRtracker."Old Value" := oldValue;
        HRtracker."New Value" := NewValue;
        HRtracker.UserID := USERID;
        HRtracker.INSERT;
    end;
}


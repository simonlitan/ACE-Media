table 52179095 "HRM-Employee C"
{
    DataCaptionFields = "No.", "First Name", "Middle Name", "Last Name";
    DrillDownPageID = "HRM-All Employees Listing";
    LookupPageID = "HRM-All Employees Listing";

    fields
    {
        field(1; "No."; Code[50])
        {
            NotBlank = false;


        }
        field(2; "First Name"; Text[30])
        {
        }
        field(3; "Middle Name"; Text[30])
        {
        }
        field(4; "Last Name"; Text[30])
        {

            trigger OnValidate()
            var
                Reason: Text[30];
            begin
                /*  IF (("Last Name" <> xRec."Last Name") AND  (xRec."Last Name" <> ''))  THEN BEGIN
                     CareerEvent.SetMessage('Changing Surname in Career History');
                     CareerEvent.RUNMODAL;
                     OK:= CareerEvent.ReturnResult;
                      IF OK THEN BEGIN
                         IF NOT CareerHistory.FIND('-') THEN
                          CareerHistory."Line No.":=1
                        ELSE BEGIN
                          CareerHistory.FIND('+');
                          CareerHistory."Line No.":=CareerHistory."Line No."+1;
                        END;

                         CareerHistory.INIT;
                         CareerHistory.Reason := CareerEvent.ReturnReason;
                         CareerHistory."Employee No.":= "No.";
                         CareerHistory."Date Of Event":= WORKDATE;
                         CareerHistory."Career Event":= 'Surname Changed';
                         CareerHistory."Last Name":= "Last Name";
                         CareerHistory."Employee First Name":= "Known As";
                         CareerHistory."Employee Last Name":= "Last Name";
                         CareerHistory.INSERT;
                      END;
                  END;

                   */

                Names := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";

            end;
        }
        field(5; Initials; Text[30])
        {
            //TableRelation = "HRM-Staff Title".Code;

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Initials)) or ("Search Name" = '') then
                    "Search Name" := Initials;
            end;
        }
        field(6; "Salary Step"; integer)
        {
            TableRelation = "HRM-Auto Inreament Sal. Steps".Step where("Salary Grade" = field("Salary Grade"));
            trigger OnValidate()
            var
                Sgrade: Record "HRM-Auto Inreament Sal. Steps";
                PrPeriod: Record "PRL-Payroll Periods";
                SalCard1: Record "PRL-Salary Card";
            begin


                begin


                    Sgrade.Reset();
                    Sgrade.SetRange("Employee Category", Rec."Salary Category");
                    Sgrade.SetRange("Salary Grade", Rec."Salary Grade");
                    Sgrade.SetRange(Step, Rec."Salary Step");
                    if Sgrade.find('-') then begin
                        PrPeriod.Reset();
                        PrPeriod.SetRange(Closed, false);
                        if PrPeriod.find('-') then begin
                            SalCard1.Reset();
                            SalCard1.SetRange("Employee Code", Rec."No.");
                            SalCard1.SetRange("Payroll Period", PrPeriod."Date Opened");
                            if SalCard1.find('-') then begin
                                SalCard1."Basic Pay" := Sgrade."Basic Salary";
                                SalCard1."Payment Mode" := SalCard1."Payment Mode"::"Bank Transfer";
                                SalCard1."Pays PAYE" := true;
                                SalCard1."Pays NSSF" := true;
                                SalCard1."Pays NHIF" := true;
                                SalCard1.Modify();
                            end else begin
                                SalCard1."Employee Code" := Rec."No.";
                                SalCard1."Payment Mode" := SalCard1."Payment Mode"::"Bank Transfer";
                                SalCard1."Basic Pay" := Sgrade."Basic Salary";
                                SalCard1."Pays PAYE" := true;
                                SalCard1."Pays NSSF" := true;
                                SalCard1."Pays NHIF" := true;
                                SalCard1."Payroll Period" := PrPeriod."Date Opened";
                                SalCard1.Insert();
                            end;
                            Message('Successfully Changed the salary');
                        end;

                    end;
                end;

            end;
        }

        field(7; "Search Name"; Code[50])
        {
        }

        field(8; "Postal Address"; Text[50])
        {
        }
        field(9; "Residential Address"; Text[50])
        {
        }
        field(10; City; Text[30])
        {

            trigger OnValidate()
            begin
                /* IF (City <> xRec.City) THEN BEGIN
                     CareerEvent.SetMessage('Location Changed');
                     CareerEvent.RUNMODAL;
                     OK:= CareerEvent.ReturnResult;
                      IF OK THEN BEGIN
                         IF NOT CareerHistory.FIND('-') THEN
                          CareerHistory."Line No.":=1
                        ELSE BEGIN
                          CareerHistory.FIND('+');
                          CareerHistory."Line No.":=CareerHistory."Line No."+1;
                        END;

                         CareerHistory.INIT;
                         CareerHistory."Employee No.":= "No.";
                         CareerHistory."Date Of Event":= WORKDATE;
                         CareerHistory."Career Event":= 'Location Changed';
                         CareerHistory.Location:= City;
                         CareerHistory."Employee First Name":= "Known As";
                         CareerHistory."Employee Last Name":= "Last Name";
                         CareerHistory.INSERT;
                      END;
                 END;*/

            end;
        }
        field(11; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if PostCode.Get("Post Code") then
                    City := PostCode.City;
                /* IF ((City <> xRec.City) AND  (xRec.City <> ''))  THEN BEGIN
                    CareerEvent.SetMessage('Location Changed');
                    CareerEvent.RUNMODAL;
                    OK:= CareerEvent.ReturnResult;
                     IF OK THEN BEGIN
                        IF NOT CareerHistory.FIND('-') THEN
                         CareerHistory."Line No.":=1
                       ELSE BEGIN
                         CareerHistory.FIND('+');
                         CareerHistory."Line No.":=CareerHistory."Line No."+1;
                       END;

                        CareerHistory.INIT;
                        CareerHistory."Employee No.":= "No.";
                        CareerHistory."Date Of Event":= WORKDATE;
                        CareerHistory."Career Event":= 'Location Changed';
                        CareerHistory.Location:= City;
                        CareerHistory."Employee First Name":= "Known As";
                        CareerHistory."Employee Last Name":= "Last Name";
                        CareerHistory.INSERT;
                     END;
                END;  */

            end;
        }
        field(12; County; Text[30])
        {
        }

        field(13; "Home Phone Number"; Text[30])
        {
        }
        field(14; "Cellular Phone Number"; Text[30])
        {
        }
        field(15; "Work Phone Number"; Text[30])
        {
        }
        field(16; "Ext."; Text[20])
        {
        }
        field(17; "E-Mail"; Text[100])
        {
        }
        field(18; "Date of Dismisal"; Date)
        { }
        field(19; Picture; BLOB)
        {
            SubType = Bitmap;
        }
        field(20; "Drive to Work"; Option)
        {
            OptionMembers = " ",Yes,No;
        }
        field(21; "ID Number"; Text[30])
        {
        }
        field(22; "Union Code"; Code[20])
        {
            TableRelation = Union;
        }
        field(23; "UIF Number"; Text[30])
        {
        }
        field(24; Gender; Option)
        {
            OptionMembers = " ",Male,Female;
        }
        field(25; "Country Code"; Code[20])
        {
            TableRelation = "Country/Region";
        }
        field(26; date; Date)
        {

        }
        field(27; Station; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(28; "Statistics Group Code"; Code[20])
        {
            TableRelation = "Employee Statistics Group";
        }
        field(29; Spouse; text[40])
        {

        }
        field(30; "Next of Kin"; text[40])
        {

        }
        field(31; Status; Option)
        {
            OptionCaption = 'Active,Inactive,Retired,Resigned,Dismissed,Discharged,Deceased,Contract Expiry,Study Leave, suspension, Interdiction, Unpaikd Leave';
            OptionMembers = Active,Inactive,Retired,Resigned,Dismissed,Disabled,Discharged,Deceased,"Study Leave","Contract Expiry",suspension,Interdiction,"Unpaid Leave";



        }
        field(32; "Driver License Number"; Code[30])
        {


        }
        field(33; "Last License Renewal"; date)
        {

        }
        field(34; "Renewal Interval"; code[10])
        {

        }
        field(35; "Renewal Interval Value"; code[10])
        {

        }
        field(36; "State Counsel"; Boolean)
        {
            Caption = 'Counsel Dealing';


        }
        field(325; "Responsibility Centre"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;

            trigger OnValidate()
            begin

            end;
        }


        field(37; Office; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('BRANCH'));

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                //  EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(38; "Resource No."; Code[20])
        {
            TableRelation = Resource;

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                //  EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(39; Comment; Boolean)
        {
            Editable = false;
        }
        field(40; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(41; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(42; "Days Generated"; Boolean)
        {

        }
        field(43; "Staff Advance No"; Code[50])
        {
            TableRelation = Customer."No." where("Customer Posting Group" = filter('Salary Advance'));
        }
        field(44; "Next License Renewal"; Date)
        { }
        field(45; "Year of Experience"; Code[20])
        {

        }
        field(46; "Pension Cleared"; Boolean)
        {
        }


        field(47; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(48; Cleared; Boolean)
        {
        }
        field(49; "Fax Number"; Text[30])
        {
        }
        field(50; "Company E-Mail"; Text[60])
        {
        }
        field(51; Title; Option)
        {
            OptionCaption = ',  ,MR,MRS,MISS,DR,PROF,Ms';
            OptionMembers = "  ","MR.","MRS.","MISS.","MS.","DR.",CC,"PROF.";

            trigger OnValidate()
            begin


            end;
        }
        field(52; "Salespers./Purch. Code"; Code[20])
        {

            trigger OnValidate()
            begin
                if ("Salespers./Purch. Code" <> '') and SalespersonPurchaser.WritePermission then;
                //EmployeeSalespersonUpdate.SalesPersonUpdate(Rec)
            end;
        }
        field(53; "No. Series"; Code[20])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(54; "Known As"; Text[30])
        {


        }
        field(55; Position; Text[80])
        {
            TableRelation = "HRM-Jobs"."Job Id";

            trigger OnValidate()
            begin


            end;
        }
        field(56; "Notice Period Days Served"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(57; "Full / Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time",Contract;

            trigger OnValidate()
            begin


            end;
        }
        field(58; "Contract Type"; Option)
        {
            OptionMembers = "",Permanent,Contract,"Temporary";
            // TableRelation = "HRM-Contract Types".Contract;
        }
        field(59; "Contract End Date"; Date)
        {
        }
        field(60; "Notice Period"; Code[20])
        {
        }
        field(61; "Union Member?"; Boolean)
        {
        }
        field(62; "Shift Worker?"; Boolean)
        {
        }
        field(63; "Contracted Hours"; Decimal)
        {
        }
        field(64; "Pay Period"; Option)
        {
            OptionMembers = Weekly,"2 Weekly","4 Weekly",Monthly," ";
        }
        field(65; "Pay Per Period"; Decimal)
        {
        }
        field(66; "Cost Code"; Code[20])
        {
            // TableRelation = Table39005630;

            trigger OnValidate()
            begin
                CurrentPayDetails;
            end;
        }
        field(67; "Notice Period Served"; Option)
        {
            OptionCaption = ' ,Fully,Partially';
            OptionMembers = " ",Fully,Partially;
        }
        field(68; "PAYE Number"; Text[30])
        {
        }
        field(69; "UIF Contributor?"; Boolean)
        {
        }
        field(70; "Date of Death"; Date)
        { }
        field(71; "PAYROLL NO"; Code[20])
        {
        }
        field(72; "Staff Claims No"; Code[50])
        {
            TableRelation = Vendor."No." where("Vendor Posting Group" = filter('CLAIM'));
        }
        field(73; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;

            trigger OnValidate()
            begin

            end;
        }
        field(74; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;

            trigger OnValidate()
            begin
                /*     EmployeeEquity.SETRANGE("Employee No.","No.");
                     OK:= EmployeeEquity.FIND('-');
                     IF OK THEN BEGIN
                       EmployeeEquity."Middle Name":= "Ethnic Origin";
                       EmployeeEquity.MODIFY;
                     END;
                          */
            end;
        }
        field(75; "First Language (R/W/S)"; Code[20])
        {

        }
        field(76; "Driving Licence"; Code[20])
        {

        }
        field(77; "Vehicle Registration Number"; Code[20])
        {

            trigger OnValidate()
            begin


            end;
        }



        field(78; Disabled; Option)
        {
            OptionMembers = " ",No,Yes;

            trigger OnValidate()
            begin
                if (Disabled = Disabled::Yes) then
                    Status := Status::Active;
                "Physical Disability" := true;
            end;
        }
        field(79; "Health Assesment?"; Boolean)
        {
        }
        field(80; "Health Assesment Date"; Date)
        {
        }
        field(81; "Date of Birth"; Date)
        {
        }

        field(82; Age; Text[40])
        {
        }
        field(83; "Date of Join"; Date)
        {

            trigger OnValidate()
            begin
                Age := Dates.DetermineAge("Date Of Birth", "Date Of Join");
                if ("Date Of Leaving" <> 0D) and ("Date Of Join" <> 0D) then
                    "Length Of Service" := Dates.DetermineAge("Date Of Join", "Date Of Leaving");
                if "Physical Disability" = true then begin
                    "Retirement date" := CalcDate('65Y', "Date of Birth")
                end else
                    "Retirement date" := CalcDate('60Y', "Date of Birth")
            end;
        }
        field(84; "Length Of Service"; Text[50])
        {
        }
        field(85; "End Of Probation Date"; Date)
        {
        }
        field(86; "Pension Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                if ("Date Of Leaving" <> 0D) and ("Pension Scheme Join" <> 0D) then
                    "Time Pension Scheme" := Dates.DetermineAge("Pension Scheme Join", "Date Of Leaving");
            end;
        }
        field(87; "Time Pension Scheme"; Text[50])
        {
        }
        field(88; "Medical Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                if ("Date Of Leaving" <> 0D) and ("Medical Scheme Join" <> 0D) then
                    "Time Medical Scheme" := Dates.DetermineAge("Medical Scheme Join", "Date Of Leaving");
            end;
        }
        field(89; "Time Medical Scheme"; Text[20])
        {

        }
        field(90; "Date Of Leaving"; Date)
        {

            trigger OnValidate()
            begin
                if ("Date Of Join" <> 0D) and ("Date Of Leaving" <> 0D) then
                    "Length Of Service" := Dates.DetermineAge("Date Of Join", "Date Of Leaving");
                if ("Pension Scheme Join" <> 0D) and ("Date Of Leaving" <> 0D) then
                    "Time Pension Scheme" := Dates.DetermineAge("Pension Scheme Join", "Date Of Leaving");
                if ("Medical Scheme Join" <> 0D) and ("Date Of Leaving" <> 0D) then
                    "Time Medical Scheme" := Dates.DetermineAge("Medical Scheme Join", "Date Of Leaving");


                if ("Date Of Leaving" <> 0D) and ("Date Of Leaving" <> xRec."Date Of Leaving") then begin
                    ExitInterviews.SetRange("Employee No.", "No.");
                    OK := ExitInterviews.Find('-');
                    Commit();
                end;


                if ("Date Of Leaving" <> 0D) and ("Date Of Leaving" <> xRec."Date Of Leaving") then begin

                    if OK then begin

                    end;
                end;

            end;
        }

        field(91; "Per Annum"; Decimal)
        {
        }
        field(92; "Allow Overtime"; Option)
        {
            OptionMembers = Yes,No," ";
        }
        field(93; "Medical Scheme No."; Text[30])
        {

            trigger OnValidate()
            begin

                if ("Medical Scheme No." <> xRec."Medical Scheme No.") and ("Medical Scheme No." <> '') then begin

                    if OK then begin

                    end;
                end;

            end;
        }
        field(94; "Medical Scheme Head Member"; Text[20])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(95; "Number Of Dependants"; Integer)
        {

            trigger OnValidate()
            begin

            end;
        }
        field(96; "Medical Scheme Name"; Text[30])
        {
            TableRelation = "GEN-Medical Scheme"."Medical Scheme";

            trigger OnValidate()
            begin

            end;
        }
        field(97; "Amount Paid By Employee"; Decimal)
        {

            trigger OnValidate()
            begin

            end;
        }
        field(98; "Amount Paid By Company"; Decimal)
        {

            trigger OnValidate()
            begin

            end;
        }

        field(99; "Receiving Car Allowance ?"; Boolean)
        {
        }
        field(100; "Second Language (R/W/S)"; Code[20])
        {

        }
        field(101; "Additional Language"; Code[20])
        {

        }

        field(102; "Cell Phone Reimbursement?"; Boolean)
        {
        }
        field(103; "Amount Reimbursed"; Decimal)
        {
        }
        field(104; "UIF Country"; Code[20])
        {
            TableRelation = "Country/Region".Code;
        }

        field(105; "Direct/Indirect"; Option)
        {
            OptionMembers = Direct,Indirect;
        }
        field(106; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                // EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(107; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                // EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(108; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Deceased,Termination,"Contract Ended",Abscondment,"Appt. Revoked","Contract Termination",Retrenchment,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
                //**Added by ACR 12/08/2002
                //**Block resource if Terminated

                if "Resource No." <> '' then begin
                    OK := "Lrec Resource".Get("Resource No.");
                    "Lrec Resource".Blocked := true;
                    "Lrec Resource".Modify;
                end;

                //**
            end;
        }
        field(109; "Job Specification"; Code[20])
        {
        }
        field(110; DateOfBirth; Text[8])
        {
        }
        field(111; DateEngaged; Text[8])
        {
        }
        field(112; "Postal Address2"; Text[50])
        {
        }
        field(113; "Postal Address3"; Text[20])
        {
        }
        field(114; "Residential Address2"; Text[30])
        {
        }
        field(115; "Residential Address3"; Text[20])
        {
        }
        field(116; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(117; Citizenship; Code[20])
        {
            TableRelation = "Country/Region".Code;
        }
        field(118; "Name Of Manager"; Text[45])
        {
        }
        field(119; "User ID"; Code[20])
        {
            TableRelation = "User Setup"."User ID";
            //This property is currently not supported
            //TestTableRelation = true;

            trigger OnValidate()
            begin
                //IF ("User ID" <> '') AND User.WRITEPERMISSION THEN
                // EmployeeResUpdate.UserUpdate(Rec)
            end;
        }
        field(120; "Disabling Details"; Text[250])
        {
        }
        field(121; "Disability Grade"; Text[30])
        {
        }
        field(122; "Passport Number"; Text[30])
        {
        }
        field(123; "2nd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(124; "3rd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(125; PensionJoin; Text[8])
        {
        }
        field(126; DateLeaving; Text[30])
        {
        }
        field(127; Region; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('REGION'));
        }
        field(128; "Manager Emp No"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                emps.Reset;
                emps.SetRange(emps."No.", "Manager Emp No");
                if emps.Find('-') then begin
                    "Name Of Manager" := emps."First Name" + ' ' + emps."Middle Name" + ' ' + emps."Last Name";
                end;
            end;
        }
        field(129; Temp; Text[30])
        {
        }
        field(130; "Employee Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
            Editable = false;
        }
        field(131; "Employee Act. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("Termination Category" = FILTER('retirement')));
            FieldClass = FlowField;
            Editable = false;
        }
        field(132; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("Termination Category" = FILTER(<> '')));
            FieldClass = FlowField;
            Editable = false;
        }
        field(133; "Contract Location"; Text[20])
        {
            Description = 'Location where contract was closed';
        }
        field(134; "First Language Read"; Boolean)
        {
        }
        field(135; "First Language Write"; Boolean)
        {
        }
        field(136; "First Language Speak"; Boolean)
        {
        }
        field(137; "Second Language Read"; Boolean)
        {
        }
        field(138; "Second Language Write"; Boolean)
        {
        }
        field(139; "Second Language Speak"; Boolean)
        {
        }
        field(140; "Custom Grading"; Code[20])
        {
            //todo TableRelation = Table39005744.Field2;
        }
        field(141; "PIN Number"; Code[20])
        {
        }
        field(142; "NSSF No."; Code[20])
        {
        }
        field(143; "NHIF No."; Code[20])
        {
        }
        field(144; "Cause of Inactivity Code"; Code[20])
        {
            Caption = 'Cause of Inactivity Code';
            TableRelation = "Cause of Inactivity";
        }
        field(145; "Grounds for Term. Code"; Code[20])
        {
            Caption = 'Grounds for Term. Code';
            TableRelation = "Grounds for Termination";
        }

        field(146; "Sacco Staff No"; Code[10])
        {
        }

        field(147; "HELB No"; Text[30])
        {
        }
        field(148; "Co-Operative No"; Text[30])
        {
        }
        field(149; "Wedding Anniversary"; Date)
        {
        }

        field(150; "KPA Code"; Code[20])
        {
            FieldClass = FlowFilter;
        }

        field(151; "Cost Center Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COURSE'));
        }


        field(152; "Position To Succeed"; Code[20])
        {
            TableRelation = "HRM-Jobs"."Job ID";

            trigger OnValidate()
            begin
                /*SuccessionGap.RESET;
                SuccessionGap.SETRANGE(SuccessionGap."Employee No","No.");
                IF SuccessionGap.FIND('-') THEN
                SuccessionGap.DELETEALL;
                
                JobReq.RESET;
                JobReq.SETRANGE(JobReq."Job Id","Position To Succeed");
                IF JobReq.FIND('-') THEN
                BEGIN
                REPEAT
                IF NOT EmpQualification.GET("No.",JobReq."Qualification Code") THEN
                BEGIN
                SuccessionGap.INIT;
                SuccessionGap."Employee No":="No.";
                SuccessionGap."Job Id":=JobReq."Job Id";
                SuccessionGap."Qualification Type":=JobReq."Qualification Type";
                SuccessionGap."Qualification Code":=JobReq."Qualification Code";
                SuccessionGap.Qualification:=JobReq.Qualification;
                SuccessionGap.Priority:=JobReq.Priority;
                SuccessionGap.INSERT;
                END;
                UNTIL JobReq.NEXT = 0;
                END;
                 */

            end;
        }
        field(153; "Succesion Date"; Date)
        {
        }
        field(154; "Send Alert to"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(155; Tribe; Code[20])
        {
            TableRelation = Tribes."Tribe Code";
        }
        field(156; Religion; Code[20])
        {

        }
        field(157; "Job Title"; Text[500])
        {
            Editable = false;

        }
        field(158; "Post Office No"; Text[30])
        {
        }
        field(159; "Posting Group"; Code[30])
        {
            NotBlank = true;
            TableRelation = "PRL-Employee Posting Group".Code;
        }
        field(160; "Payroll Posting Group"; Code[20])
        {
            TableRelation = "PRL-Employee Posting Group".Code;
        }
        field(161; "Served Notice Period"; Boolean)
        {
        }
        field(162; "Exit Interview Date"; Date)
        {
        }
        field(163; "Exit Interview Done by"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(164; "Allow Re-Employment In Future"; Boolean)
        {
        }
        field(165; "Medical Scheme Name #2"; Text[100])
        {
            TableRelation = "GEN-Medical Scheme"."Medical Scheme";

            trigger OnValidate()
            begin
                //MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //OK := MedicalAidBenefit.FIND('+');
                //IF OK THEN BEGIN
                // REPEAT
                // MedicalAidBenefit."Medical Aid Name":= "Medical Aid Name";
                //  MedicalAidBenefit.MODIFY;
                // UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(166; "Resignation Date"; Date)
        {
        }
        field(167; "Suspension Date"; Date)
        {
        }
        field(168; "Demised Date"; Date)
        {
        }
        field(169; "Retirement date"; Date)
        {
        }

        field(170; "Retrenchment date"; Date)
        {
        }

        field(171; Permanent; Boolean)
        {
        }
        field(172; "Library Category"; Option)
        {
            OptionMembers = "ADMIN STAFF","TEACHING STAFF",DIRECTORS;
        }
        field(173; Category; Code[10])
        {
        }

        field(174; "Library Code"; Code[20])
        {
            //  TableRelation = "ACA-Library Codes"."Lib Code";
        }
        field(175; "Library Borrower Type"; Option)
        {
            OptionCaption = 'Staff';
            OptionMembers = Staff;
        }
        field(176; Names; Text[100])
        {
        }
        field(177; Lecturer; Boolean)
        {
        }
        field(178; "Maximun Hours"; Decimal)
        {
        }
        field(179; Password; Text[50])
        {
        }

        field(180; "Grade Level"; Code[20])
        {
            TableRelation = "HRM-Salary Grades"."Salary Grade";

        }
        field(181; "Company Type"; Option)
        {
            OptionCaption = 'KRC Staff,RTI Staff';
            OptionMembers = "KRC Staff","RTI Staff";
        }
        field(182; "Main Bank"; Code[50])
        {
            TableRelation = "PRL-Bank Structure"."Bank Code";
            trigger OnValidate()
            begin
                bankstructure.Reset();
                bankstructure.SetRange("Bank Code", "Main Bank");
                if bankstructure.FindFirst() then
                    "Main Bank Name" := bankstructure."Bank Name";

            end;

        }
        field(183; "Branch Bank"; Code[50])
        {
            TableRelation = "PRL-Bank Structure"."Branch Code" where("Bank Code" = field("Main Bank"));
            trigger OnValidate()
            begin
                bankstructure.Reset();
                bankstructure.SetRange("Bank Code", "Main Bank");
                bankstructure.SetRange("branch Code", "Branch Bank");
                if bankstructure.FindFirst() then
                    "Branch Bank Name" := bankstructure."Branch Name";
            end;
        }
        field(184; "Lock Bank Details"; Boolean)
        {
        }
        field(324; "KRA Certificate"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(185; "Bank Account Number"; Code[30])
        {
        }
        field(186; "Date of Current Appointment"; Date)
        {
        }
        field(187; "Payroll Code"; Code[20])
        {
            TableRelation = "PRL-Payroll Type";
        }
        field(188; "Holiday Days Entitlement"; Decimal)
        {
        }
        field(189; "Holiday Days Used"; Decimal)
        {
        }
        field(190; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,FOSA;
        }
        field(191; "Hourly Rate"; Decimal)
        {
        }
        field(192; "Daily Rate"; Decimal)
        {
        }
        field(193; "Other Names"; Text[50])
        {
        }

        field(194; "Project Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('projects'));
        }
        field(195; "count"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(196; "Portal Password"; Text[30])
        {

            trigger OnValidate()
            begin
                "Changed Password" := false;
                Modify;
            end;
        }
        field(197; "Changed Password"; Boolean)
        {
            Editable = false;
        }
        field(198; "Leave Balance"; Decimal)
        {
            CalcFormula = Sum("HRM-Leave Ledger"."No. of Days" WHERE("Employee No" = FIELD("No."), "Leave Type" = const('ANNUAL')));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            Editable = false;
        }
        field(326; "Forfeited Leave"; Decimal)
        {
            CalcFormula = Sum("HRM-Leave Ledger"."Forfeited Leave" WHERE("Employee No" = FIELD("No."), "Leave Type" = const('ANNUAL')));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            Editable = false;
        }

        field(199; "Citizenship Text"; Text[20])
        {
        }
        field(200; "Full Name"; Text[81])
        {
        }

        field(201; "Job Application No"; Code[30])
        {
        }
        field(202; "Taken Leave Days"; Decimal)
        {
        }
        field(203; "Probation Start Date"; Date)
        {
        }
        field(204; "Confirmation Date"; Date)
        {
        }
        field(205; "Days to Retirement"; Integer)
        {
        }
        field(206; "Annual Increament Date"; Date)
        {
        }
        field(207; "Date Of Present Appointment"; Date)
        {
        }
        field(208; "Employee Terms Of Service"; Option)
        {
            OptionCaption = 'Temporary Appointment,Designee,Consultant,Pre-Service trainee';
            OptionMembers = "Temporary Appointment",Designee,Consultant,"Pre-Service trainee";
        }
        field(209; "Station Name"; Text[10])
        {
            Editable = false;
        }
        field(210; "Incremental Month"; Integer)
        {
        }
        field(211; "Directorate Name"; Text[20])
        {
            Editable = false;
        }
        field(212; "Main Bank Name"; Text[100])
        {



        }

        field(213; "Branch Bank Name"; Text[100])
        {


        }


        field(214; "House Allowance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(215; Salutation; code[50])
        {
            //OptionMembers = " ",Sir,Madam;
        }
        field(216; Supervisor; code[30])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(217; "Earns Gratuity"; boolean)
        {
        }
        field(218; "On Probation"; boolean)
        {
        }
        field(219; "Gratuity Wth Voluntary Pension"; boolean)
        {
        }
        field(220; "Employee Pension %"; Decimal)
        {
        }
        field(221; "Status 2"; Option)
        {
            OptionCaption = 'Active,Inactive,Retired,Resigned,Dismissed,Disabled,Discharged';
            OptionMembers = Active,Inactive,Retired,Resigned,Dismissed,Disabled,Discharged;
        }
        field(222; "Paid Leave Allowance"; Boolean)
        {

        }
        field(223; "Job Id"; code[50])
        {
            TableRelation = "HRM-Jobs"."Job ID";
            trigger OnValidate()
            begin
                Joblist.Reset();
                Joblist.SetRange("Job ID", rec."Job ID");
                if Joblist.Find('-') then begin
                    "Job Title" := Joblist."Job Title";
                end;


            end;

        }
        field(224; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


        }
        field(225; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));


        }
        field(226; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));


        }
        field(227; "Social Security No."; Code[20])
        {
        }
        field(228; "Pension House"; Code[20])
        {
            // TableRelation = "PRL-Institutional Membership"."Institution No" WHERE("Group No" = CONST('PENSION'));
        }
        field(229; "Salary Notch/Step"; Integer)
        {

            trigger OnValidate()
            begin
                if not Confirm('Changing the Grade will affect the Basic Salary', false) then
                    Error('You have opted to abort the process');

                if SalCard.Get("No.") then begin


                    SalNotch.RESET;
                    SalNotch.SETRANGE(SalNotch."Salary Grade", "Salary Grade");
                    SalNotch.SETRANGE(SalNotch."Step", "Salary Notch/Step");
                    IF SalNotch.FIND('-') THEN BEGIN
                        IF SalNotch."Basic Salary" <> 0 THEN BEGIN
                            IF SalCard.GET("No.") THEN BEGIN
                                SalCard."Basic Pay" := SalNotch."Basic Salary";
                            END;
                        END;
                    END;

                    SalCard.MODIFY;
                END ELSE BEGIN
                    SalCard.INIT;
                    SalCard."Employee Code" := "No.";
                    SalCard."Pays PAYE" := TRUE;
                    //   SalCard."Location/Division":="Location/Division Code";

                    //   SalCard."Cost Centre":="Cost Center Code";
                    //   SalCard."Salary Grade":="Salary Grade";
                    //SalCard."Salary Notch":="Salary Notch/Step";
                    IF SalGrade.GET("Salary Grade") THEN
                        //  SalaryGrades."Pays NHF":=SalGrade."Pays NHF";

                        SalNotch.RESET;
                    SalNotch.SETRANGE(SalNotch."Salary Grade", "Salary Grade");
                    SalNotch.SETRANGE(SalNotch."Step", "Salary Notch/Step");
                    IF SalNotch.FIND('-') THEN BEGIN
                        IF SalNotch."Basic salary" <> 0 THEN BEGIN
                            SalCard."Basic Pay" := SalNotch."Basic salary";
                        END;
                    END;
                    SalCard.INSERT;

                END;

                objPayrollPeriod.RESET;
                objPayrollPeriod.SETRANGE(objPayrollPeriod.Closed, FALSE);
                IF objPayrollPeriod.FIND('-') THEN BEGIN
                    NotchTrans.RESET;
                    NotchTrans.SETRANGE(NotchTrans."Salary Grade code", "Salary Grade");
                    NotchTrans.SETRANGE(NotchTrans."Grade Level", "Salary Notch/Step");
                    IF NotchTrans.FIND('-') THEN BEGIN
                        REPEAT
                            EmpTrans.RESET;
                            EmpTrans.SETCURRENTKEY(EmpTrans."Employee Code", EmpTrans."Transaction Code");
                            EmpTrans.SETRANGE(EmpTrans."Employee Code", "No.");
                            // EmpTrans.SETRANGE(EmpTrans."Transaction Code", NotchTrans."Transaction Code");
                            // EmpTrans.SETRANGE(EmpTrans."Payroll Period", objPayrollPeriod."Date Opened");
                            IF EmpTrans.FIND('-') THEN BEGIN
                                // EmpTrans.Amount := NotchTrans.Amount;
                                EmpTrans.MODIFY;
                            END ELSE BEGIN
                                EmpTransR.INIT;
                                EmpTransR."Employee Code" := "No.";
                                //  EmpTransR."Transaction Code" := NotchTrans."Transaction Code";
                                EmpTransR."Period Month" := objPayrollPeriod."Period Month";
                                EmpTransR."Period Year" := objPayrollPeriod."Period Year";
                                EmpTransR."Payroll Period" := objPayrollPeriod."Date Opened";
                                // EmpTransR."Transaction Name" := NotchTrans."Transaction Name";
                                //EmpTransR.Amount := NotchTrans.Amount;
                                EmpTransR.INSERT;

                            END;


                        UNTIL NotchTrans.NEXT = 0;
                    END;

                end;

            end;
        }
        field(230; "Status Change Date"; Date)
        {
        }
        field(231; "Previous Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(232; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(233; "Prev. Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('BPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(234; "Curr. Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('BPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(235; "Prev. Gross Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('GPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(236; "Curr. Gross Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('GPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(237; "Gross Income Variation"; Decimal)
        {
        }
        field(238; "Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(239; "Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(240; "Transaction Amount"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = FIELD("Transaction Code Filter"),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(241; "Transaction Code Filter"; Text[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "PRL-Transaction Codes"."Transaction Code";
        }
        field(242; "NHF No."; Code[20])
        {
        }
        field(243; "NSITF No."; Code[20])
        {
        }
        field(244; "Account Type"; Option)
        {
            OptionCaption = ' ,Savings,Current';
            OptionMembers = " ",Savings,Current;
        }
        field(245; "Location/Division Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('LOC/DIV'));
        }
        field(246; "Cost Centre Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COSTCENTRE'));
        }
        field(247; "Salary Grade Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(248; "Salary Notch Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(249; "Payroll Type"; Option)
        {
            OptionCaption = 'General,Directors';
            OptionMembers = General,Directors;
        }
        field(250; "Employee Classification"; Code[20])
        {
        }
        field(251; "Transaction AUtil"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('UTILJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(252; "Transaction AEdu"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('EDUJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(253; "Transaction AFurn"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('FURNJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }

        field(254; "ECA Contrib"; Decimal)
        {
            CalcFormula = Sum("PRL-Employee Transactions"."Employer Amount" WHERE("Transaction Code" = CONST('ECA'),
                                                                                   "Employee Code" = FIELD("No."),
                                                                                   "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(255; "Prev. Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = CONST(20140101D)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(256; "Curr. Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = CONST(20140201D)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(257; "Gross Net Pay Variation"; Decimal)
        {
        }
        field(258; "Prev net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(259; "Curr net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(260; "Gross Net Variation"; Decimal)
        {
        }

        field(261; "Selected Period"; Date)
        {
        }
        field(323; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = filter(2));

            trigger OnValidate()
            begin


            end;
        }


        field(262; "Total Leave Taken"; Decimal)
        {


            CalcFormula = sum("HRM-Leave Requisition"."Applied Days" where("Employee No" = field("No."), Status = filter(Posted), "Leave Type" = filter('ANNUAL')));
            Editable = false;
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
            trigger OnValidate()
            var
                leavereq: Record "HRM-Leave Requisition";
            begin
                // leavereq.Leavedate(Today);
            end;
        }
        field(263; "Total (Leave Days)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(264; "Cash - Leave Earned"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(265; "Reimbursed Leave Days"; Decimal)
        {
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                Validate("Allocated Leave Days");
            end;
        }
        field(266; "Cash per Leave Day"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(267; "Allocated Leave Days"; Decimal)
        {

            trigger OnValidate()
            begin
                CalcFields("Total Leave Taken");
                "Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
                //SUM UP LEAVE LEDGER ENTRIES
                "Leave Balance" := "Total (Leave Days)" - "Total Leave Taken";
                //TotalDaysVal := Rec."Total Leave Taken";
            end;
        }
        field(268; "Contract Start Date"; Date)
        {
        }

        field(269; "Alt. Address Start Date"; Date)
        {
            Caption = 'Alt. Address Start Date';
        }
        field(270; "Alt. Address End Date"; Date)
        {
            Caption = 'Alt. Address End Date';
        }

        field(271; "Total Absence (Base)"; Decimal)
        {
            CalcFormula = Sum("Employee Absence"."Quantity (Base)" WHERE("Employee No." = FIELD("No."),
                                                                          "Cause of Absence Code" = FIELD("Cause of Absence Filter"),
                                                                          "From Date" = FIELD("Date Filter")));
            Caption = 'Total Absence (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(272; "Cause of Absence Filter"; Code[10])
        {
            Caption = 'Cause of Absence Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cause of Absence";
        }
        field(273; "Leave Status"; Option)
        {
            OptionMembers = "On Leave"," Resumed";
        }
        field(274; "Leave Type Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HRM-Leave Types".Code;
        }
        field(275; "Acrued Leave Days"; Decimal)
        {
        }
        field(276; "Leave Period Filter"; Code[20])
        {
        }
        field(277; "Annual Leave Account"; Decimal)
        {
        }
        field(278; "Compassionate Leave Acc."; Decimal)
        {
        }
        field(279; "Maternity Leave Acc."; Decimal)
        {
        }
        field(280; "Paternity Leave Acc."; Decimal)
        {
        }
        field(281; "Sick Leave Acc."; Decimal)
        {
        }
        field(282; "Study Leave Acc"; Decimal)
        {
        }
        field(283; OffDays; Decimal)
        {
        }
        field(284; "Exists in HR"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(285; Grade; Code[20])
        {
            TableRelation = "HRM-Grades";
        }
        field(286; "Sort No"; Code[20])
        {
            SQLDataType = Integer;
        }
        field(287; "Physical Disability"; Boolean)
        {
        }
        field(288; "Salary Category"; Code[50])
        {
            TableRelation = "HRM-Employee Categories".Code;
        }
        field(289; "Salary Grade"; Code[20])
        {
            TableRelation = "HRM-Job_Salary grade/steps"."Salary Grade code";// WHERE("Salary Grade code" = field("Grade Level"));
        }
        field(290; "Current Basic"; Decimal)
        {
            CalcFormula = Lookup("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(291; "Grade Filter"; Code[20])
        {

        }
        field(292; "New Grade Filter"; Code[20])
        {

        }
        field(293; "Employee Type"; Option)
        {
            OptionCaption = ' ,Permanent,Contract,Apprenticeship,Volunteers,Intern,Attachee, Casual';
            OptionMembers = " ",Permanent,Contract,Apprenticeship,Volunteers,Intern,Attachee,Casual;

        }
        field(294; "Basic Salary"; Decimal)
        {
            CalcFormula = Lookup("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(295; "Salary Segment"; Integer)
        {
        }
        field(296; Section; Code[30])
        {

        }
        field(297; "Total Days Worked"; Integer)
        {
            CalcFormula = Count("Staff Attendance Ledger" WHERE("Staff No." = FIELD("No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(298; "Based On Hours worked"; Option)
        {
            OptionCaption = ' ,BasedOnWorkedHrs';
            OptionMembers = " ",BasedOnWorkedHrs;
        }
        field(299; "County Name"; Text[30])
        {
            Editable = false;
        }

        field(300; "Credit Account"; Code[20])
        {
            TableRelation = Customer."No." WHERE("Customer Posting Group" = FILTER('EMPLOYEE'));
        }
        field(301; "Returning Officer"; Boolean)
        {
        }
        field(302; Signature; BLOB)
        {
            SubType = Bitmap;
        }
        field(303; Registrar; Boolean)
        {
        }

        field(304; "Barcode Picture"; BLOB)
        {
            SubType = Bitmap;
        }
        field(305; "Leave Type"; Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "HRM-Leave Types".Code;
        }
        field(306; "Medical Scheme Join Date"; Date)
        {
        }
        field(307; Profession; Code[50])
        {
        }
        field(308; "On Leave"; Boolean)
        {
        }
        field(309; "Current Leave No"; Code[50])
        {
        }
        field(310; "Part Time"; Boolean)
        {
        }
        field(311; "Employee Category"; Code[20])
        {
            TableRelation = "HRM-Staff Categories"."Category Code";
        }
        field(312; Driver; Boolean)
        {
        }
        field(313; "Total Hours Worked"; Integer)
        {
        }
        field(314; "HOD"; Boolean)
        {

        }
        field(315; "Current Leave Start"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(316; "Current Leave End"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(317; "Current Leave Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(318; "Current Leave Applied Days"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(319; "Terms of Service"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(320; "Secondary Income"; Boolean)
        {

        }
        field(321; "Staff PettyC No"; Code[50])
        {
            Caption = 'Staff Petty Cash No';
            TableRelation = Customer."No." where("Customer Posting Group" = filter('STAFF(STD)'));
        }
        field(322; "Staff Imprest No"; Code[50])
        {
            TableRelation = Customer."No." where("Customer Posting Group" = filter('IMPREST'));
        }

    }

    keys
    {
        key(Key1; "No.", "First Name", "Middle Name", "Last Name")
        {
        }
        key(Key2; "First Name")
        {
        }
        key(Key3; "Last Name")
        {
        }
        key(Key4; "ID Number")
        {
        }
        key(Key5; "Cost Code")
        {
        }
        key(Key6; "Date Of Join", "Date Of Leaving")
        {
        }
        key(Key7; "Termination Category")
        {
        }
        key(Key8; "Known As")
        {
        }
        key(Key9; "User ID")
        {
        }

    }

    fieldgroups
    {
        fieldgroup(dropdown; "No.", "First Name", "Middle Name", "Last Name")
        {

        }
    }

    trigger OnDelete()
    begin
        RecType := RecType::Emp;


        EmployeeImages.SetRange("Qualification Type", "No.");
        EmployeeImages.DeleteAll;


        EmployeeRelative.SetRange("Employee Code", "No.");
        EmployeeRelative.DeleteAll;



        EmployeeEquity.SetRange("Employee No.", "No.");
        EmployeeEquity.DeleteAll;

        HumanResComment.SetRange("No.", "No.");
        HumanResComment.DeleteAll;




        EmploymentHistory.SetRange("Employee No.", "No.");
        EmploymentHistory.DeleteAll;



        Grievances.SetRange("Employee No.", "No.");
        Grievances.DeleteAll;





        LearningIntervention.SetRange("Employee Requisition No", "No.");
        LearningIntervention.DeleteAll;

        ExistingQualification.SetRange("Exit Interview No", "No.");
        ExistingQualification.DeleteAll;




        EducationAssistance.SetRange("Application No", "No.");
        EducationAssistance.DeleteAll;

        InformalTraining.SetRange("Job Application No", "No.");
        InformalTraining.DeleteAll;

    end;



    procedure FullName(): Text[100]
    begin
        if "Middle Name" = '' then
            exit("First Name" + ' ' + "Last Name")
        else
            exit("First Name" + ' ' + "Middle Name" + ' ' + "Last Name");
    end;

    trigger OnInsert()

    begin
        RecType := RecType::Emp;
        //ValidateUser.validateUser(RecType);

        if "No." = '' then begin
            HumanResSetup.Get();
            HumanResSetup.TestField("Employee Nos.");
            NoSeriesMgt.InitSeries(HumanResSetup."Employee Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;



        USetup.RESET;
        USetup.SETRANGE(USetup."User ID", USERID);
        USetup.SETRANGE(USetup."Create Employee", false);
        IF USetup.FIND('-') THEN ERROR('You are not authorised');
        Rec."Payroll Posting Group" := 'PAYROLL';
        Rec."Posting Group" := 'PAYROLL';


    end;







    var
        enddate2: Date;
        salnotch: Record "HRM-Auto Inreament Sal. Steps";
        USetup: record "User Setup";
        bankstructure: record "PRL-Bank Structure";
        emps: Record "HRM-Employee C";
        HumanResSetup: Record "HRM-Human Resources Setup.";
        PMEmployee: Record "HRM-Employee C";
        EmployeeRelative: Record "HRM-Proffessional Membership";
        EmployeeImages: Record "HRM-Qualifications";
        Relative: Record "HRM-Job Requirements";
        CorrespondHistory: Record "HRM-Employee Requisitions";
        HumanResComment: Record "HRM-Employee C";
        EmployeeEquity: Record "HRM-Job Occupations";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        //EmployeeResUpdate: Codeunit "Process Bank Acc. Rec Lines-2";
        EmployeePayment: Record "HRM-Qualification Levels";
        OK: Boolean;

        EmploymentHistory: Record "HRM-Employment History";
        ExitInterviews: Record "HRM-Employee SIC Numbers";
        Grievances: Record "HRM-Employee Course Comp.";

        LearningIntervention: Record "HRM-Shortlisted Applicants";
        ExistingQualification: Record "HRM-Exit Interview Checklist";

        EducationAssistance: Record "HRM-Applicant Qualifications";
        InformalTraining: Record "HRM-Applicant Referees";

        // EmployeeSkillsLines: Record "HRM-Commitee Members (KNCHR)";
        User: Record User;
        ERROR1: Label 'Employee Career History Starting Information already exist.';
        MSG1: Label 'Employee Career History Starting Information successfully created.';
        ReasonDiaglog: Dialog;
        Jobs: Record "HRM-Jobs";
        Payroll: Record "HRM-Employee C";
        JobReq: Record "HRM-Job Requirement";
        EmpQualification: Record "Employee Qualification";
        AssMatrix: Record "PRL-Employee Transactions";
        AssMatrixTemp: Record "PRL-Employee Transactions";
        PayPeriod: Record "PRL-Payroll Periods";
        PayStartDate: Date;
        PayPeriodText: Text[30];
        Assm: Record "PRL-Employee Transactions";
        CareerEvent: Page "HRM-Committees";
        CIT: Record "Country/Region";
        HRSetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRJobs: Record "HRM-Jobs";
        PostCodes: Record "Post Code";
        HRLookupValues: Record "HRM-Lookup Values";
        EmpTrans: Record "PRL-Employee Transactions";
        NotchTrans: record "HRM-Job_Salary grade/steps";
        dim: record "Dimension Value";
        CLen: DateFormula;
        UserSetup: Record "User Setup";
        CDate: Date;
        Res: Record Employee;
        Joblist: Record "HRM-Jobs";
        EmployeeSalespersonUpdate: Codeunit "Employee/Salesperson Update";
        HREmp: Record "HRM-Employee C";
        Country: Record "Country/Region";
        objPayrollPeriod: Record "PRL-Payroll Periods";
        Cnt: Integer;

        HRDC: Record "HRM-Disciplinary Cases (B)";
        HRTRA: Record "HRM-Training Applications";
        HREK: Record "HRM-Employee Kin";
        HRJO: Record "HRM-Job Occupations";

        HREPR: Record "HRM-Employee C";
        HRAP: Record "HRM-Activity Participants";
        EmpTransR: record "PRL-Employee Transactions";
        HREH: Record "HRM-Employment History";
        HREQ: Record "HRM-Employee Qualifications";
        HREEI: Record "HRM-Employee Exit Interviews";

        HRJA: Record "HRM-Job Applications (B)";
        HRAQ: Record "HRM-Applicant Qualifications";


        PostCode: Record "Post Code";
        PrBankStructure: Record "PRL-Bank Structure";
        MISC: Record "Misc. Article Information";

        yDOB: Integer;
        yTODAY: Integer;
        noYrsToRetirement: Integer;
        RetirementYear: Integer;
        AppAge: Integer;
        RetirementYear2: Text;
        Dates: Codeunit "HR Dates";
        Dimn: Record "Dimension Value";
        RetirementDate: Date;
        dDOB: Integer;
        mDOB: Integer;
        DaystoRetirement: Text;

        RecType: Option " ",GL,Cust,Item,Supp,FA,Emp,Sal,CourseReg,prTrans,EmpTrans;
        CompNo: Code[20];

        prlBankStructure: Record "PRL-Bank Structure";




        ToD: Date;
        CurrentMonth: Date;

        SalCard: Record "PRL-Salary Card";
        SalGrade: Record "HRM-Salary Grades";



    procedure AssistEdit(OldEmployee: Record "HRM-Employee C"): Boolean
    begin
        PMEmployee := Rec;
        HumanResSetup.Get;
        HumanResSetup.TestField("Employee Nos.");
        if NoSeriesMgt.SelectSeries(HumanResSetup."Employee Nos.", OldEmployee."No. Series", PMEmployee."No. Series") then begin
            HumanResSetup.Get;
            HumanResSetup.TestField("Employee Nos.");
            NoSeriesMgt.SetSeries(PMEmployee."No.");
            Rec := PMEmployee;
            exit(true);
        end;
    end;



    procedure CurrentPayDetails()
    begin
        if "No." = '' then begin
            EmployeePayment.SetFilter("Entry No", "No.");
            OK := EmployeePayment.Find('+');
            if OK then begin
                // "Pay Period":= EmployeePayment.Description;
                /* "Pay Per Period":= EmployeePayment."Pay Per Period";
                 "Contracted Hours":= EmployeePayment.Blocked;
                 "Per Annum":= EmployeePayment."Annual Pay";
                 "Allow Overtime":= EmployeePayment."Allow Overtime";
                  MODIFY;   */
            end else begin
                "Pay Period" := 4;
                "Pay Per Period" := 0;
                "Contracted Hours" := 0;
                "Per Annum" := 0;
                "Allow Overtime" := 2;
                Modify;
            end;
        end;

    end;




    procedure GetPayPeriod()
    begin

        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then
            PayStartDate := PayPeriod."Date Opened";
        PayPeriodText := PayPeriod."Period Name";
    end;
}


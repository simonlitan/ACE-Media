table 52178788 "Board Salary Details"
{
    Caption = 'Board Members';
    DataCaptionFields = "No.", Name, "Job Title";
    DrillDownPageID = "NW-Board Members List";
    LookupPageID = "NW-Board Members List";

    fields
    {
        field(1; "Board Payroll Code"; code[30])
        {

        }
        field(2; "No."; Code[20])
        {
            NotBlank = false;

            trigger OnValidate()
            begin

            end;
        }
        field(3; "Name"; Text[200])
        {
        }
        field(4; "Payroll Period"; date)
        {

        }
        field(8; "Postal Address"; Text[40])
        {
        }
        field(9; "Residential Address"; Text[20])
        {
        }
        field(10; City; Text[30])
        {
        }
        field(11; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            ValidateTableRelation = false;
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
        field(16; "Ext."; Text[1])
        {
        }
        field(17; "E-Mail"; Text[40])
        {
        }
        field(19; Picture; BLOB)
        {
            SubType = Bitmap;
        }
        field(21; "ID Number"; Text[20])
        {
        }
        field(22; "Union Code"; Code[5])
        {
            TableRelation = Union;
        }
        field(23; "UIF Number"; Text[30])
        {
        }
        field(24; Gender; Option)
        {
            OptionMembers = Female,Male;
        }
        field(25; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(28; "Statistics Group Code"; Code[10])
        {
            TableRelation = "Employee Statistics Group";
        }
        field(31; Status; Option)
        {
            OptionMembers = Active,"In-Active",Disabled,Suspended,Deceased;
        }
        field(36; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DEPARTMENTS'));
        }
        field(37; Office; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('BRANCH'));
        }
        field(38; "Resource No."; Code[20])
        {
            TableRelation = Resource;
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
        field(42; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(43; "Office Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(47; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(49; "Fax Number"; Text[30])
        {
        }
        field(50; "Company E-Mail"; Text[30])
        {
        }
        field(51; Title; Option)
        {
            OptionMembers = "MR.","MRS.","MISS.",MS,"DR."," ENG. ",DR,CC,"PROF.",PROF;
        }
        field(52; "Salespers./Purch. Code"; Code[10])
        {
        }
        field(53; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(54; "Known As"; Text[30])
        {
        }
        field(55; Position; Text[20])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(57; "Full / Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time",Contract;
        }
        field(58; "Contract Type"; Option)
        {
            Caption = 'Contract Status';
            OptionMembers = Permanent,"Temporary",Voluntary,Probation,Contract;
        }
        field(59; "Contract End Date"; Date)
        {
        }
        field(60; "Notice Period"; Code[10])
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
        field(66; "Cost Code"; Code[10])
        {
        }
        field(68; "PAYE Number"; Text[30])
        {
        }
        field(69; "UIF Contributor?"; Boolean)
        {
        }
        field(73; "Marital Status"; Option)
        {
            OptionCaption = ' ,Single,Married,Separated,Divorced,Widow(er),Other';
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
        }
        field(74; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;
        }
        field(75; "First Language (R/W/S)"; Code[10])
        {
        }
        field(76; "Driving Licence"; Code[10])
        {
        }
        field(77; "Vehicle Registration Number"; Code[10])
        {
        }
        field(78; Disabled; Option)
        {
            OptionMembers = No,Yes," ";

            trigger OnValidate()
            begin
                if (Disabled = Disabled::Yes) then
                    Status := Status::Disabled;
            end;
        }
        field(79; "Health Assesment?"; Boolean)
        {
        }
        field(80; "Health Assesment Date"; Date)
        {
        }
        field(81; "Date Of Birth"; Date)
        {
        }
        field(82; Age; Text[80])
        {
        }
        field(83; "Date Of Join"; Date)
        {

            trigger OnValidate()
            begin
            end;
        }
        field(84; "Length Of Service"; Text[20])
        {
        }
        field(85; "End Of Probation Date"; Date)
        {
        }
        field(86; "Pension Scheme Join"; Date)
        {
        }
        field(87; "Time Pension Scheme"; Text[20])
        {
        }
        field(88; "Medical Scheme Join"; Date)
        {
        }
        field(89; "Time Medical Scheme"; Text[20])
        {
        }
        field(90; "Date Of Leaving"; Date)
        {
        }
        field(91; Paterson; Code[10])
        {
        }
        field(92; Peromnes; Code[10])
        {
        }
        field(93; Hay; Code[10])
        {
        }
        field(94; Castellion; Code[10])
        {
        }
        field(95; "Per Annum"; Decimal)
        {
        }
        field(96; "Allow Overtime"; Option)
        {
            OptionMembers = Yes,No," ";
        }
        field(97; "Medical Scheme No."; Text[30])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(98; "Medical Scheme Head Member"; Text[60])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(99; "Number Of Dependants"; Integer)
        {

            trigger OnValidate()
            begin

            end;
        }
        field(100; "Medical Scheme Name"; Text[10])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(101; "Amount Paid By Employee"; Decimal)
        {

            trigger OnValidate()
            begin

            end;
        }
        field(102; "Amount Paid By Company"; Decimal)
        {

            trigger OnValidate()
            begin

            end;
        }
        field(103; "Receiving Car Allowance ?"; Boolean)
        {
        }
        field(104; "Second Language (R/W/S)"; Code[10])
        {
        }
        field(105; "Additional Language"; Code[10])
        {
        }
        field(106; "Cell Phone Reimbursement?"; Boolean)
        {
        }
        field(107; "Amount Reimbursed"; Decimal)
        {
        }
        field(108; "UIF Country"; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(109; "Direct/Indirect"; Option)
        {
            OptionMembers = Direct,Indirect;
        }
        field(110; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(111; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";
        }
        field(112; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
            end;
        }
        field(113; "Job Specification"; Code[30])
        {
        }
        field(114; DateOfBirth; Text[8])
        {
        }
        field(115; DateEngaged; Text[8])
        {
        }
        field(116; "Postal Address2"; Text[30])
        {
        }
        field(117; "Postal Address3"; Text[20])
        {
        }
        field(118; "Residential Address2"; Text[30])
        {
        }
        field(119; "Residential Address3"; Text[20])
        {
        }
        field(120; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(121; Citizenship; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(122; "Name Of Manager"; Text[45])
        {
        }
        field(123; "User ID"; Code[30])
        {

        }
        field(124; "Disabling Details"; Text[50])
        {
        }
        field(125; "Disability Grade"; Text[30])
        {
        }
        field(126; "Passport Number"; Text[30])
        {
        }
        field(127; "2nd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(128; "3rd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(129; PensionJoin; Text[8])
        {
        }
        field(130; DateLeaving; Text[30])
        {
        }
        field(131; Region; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('REGION'));
        }
        field(132; "Manager Emp No"; Code[30])
        {
        }
        field(133; Temp; Text[2])
        {
        }
        field(134; "Employee Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
        }
        field(135; "Employee Act. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
        }
        field(136; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
        }
        field(137; "Contract Location"; Text[20])
        {
            Description = 'Location where contract was closed';
        }
        field(138; "First Language Read"; Boolean)
        {
        }
        field(139; "First Language Write"; Boolean)
        {
        }
        field(140; "First Language Speak"; Boolean)
        {
        }
        field(141; "Second Language Read"; Boolean)
        {
        }
        field(142; "Second Language Write"; Boolean)
        {
        }
        field(143; "Second Language Speak"; Boolean)
        {
        }
        field(144; "Custom Grading"; Code[10])
        {
        }
        field(145; "PIN Number"; Code[20])
        {
        }
        field(146; "NSSF No."; Code[20])
        {
        }
        field(147; "NHIF No."; Code[20])
        {
        }
        field(148; "Cause of Inactivity Code"; Code[10])
        {
            Caption = 'Cause of Inactivity Code';
            TableRelation = "Cause of Inactivity";
        }
        field(149; "Grounds for Term. Code"; Code[10])
        {
            Caption = 'Grounds for Term. Code';
            TableRelation = "Grounds for Termination";
        }
        field(150; "Sacco Staff No"; Code[10])
        {
        }
        field(151; "Period Filter"; Date)
        {
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(152; "HELB No"; Text[30])
        {
        }
        field(153; "Co-Operative No"; Text[30])
        {
        }
        field(154; "Wedding Anniversary"; Date)
        {
        }
        field(155; "KPA Code"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(156; "Competency Area"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(157; "Cost Center Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COURSE'));
        }
        field(158; "Position To Succeed"; Code[20])
        {
        }
        field(159; "Succesion Date"; Date)
        {
        }
        field(160; "Send Alert to"; Code[20])
        {
        }
        field(161; Tribe; Code[20])
        {
        }
        field(162; Religion; Code[20])
        {
        }
        field(163; "Job Title"; Text[50])
        {
        }
        field(164; "Post Office No"; Text[50])
        {
        }
        field(165; "Posting Group"; Code[50])
        {
            NotBlank = true;
            TableRelation = "PRL-Employee Posting Group".Code;
        }
        field(166; "Payroll Posting Group"; Code[10])
        {
            TableRelation = "PRL-Employee Posting Group";
        }
        field(167; "Served Notice Period"; Boolean)
        {
        }
        field(168; "Exit Interview Date"; Date)
        {
        }
        field(169; "Exit Interview Done by"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(170; "Allow Re-Employment In Future"; Boolean)
        {
        }
        field(171; "Medical Scheme Name #2"; Text[30])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(172; "Resignation Date"; Date)
        {
        }
        field(173; "Suspension Date"; Date)
        {
        }
        field(174; "Demised Date"; Date)
        {
        }
        field(175; "Retirement date"; Date)
        {
        }
        field(176; "Retrenchment date"; Date)
        {
        }
        field(177; Campus; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DEPARTMENTS'));
        }
        field(178; Permanent; Boolean)
        {
        }
        field(179; "Library Category"; Option)
        {
            OptionMembers = "ADMIN STAFF","TEACHING STAFF",DIRECTORS;
        }
        field(180; Category; Code[10])
        {
        }
        field(181; "Payroll Departments"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(188; "Grade Level"; Code[20])
        {
            TableRelation = "HRM-Salary Grades"."Salary Grade";

            trigger OnValidate()
            begin
                if not Confirm('Changing the Grade will affect the Basic Salary', false) then
                    Error('You have opted to abort the process');

                if SalGrade.Get("Grade Level") then begin
                    if SalGrade."Salary Amount" <> 0 then begin
                        if SalCard.Get("No.") then begin
                            SalCard."Basic Pay" := SalGrade."Salary Amount";
                            SalCard.Modify;
                        end;
                    end;
                end;
            end;
        }
        field(189; "Company Type"; Option)
        {
            OptionCaption = 'KRC Staff,RTI Staff';
            OptionMembers = "KRC Staff","RTI Staff";
        }
        field(190; "Main Bank"; Code[50])
        {
            TableRelation = "PRL-Bank Structure"."Bank Code";
        }
        field(191; "Branch Bank"; Code[50])
        {
            TableRelation = "PRL-Bank Structure"."Branch Code" where("Bank Code" = field("Main Bank"));
            trigger OnValidate()
            var
                prlBankStructure: Record "PRL-Bank Structure";
            begin
                prlBankStructure.Reset();
                prlBankStructure.SetRange("Bank Code", "Main Bank");
                prlBankStructure.SetRange("Branch Code", "Branch Bank");
                if prlBankStructure.FindFirst() then begin
                    "Bank Name" := prlBankStructure."Bank Name";
                    "Branch Name" := prlBankStructure."Branch Name";
                end;
            end;
        }
        field(192; "Lock Bank Details"; Boolean)
        {
        }
        field(193; "Bank Account Number"; Code[30])
        {
        }
        field(195; "Payroll Code"; Code[20])
        {
            TableRelation = "PRL-Payroll Type";
        }
        field(196; "Holiday Days Entitlement"; Decimal)
        {
        }
        field(197; "Holiday Days Used"; Decimal)
        {
        }
        field(198; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,FOSA;
        }
        field(199; "Hourly Rate"; Decimal)
        {
        }
        field(200; "Daily Rate"; Decimal)
        {
        }
        field(201; "Other Names"; Text[50])
        {
        }
        field(300; "Social Security No."; Code[20])
        {
        }
        field(301; "Pension House"; Code[20])
        {
            TableRelation = "PRL-Institutional Membership"."Institution No" WHERE("Group No" = CONST('PENSION'));
        }
        field(302; "Salary Notch/Step"; Code[20])
        {

            trigger OnValidate()
            begin

                if SalCard.Get("No.") then begin

                end;

            end;
        }
        field(303; "Status Change Date"; Date)
        {
        }
        field(304; "Previous Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(305; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(306; "Prev. Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('BPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
        }
        field(307; "Curr. Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('BPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(308; "Prev. Gross Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('GPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
        }
        field(309; "Curr. Gross Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('GPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(310; "Gross Income Variation"; Decimal)
        {
        }
        field(311; "Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(312; "Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(313; "Transaction Amount"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = FIELD("Transaction Code Filter"),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(314; "Transaction Code Filter"; Text[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "PRL-Transaction Codes"."Transaction Code";
        }
        field(315; "NHF No."; Code[20])
        {
        }
        field(316; "NSITF No."; Code[20])
        {
        }
        field(317; "Account Type"; Option)
        {
            OptionCaption = ' ,Savings,Current';
            OptionMembers = " ",Savings,Current;
        }
        field(318; "Location/Division Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('LOC/DIV'));
        }
        field(320; "Cost Centre Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COSTCENTRE'));
        }
        field(321; "Salary Grade Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(322; "Salary Notch Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(323; "Payroll Type"; Option)
        {
            OptionCaption = 'General,Directors';
            OptionMembers = General,Directors;
        }
        field(324; "Employee Classification"; Code[20])
        {
        }
        field(325; "Transaction AUtil"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('UTILJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(326; "Transaction AEdu"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('EDUJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(327; "Transaction AFurn"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('FURNJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(328; "Department Name"; Text[30])
        {
        }
        field(329; "ECA Contrib"; Decimal)
        {
            CalcFormula = Sum("PRL-Employee Transactions"."Employer Amount" WHERE("Transaction Code" = CONST('ECA'),
                                                                                   "Employee Code" = FIELD("No."),
                                                                                   "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(330; "Prev. Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = CONST(20140101D)));
            FieldClass = FlowField;
        }
        field(331; "Curr. Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = CONST(20140201D)));
            FieldClass = FlowField;
        }
        field(332; "Gross Net Pay Variation"; Decimal)
        {
        }
        field(333; "Prev net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
        }
        field(334; "Curr net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(335; "Gross Net Variation"; Decimal)
        {
        }
        field(336; "New Departmental Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(337; "Selected Period"; Date)
        {
        }
        field(50000; "Exists in HR"; Integer)
        {
            CalcFormula = Count("HRM-Employee" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50001; Grade; Code[20])
        {
            TableRelation = "HRM-Grades";
        }
        field(50002; "Sort No"; Code[20])
        {
            SQLDataType = Integer;
        }
        field(50003; "Physical Disability"; Boolean)
        {
        }
        field(50004; "Salary Category"; Code[50])
        {
            TableRelation = "HRM-Employee Categories".Code;
        }
        field(50005; "Salary Grade"; Code[20])
        {
            TableRelation = "HRM-Job_Salary grade/steps"."Salary Grade code" WHERE("Employee Category" = FIELD("Salary Category"));
        }
        field(50006; "Current Basic"; Decimal)
        {
            CalcFormula = Lookup("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50007; "Grade Filter"; Code[20])
        {

        }
        field(50008; "New Grade Filter"; Code[20])
        {

        }
        field(50009; "Employee Type"; Option)
        {
            OptionCaption = ' ,Permanent,Casual,Part Time';
            OptionMembers = " ",Permanent,Casual,"Part Time";
        }
        field(50010; "Basic Salary"; Decimal)
        {
            CalcFormula = Lookup("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50011; "Salary Segment"; Integer)
        {
        }
        field(50012; Section; Code[30])
        {

        }
        field(50013; "Total Days Worked"; Integer)
        {
            CalcFormula = Count("Staff Attendance Ledger" WHERE("Staff No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50014; "Based On Hours worked"; Option)
        {
            OptionCaption = ' ,BasedOnWorkedHrs';
            OptionMembers = " ",BasedOnWorkedHrs;
        }
        field(50016; "Department NameS"; Code[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE("Dimension Code" = FILTER('DEPARTMENT|DEPARTMENTS'),
                                                               Code = FIELD("Department Code")));
            FieldClass = FlowField;
        }
        field(50017; "Credit Account"; Code[20])
        {
            TableRelation = Customer."No." WHERE("Customer Posting Group" = FILTER('EMPLOYEE'));
        }
        field(60000; "Returning Officer"; Boolean)
        {
        }
        field(60001; Signature; BLOB)
        {
            SubType = Bitmap;
        }
        field(60002; Registrar; Boolean)
        {
        }
        field(60003; "Head of Department"; Code[10])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(60004; "Barcode Picture"; BLOB)
        {
            SubType = Bitmap;
        }
        field(60005; "Leave Type"; Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "HRM-Leave Types".Code WHERE(Gender = FIELD(Gender));
        }
        field(60006; "Medical Scheme Join Date"; Date)
        {
        }
        field(60010; Profession; Code[20])
        {
        }
        field(60011; "On Leave"; Boolean)
        {
        }
        field(60012; "Current Leave No"; Code[20])
        {
        }
        field(60013; "Part Time"; Boolean)
        {
        }
        field(60014; "Employee Category"; Code[20])
        {
            TableRelation = "HRM-Staff Categories"."Category Code";
        }
        field(60015; Driver; Boolean)
        {
        }
        field(60016; "Total Hours Worked"; Integer)
        {
        }
        field(60017; "Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(60018; "Branch Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(60019; "Place of Residence"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(60020; "Distance to Principal Bus"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60021; "Vehicle Model"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(60022; "Vehicle Registration No."; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60023; "FC"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60024; "STBD"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60025; "HRGP"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60026; "GRA"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60027; "FB"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60028; "ADH"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60029; "SPEC"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60030; "Sitting Allowance"; Decimal)
        {
            //TableRelation = "Board Members Allowances"."Sitting Allowance";
        }
        field(60031; "Mileage Claim"; Decimal)
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Board Members Allowances"."Mileage Claim";
        }
        field(60032; "Accomodation Allowance"; Decimal)
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Board Members Allowances"."Accomodation Allowance";
        }
        field(60033; "Chair's Honoraria"; Decimal)
        {
            //TableRelation = "Board Members Allowances"."Chair's Honoraria";
            DataClassification = ToBeClassified;
        }
        field(60034; "Sitting Allowance tax"; Decimal)
        {
            // TableRelation = "Board Members Allowances"."Sitting Allowance tax";
            DataClassification = ToBeClassified;
        }
        field(60035; "Mileage  Allowance Tax "; Decimal)
        {
            // TableRelation = "Board Members Allowances"."Mileage  Allowance Tax";
            DataClassification = ToBeClassified;
        }
        field(60036; "Lunch Allowance Tax"; Decimal)
        {
            // TableRelation = "Board Members Allowances"."Lunch Allowance Tax";
            DataClassification = ToBeClassified;
        }

        field(60037; "Sitting Allowance Net"; Decimal)
        {
            // TableRelation = "Board Members Allowances"."Sitting Allowance Net";
            DataClassification = ToBeClassified;
        }
        field(60038; "Mileage  Allowance Net "; Decimal)
        {
            //TableRelation = "Board Members Allowances"."Mileage  Allowance Net";
            DataClassification = ToBeClassified;
        }
        field(60039; "Lunch Allowance Net"; Decimal)
        {
            // TableRelation = "Board Members Allowances"."Lunch Allowance Net";
            DataClassification = ToBeClassified;
        }
        field(60040; "Lunch Allowance"; Decimal)
        {
            //TableRelation = "Board Members Allowances"."Lunch Allowance";
            DataClassification = ToBeClassified;
        }
        field(60041; "tax Code"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60042; "Tax Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60043; "Accomodation Days"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if ((Rec."Accomodation Days" <> 0) or (Rec."Accomodation Days" > 0)) then begin
                    Rec."Accomodation Totals" := Rec."Accomodation Days" * Rec."Accomodation Allowance";
                end;

            end;
        }
        field(60044; "Board Gross Totals"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60045; "Board Tax Totals"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60046; "Board Net Totals"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60047; "Accomodation Totals"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60048; "Meeting Sitting Allowance"; Decimal)
        {
            /* FieldClass = FlowField;
            CalcFormula = sum("Board Salary Details"."Meeting Sitting Allowance" where("Board Payroll Code" = field("Board Payroll Code")));
         */
        }
        field(60049; "Meeting Mileage Allowance"; Decimal)
        {
            /*  FieldClass = FlowField;
             CalcFormula = sum("Board Salary Details"."Meeting Mileage Allowance" where("Board Payroll Code" = field("Board Payroll Code")));
  */
        }
        field(60050; "Meeting Lunch Allowance"; Decimal)
        {
            /* FieldClass = FlowField;
            CalcFormula = sum("Board Salary Details"."Lunch Allowance" where("Board Payroll Code" = field("Board Payroll Code")));
 */
        }
        field(60051; "Meeting Accomodation Allowance"; Decimal)
        {
            /* FieldClass = FlowField;
            CalcFormula = sum("Board Salary Details"."Accomodation Totals" where("Board Payroll Code" = field("Board Payroll Code")));
 */
        }
        field(60052; "Meeting Gross Allowances"; Decimal)
        {
            /* FieldClass = FlowField;
            CalcFormula = sum("Board Salary Details"."Board Gross Totals" where("Board Payroll Code" = field("Board Payroll Code")));
 */
        }
        field(60053; "Meeting Tax Deductions"; Decimal)
        {
            /* FieldClass = FlowField;
            CalcFormula = sum("Board Salary Details"."Board Tax Totals" where("Board Payroll Code" = field("Board Payroll Code")));
 */
        }
        field(60054; "Meeting Net Allowance"; Decimal)
        {
            /*  FieldClass = FlowField;
             CalcFormula = sum("Board Salary Details"."Board Net Totals" where("Board Payroll Code" = field("Board Payroll Code")));
  */
        }

    }

    keys
    {
        key(Key1; "Board Payroll Code", "No.")
        {
        }
        key(Key2; "Name")
        {
        }
        key(Key3; "ID Number")
        {
        }
        key(Key4; "Known As")
        {
        }
        key(Key6; "User ID")
        {
        }
        key(Key7; "Cost Code")
        {
        }
        key(Key8; "Date Of Join", "Date Of Leaving")
        {
        }
        key(Key9; "Termination Category")
        {
        }
        key(Key10; "Department Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        //"Last Date Modified" := TODAY;
    end;

    trigger OnRename()
    begin
        //"Last Date Modified" := TODAY;
    end;

    var
        Res: Record Resource;
        PostCode: Record "Post Code";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        OK: Boolean;
        User: Record User;
        ERROR1: Label 'Employee Career History Starting Information already exist.';
        MSG1: Label 'Employee Career History Starting Information successfully created.';
        ReasonDiaglog: Dialog;
        EmpQualification: Record "Employee Qualification";
        PayStartDate: Date;
        PayPeriodText: Text[30];
        ToD: Date;
        CurrentMonth: Date;
        HrSetup: Record "Human Resources Setup";
        SalCard: Record "PRL-Salary Card";
        SalGrade: Record "HRM-Salary Grades";

    procedure AssistEdit(OldEmployee: Record "HRM-Employee C"): Boolean
    begin
    end;

    procedure CurrentPayDetails()
    begin
    end;

    procedure UpdtResUsersetp(var HREmpl: Record "HRM-Employee C")
    var
        Res: Record Resource;
        Usersetup: Record "User Setup";
    begin


    end;

    procedure SetEmployeeHistory()
    begin
    end;

    procedure GetPayPeriod()
    begin
    end;

    trigger OnDelete()

    begin
        //   Error('Action Not Permitted');
    end;
}
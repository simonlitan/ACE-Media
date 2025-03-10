table 52178638 "NW-Board Members"
{
    Caption = 'Board Members';
    DataCaptionFields = "No.", "First Name", "Middle Name", "Last Name", "Job Title", "Search Name";
    DrillDownPageID = "NW-Board Members List";
    LookupPageID = "NW-Board Members List";

    fields
    {
        field(1; "No."; Code[20])
        {
            NotBlank = false;

            trigger OnValidate()
            begin

            end;
        }
        field(2; "First Name"; Text[30])
        {
        }
        field(3; "Middle Name"; Text[50])
        {
        }
        field(4; "Last Name"; Text[50])
        {

            trigger OnValidate()
            var
                Reason: Text[30];
            begin
            end;
        }
        field(5; Initials; Text[30])
        {

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Initials)) or ("Search Name" = '') then
                    "Search Name" := Initials;
            end;
        }
        field(6; "Search Name"; Code[50])
        {
        }
        field(7; "Postal Address"; Text[40])
        {
        }
        field(8; "Residential Address"; Text[20])
        {
        }
        field(9; City; Text[30])
        {
        }
        field(10; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            ValidateTableRelation = false;
        }
        field(11; County; Text[30])
        {
        }
        field(12; "Home Phone Number"; Text[30])
        {
        }
        field(13; "Cellular Phone Number"; Text[30])
        {
        }
        field(14; "Work Phone Number"; Text[30])
        {
        }
        field(15; "Ext."; Text[1])
        {
        }
        field(16; "E-Mail"; Text[40])
        {
        }
        field(17; Picture; BLOB)
        {
            SubType = Bitmap;
        }
        field(18; "ID Number"; Text[20])
        {
        }
        field(19; "Union Code"; Code[5])
        {
            TableRelation = Union;
        }
        field(20; "UIF Number"; Text[30])
        {
        }
        field(21; Gender; Option)
        {
            OptionMembers = Female,Male;
        }
        field(22; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(23; "Statistics Group Code"; Code[10])
        {
            TableRelation = "Employee Statistics Group";
        }
        field(24; Status; Option)
        {
            OptionMembers = Active,"In-Active",Disabled,Suspended,Deceased;
        }
        field(25; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DEPARTMENTS'));
        }
        field(26; Office; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('BRANCH'));
        }
        field(27; "Resource No."; Code[20])
        {
            TableRelation = Resource;
        }
        field(28; Comment; Boolean)
        {
            Editable = false;
        }
        field(29; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(30; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(31; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(32; "Office Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(33; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(34; "Fax Number"; Text[30])
        {
        }
        field(35; "Company E-Mail"; Text[30])
        {
        }
        field(36; Title; Option)
        {
            OptionMembers = "MR.","MRS.","MISS.",MS,"DR."," ENG. ",DR,CC,"PROF.",PROF;
        }
        field(37; "Salespers./Purch. Code"; Code[10])
        {
        }
        field(38; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(39; "Known As"; Text[30])
        {
        }
        field(40; Position; Text[20])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(41; "Full / Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time",Contract;
        }
        field(42; "Contract Type"; Option)
        {
            Caption = 'Contract Status';
            OptionMembers = Permanent,"Temporary",Voluntary,Probation,Contract;
        }
        field(43; "Contract End Date"; Date)
        {
        }
        field(44; "Notice Period"; Code[10])
        {
        }
        field(45; "Union Member?"; Boolean)
        {
        }
        field(46; "Shift Worker?"; Boolean)
        {
        }
        field(47; "Contracted Hours"; Decimal)
        {
        }
        field(48; "Pay Period"; Option)
        {
            OptionMembers = Weekly,"2 Weekly","4 Weekly",Monthly," ";
        }
        field(49; "Pay Per Period"; Decimal)
        {
        }
        field(50; "Cost Code"; Code[10])
        {
        }
        field(51; "PAYE Number"; Text[30])
        {
        }
        field(52; "UIF Contributor?"; Boolean)
        {
        }
        field(53; "Marital Status"; Option)
        {
            OptionCaption = ' ,Single,Married,Separated,Divorced,Widow(er),Other';
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
        }
        field(54; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;
        }
        field(55; "First Language (R/W/S)"; Code[10])
        {
        }
        field(56; "Driving Licence"; Code[10])
        {
        }
        field(57; "Vehicle Registration Number"; Code[10])
        {
        }
        field(58; Disabled; Option)
        {
            OptionMembers = No,Yes," ";

            trigger OnValidate()
            begin
                if (Disabled = Disabled::Yes) then
                    Status := Status::Disabled;
            end;
        }
        field(59; "Health Assesment?"; Boolean)
        {
        }
        field(60; "Health Assesment Date"; Date)
        {
        }
        field(61; "Date Of Birth"; Date)
        {
        }
        field(62; Age; Text[80])
        {
        }
        field(63; "Date Of Join"; Date)
        {

            trigger OnValidate()
            begin
            end;
        }
        field(64; "Length Of Service"; Text[20])
        {
        }
        field(65; "End Of Probation Date"; Date)
        {
        }
        field(66; "Pension Scheme Join"; Date)
        {
        }
        field(67; "Time Pension Scheme"; Text[20])
        {
        }
        field(68; "Medical Scheme Join"; Date)
        {
        }
        field(69; "Time Medical Scheme"; Text[20])
        {
        }
        field(70; "Date Of Leaving"; Date)
        {
        }
        field(71; Paterson; Code[10])
        {
        }
        field(72; Peromnes; Code[10])
        {
        }
        field(73; Hay; Code[10])
        {
        }
        field(74; Castellion; Code[10])
        {
        }
        field(75; "Per Annum"; Decimal)
        {
        }
        field(76; "Allow Overtime"; Option)
        {
            OptionMembers = Yes,No," ";
        }
        field(77; "Medical Scheme No."; Text[30])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(78; "Medical Scheme Head Member"; Text[60])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(79; "Number Of Dependants"; Integer)
        {

            trigger OnValidate()
            begin

            end;
        }
        field(80; "Medical Scheme Name"; Text[10])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(81; "Amount Paid By Employee"; Decimal)
        {

            trigger OnValidate()
            begin

            end;
        }
        field(82; "Amount Paid By Company"; Decimal)
        {

            trigger OnValidate()
            begin

            end;
        }
        field(83; "Receiving Car Allowance ?"; Boolean)
        {
        }
        field(84; "Second Language (R/W/S)"; Code[10])
        {
        }
        field(85; "Additional Language"; Code[10])
        {
        }
        field(86; "Cell Phone Reimbursement?"; Boolean)
        {
        }
        field(87; "Amount Reimbursed"; Decimal)
        {
        }
        field(88; "UIF Country"; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(89; "Direct/Indirect"; Option)
        {
            OptionMembers = Direct,Indirect;
        }
        field(90; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(91; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";
        }
        field(92; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
            end;
        }
        field(93; "Job Specification"; Code[30])
        {
        }
        field(94; DateOfBirth; Text[8])
        {
        }
        field(95; DateEngaged; Text[8])
        {
        }
        field(96; "Postal Address2"; Text[30])
        {
        }
        field(97; "Postal Address3"; Text[20])
        {
        }
        field(98; "Residential Address2"; Text[30])
        {
        }
        field(99; "Residential Address3"; Text[20])
        {
        }
        field(100; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(101; Citizenship; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(102; "Name Of Manager"; Text[45])
        {
        }
        field(103; "User ID"; Code[30])
        {

        }
        field(104; "Disabling Details"; Text[50])
        {
        }
        field(105; "Disability Grade"; Text[30])
        {
        }
        field(106; "Passport Number"; Text[30])
        {
        }
        field(107; "2nd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(108; "3rd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(109; PensionJoin; Text[8])
        {
        }
        field(110; DateLeaving; Text[30])
        {
        }
        field(111; Region; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('REGION'));
        }
        field(112; "Manager Emp No"; Code[30])
        {
        }
        field(113; Temp; Text[2])
        {
        }
        field(114; "Employee Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
        }
        field(115; "Employee Act. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
        }
        field(116; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
        }
        field(117; "Contract Location"; Text[20])
        {
            Description = 'Location where contract was closed';
        }
        field(118; "First Language Read"; Boolean)
        {
        }
        field(119; "First Language Write"; Boolean)
        {
        }
        field(120; "First Language Speak"; Boolean)
        {
        }
        field(121; "Second Language Read"; Boolean)
        {
        }
        field(122; "Second Language Write"; Boolean)
        {
        }
        field(123; "Second Language Speak"; Boolean)
        {
        }
        field(124; "Custom Grading"; Code[10])
        {
        }
        field(125; "PIN Number"; Code[20])
        {
        }
        field(126; "NSSF No."; Code[20])
        {
        }
        field(127; "NHIF No."; Code[20])
        {
        }
        field(128; "Cause of Inactivity Code"; Code[10])
        {
            Caption = 'Cause of Inactivity Code';
            TableRelation = "Cause of Inactivity";
        }
        field(129; "Grounds for Term. Code"; Code[10])
        {
            Caption = 'Grounds for Term. Code';
            TableRelation = "Grounds for Termination";
        }
        field(130; "Sacco Staff No"; Code[10])
        {
        }
        field(131; "Period Filter"; Date)
        {
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(132; "HELB No"; Text[30])
        {
        }
        field(133; "Co-Operative No"; Text[30])
        {
        }
        field(134; "Wedding Anniversary"; Date)
        {
        }
        field(135; "KPA Code"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(136; "Competency Area"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(137; "Cost Center Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COURSE'));
        }
        field(138; "Position To Succeed"; Code[20])
        {
        }
        field(139; "Succesion Date"; Date)
        {
        }
        field(140; "Send Alert to"; Code[20])
        {
        }
        field(141; Tribe; Code[20])
        {
        }
        field(142; Religion; Code[20])
        {
        }
        field(143; "Job Title"; Text[50])
        {
        }
        field(144; "Post Office No"; Text[50])
        {
        }
        field(145; "Posting Group"; Code[50])
        {
            NotBlank = true;
            TableRelation = "PRL-Employee Posting Group".Code;
        }
        field(146; "Payroll Posting Group"; Code[10])
        {
            TableRelation = "PRL-Employee Posting Group";
        }
        field(147; "Served Notice Period"; Boolean)
        {
        }
        field(148; "Exit Interview Date"; Date)
        {
        }
        field(149; "Exit Interview Done by"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(150; "Allow Re-Employment In Future"; Boolean)
        {
        }
        field(151; "Medical Scheme Name #2"; Text[30])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(152; "Resignation Date"; Date)
        {
        }
        field(153; "Suspension Date"; Date)
        {
        }
        field(154; "Demised Date"; Date)
        {
        }
        field(155; "Retirement date"; Date)
        {
        }
        field(156; "Retrenchment date"; Date)
        {
        }
        field(157; Campus; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DEPARTMENTS'));
        }
        field(158; Permanent; Boolean)
        {
        }
        field(159; "Library Category"; Option)
        {
            OptionMembers = "ADMIN STAFF","TEACHING STAFF",DIRECTORS;
        }
        field(160; Category; Code[10])
        {
        }
        field(161; "Payroll Departments"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(162; "Grade Level"; Code[20])
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
        field(163; "Company Type"; Option)
        {
            OptionCaption = 'KRC Staff,RTI Staff';
            OptionMembers = "KRC Staff","RTI Staff";
        }
        field(164; "Main Bank"; Code[50])
        {
            TableRelation = "PRL-Bank Structure"."Bank Code";
        }
        field(165; "Branch Bank"; Code[50])
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
        field(166; "Lock Bank Details"; Boolean)
        {
        }
        field(167; "Bank Account Number"; Code[30])
        {
        }
        field(168; "Payroll Code"; Code[20])
        {
            TableRelation = "PRL-Payroll Type";
        }
        field(169; "Holiday Days Entitlement"; Decimal)
        {
        }
        field(170; "Holiday Days Used"; Decimal)
        {
        }
        field(171; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,FOSA;
        }
        field(172; "Hourly Rate"; Decimal)
        {
        }
        field(173; "Daily Rate"; Decimal)
        {
        }
        field(174; "Other Names"; Text[50])
        {
        }
        field(175; "Social Security No."; Code[20])
        {
        }
        field(176; "Pension House"; Code[20])
        {
            // TableRelation = "PRL-Institutional Membership"."Institution No" WHERE("Group No" = CONST('PENSION'));
        }
        field(177; "Salary Notch/Step"; Code[20])
        {

            trigger OnValidate()
            begin

                if SalCard.Get("No.") then begin

                end;

            end;
        }
        field(178; "Status Change Date"; Date)
        {
        }
        field(179; "Previous Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(180; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(181; "Prev. Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('BPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
        }
        field(182; "Curr. Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('BPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(183; "Prev. Gross Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('GPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
        }
        field(184; "Curr. Gross Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('GPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(185; "Gross Income Variation"; Decimal)
        {
        }
        field(186; "Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(187; "Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(188; "Transaction Amount"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = FIELD("Transaction Code Filter"),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(189; "Transaction Code Filter"; Text[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "PRL-Transaction Codes"."Transaction Code";
        }
        field(190; "NHF No."; Code[20])
        {
        }
        field(191; "NSITF No."; Code[20])
        {
        }
        field(192; "Account Type"; Option)
        {
            OptionCaption = ' ,Savings,Current';
            OptionMembers = " ",Savings,Current;
        }
        field(193; "Location/Division Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('LOC/DIV'));
        }
        field(194; "Cost Centre Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COSTCENTRE'));
        }
        field(195; "Salary Grade Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(196; "Salary Notch Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(197; "Payroll Type"; Option)
        {
            OptionCaption = 'General,Directors';
            OptionMembers = General,Directors;
        }
        field(198; "Employee Classification"; Code[20])
        {
        }
        field(199; "Transaction AUtil"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('UTILJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(200; "Transaction AEdu"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('EDUJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(201; "Transaction AFurn"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('FURNJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(202; "Department Name"; Text[30])
        {
        }
        field(203; "ECA Contrib"; Decimal)
        {
            CalcFormula = Sum("PRL-Employee Transactions"."Employer Amount" WHERE("Transaction Code" = CONST('ECA'),
                                                                                   "Employee Code" = FIELD("No."),
                                                                                   "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(204; "Prev. Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = CONST(20140101D)));
            FieldClass = FlowField;
        }
        field(205; "Curr. Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = CONST(20140201D)));
            FieldClass = FlowField;
        }
        field(206; "Gross Net Pay Variation"; Decimal)
        {
        }
        field(207; "Prev net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
        }
        field(208; "Curr net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(209; "Gross Net Variation"; Decimal)
        {
        }
        field(210; "New Departmental Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(211; "Selected Period"; Date)
        {
        }
        field(212; "Exists in HR"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(213; Grade; Code[20])
        {
            TableRelation = "HRM-Grades";
        }
        field(214; "Sort No"; Code[20])
        {
            SQLDataType = Integer;
        }
        field(215; "Physical Disability"; Boolean)
        {
        }
        field(216; "Salary Category"; Code[50])
        {
            TableRelation = "HRM-Employee Categories".Code;
        }
        field(217; "Salary Grade"; Code[20])
        {
            TableRelation = "HRM-Job_Salary grade/steps"."Salary Grade code" WHERE("Employee Category" = FIELD("Salary Category"));
        }
        field(218; "Current Basic"; Decimal)
        {
            CalcFormula = Lookup("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(219; "Grade Filter"; Code[20])
        {

        }
        field(220; "New Grade Filter"; Code[20])
        {

        }
        field(221; "Employee Type"; Option)
        {
            OptionCaption = ' ,Permanent,Casual,Part Time';
            OptionMembers = " ",Permanent,Casual,"Part Time";
        }
        field(222; "Basic Salary"; Decimal)
        {
            CalcFormula = Lookup("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(223; "Salary Segment"; Integer)
        {
        }
        field(224; Section; Code[30])
        {

        }
        field(225; "Total Days Worked"; Integer)
        {
            CalcFormula = Count("Staff Attendance Ledger" WHERE("Staff No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(226; "Based On Hours worked"; Option)
        {
            OptionCaption = ' ,BasedOnWorkedHrs';
            OptionMembers = " ",BasedOnWorkedHrs;
        }
        field(227; "Department NameS"; Code[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE("Dimension Code" = FILTER('DEPARTMENT|DEPARTMENTS'),
                                                               Code = FIELD("Department Code")));
            FieldClass = FlowField;
        }
        field(228; "Credit Account"; Code[20])
        {
            TableRelation = Customer."No." WHERE("Customer Posting Group" = FILTER('EMPLOYEE'));
        }
        field(229; "Returning Officer"; Boolean)
        {
        }
        field(230; Signature; BLOB)
        {
            SubType = Bitmap;
        }
        field(231; Registrar; Boolean)
        {
        }
        field(232; "Head of Department"; Code[10])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(233; "Barcode Picture"; BLOB)
        {
            SubType = Bitmap;
        }
        field(234; "Leave Type"; Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "HRM-Leave Types".Code WHERE(Gender = FIELD(Gender));
        }
        field(235; "Medical Scheme Join Date"; Date)
        {
        }
        field(236; Profession; Code[20])
        {
        }
        field(237; "On Leave"; Boolean)
        {
        }
        field(238; "Current Leave No"; Code[20])
        {
        }
        field(239; "Part Time"; Boolean)
        {
        }
        field(240; "Employee Category"; Code[20])
        {
            TableRelation = "HRM-Staff Categories"."Category Code";
        }
        field(241; Driver; Boolean)
        {
        }
        field(242; "Total Hours Worked"; Integer)
        {
        }
        field(243; "Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(244; "Branch Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(245; "Place of Residence"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(246; "Distance to Principal Bus"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                claimAmount: Decimal;
            begin
                if ((Rec."Distance to Principal Bus" <> 0) or (Rec."Distance to Principal Bus" > 0)) then begin
                    claimAmount := Rec."Distance to Principal Bus" * Rec."Mileage Rate";
                    if ((claimAmount < Rec."Mileage Ceiling") or (claimAmount = Rec."Mileage Ceiling")) then begin
                        Rec."Mileage Claim" := claimAmount;
                        Rec."Mileage  Allowance Tax" := (Rec."tax Rate" / 100) * claimAmount;
                        Rec."Mileage  Allowance Net" := claimAmount - ((Rec."tax Rate" / 100) * Rec."Mileage Claim");
                    end else
                        if (claimAmount > Rec."Mileage Ceiling") then begin
                            Rec."Mileage Claim" := Rec."Mileage Ceiling";
                            Rec."Mileage  Allowance Tax" := (Rec."tax Rate" / 100) * Rec."Mileage Ceiling";
                            Rec."Mileage  Allowance Net" := Rec."Mileage Ceiling" - ((Rec."tax Rate" / 100) * Rec."Mileage Ceiling");
                        end;
                end;

            end;
        }
        field(247; "Vehicle Model"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(248; "Vehicle Registration No."; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(249; "FC"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(250; "STBD"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(251; "HRGP"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(252; "GRA"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(253; "FB"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(254; "ADH"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(255; "SPEC"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(256; "Sitting Allowance"; Decimal)
        {
            //TableRelation = "Board Members Allowances"."Sitting Allowance";
            FieldClass = FlowField;
            CalcFormula = sum("Board Members Allowances"."Sitting Allowance");
        }
        field(257; "Mileage Claim"; Decimal)
        {
            /* DataClassification = ToBeClassified;
            TableRelation = "Board Members Allowances"."Mileage Claim"; */
        }
        field(258; "Accomodation Allowance"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Board Members Allowances"."Accomodation Allowance");
        }
        field(259; "Chair's Honoraria"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Board Members Allowances"."Chair's Honoraria");
        }
        field(260; "Sitting Allowance tax"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Board Members Allowances"."Sitting Allowance Tax");
        }
        field(261; "Mileage  Allowance Tax"; Decimal)
        {
            /* TableRelation = "Board Members Allowances"."Mileage  Allowance Tax";
            DataClassification = ToBeClassified; */
        }
        field(262; "Lunch Allowance Tax"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Board Members Allowances"."Lunch Allowance Tax");
        }

        field(263; "Sitting Allowance Net"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Board Members Allowances"."Sitting Allowance Net");
        }
#pragma warning disable AL0771
        field(264; "Mileage  Allowance Net"; Decimal)
#pragma warning restore AL0771
        {
            /*  TableRelation = "Board Members Allowances"."Mileage  Allowance Net";
             DataClassification = ToBeClassified; */
        }
        field(265; "Lunch Allowance Net"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Board Members Allowances"."Lunch Allowance Net");
        }
        field(266; "Lunch Allowance"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Board Members Allowances"."Lunch Allowance");
        }
        field(267; "Mileage Rate"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("NW-Mileage Allowance Rates"."Rate Value");

            trigger OnValidate()
            var
                claimAmount: Decimal;
            begin
                claimAmount := Rec."Distance to Principal Bus" * Rec."Mileage Rate";
                if ((claimAmount < Rec."Mileage Ceiling") or (claimAmount = Rec."Mileage Ceiling")) then begin
                    Rec."Mileage Claim" := claimAmount;
                    Rec."Mileage  Allowance Tax" := Rec."tax Rate" * Rec."Mileage Claim";
                    Rec."Mileage  Allowance Net" := Rec."Mileage Claim" - (Rec."tax Rate" * Rec."Mileage Claim");
                end else
                    Rec."Mileage Claim" := Rec."Mileage Ceiling";
                Rec."Mileage  Allowance Tax" := Rec."tax Rate" * Rec."Mileage Ceiling";
                Rec."Mileage  Allowance Net" := Rec."Mileage Ceiling" - (Rec."tax Rate" * Rec."Mileage Ceiling");
            end;
        }
        field(268; "Mileage Ceiling"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("NW-Mileage Allowance Rates"."Ceiling Amount");
            trigger OnValidate()
            var
                claimAmount: Decimal;
            begin
                claimAmount := Rec."Distance to Principal Bus" * Rec."Mileage Rate";
                if ((claimAmount < Rec."Mileage Ceiling") or (claimAmount = Rec."Mileage Ceiling")) then begin
                    Rec."Mileage Claim" := claimAmount;
                    Rec."Mileage  Allowance Tax" := (Rec."tax Rate" / 100) * Rec."Mileage Claim";
                    Rec."Mileage  Allowance Net" := Rec."Mileage Claim" - ((Rec."tax Rate" / 100) * Rec."Mileage Claim");
                end else
                    Rec."Mileage Claim" := Rec."Mileage Ceiling";
                Rec."Mileage  Allowance Tax" := (Rec."tax Rate" / 100) * Rec."Mileage Ceiling";
                Rec."Mileage  Allowance Net" := Rec."Mileage Ceiling" - ((Rec."tax Rate" / 100) * Rec."Mileage Ceiling");
            end;

        }
        field(269; "Tax Code"; code[30])
        {
            //TableRelation = "Board Tax setup"."Tax Code";
            CalcFormula = lookup("Board Members Allowances"."Board Tax");
            FieldClass = FlowField;

            trigger OnValidate()
            var
                txcode: Record "Board Tax setup";
                claimAmount: Decimal;
            begin
                txcode.Reset();
                txcode.SetRange("Tax Code", Rec."Tax Code");
                if txcode.Find('-') then begin
                    Rec."tax Rate" := txcode."Tax Rate";
                    if ((Rec."Distance to Principal Bus" <> 0) or (Rec."Distance to Principal Bus" > 0)) then begin
                        claimAmount := Rec."Distance to Principal Bus" * Rec."Mileage Rate";
                        if ((claimAmount < Rec."Mileage Ceiling") or (claimAmount = Rec."Mileage Ceiling")) then begin
                            Rec."Mileage Claim" := claimAmount;
                            Rec."Mileage  Allowance Tax" := (Rec."tax Rate" / 100) * claimAmount;
                            Rec."Mileage  Allowance Net" := claimAmount - ((Rec."tax Rate" / 100) * Rec."Mileage Claim");
                        end else
                            if (claimAmount > Rec."Mileage Ceiling") then begin
                                Rec."Mileage Claim" := Rec."Mileage Ceiling";
                                Rec."Mileage  Allowance Tax" := ((Rec."tax Rate" / 100) * Rec."Mileage Ceiling");
                                Rec."Mileage  Allowance Net" := (Rec."Mileage Ceiling" - ((Rec."tax Rate" / 100) * Rec."Mileage Ceiling"));
                            end;
                    end;
                end;

            end;
        }
        field(270; "tax Rate"; Decimal)
        {
            CalcFormula = sum("Board Tax setup"."Tax Rate" where("Tax Code" = field("Tax Code")));
            FieldClass = FlowField;
            trigger OnValidate()
            var
                claimAmount: Decimal;
            begin
                if ((Rec."Distance to Principal Bus" <> 0) or (Rec."Distance to Principal Bus" > 0)) then begin
                    claimAmount := Rec."Distance to Principal Bus" * Rec."Mileage Rate";
                    if ((claimAmount < Rec."Mileage Ceiling") or (claimAmount = Rec."Mileage Ceiling")) then begin
                        Rec."Mileage Claim" := claimAmount;
                        Rec."Mileage  Allowance Tax" := (Rec."tax Rate" / 100) * claimAmount;
                        Rec."Mileage  Allowance Net" := claimAmount - ((Rec."tax Rate" / 100) * Rec."Mileage Claim");
                    end else
                        if (claimAmount > Rec."Mileage Ceiling") then begin
                            Rec."Mileage Claim" := Rec."Mileage Ceiling";
                            Rec."Mileage  Allowance Tax" := (Rec."tax Rate" / 100) * Rec."Mileage Ceiling";
                            Rec."Mileage  Allowance Net" := Rec."Mileage Ceiling" - ((Rec."tax Rate" / 100) * Rec."Mileage Ceiling");
                        end;
                end;
            end;
        }


    }

    keys
    {
        key(Key1; "No.")
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
        key(Key5; "Known As")
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

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            NoSeriesMgt.InitSeries('BRD Mem', xRec."No. Series", 0D, "No.", "No. Series");
        end
    end;


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

    procedure FullName(): Text[100]
    begin
        if "Middle Name" = '' then
            exit("Known As" + ' ' + "Last Name")
        else
            exit("Known As" + ' ' + "Middle Name" + ' ' + "Last Name");
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
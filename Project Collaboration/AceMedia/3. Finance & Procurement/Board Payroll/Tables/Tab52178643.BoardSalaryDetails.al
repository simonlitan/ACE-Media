table 52178643 "Board Salary Details"
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
        field(5; "Postal Address"; Text[40])
        {
        }
        field(6; "Residential Address"; Text[20])
        {
        }
        field(7; City; Text[30])
        {
        }
        field(8; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            ValidateTableRelation = false;
        }
        field(9; County; Text[30])
        {
        }
        field(10; "Home Phone Number"; Text[30])
        {
        }
        field(11; "Cellular Phone Number"; Text[30])
        {
        }
        field(12; "Work Phone Number"; Text[30])
        {
        }
        field(13; "Ext."; Text[1])
        {
        }
        field(14; "E-Mail"; Text[40])
        {
        }
        field(15; Picture; BLOB)
        {
            SubType = Bitmap;
        }
        field(16; "ID Number"; Text[20])
        {
        }
        field(17; "Union Code"; Code[5])
        {
            TableRelation = Union;
        }
        field(18; "UIF Number"; Text[30])
        {
        }
        field(19; Gender; Option)
        {
            OptionMembers = Female,Male;
        }
        field(20; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(21; "Statistics Group Code"; Code[10])
        {
            TableRelation = "Employee Statistics Group";
        }
        field(22; Status; Option)
        {
            OptionMembers = Active,"In-Active",Disabled,Suspended,Deceased;
        }
        field(23; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DEPARTMENTS'));
        }
        field(24; Office; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('BRANCH'));
        }
        field(25; "Resource No."; Code[20])
        {
            TableRelation = Resource;
        }
        field(26; Comment; Boolean)
        {
            Editable = false;
        }
        field(27; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(28; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(29; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(30; "Office Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(31; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(32; "Fax Number"; Text[30])
        {
        }
        field(33; "Company E-Mail"; Text[30])
        {
        }
        field(34; Title; Option)
        {
            OptionMembers = "MR.","MRS.","MISS.",MS,"DR."," ENG. ",DR,CC,"PROF.",PROF;
        }
        field(35; "Salespers./Purch. Code"; Code[10])
        {
        }
        field(36; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(37; "Known As"; Text[30])
        {
        }
        field(38; Position; Text[20])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(39; "Full / Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time",Contract;
        }
        field(40; "Contract Type"; Option)
        {
            Caption = 'Contract Status';
            OptionMembers = Permanent,"Temporary",Voluntary,Probation,Contract;
        }
        field(41; "Contract End Date"; Date)
        {
        }
        field(42; "Notice Period"; Code[10])
        {
        }
        field(43; "Union Member?"; Boolean)
        {
        }
        field(44; "Shift Worker?"; Boolean)
        {
        }
        field(45; "Contracted Hours"; Decimal)
        {
        }
        field(46; "Pay Period"; Option)
        {
            OptionMembers = Weekly,"2 Weekly","4 Weekly",Monthly," ";
        }
        field(47; "Pay Per Period"; Decimal)
        {
        }
        field(48; "Cost Code"; Code[10])
        {
        }
        field(49; "PAYE Number"; Text[30])
        {
        }
        field(50; "UIF Contributor?"; Boolean)
        {
        }
        field(51; "Marital Status"; Option)
        {
            OptionCaption = ' ,Single,Married,Separated,Divorced,Widow(er),Other';
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
        }
        field(52; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;
        }
        field(53; "First Language (R/W/S)"; Code[10])
        {
        }
        field(54; "Driving Licence"; Code[10])
        {
        }
        field(55; "Vehicle Registration Number"; Code[10])
        {
        }
        field(56; Disabled; Option)
        {
            OptionMembers = No,Yes," ";

            trigger OnValidate()
            begin
                if (Disabled = Disabled::Yes) then
                    Status := Status::Disabled;
            end;
        }
        field(57; "Health Assesment?"; Boolean)
        {
        }
        field(58; "Health Assesment Date"; Date)
        {
        }
        field(59; "Date Of Birth"; Date)
        {
        }
        field(60; Age; Text[80])
        {
        }
        field(61; "Date Of Join"; Date)
        {

            trigger OnValidate()
            begin
            end;
        }
        field(62; "Length Of Service"; Text[20])
        {
        }
        field(63; "End Of Probation Date"; Date)
        {
        }
        field(64; "Pension Scheme Join"; Date)
        {
        }
        field(65; "Time Pension Scheme"; Text[20])
        {
        }
        field(66; "Medical Scheme Join"; Date)
        {
        }
        field(67; "Time Medical Scheme"; Text[20])
        {
        }
        field(68; "Date Of Leaving"; Date)
        {
        }
        field(69; Paterson; Code[10])
        {
        }
        field(70; Peromnes; Code[10])
        {
        }
        field(71; Hay; Code[10])
        {
        }
        field(72; Castellion; Code[10])
        {
        }
        field(73; "Per Annum"; Decimal)
        {
        }
        field(74; "Allow Overtime"; Option)
        {
            OptionMembers = Yes,No," ";
        }
        field(75; "Medical Scheme No."; Text[30])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(76; "Medical Scheme Head Member"; Text[60])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(77; "Number Of Dependants"; Integer)
        {

            trigger OnValidate()
            begin

            end;
        }
        field(78; "Medical Scheme Name"; Text[10])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(79; "Amount Paid By Employee"; Decimal)
        {

            trigger OnValidate()
            begin

            end;
        }
        field(80; "Amount Paid By Company"; Decimal)
        {

            trigger OnValidate()
            begin

            end;
        }
        field(81; "Receiving Car Allowance ?"; Boolean)
        {
        }
        field(82; "Second Language (R/W/S)"; Code[10])
        {
        }
        field(83; "Additional Language"; Code[10])
        {
        }
        field(84; "Cell Phone Reimbursement?"; Boolean)
        {
        }
        field(85; "Amount Reimbursed"; Decimal)
        {
        }
        field(86; "UIF Country"; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(87; "Direct/Indirect"; Option)
        {
            OptionMembers = Direct,Indirect;
        }
        field(88; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(89; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";
        }
        field(90; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
            end;
        }
        field(91; "Job Specification"; Code[30])
        {
        }
        field(92; DateOfBirth; Text[8])
        {
        }
        field(93; DateEngaged; Text[8])
        {
        }
        field(94; "Postal Address2"; Text[30])
        {
        }
        field(95; "Postal Address3"; Text[20])
        {
        }
        field(96; "Residential Address2"; Text[30])
        {
        }
        field(97; "Residential Address3"; Text[20])
        {
        }
        field(98; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(99; Citizenship; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(100; "Name Of Manager"; Text[45])
        {
        }
        field(101; "User ID"; Code[30])
        {

        }
        field(102; "Disabling Details"; Text[50])
        {
        }
        field(103; "Disability Grade"; Text[30])
        {
        }
        field(104; "Passport Number"; Text[30])
        {
        }
        field(105; "2nd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(106; "3rd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(107; PensionJoin; Text[8])
        {
        }
        field(108; DateLeaving; Text[30])
        {
        }
        field(109; Region; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('REGION'));
        }
        field(110; "Manager Emp No"; Code[30])
        {
        }
        field(111; Temp; Text[2])
        {
        }
        field(112; "Employee Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
        }
        field(113; "Employee Act. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
        }
        field(114; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
        }
        field(115; "Contract Location"; Text[20])
        {
            Description = 'Location where contract was closed';
        }
        field(116; "First Language Read"; Boolean)
        {
        }
        field(117; "First Language Write"; Boolean)
        {
        }
        field(118; "First Language Speak"; Boolean)
        {
        }
        field(119; "Second Language Read"; Boolean)
        {
        }
        field(120; "Second Language Write"; Boolean)
        {
        }
        field(121; "Second Language Speak"; Boolean)
        {
        }
        field(122; "Custom Grading"; Code[10])
        {
        }
        field(123; "PIN Number"; Code[20])
        {
        }
        field(124; "NSSF No."; Code[20])
        {
        }
        field(125; "NHIF No."; Code[20])
        {
        }
        field(126; "Cause of Inactivity Code"; Code[10])
        {
            Caption = 'Cause of Inactivity Code';
            TableRelation = "Cause of Inactivity";
        }
        field(127; "Grounds for Term. Code"; Code[10])
        {
            Caption = 'Grounds for Term. Code';
            TableRelation = "Grounds for Termination";
        }
        field(128; "Sacco Staff No"; Code[10])
        {
        }
        field(129; "Period Filter"; Date)
        {
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(130; "HELB No"; Text[30])
        {
        }
        field(131; "Co-Operative No"; Text[30])
        {
        }
        field(132; "Wedding Anniversary"; Date)
        {
        }
        field(133; "KPA Code"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(134; "Competency Area"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(135; "Cost Center Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COURSE'));
        }
        field(136; "Position To Succeed"; Code[20])
        {
        }
        field(137; "Succesion Date"; Date)
        {
        }
        field(138; "Send Alert to"; Code[20])
        {
        }
        field(139; Tribe; Code[20])
        {
        }
        field(140; Religion; Code[20])
        {
        }
        field(141; "Job Title"; Text[50])
        {
        }
        field(142; "Post Office No"; Text[50])
        {
        }
        field(143; "Posting Group"; Code[50])
        {
            NotBlank = true;
            TableRelation = "PRL-Employee Posting Group".Code;
        }
        field(144; "Payroll Posting Group"; Code[10])
        {
            TableRelation = "PRL-Employee Posting Group";
        }
        field(145; "Served Notice Period"; Boolean)
        {
        }
        field(146; "Exit Interview Date"; Date)
        {
        }
        field(147; "Exit Interview Done by"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(148; "Allow Re-Employment In Future"; Boolean)
        {
        }
        field(149; "Medical Scheme Name #2"; Text[30])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(150; "Resignation Date"; Date)
        {
        }
        field(151; "Suspension Date"; Date)
        {
        }
        field(152; "Demised Date"; Date)
        {
        }
        field(153; "Retirement date"; Date)
        {
        }
        field(154; "Retrenchment date"; Date)
        {
        }
        field(155; Campus; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DEPARTMENTS'));
        }
        field(156; Permanent; Boolean)
        {
        }
        field(157; "Library Category"; Option)
        {
            OptionMembers = "ADMIN STAFF","TEACHING STAFF",DIRECTORS;
        }
        field(158; Category; Code[10])
        {
        }
        field(159; "Payroll Departments"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(160; "Grade Level"; Code[20])
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
        field(161; "Company Type"; Option)
        {
            OptionCaption = 'KRC Staff,RTI Staff';
            OptionMembers = "KRC Staff","RTI Staff";
        }
        field(162; "Main Bank"; Code[50])
        {
            TableRelation = "PRL-Bank Structure"."Bank Code";
        }
        field(163; "Branch Bank"; Code[50])
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
        field(164; "Lock Bank Details"; Boolean)
        {
        }
        field(165; "Bank Account Number"; Code[30])
        {
        }
        field(166; "Payroll Code"; Code[20])
        {
            TableRelation = "PRL-Payroll Type";
        }
        field(167; "Holiday Days Entitlement"; Decimal)
        {
        }
        field(168; "Holiday Days Used"; Decimal)
        {
        }
        field(169; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,FOSA;
        }
        field(170; "Hourly Rate"; Decimal)
        {
        }
        field(171; "Daily Rate"; Decimal)
        {
        }
        field(172; "Other Names"; Text[50])
        {
        }
        field(173; "Social Security No."; Code[20])
        {
        }
        field(174; "Pension House"; Code[20])
        {
            //  TableRelation = "PRL-Institutional Membership"."Institution No" WHERE("Group No" = CONST('PENSION'));
        }
        field(175; "Salary Notch/Step"; Code[20])
        {

            trigger OnValidate()
            begin

                if SalCard.Get("No.") then begin

                end;

            end;
        }
        field(176; "Status Change Date"; Date)
        {
        }
        field(177; "Previous Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(178; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(179; "Prev. Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('BPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
        }
        field(180; "Curr. Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('BPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(181; "Prev. Gross Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('GPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
        }
        field(182; "Curr. Gross Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('GPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(183; "Gross Income Variation"; Decimal)
        {
        }
        field(184; "Basic Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(185; "Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(186; "Transaction Amount"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = FIELD("Transaction Code Filter"),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(187; "Transaction Code Filter"; Text[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "PRL-Transaction Codes"."Transaction Code";
        }
        field(188; "NHF No."; Code[20])
        {
        }
        field(189; "NSITF No."; Code[20])
        {
        }
        field(190; "Account Type"; Option)
        {
            OptionCaption = ' ,Savings,Current';
            OptionMembers = " ",Savings,Current;
        }
        field(191; "Location/Division Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('LOC/DIV'));
        }
        field(192; "Cost Centre Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COSTCENTRE'));
        }
        field(193; "Salary Grade Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(194; "Salary Notch Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(195; "Payroll Type"; Option)
        {
            OptionCaption = 'General,Directors';
            OptionMembers = General,Directors;
        }
        field(196; "Employee Classification"; Code[20])
        {
        }
        field(197; "Transaction AUtil"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('UTILJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(198; "Transaction AEdu"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('EDUJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(199; "Transaction AFurn"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('FURNJN'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(200; "Department Name"; Text[30])
        {
        }
        field(201; "ECA Contrib"; Decimal)
        {
            CalcFormula = Sum("PRL-Employee Transactions"."Employer Amount" WHERE("Transaction Code" = CONST('ECA'),
                                                                                   "Employee Code" = FIELD("No."),
                                                                                   "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(202; "Prev. Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = CONST(20140101D)));
            FieldClass = FlowField;
        }
        field(203; "Curr. Net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = CONST(20140201D)));
            FieldClass = FlowField;
        }
        field(204; "Gross Net Pay Variation"; Decimal)
        {
        }
        field(205; "Prev net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Previous Month Filter")));
            FieldClass = FlowField;
        }
        field(206; "Curr net Pay"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("No."),
                                                                      "Transaction Code" = CONST('NPAY'),
                                                                      "Payroll Period" = FIELD("Current Month Filter")));
            FieldClass = FlowField;
        }
        field(207; "Gross Net Variation"; Decimal)
        {
        }
        field(208; "New Departmental Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(209; "Selected Period"; Date)
        {
        }
        field(210; "Exists in HR"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(211; Grade; Code[20])
        {
            TableRelation = "HRM-Grades";
        }
        field(212; "Sort No"; Code[20])
        {
            SQLDataType = Integer;
        }
        field(213; "Physical Disability"; Boolean)
        {
        }
        field(214; "Salary Category"; Code[50])
        {
            TableRelation = "HRM-Employee Categories".Code;
        }
        field(215; "Salary Grade"; Code[20])
        {
            TableRelation = "HRM-Job_Salary grade/steps"."Salary Grade code" WHERE("Employee Category" = FIELD("Salary Category"));
        }
        field(216; "Current Basic"; Decimal)
        {
            CalcFormula = Lookup("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(217; "Grade Filter"; Code[20])
        {

        }
        field(218; "New Grade Filter"; Code[20])
        {

        }
        field(219; "Employee Type"; Option)
        {
            OptionCaption = ' ,Permanent,Casual,Part Time';
            OptionMembers = " ",Permanent,Casual,"Part Time";
        }
        field(220; "Basic Salary"; Decimal)
        {
            CalcFormula = Lookup("PRL-Salary Card"."Basic Pay" WHERE("Employee Code" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(221; "Salary Segment"; Integer)
        {
        }
        field(222; Section; Code[30])
        {

        }
        field(223; "Total Days Worked"; Integer)
        {
            CalcFormula = Count("Staff Attendance Ledger" WHERE("Staff No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(224; "Based On Hours worked"; Option)
        {
            OptionCaption = ' ,BasedOnWorkedHrs';
            OptionMembers = " ",BasedOnWorkedHrs;
        }
        field(225; "Department NameS"; Code[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE("Dimension Code" = FILTER('DEPARTMENT|DEPARTMENTS'),
                                                               Code = FIELD("Department Code")));
            FieldClass = FlowField;
        }
        field(226; "Credit Account"; Code[20])
        {
            TableRelation = Customer."No." WHERE("Customer Posting Group" = FILTER('EMPLOYEE'));
        }
        field(227; "Returning Officer"; Boolean)
        {
        }
        field(228; Signature; BLOB)
        {
            SubType = Bitmap;
        }
        field(229; Registrar; Boolean)
        {
        }
        field(230; "Head of Department"; Code[10])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(231; "Barcode Picture"; BLOB)
        {
            SubType = Bitmap;
        }
        field(232; "Leave Type"; Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "HRM-Leave Types".Code WHERE(Gender = FIELD(Gender));
        }
        field(233; "Medical Scheme Join Date"; Date)
        {
        }
        field(234; Profession; Code[20])
        {
        }
        field(235; "On Leave"; Boolean)
        {
        }
        field(236; "Current Leave No"; Code[20])
        {
        }
        field(237; "Part Time"; Boolean)
        {
        }
        field(238; "Employee Category"; Code[20])
        {
            TableRelation = "HRM-Staff Categories"."Category Code";
        }
        field(239; Driver; Boolean)
        {
        }
        field(240; "Total Hours Worked"; Integer)
        {
        }
        field(241; "Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(242; "Branch Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(243; "Place of Residence"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(244; "Distance to Principal Bus"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(245; "Vehicle Model"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(246; "Vehicle Registration No."; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(247; "FC"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(248; "STBD"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(249; "HRGP"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(250; "GRA"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(251; "FB"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(252; "ADH"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(253; "SPEC"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(254; "Sitting Allowance"; Decimal)
        {
            //TableRelation = "Board Members Allowances"."Sitting Allowance";
        }
        field(255; "Mileage Claim"; Decimal)
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Board Members Allowances"."Mileage Claim";
        }
        field(256; "Accomodation Allowance"; Decimal)
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Board Members Allowances"."Accomodation Allowance";
        }
        field(257; "Chair's Honoraria"; Decimal)
        {
            //TableRelation = "Board Members Allowances"."Chair's Honoraria";
            DataClassification = ToBeClassified;
        }
        field(258; "Sitting Allowance tax"; Decimal)
        {
            // TableRelation = "Board Members Allowances"."Sitting Allowance tax";
            DataClassification = ToBeClassified;
        }
        field(259; "Mileage  Allowance Tax"; Decimal)
        {
            // TableRelation = "Board Members Allowances"."Mileage  Allowance Tax";
            DataClassification = ToBeClassified;
        }
        field(260; "Lunch Allowance Tax"; Decimal)
        {
            // TableRelation = "Board Members Allowances"."Lunch Allowance Tax";
            DataClassification = ToBeClassified;
        }

        field(261; "Sitting Allowance Net"; Decimal)
        {
            // TableRelation = "Board Members Allowances"."Sitting Allowance Net";
            DataClassification = ToBeClassified;
        }
        field(262; "Mileage  Allowance Net"; Decimal)
        {
            //TableRelation = "Board Members Allowances"."Mileage  Allowance Net";
            DataClassification = ToBeClassified;
        }
        field(263; "Lunch Allowance Net"; Decimal)
        {
            // TableRelation = "Board Members Allowances"."Lunch Allowance Net";
            DataClassification = ToBeClassified;
        }
        field(264; "Lunch Allowance"; Decimal)
        {
            //TableRelation = "Board Members Allowances"."Lunch Allowance";
            DataClassification = ToBeClassified;
        }
        field(265; "tax Code"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(266; "Tax Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(267; "Accomodation Days"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if ((Rec."Accomodation Days" <> 0) or (Rec."Accomodation Days" > 0)) then begin
                    Rec."Accomodation Totals" := Rec."Accomodation Days" * Rec."Accomodation Allowance";
                end;

            end;
        }
        field(268; "Board Gross Totals"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(269; "Board Tax Totals"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(270; "Board Net Totals"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(271; "Accomodation Totals"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(272; "Meeting Sitting Allowance"; Decimal)
        {
            /* FieldClass = FlowField;
            CalcFormula = sum("Board Salary Details"."Meeting Sitting Allowance" where("Board Payroll Code" = field("Board Payroll Code")));
         */
        }
        field(273; "Meeting Mileage Allowance"; Decimal)
        {
            /*  FieldClass = FlowField;
             CalcFormula = sum("Board Salary Details"."Meeting Mileage Allowance" where("Board Payroll Code" = field("Board Payroll Code")));
  */
        }
        field(274; "Meeting Lunch Allowance"; Decimal)
        {
            /* FieldClass = FlowField;
            CalcFormula = sum("Board Salary Details"."Lunch Allowance" where("Board Payroll Code" = field("Board Payroll Code")));
 */
        }
        field(275; "Meeting Accomodation Allowance"; Decimal)
        {
            /* FieldClass = FlowField;
            CalcFormula = sum("Board Salary Details"."Accomodation Totals" where("Board Payroll Code" = field("Board Payroll Code")));
 */
        }
        field(276; "Meeting Gross Allowances"; Decimal)
        {
            /* FieldClass = FlowField;
            CalcFormula = sum("Board Salary Details"."Board Gross Totals" where("Board Payroll Code" = field("Board Payroll Code")));
 */
        }
        field(277; "Meeting Tax Deductions"; Decimal)
        {
            /* FieldClass = FlowField;
            CalcFormula = sum("Board Salary Details"."Board Tax Totals" where("Board Payroll Code" = field("Board Payroll Code")));
 */
        }
        field(278; "Meeting Net Allowance"; Decimal)
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
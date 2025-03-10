table 61188 "HRM-Employee C"
{


    DrillDownPageID = "HRM-All Employees Listing";
    LookupPageID = "HRM-All Employees Listing";

    fields
    {
        field(1; "No."; Code[20])
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
            TableRelation = "HRM-Staff Title".Code;

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Initials)) or ("Search Name" = '') then
                    "Search Name" := Initials;
            end;
        }

        field(7; "Search Name"; Code[50])
        {
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
        field(44; "Next License Renewal"; Date)
        { }
        field(45; "Year of Experience"; Code[20])
        {

        }
        field(8; "Postal Address"; Text[50])
        {
        }
        field(9; "Residential Address"; Text[50])
        {
        }
        field(26; date; Date)
        {

        }
        field(27; Station; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
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
        field(225; "Earns Gratuity"; boolean)
        {
        }
        field(226; "On Probation"; boolean)
        {
        }
        field(227; "Gratuity Wth Voluntary Pension"; boolean)
        {
        }
        field(228; "Employee Pension %"; Decimal)
        {
        }
        field(17; "E-Mail"; Text[100])
        {
        }
        field(19; Picture; BLOB)
        {
            SubType = Bitmap;
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
        field(28; "Statistics Group Code"; Code[20])
        {
            TableRelation = "Employee Statistics Group";
        }
        field(31; Status; Option)
        {
            OptionCaption = 'Terminated,Active,Inactive,Retired,Resigned,Dismissed,Disabled,Discharged';
            OptionMembers = Terminated,Active,Inactive,Retired,Resigned,Dismissed,Disabled,Discharged;
        }
        field(229; "Status 2"; Option)
        {
            OptionCaption = 'Active,Inactive,Retired,Resigned,Dismissed,Disabled,Discharged,Terminated';
            OptionMembers = Active,Inactive,Retired,,Terminated,Resigned,Dismissed,Disabled,Discharged;
        }
        field(36; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('Cost_Center'));

            trigger OnValidate()

            begin
                dim.Reset();
                dim.SetRange(code, "Department Code");
                if dim.FindFirst() then
                    "Department Name" := dim.Name;

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
        field(42; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(43; "Office Filter"; Code[20])
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
        field(50; "Company E-Mail"; Text[60])
        {
        }
        field(51; Title; Option)
        {
            OptionCaption = ',  ,,MR,MRS,MISS,MS,DR.,CC,PROF.';
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
        field(223; Salutation; Option)
        {
            OptionMembers = " ",Sir,Madam;
        }
        field(54; "Known As"; Text[30])
        {


        }
        field(55; Position; Text[80])
        {
            TableRelation = "HRM-Company Jobs"."Job Description";

            trigger OnValidate()
            begin


            end;
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
            OptionMembers = "",Permanent,Casual,Contract,"Temporary";
            // TableRelation = "HRM-Contract Types".Contract;
        }
        field(59; "Contract End Date"; Date)
        {
        }
        field(60; "Notice Period"; Code[20])
        {
            TableRelation = "REG-Registry Cue"."Primary Key";
        }
        field(61; "Union Member?"; Boolean)
        {
        }
        field(29; Spouse; text[40])
        {

        }
        field(30; "Next of Kin"; text[40])
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
        field(68; "PAYE Number"; Text[30])
        {
        }
        field(69; "UIF Contributor?"; Boolean)
        {
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
            TableRelation = "HRM-Language Preference";
        }
        field(76; "Driving Licence"; Code[20])
        {
            TableRelation = "HRM-Job Responsiblities (B)";
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
        field(81; "Date Of Birth"; Date)
        {
        }
        field(70; "Date of Death"; Date)
        { }
        field(18; "Date of Dismisal"; Date)
        { }

        field(82; Age; Text[40])
        {
        }
        field(83; "Date Of Join"; Date)
        {

            trigger OnValidate()
            begin
                Age := Dates.DetermineAge("Date Of Birth", "Date Of Join");
                if ("Date Of Leaving" <> 0D) and ("Date Of Join" <> 0D) then
                    "Length Of Service" := Dates.DetermineAge("Date Of Join", "Date Of Leaving");

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
        field(20; "Drive to Work"; Option)
        {
            OptionMembers = " ",Yes,No;
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
        field(91; Paterson; Code[20])
        {
            TableRelation = "HRM-Overall Comments"."Appraisal Code";
        }
        field(92; Peromnes; Code[20])
        {
            TableRelation = "HRM-Jobs";
        }
        field(93; Hay; Code[20])
        {
            TableRelation = "HRM-Goal Setting Objective"."Appraisal Code";
        }
        field(94; Castellion; Code[20])
        {
            TableRelation = "HRM-Interpersonal Factors"."Appraisal Code";
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

                if ("Medical Scheme No." <> xRec."Medical Scheme No.") and ("Medical Scheme No." <> '') then begin

                    if OK then begin

                    end;
                end;

            end;
        }
        field(98; "Medical Scheme Head Member"; Text[20])
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
        field(100; "Medical Scheme Name"; Text[30])
        {
            TableRelation = "GEN-Medical Scheme"."Medical Scheme";

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
        field(46; "Pension Cleared"; Boolean)
        {
        }
        field(104; "Second Language (R/W/S)"; Code[20])
        {
            TableRelation = "HRM-Language Preference".Code;
        }
        field(105; "Additional Language"; Code[20])
        {
            TableRelation = "HRM-Language Preference".Code;
        }
        field(48; Cleared; Boolean)
        {
        }
        field(56; "Notice Period Days Served"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(108; "UIF Country"; Code[20])
        {
            TableRelation = "Country/Region".Code;
        }
        field(67; "Notice Period Served"; Option)
        {
            OptionCaption = ' ,Fully,Partially';
            OptionMembers = " ",Fully,Partially;
        }
        field(110; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                // EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(111; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                // EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(112; "Termination Category"; Option)
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
        field(113; "Job Specification"; Code[20])
        {
        }
        field(114; DateOfBirth; Text[8])
        {
        }
        field(115; DateEngaged; Text[8])
        {
        }
        field(116; "Postal Address2"; Text[50])
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
        field(121; Citizenship; Code[20])
        {
            TableRelation = "Country/Region".Code;
        }
        field(122; "Name Of Manager"; Text[45])
        {
        }
        field(123; "User ID"; Code[20])
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
        field(124; "Disabling Details"; Text[20])
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
        field(131; Region; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('REGION'));
        }
        field(132; "Manager Emp No"; Code[30])
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
        field(133; Temp; Text[30])
        {
        }
        field(134; "Employee Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
        }
        field(135; "Employee Act. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("Termination Category" = FILTER('retirement')));
            FieldClass = FlowField;
        }
        field(136; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("Termination Category" = FILTER(<> '')));
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
        field(144; "Custom Grading"; Code[20])
        {
            //todo TableRelation = Table39005744.Field2;
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
        field(148; "Cause of Inactivity Code"; Code[20])
        {
            Caption = 'Cause of Inactivity Code';
            TableRelation = "Cause of Inactivity";
        }
        field(149; "Grounds for Term. Code"; Code[20])
        {
            Caption = 'Grounds for Term. Code';
            TableRelation = "Grounds for Termination";
        }
        field(71; "PAYROLL NO"; Code[20])
        {
        }
        field(151; "Period Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HRM-Appraisal Periods";
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

        field(156; "Competency Area"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HRM-Competency Areas".Code WHERE("Employee No" = FIELD("No."),
                                                               Period = FIELD("Period Filter"));
        }
        field(72; "Division Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DIVISION'));
        }
        field(158; "Position To Succeed"; Code[20])
        {
            TableRelation = "HRM-Company Jobs"."Job ID";

            trigger OnValidate()
            begin


            end;
        }
        field(159; "Succesion Date"; Date)
        {
        }
        field(160; "Send Alert to"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(161; Tribe; Code[20])
        {
            TableRelation = Tribes."Tribe Code";
        }
        field(162; Religion; Code[20])
        {
            TableRelation = "ACA-Religions".Religion;
            Editable = true;
        }
        field(232; Denomination; Code[50])
        {
            TableRelation = "Denominations".Denomination;
            Editable = true;
        }
        field(231; "Job Id"; code[50])
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
        field(163; "Job Title"; Text[250])
        {
            Editable = false;

        }
        field(164; "Post Office No"; Text[30])
        {
        }
        field(165; "Posting Group"; Code[30])
        {
            NotBlank = true;
            TableRelation = "PRL-Employee Posting Group".Code;
        }
        field(166; "Payroll Posting Group"; Code[20])
        {
            TableRelation = "PRL-Employee Posting Group".Code;
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
        field(171; "Medical Scheme Name #2"; Text[100])
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
        field(194; "Date of Appointment"; Date)
        {
        }

        field(202; "Project Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('projects'));
        }

        field(182; "Library Code"; Code[20])
        {
            //  TableRelation = "ACA-Library Codes"."Lib Code";
        }
        field(183; "Library Borrower Type"; Option)
        {
            OptionCaption = 'Staff';
            OptionMembers = Staff;
        }
        field(184; Names; Text[100])
        {
        }
        field(185; Lecturer; Boolean)
        {
        }
        field(186; "Maximun Hours"; Decimal)
        {
        }
        field(187; Password; Text[50])
        {
        }
        field(203; "count"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(204; "Portal Password"; Text[30])
        {

            trigger OnValidate()
            begin
                "Changed Password" := false;
                Modify;
            end;
        }
        field(205; "Changed Password"; Boolean)
        {
            Editable = false;
        }
        field(206; "Leave Balance"; Decimal)
        {
            CalcFormula = Sum("HRM-Leave Ledger"."No. of Days" WHERE("Employee No" = FIELD("No.")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }



        field(2003; "Total Leave Taken"; Decimal)
        {


            CalcFormula = sum("HRM-Leave Requisition"."Applied Days" where("Employee No" = field("No."),
        Status = filter(Posted)));
            Editable = false;


            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
            trigger OnValidate()
            var
                leavereq: Record "HRM-Leave Requisition";
            begin
                leavereq.Leavedate();
            end;
        }

        field(2006; "Total (Leave Days)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(2007; "Cash - Leave Earned"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(2008; "Reimbursed Leave Days"; Decimal)
        {
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                Validate("Allocated Leave Days");
            end;
        }

        field(2009; "Cash per Leave Day"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(2023; "Allocated Leave Days"; Decimal)
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

        field(2024; "Contract Start Date"; Date)
        {
        }

        field(2028; "Alt. Address Start Date"; Date)
        {
            Caption = 'Alt. Address Start Date';
        }
        field(2029; "Alt. Address End Date"; Date)
        {
            Caption = 'Alt. Address End Date';
        }

        field(2035; "Total Absence (Base)"; Decimal)
        {
            CalcFormula = Sum("Employee Absence"."Quantity (Base)" WHERE("Employee No." = FIELD("No."),
                                                                          "Cause of Absence Code" = FIELD("Cause of Absence Filter"),
                                                                          "From Date" = FIELD("Date Filter")));
            Caption = 'Total Absence (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(2036; "Cause of Absence Filter"; Code[10])
        {
            Caption = 'Cause of Absence Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cause of Absence";
        }
        field(2037; "Leave Status"; Option)
        {
            OptionMembers = "On Leave"," Resumed";
        }
        field(2038; "Leave Type Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HRM-Leave Types".Code;
        }
        field(2039; "Acrued Leave Days"; Decimal)
        {
        }
        field(2040; "Leave Period Filter"; Code[20])
        {
        }
        field(3971; "Annual Leave Account"; Decimal)
        {
        }
        field(3972; "Compassionate Leave Acc."; Decimal)
        {
        }
        field(3973; "Maternity Leave Acc."; Decimal)
        {
        }
        field(3974; "Paternity Leave Acc."; Decimal)
        {
        }
        field(3975; "Sick Leave Acc."; Decimal)
        {
        }
        field(3976; "Study Leave Acc"; Decimal)
        {
        }
        field(3977; OffDays; Decimal)
        {
        }
        field(207; "Citizenship Text"; Text[20])
        {
        }
        field(208; "Full Name"; Text[81])
        {
        }

        field(209; "Job Application No"; Code[30])
        {
        }
        field(210; "Taken Leave Days"; Decimal)
        {
        }
        field(211; "Probation Start Date"; Date)
        {
        }
        field(212; "Confirmation Date"; Date)
        {
        }
        field(213; "Days to Retirement"; Integer)
        {
        }
        field(214; "Annual Increament Date"; Date)
        {
        }
        field(215; "Date Of Present Appointment"; Date)
        {
        }
        field(216; "Employee Terms Of Service"; Option)
        {
            OptionCaption = 'Temporary Appointment,Designee,Consultant,Pre-Service trainee';
            OptionMembers = "Temporary Appointment",Designee,Consultant,"Pre-Service trainee";
        }
        field(217; "Station Name"; Text[10])
        {
            Editable = false;
        }
        field(218; "Incremental Month"; Integer)
        {
        }
        field(219; "Directorate Name"; Text[20])
        {
            Editable = false;
        }
        field(50015; "County Name"; Text[30])
        {
            Editable = false;
        }


        field(222; "House Allowance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60020; "Current Leave Start"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(60021; "Current Leave End"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(60022; "Current Leave Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(60023; "Current Leave Applied Days"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60024; "Terms of Service"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(103; "Receiving Car Allowance ?"; Boolean)
        {
        }

        field(106; "Cell Phone Reimbursement?"; Boolean)
        {
        }
        field(107; "Amount Reimbursed"; Decimal)
        {
        }

        field(109; "Direct/Indirect"; Option)
        {
            OptionMembers = Direct,Indirect;
        }

        field(150; "Sacco Staff No"; Code[10])
        {
        }

        field(155; "KPA Code"; Code[20])
        {
            FieldClass = FlowFilter;
        }

        field(157; "Cost Center Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COURSE'));
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

        }
        field(6; "Salary Step"; integer)
        {
            TableRelation = "HRM-Auto Inreament Sal. Steps".Step where("Salary Grade" = field("Grade Level"));
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
        field(189; "Company Type"; Option)
        {
            OptionCaption = 'KRC Staff,RTI Staff';
            OptionMembers = "KRC Staff","RTI Staff";
        }
        field(190; "Main Bank"; Code[50])
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
        field(191; "Branch Bank"; Code[50])
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
        field(220; "Main Bank Name"; Text[100])
        {



        }

        field(221; "Branch Bank Name"; Text[100])
        {


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
        field(302; "Salary Notch/Step"; Integer)
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
                    //   SalCard.Department:="Department Code";
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
        field(328; "Department Name"; Text[250])
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
            // TableRelation = "HRM-Grades";
            TableRelation = "HRM-Salary Grades";
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
            TableRelation = "HRM-Job_Salary grade/steps"."Salary Grade code" WHERE("Salary Grade code" = field("Grade Level"));
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
            OptionCaption = ' ,Permanent,Casual,Intern,Part Time';
            OptionMembers = " ",Permanent,Casual,Intern,"Part Time";
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
        field(50016; "Department NameS"; Code[250])
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
        field(60017; "HOD"; Boolean)
        {

        }
        field(224; Supervisor; code[30])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(230; "Paid Leave Allowance"; Boolean)
        {

        }
        field(2041; "Special Duty"; Text[100]) //used in perfomance mngmnt card
        {
        }
        field(2042; supDesignation; Text[100]) //used in perfomance mngmnt card
        {
        }
        field(2043; ApraiseeComm; Text[200]) //used in perfomance mngmnt card
        {
        }
        field(2044; ApraiserComm; Text[200]) //used in perfomance mngmnt card
        {
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
        key(Key10; "Department Code")
        {
        }
    }

    fieldgroups
    {
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


        SAQATrainingHistory.SetRange(Code, "No.");
        SAQATrainingHistory.DeleteAll;

        EmploymentHistory.SetRange("Employee No.", "No.");
        EmploymentHistory.DeleteAll;



        Grievances.SetRange("Employee No.", "No.");
        Grievances.DeleteAll;



        SAQATraining.SetRange(Code, "No.");
        SAQATraining.DeleteAll;

        LearningIntervention.SetRange("Employee Requisition No", "No.");
        LearningIntervention.DeleteAll;

        ExistingQualification.SetRange("Exit Interview No", "No.");
        ExistingQualification.DeleteAll;

        ProfessionalMembership.SetRange("Employee No", "No.");
        ProfessionalMembership.DeleteAll;

        EducationAssistance.SetRange("Application No", "No.");
        EducationAssistance.DeleteAll;

        InformalTraining.SetRange("Job Application No", "No.");
        InformalTraining.DeleteAll;

    end;



    procedure FullName(): Text[100]
    begin
        if "Middle Name" = '' then
            exit("Known As" + ' ' + "Last Name")
        else
            exit("Known As" + ' ' + "Middle Name" + ' ' + "Last Name");
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
        EmployeeMaternity: Record "HRM-Pension Payments";
        SAQATrainingHistory: Record "HRM-Drivers";
        EmploymentHistory: Record "HRM-Employment History";
        ExitInterviews: Record "HRM-Employee SIC Numbers";
        Grievances: Record "HRM-Employee Course Comp.";
        SAQATraining: Record "HRM-Drivers";
        LearningIntervention: Record "HRM-Shortlisted Applicants";
        ExistingQualification: Record "HRM-Exit Interview Checklist";
        ProfessionalMembership: Record "HRM-Employee Attachments";
        EducationAssistance: Record "HRM-Applicant Qualifications";
        InformalTraining: Record "HRM-Applicant Referees";
        EmployeeSkillsPlan: Record "HRM-Appraisal Goal Setting L";
        // EmployeeSkillsLines: Record "HRM-Commitee Members (KNCHR)";
        User: Record User;
        ERROR1: Label 'Employee Career History Starting Information already exist.';
        MSG1: Label 'Employee Career History Starting Information successfully created.';
        ReasonDiaglog: Dialog;
        Jobs: Record "HRM-Company Jobs";
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
        HRAE: Record "HRM-Appraisal Evaluations";
        HRDC: Record "HRM-Disciplinary Cases (B)";
        HRTRA: Record "HRM-Training Applications";
        HREK: Record "HRM-Employee Kin";
        HRJO: Record "HRM-Job Occupations";
        HRD: Record "HRM-Drivers";
        HREPR: Record "HRM-Employee C";
        HRAP: Record "HRM-Activity Participants";
        EmpTransR: record "PRL-Employee Transactions";
        HREH: Record "HRM-Employment History";
        HREQ: Record "HRM-Employee Qualifications";
        HREEI: Record "HRM-Employee Exit Interviews";
        HREA: Record "HRM-Employee Attachments";
        HRJA: Record "HRM-Job Applications (B)";
        HRAQ: Record "HRM-Applicant Qualifications";
        HRAGSH: Record "HRM-Appraisal Goal Setting H";
        HRAGSL: Record "HRM-Appraisal Goal Setting L";

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
        FRMVitalSetup: Record "FRM Vital Setup";
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


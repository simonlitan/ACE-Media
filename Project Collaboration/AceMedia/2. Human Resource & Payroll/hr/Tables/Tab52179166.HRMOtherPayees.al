table 52179166 "HRM-Other Payees"
{
    Caption = 'Employee';
    DataCaptionFields = "No.", Title, "First Name", "Middle Name", "Last Name";
    Description = 'Employees';
    DrillDownPageID = "HRM-Other Payees";
    LookupPageID = "HRM-Other Payees";

    fields
    {
        field(1; "No."; Code[20])
        {
            NotBlank = false;

            trigger OnValidate()
            begin


                //This is for staff to Library Dataport don't Delete!
                IF "No." <> '' THEN
                    Category := 'STAFF';
            end;
        }
        field(2; "First Name"; Text[50])
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

            trigger OnValidate()
            begin
                IF ("Search Name" = UPPERCASE(xRec.Initials)) OR ("Search Name" = '') THEN
                    "Search Name" := Initials;
            end;
        }
        field(6; "Search Name"; Code[50])
        {
        }
        field(7; "Postal Address"; Text[50])
        {
        }
        field(8; "Residential Address"; Text[50])
        {
        }
        field(9; City; Text[30])
        {

            trigger OnValidate()
            begin


            end;
        }
        field(10; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                IF PostCode.GET("Post Code") THEN
                    City := PostCode.City;


            end;
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
        field(15; "Ext."; Text[20])
        {
        }
        field(16; "E-Mail"; Text[100])
        {
        }
        field(17; Picture; BLOB)
        {
            SubType = Bitmap;
        }
        field(18; "ID Number"; Text[30])
        {
        }
        field(19; "Union Code"; Code[20])
        {
            TableRelation = Union;
        }
        field(20; "UIF Number"; Text[30])
        {
        }
        field(21; Gender; Option)
        {
            OptionMembers = ,Male,Female;
        }
        field(22; "Country Code"; Code[20])
        {
            TableRelation = "Country/Region";
        }
        field(23; "Statistics Group Code"; Code[20])
        {
            TableRelation = "Employee Statistics Group";
        }
        field(24; Status; Option)
        {
            OptionCaption = 'Active,Inactive,Normal,Resigned,Discharged,Retrenched,Pension,Disabled,Propation,Confirmed';
            OptionMembers = Active,Inactive,Normal,Resigned,Discharged,Retrenched,Pension,Disabled,Propation,Confirmed;

            trigger OnValidate()
            begin


            end;
        }
        field(25; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FILTER('DEPARTMENT'));

            trigger OnValidate()
            begin

            end;
        }
        field(26; Office; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('BRANCH'));

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                //  EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(27; "Resource No."; Code[20])
        {
            TableRelation = Resource;

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                //  EmployeeResUpdate.ResUpdate(Rec)
            end;
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
        field(31; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(32; "Office Filter"; Code[20])
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
        field(35; "Company E-Mail"; Text[60])
        {
        }
        field(36; Title; Option)
        {
            OptionCaption = 'MR,MRS,MISS,MS,DR.,  ,CC,ASSCOC.PROF,PROF.';
            OptionMembers = "MR.","MRS.","MISS.","MS.","DR.","  ",CC,"ASSCOC.PROF","PROF.",PROF;

            trigger OnValidate()
            begin


            end;
        }
        field(37; "Salespers./Purch. Code"; Code[20])
        {

            trigger OnValidate()
            begin
                IF ("Salespers./Purch. Code" <> '') AND SalespersonPurchaser.WRITEPERMISSION THEN;
                //EmployeeSalespersonUpdate.SalesPersonUpdate(Rec)
            end;
        }
        field(38; "No. Series"; Code[20])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(39; "Known As"; Text[30])
        {

            trigger OnValidate()
            begin


            end;
        }
        field(40; Position; Text[80])
        {

            trigger OnValidate()
            begin


            end;
        }
        field(41; "Full / Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time",Contract,Normal;

            trigger OnValidate()
            begin


            end;
        }
        field(42; "Contract Type"; Code[50])
        {
        }
        field(43; "Contract End Date"; Date)
        {
        }
        field(44; "Notice Period"; Code[20])
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
        field(50; "Cost Code"; Code[20])
        {
            //TableRelation = 39005630;

            trigger OnValidate()
            begin
                CurrentPayDetails;
            end;
        }
        field(51; "PAYE Number"; Text[30])
        {
        }
        field(52; "UIF Contributor?"; Boolean)
        {
        }
        field(53; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;

            trigger OnValidate()
            begin


            end;
        }
        field(54; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;

            trigger OnValidate()
            begin


            end;
        }
        field(55; "First Language (R/W/S)"; Code[20])
        {

        }
        field(56; "Driving Licence"; Code[20])
        {
            TableRelation = "HRM-Job Responsiblities (B)";
        }
        field(57; "Vehicle Registration Number"; Code[20])
        {

            trigger OnValidate()
            begin

            end;
        }
        field(58; Disabled; Option)
        {
            OptionMembers = No,Yes," ";

            trigger OnValidate()
            begin
                IF (Disabled = Disabled::Yes) THEN
                    Status := Status::Retrenched;
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
        field(62; Age; Text[40])
        {
        }
        field(63; "Date Of Join"; Date)
        {

            trigger OnValidate()
            begin
                IF (("Date Of Birth" <> 0D) AND ("Date Of Join" <> 0D)) THEN BEGIN
                    Age := Dates.DetermineAge("Date Of Birth", "Date Of Join");
                END;
                IF ("Date Of Leaving" <> 0D) AND ("Date Of Join" <> 0D) THEN
                    "Length Of Service" := Dates.DetermineAge("Date Of Join", "Date Of Leaving");


            end;
        }
        field(64; "Length Of Service"; Text[50])
        {
        }
        field(65; "End Of Probation Date"; Date)
        {
        }
        field(66; "Pension Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                // IF ("Date Of Leaving" <> 0D) AND ("Pension Scheme Join" <> 0D) THEN
                //  "Time Pension Scheme":= Dates.DetermineAge("Pension Scheme Join","Date Of Leaving");
            end;
        }
        field(67; "Time Pension Scheme"; Text[50])
        {
        }
        field(68; "Medical Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                //  IF  ("Date Of Leaving" <> 0D) AND ("Medical Scheme Join" <> 0D) THEN
                //  "Time Medical Scheme":= Dates.DetermineAge("Medical Scheme Join","Date Of Leaving");
            end;
        }
        field(69; "Time Medical Scheme"; Text[20])
        {
            //This property is currently not supported
            //TestTableRelation = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
        }
        field(70; "Date Of Leaving"; Date)
        {

            trigger OnValidate()
            begin
                /*   IF ("Date Of Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                    "Length Of Service":= Dates.DetermineAge("Date Of Join","Date Of Leaving");
                   IF ("Pension Scheme Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                    "Time Pension Scheme":= Dates.DetermineAge("Pension Scheme Join","Date Of Leaving");
                   IF ("Medical Scheme Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                    "Time Medical Scheme":= Dates.DetermineAge("Medical Scheme Join","Date Of Leaving");


                   IF ("Date Of Leaving" <> 0D) AND ("Date Of Leaving" <> xRec."Date Of Leaving") THEN BEGIN
                      ExitInterviews.SETRANGE("Employee No.","No.");
                      OK:= ExitInterviews.FIND('-');
                      COMMIT();
                   END;


                  IF ("Date Of Leaving" <> 0D) AND ("Date Of Leaving" <> xRec."Date Of Leaving") THEN BEGIN
                    // CareerEvent.SetMessage('Left The Company');
                   //  CareerEvent.RUNMODAL;
                    // OK:= CareerEvent.ReturnResult;
                      IF OK THEN BEGIN
                       {  CareerHistory.INIT;
                         IF NOT CareerHistory.FIND('-') THEN
                          CareerHistory."Line No.":=1
                        ELSE BEGIN
                          CareerHistory.FIND('+');
                          CareerHistory."Line No.":=CareerHistory."Line No."+1;
                        END;
                       }
                      //   CareerHistory."Employee No.":= "No.";
                      //   CareerHistory."Date Of Event":= "Date Of Leaving";
                      //   CareerHistory."Career Event":= 'Left The Company';
                      //   CareerHistory."Employee First Name":= "Known As";
                       //  CareerHistory."Employee Last Name":= "Last Name";

                        // CareerHistory.INSERT;
                      END;
                  END;
                  */

            end;
        }

        field(71; Peromnes; Code[20])
        {
            TableRelation = "HRM-Jobs";
        }

        field(72; "Per Annum"; Decimal)
        {
        }
        field(73; "Allow Overtime"; Option)
        {
            OptionMembers = Yes,No," ";
        }
        field(74; "Medical Scheme No."; Text[30])
        {

            trigger OnValidate()
            begin
                //MedicalAidBenefit.SETRANGE("Employee No.","No.");
                // OK := MedicalAidBenefit.FIND('+');
                //IF OK THEN BEGIN
                // REPEAT
                //  MedicalAidBenefit."Medical Aid Number":= "Medical Aid Number";
                //   MedicalAidBenefit.MODIFY;
                //   COMMIT();
                //UNTIL MedicalAidBenefit.NEXT = 0;
                // END;

                IF ("Medical Scheme No." <> xRec."Medical Scheme No.") AND ("Medical Scheme No." <> '') THEN BEGIN
                    // CareerEvent.SetMessage('Medical Aid Number Changed');
                    // CareerEvent.RUNMODAL;
                    // OK:= CareerEvent.ReturnResult;
                    IF OK THEN BEGIN
                        /*  CareerHistory.INIT;
                          IF NOT CareerHistory.FIND('-') THEN
                           CareerHistory."Line No.":=1
                         ELSE BEGIN
                           CareerHistory.FIND('+');
                           CareerHistory."Line No.":=CareerHistory."Line No."+1;
                         END;

                          CareerHistory."Employee No.":= "No.";
                          CareerHistory."Date Of Event":= WORKDATE;
                          CareerHistory."Career Event":= 'Medical Aid Number Changed';
                          CareerHistory."Medical Aid Number":= "Medical Scheme No.";
                          CareerHistory."Employee First Name":= "Known As";
                          CareerHistory."Employee Last Name":= "Last Name";
                          CareerHistory.INSERT;*/
                    END;
                END;

            end;
        }
        field(75; "Medical Scheme Head Member"; Text[20])
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //   OK := MedicalAidBenefit.FIND('+');
                //  IF OK THEN BEGIN
                //  REPEAT
                //   MedicalAidBenefit."Medical Aid Head Member":= "Medical Aid Head Member";
                //    MedicalAidBenefit.MODIFY;
                //  UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(76; "Number Of Dependants"; Integer)
        {

            trigger OnValidate()
            begin
                // MedicalAidBenefit.SETRANGE("Employee No.","No.");
                // OK := MedicalAidBenefit.FIND('+');
                // IF OK THEN BEGIN
                //REPEAT
                //  MedicalAidBenefit."Number Of Dependants":= "Number Of Dependants";
                //  MedicalAidBenefit.MODIFY;
                //UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(77; "Medical Scheme Name"; Text[30])
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
        field(78; "Amount Paid By Employee"; Decimal)
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //  OK := MedicalAidBenefit.FIND('+');
                //   IF OK THEN BEGIN
                //     REPEAT
                //      MedicalAidBenefit."Amount Paid By Employee":= "Amount Paid By Employee";
                //       MedicalAidBenefit.MODIFY;
                //     UNTIL MedicalAidBenefit.NEXT = 0;
                //    END;
            end;
        }
        field(79; "Amount Paid By Company"; Decimal)
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //   OK := MedicalAidBenefit.FIND('+');
                //  IF OK THEN BEGIN
                // REPEAT
                //      MedicalAidBenefit."Amount Paid By Company":= "Amount Paid By Company";
                //      MedicalAidBenefit.MODIFY;
                // UNTIL MedicalAidBenefit.NEXT = 0;
                //   END;
            end;
        }
        field(80; "Pension Cleared"; Boolean)
        {
        }
        field(81; "Second Language (R/W/S)"; Code[20])
        {

        }
        field(82; "Additional Language"; Code[20])
        {

        }
        field(83; Cleared; Boolean)
        {
        }
        field(84; "Notice Period Days Served"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(85; "UIF Country"; Code[20])
        {
            TableRelation = "Country/Region".Code;
        }
        field(86; "Notice Period Served"; Option)
        {
            OptionCaption = ' ,Fully,Partially';
            OptionMembers = " ",Fully,Partially;
        }
        field(87; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                // EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(88; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";

            trigger OnValidate()
            begin
                //IF ("Resource No." <> '') AND Res.WRITEPERMISSION THEN
                // EmployeeResUpdate.ResUpdate(Rec)
            end;
        }
        field(89; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Deceased,Termination,"Contract Ended",Abscondment,"Appt. Revoked","Contract Termination",Retrenchment,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
                //**Added by ACR 12/08/2002
                //**Block resource if Terminated

                IF "Resource No." <> '' THEN BEGIN
                    OK := "Lrec Resource".GET("Resource No.");
                    "Lrec Resource".Blocked := TRUE;
                    //   "Lrec Resource".MODIFY;
                END;

                //**
            end;
        }
        field(90; "Job Specification"; Code[50])
        {
        }
        field(91; DateOfBirth; Text[8])
        {
        }
        field(92; DateEngaged; Text[8])
        {
        }
        field(93; "Postal Address2"; Text[50])
        {
        }
        field(94; "Postal Address3"; Text[20])
        {
        }
        field(95; "Residential Address2"; Text[30])
        {
        }
        field(96; "Residential Address3"; Text[20])
        {
        }
        field(97; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(98; Citizenship; Code[20])
        {
            TableRelation = "Country/Region".Code;
        }
        field(99; "Name Of Manager"; Text[45])
        {
        }
        field(100; "User ID"; Code[50])
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
        field(101; "Disabling Details"; Text[50])
        {
        }
        field(102; "Disability Grade"; Text[30])
        {
        }
        field(103; "Passport Number"; Text[30])
        {
        }
        field(104; "2nd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(105; "3rd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(106; PensionJoin; Text[8])
        {
        }
        field(107; DateLeaving; Text[30])
        {
        }
        field(108; Region; Code[20])
        {
        }
        field(109; "Manager Emp No"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                emps.RESET;
                emps.SETRANGE(emps."No.", "Manager Emp No");
                IF emps.FIND('-') THEN BEGIN
                    "Name Of Manager" := emps."First Name" + ' ' + emps."Middle Name" + ' ' + emps."Last Name";
                END;
            end;
        }
        field(110; Temp; Text[30])
        {
        }
        field(111; "Employee Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C");
            FieldClass = FlowField;
        }
        field(112; "Employee Act. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("Termination Category" = FILTER(= ' ')));
            FieldClass = FlowField;
        }
        field(113; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("Termination Category" = FILTER(<> ' ')));
            FieldClass = FlowField;
        }
        field(114; "Contract Location"; Text[20])
        {
            Description = 'Location where contract was closed';
        }
        field(115; "First Language Read"; Boolean)
        {
        }
        field(116; "First Language Write"; Boolean)
        {
        }
        field(117; "First Language Speak"; Boolean)
        {
        }
        field(118; "Second Language Read"; Boolean)
        {
        }
        field(119; "Second Language Write"; Boolean)
        {
        }
        field(120; "Second Language Speak"; Boolean)
        {
        }
        field(121; "Custom Grading"; Code[20])
        {
            //TableRelation = 39005744.Field2;
        }
        field(122; "PIN Number"; Code[20])
        {
        }
        field(123; "NSSF No."; Code[20])
        {
        }
        field(124; "NHIF No."; Code[20])
        {
        }
        field(125; "Cause of Inactivity Code"; Code[20])
        {
            Caption = 'Cause of Inactivity Code';
            TableRelation = "Cause of Inactivity";
        }
        field(126; "Grounds for Term. Code"; Code[20])
        {
            Caption = 'Grounds for Term. Code';
            TableRelation = "Grounds for Termination";
        }
        field(127; "PAYROLL NO"; Code[20])
        {
        }
        field(128; "Period Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            //TableRelation = "HRM-Appraisal Periods2".Period;
        }
        field(129; "HELB No"; Text[30])
        {
        }
        field(130; "Co-Operative No"; Text[30])
        {
        }
        field(131; "Wedding Anniversary"; Date)
        {
        }
        field(132; Grade; Code[20])
        {
            FieldClass = Normal;
            TableRelation = "HRM-Grades".Grade;
        }
        field(133; "Competency Area"; Code[20])
        {

        }
        field(134; "Division Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DIVISION'));
        }
        field(135; "Position To Succeed"; Code[20])
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
        field(136; "Succesion Date"; Date)
        {
        }
        field(137; "Send Alert to"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(138; Tribe; Code[20])
        {
            TableRelation = Tribes."Tribe Code";
        }
        field(139; Religion; Code[20])
        {
            //TableRelation = "GEN-Religion".Relegion;
        }
        field(140; "Job Title"; Code[20])
        {

        }
        field(141; "Post Office No"; Text[30])
        {
        }
        field(142; "Posting Group"; Code[30])
        {
            NotBlank = true;
        }
        field(143; "Payroll Posting Group"; Code[20])
        {
        }
        field(144; "Served Notice Period"; Boolean)
        {
        }
        field(145; "Exit Interview Date"; Date)
        {
        }
        field(146; "Exit Interview Done by"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(147; "Allow Re-Employment In Future"; Boolean)
        {
        }
        field(148; "Medical Scheme Name #2"; Text[50])
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
        field(149; "Resignation Date"; Date)
        {
        }
        field(150; "Suspension Date"; Date)
        {
        }
        field(151; "Demised Date"; Date)
        {
        }
        field(152; "Retirement date"; Date)
        {
        }
        field(153; "Date of Appointment"; Date)
        {
        }
        field(154; "Section Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('SECTION'));
        }
        field(155; Permanent; Boolean)
        {

            trigger OnValidate()
            begin
                //Helps Filter Permanent and Casual employees
                IF Payroll.GET("No.") THEN BEGIN
                    Payroll.Permanent := Permanent;
                    //Payroll.MODIFY;
                END;
            end;
        }
        field(156; "Library Category"; Option)
        {
            OptionCaption = 'ADMIN STAFF,TEACHING STAFF,DIRECTORS,NAMES';
            OptionMembers = "ADMIN STAFF","TEACHING STAFF",DIRECTORS,NAMES;
        }
        field(157; Category; Code[20])
        {
        }
        field(158; "Payroll Departments"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                //Added to change dept on employee table and assignment matrix table
                //employee payroll
                IF Payroll.GET("No.") THEN BEGIN

                    //Payroll.MODIFY;
                END;
            end;
        }
        field(159; "Library Code"; Code[20])
        {
            //TableRelation = "ACA-Library Codes"."Lib Code";
        }
        field(160; "Library Borrower Type"; Option)
        {
            OptionCaption = 'Staff';
            OptionMembers = Staff;
        }
        field(161; Names; Text[50])
        {
        }
        field(162; Lecturer; Boolean)
        {
        }
        field(163; "Maximun Hours"; Decimal)
        {
        }
        field(164; Password; Text[50])
        {
        }
        field(165; "count"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(166; "Portal Password"; Text[30])
        {

            trigger OnValidate()
            begin
                "Changed Password" := FALSE;
                //MODIFY;
            end;
        }
        field(167; "Changed Password"; Boolean)
        {
            Editable = true;
        }
        field(168; "Leave Balance"; Decimal)
        {
            CalcFormula = Sum("HRM-Leave Ledger"."No. of Days" WHERE("Employee No" = FIELD("No.")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(169; "Department Name"; Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE("Dimension Code" = FILTER('DEPARTMENT'),
                                                               Code = FIELD("Department Code")));
            FieldClass = FlowField;
        }
        field(170; "Social Security No."; Code[30])
        {
        }
        field(171; "Payroll Code"; Code[20])
        {
            TableRelation = "Dimension Value";
        }
        field(172; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,FOSA;
        }
        field(173; "Total Leave Taken"; Decimal)
        {
            CalcFormula = Sum("HRM-Leave Ledger"."No. of Days" WHERE("Transaction Type" = FILTER(Application),
                                                                      "Employee No" = FIELD("No."),
                                                                      "Entry Type" = FILTER(Application),
                                                                      "Leave Type" = FIELD("Leave Type")));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
        field(174; "Total (Leave Days)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(175; "Cash - Leave Earned"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(176; "Reimbursed Leave Days"; Decimal)
        {
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                VALIDATE("Allocated Leave Days");
            end;
        }
        field(177; "Cash per Leave Day"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(178; "Allocated Leave Days"; Decimal)
        {

            trigger OnValidate()
            begin
                CALCFIELDS("Total Leave Taken");
                "Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
                //SUM UP LEAVE LEDGER ENTRIES
                "Leave Balance" := "Total (Leave Days)" - "Total Leave Taken";
                //TotalDaysVal := Rec."Total Leave Taken";
            end;
        }
        field(179; "Contract Start Date"; Date)
        {
        }
        field(180; "Main Bank"; Code[5])
        {
            TableRelation = "PRL-Bank Structure"."Bank Code";

            trigger OnValidate()
            begin
                PrBankStructure.SETRANGE(PrBankStructure."Bank Code", "Main Bank");
                PrBankStructure.SETRANGE(PrBankStructure."Branch Code", "Branch Bank");

                IF PrBankStructure.FIND('-') THEN
                    "Branch Bank" := PrBankStructure."Branch Code";
                "Branch Bank Name" := PrBankStructure."Branch Name";
                "Main Bank Name" := PrBankStructure."Bank Name";
            end;
        }
        field(181; "Branch Bank"; Code[5])
        {
            TableRelation = "PRL-Bank Structure"."Branch Code" WHERE("Bank Code" = FIELD("Main Bank"));

            trigger OnValidate()
            begin
                PrBankStructure.SETRANGE(PrBankStructure."Branch Code", "Branch Bank");
                IF PrBankStructure.FIND('-') THEN
                    "Main Bank" := PrBankStructure."Bank Code";
            end;
        }
        field(182; "Alt. Address Start Date"; Date)
        {
            Caption = 'Alt. Address Start Date';
        }
        field(183; "Alt. Address End Date"; Date)
        {
            Caption = 'Alt. Address End Date';
        }
        field(184; "Bank Account Number"; Code[20])
        {
        }
        field(185; "Total Absence (Base)"; Decimal)
        {
            CalcFormula = Sum("Employee Absence"."Quantity (Base)" WHERE("Employee No." = FIELD("No."),
                                                                          "Cause of Absence Code" = FIELD("Cause of Absence Filter"),
                                                                          "From Date" = FIELD("Date Filter")));
            Caption = 'Total Absence (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(186; "Cause of Absence Filter"; Code[10])
        {
            Caption = 'Cause of Absence Filter';
            FieldClass = FlowFilter;
            TableRelation = "Cause of Absence";
        }
        field(187; "Leave Status"; Option)
        {
            OptionMembers = "On Leave"," Resumed";
        }
        field(188; "Leave Type Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HRM-Leave Types".Code;
        }
        field(189; "Acrued Leave Days"; Decimal)
        {
        }
        field(190; "Leave Period Filter"; Code[20])
        {
        }
        field(191; "Annual Leave Account"; Decimal)
        {
        }
        field(192; "Compassionate Leave Acc."; Decimal)
        {
        }
        field(193; "Maternity Leave Acc."; Decimal)
        {
        }
        field(194; "Paternity Leave Acc."; Decimal)
        {
        }
        field(195; "Sick Leave Acc."; Decimal)
        {
        }
        field(196; "Study Leave Acc"; Decimal)
        {
        }
        field(197; OffDays; Decimal)
        {
        }
        field(198; "Citizenship Text"; Text[20])
        {
        }
        field(199; "Full Name"; Text[60])
        {
        }
        field(200; "Employee Type"; Option)
        {
            OptionCaption = ' ,Permanent,Casuals,Contract,Intern';
            OptionMembers = " ",Permanent,Casuals,Contract,Intern;
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
        field(209; "Station Name"; Text[30])
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
        field(212; "County Name"; Text[30])
        {
            Editable = false;
        }
        field(213; "Main Bank Name"; Text[20])
        {
        }
        field(214; "Branch Bank Name"; Text[20])
        {
            Editable = false;
        }
        field(215; "Returning Officer"; Boolean)
        {
        }
        field(216; Signature; BLOB)
        {
            SubType = Bitmap;
        }
        field(217; Registrar; Boolean)
        {
        }
        field(218; "Head of Department"; Code[10])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(219; "Barcode Picture"; BLOB)
        {
            SubType = Bitmap;
        }
        field(220; "Leave Type"; Code[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "HRM-Leave Types".Code WHERE(Gender = FIELD(Gender));
        }
        field(221; "Medical Scheme Join Date"; Date)
        {
        }
        field(222; "Physical Disability"; Boolean)
        {
        }
        field(223; "Salary Category"; Code[30])
        {
            TableRelation = "HRM-Employee Categories".Code WHERE(Section = FILTER(HR));
        }
        field(224; "Salary Grade"; Code[20])
        {
            TableRelation = "HRM-Job_Salary grade/steps"."Salary Grade code" WHERE("Employee Category" = FIELD("Salary Category"));
        }
        field(225; Profession; Code[50])
        {
        }
        field(226; "On Leave"; Boolean)
        {
        }
        field(227; "Current Leave No"; Code[20])
        {
        }
        field(228; "Part Time"; Boolean)
        {
        }
        field(229; "Terms of Service"; Code[20])
        {
            TableRelation = "HRM-Staff Categories"."Category Code";
        }
        field(230; "Campus Code"; Code[20])
        {
        }
        field(231; "Is HOD"; Boolean)
        {
        }
        field(232; "Administrative HOD"; Boolean)
        {
        }
        field(233; "Current Leave Start"; Date)
        {
        }
        field(234; "Current Leave End"; Date)
        {
        }
        field(235; "Current Leave Type"; Code[20])
        {
        }
        field(236; "Current Leave Applied Days"; Decimal)
        {
        }
        field(237; "Department Name 2"; Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE(Code = FIELD("Department Code")));
            FieldClass = FlowField;
        }
        field(238; "Is Dean"; Boolean)
        {
        }
        field(239; "Contract Renewal Date"; Date)
        {
        }
        field(240; HOD; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C"."No.";
        }
        field(241; Designation; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
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
    }

    trigger OnDelete()
    begin
        /*RecType:=RecType::Emp;
        ValidateUser.validateUser(RecType);
        */
        EmployeeImages.SETRANGE("Qualification Type", "No.");
        EmployeeImages.DELETEALL;

        //EmployeeNotes.SETRANGE("Employee No.","No.");
        //EmployeeNotes.DELETEALL;

        EmployeeRelative.SETRANGE("Employee Code", "No.");
        EmployeeRelative.DELETEALL;

        //VehicleUsage.SETRANGE("Employee No.","No.");
        //VehicleUsage.DELETEALL;

        //CorrespondHistory.SETRANGE("Employee No.","No.");
        //CorrespondHistory.DELETEALL;

        EmployeeEquity.SETRANGE("Employee No.", "No.");
        EmployeeEquity.DELETEALL;

        HumanResComment.SETRANGE("No.", "No.");
        HumanResComment.DELETEALL;

        //AssignAbsence.SETRANGE("Employee No.","No.");
        //AssignAbsence.DELETEALL;

        //AbsenceHoliday.SETRANGE("Employee No.","No.");
        //AbsenceHoliday.DELETEALL;

        //EmployeePayment.SETRANGE("Entry No","No.");
        //EmployeePayment.DELETEALL;

        //EmployeeBankDetails.SETRANGE("Employee No.","No.");
        //EmployeeBankDetails.DELETEALL;

        //EmployeeMaternity.SETRANGE("No.","No.");
        //EmployeeMaternity.DELETEALL;



        EmploymentHistory.SETRANGE("Employee No.", "No.");
        EmploymentHistory.DELETEALL;

        //MedicalHistory.SETRANGE("Employee No.","No.");
        //MedicalHistory.DELETEALL;

        //CareerHistory.SETRANGE("Employee No.","No.");
        //CareerHistory.DELETEALL;

        //Appraisal.SETRANGE("Employee No.","No.");
        //Appraisal.DELETEALL;

        //Disciplinary.SETRANGE("Employee No.","No.");
        //Disciplinary.DELETEALL;

        //ExitInterviews.SETRANGE("Employee No.","No.");
        //ExitInterviews.DELETEALL;

        //Grievances.SETRANGE("Employee No.","No.");
        //Grievances.DELETEALL;

        //Appraisal.SETRANGE("Employee No.","No.");
        //Appraisal.DELETEALL;

        //MedicalAidBenefit.SETRANGE("Employee No.","No.");
        //MedicalAidBenefit.DELETEALL;

        //PensionBenefit.SETRANGE("Employee No.","No.");
        //PensionBenefit.DELETEALL;

        //CarBenefit.SETRANGE("Employee No.","No.");
        //CarBenefit.DELETEALL;



        LearningIntervention.SETRANGE("Employee Requisition No", "No.");
        LearningIntervention.DELETEALL;

        ExistingQualification.SETRANGE("Exit Interview No", "No.");
        ExistingQualification.DELETEALL;



        EducationAssistance.SETRANGE("Application No", "No.");
        EducationAssistance.DELETEALL;

        InformalTraining.SETRANGE("Job Application No", "No.");
        InformalTraining.DELETEALL;

        EmployeeSkillsLines.SETRANGE("Member No.", "No.");
        EmployeeSkillsLines.DELETEALL;



    end;

    trigger OnInsert()
    begin
        RecType := RecType::Emp;
        //ValidateUser.validateUser(RecType);
        IF "No." = '' THEN BEGIN
            HumanResSetup.GET;
            HumanResSetup.TestField("Ministry Employee Nos.");
            NoSeriesMgt.InitSeries(HumanResSetup."Ministry Employee Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            "No. Series" := '';
        END;
    end;

    trigger OnModify()
    begin
        //RecType:=RecType::Emp;
        //ValidateUser.validateUser(RecType);

        "Last Date Modified" := TODAY;
        /*
        IF Res.READPERMISSION THEN
          EmployeeResUpdate.HumanResToRes(xRec,Rec);
        
        IF SalespersonPurchaser.READPERMISSION THEN
          EmployeeSalespersonUpdate.HumanResToSalesPerson(xRec,Rec); */
        CurrentPayDetails;

        IF ("Department Code" <> xRec."Department Code") OR
          (Office <> xRec.Office)
        THEN
            ;
        //  UpdtResUsersetp.OnModify(Rec);
        //  UpdtResUsersetp(Rec);

    end;

    trigger OnRename()
    begin
        /*RecType:=RecType::Emp;
        ValidateUser.validateUser(RecType);*/

        "Last Date Modified" := TODAY;

    end;

    var
        emps: Record "HRM-Other Payees";
        HumanResSetup: Record "HRM-Human Resources Setup.";
        PMEmployee: Record "HRM-Other Payees";
        EmployeeRelative: Record "HRM-Proffessional Membership";
        EmployeeImages: Record "HRM-Qualifications";
        Relative: Record "HRM-Job Requirements";
        CorrespondHistory: Record "HRM-Employee Requisitions";
        HumanResComment: Record "HRM-Other Payees";
        EmployeeEquity: Record "HRM-Job Occupations";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        //EmployeeResUpdate: Codeunit 60100;
        EmployeePayment: Record "HRM-Qualification Levels";
        OK: Boolean;

        EmploymentHistory: Record "HRM-Employment History";
        ExitInterviews: Record "HRM-Employee SIC Numbers";
        Grievances: Record "HRM-Employee Course Comp.";

        LearningIntervention: Record "HRM-Shortlisted Applicants";
        ExistingQualification: Record "HRM-Exit Interview Checklist";

        EducationAssistance: Record "HRM-Applicant Qualifications";
        InformalTraining: Record "HRM-Applicant Referees";

        EmployeeSkillsLines: Record "HRM-Commitee Members (KNCHR)";
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
        CLen: DateFormula;
        UserSetup: Record "User Setup";
        CDate: Date;
        Res: Record Employee;
        EmployeeSalespersonUpdate: Codeunit "Employee/Salesperson Update";
        HREmp: Record "HRM-Employee C";
        Country: Record "Country/Region";
        Cnt: Integer;

        HRDC: Record "HRM-Disciplinary Cases (B)";
        HRTRA: Record "HRM-Training Applications";
        HREK: Record "HRM-Employee Kin";
        HRJO: Record "HRM-Job Occupations";

        HREPR: Record "HRM-Employee C";
        HRAP: Record "HRM-Activity Participants";
        HREH: Record "HRM-Employment History";
        HREQ: Record "HRM-Employee Qualifications";
        HREEI: Record "HRM-Employee Exit Interviews";

        HRJA: Record "HRM-Job Applications (B)";
        HRAQ: Record "HRM-Applicant Qualifications";


        HRCM: Record "HRM-Commitee Members (KNCHR)";
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
        //ValidateUser: Codeunit 61105;
        RecType: Option " ",GL,Cust,Item,Supp,FA,Emp,Sal,CourseReg,prTrans,EmpTrans;


    /* procedure AssistEdit(OldEmployee: Record 61188): Boolean
    begin
        WITH PMEmployee DO BEGIN
            PMEmployee := Rec;
            HumanResSetup.GET;
            HumanResSetup.TESTFIELD("Employee Nos.");
            IF NoSeriesMgt.SelectSeries(HumanResSetup."Employee Nos.", OldEmployee."No. Series", "No. Series") THEN BEGIN
                HumanResSetup.GET;
                HumanResSetup.TESTFIELD("Employee Nos.");
                NoSeriesMgt.SetSeries("No.");
                Rec := PMEmployee;
                EXIT(TRUE);
            END;
        END;
    end; */


    procedure FullName(): Text[100]
    begin
        IF "Middle Name" = '' THEN
            EXIT("Known As" + "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
        ELSE
            EXIT("Known As" + "First Name" + ' ' + "Middle Name" + ' ' + "Last Name");
    end;


    procedure CurrentPayDetails()
    begin
        IF "No." = '' THEN BEGIN
            EmployeePayment.SETFILTER("Entry No", "No.");
            OK := EmployeePayment.FIND('+');
            IF OK THEN BEGIN
                // "Pay Period":= EmployeePayment.Description;
                /* "Pay Per Period":= EmployeePayment."Pay Per Period";
                 "Contracted Hours":= EmployeePayment.Blocked;
                 "Per Annum":= EmployeePayment."Annual Pay";
                 "Allow Overtime":= EmployeePayment."Allow Overtime";
                  MODIFY;   */
            END ELSE BEGIN
                "Pay Period" := 4;
                "Pay Per Period" := 0;
                "Contracted Hours" := 0;
                "Per Annum" := 0;
                "Allow Overtime" := 2;
                // MODIFY;
            END;
        END;

    end;


    procedure UpdtResUsersetp(var HREmpl: Record "HRM-Employee C")
    var
        Res: Record Resource;
        Usersetup: Record "User Setup";
    begin
        /*
        ContMgtSetup.GET;
        IF ContMgtSetup."Customer Integration" =
           ContMgtSetup."Customer Integration"::"No Integration"
        THEN
          EXIT;
        */
        /*
        Res.SETCURRENTKEY("No.");
        Res.SETRANGE("No.",HREmpl."Resource No.");
        IF Res.FIND('-') THEN BEGIN
          Res."Global Dimension 1 Code" := HREmpl."Department Code";
          Res."Global Dimension 2 Code" := HREmpl.Office;
          Res.MODIFY;
        END;
        
        IF Usersetup.GET(HREmpl."User ID") THEN BEGIN
          Usersetup.Department := HREmpl."Department Code";
          Usersetup.Office := HREmpl.Office;
          Usersetup.MODIFY;
        END;
        */

    end;


    procedure SetEmployeeHistory()
    begin
        /*IF NOT("No." = '') THEN
        BEGIN
           "HR Career History".INIT;
           "HR Career History"."Employee No." := "No.";
           "HR Career History".VALIDATE("Employee No.");
           "HR Career History"."Date Of Event" := "Date Of Join";
           "HR Career History"."Career Event" := 'Joined The Company';
           "HR Career History".Location:= City;
           "HR Career History".Status:= Status;
           "HR Career History".Department := "Department Code";
           "HR Career History".Office := Office;
           "HR Career History".Title:= Title;
           "HR Career History".Joined:= TRUE;
           "HR Career History"."Job Title":= Position;
           "HR Career History"."Full/Part Time":= "Full / Part Time";
           "HR Career History"."Marital Status":= "Marital Status";
           "HR Career History"."Vehicle Registration":= "Vehicle Registration Number";
           "HR Career History"."Medical Aid Number":= "Medical Scheme No.";
        
           IF ("HR Career History".INSERT) THEN
              MESSAGE(MSG1)
           ELSE
              ERROR(ERROR1);
        END;  */

    end;


    procedure GetPayPeriod()
    begin

        PayPeriod.SETRANGE(PayPeriod.Closed, FALSE);
        IF PayPeriod.FIND('-') THEN
            PayStartDate := PayPeriod."Date Opened";
        PayPeriodText := PayPeriod."Period Name";
    end;

    local procedure FullNames()
    begin
    end;
}


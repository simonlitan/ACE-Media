table 52179155 "HRM-Setup"
{
    DrillDownPageId = "HRM-Setup";
    LookupPageId = "HRM-Setup";


    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Employee Nos."; Code[10])
        {
            Caption = 'Employee Nos.';
            TableRelation = "No. Series";
        }
        field(3; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            TableRelation = "Human Resource Unit of Measure";

            trigger OnValidate()
            var
                ResUnitOfMeasure: Record "Resource Unit of Measure";
                ResLedgEnty: Record "Res. Ledger Entry";
            begin
                if "Base Unit of Measure" <> xRec."Base Unit of Measure" then begin
                    if EmployeeAbsence.Find('-') then
                        Error(Text001, FieldCaption("Base Unit of Measure"), EmployeeAbsence.TableCaption);
                end;

                HumanResUnitOfMeasure.Get("Base Unit of Measure");
                ResUnitOfMeasure.TestField("Qty. per Unit of Measure", 1);
                ResUnitOfMeasure.TestField("Related to Base Unit of Meas.");
            end;
        }
        field(4; "Leave Application Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(5; "Recruitment Needs Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(6; "Disciplinary Cases Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(7; "Applicants Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(8; "Further Info Nos"; code[10])
        {
            TableRelation = "No. Series".code;
        }
        field(9; "Vehicle Nos"; code[10])
        {
            TableRelation = "No. Series".code;
        }
        field(10; "Job List"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(11; "Work Ticket No."; Code[15])
        {
            TableRelation = "No. Series".Code;
        }
        field(12; "Venue Booking"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(13; "Transport Requisition No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(14; "Fuel Register"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(15; "Maintenance No"; code[20])
        {
            TableRelation = "No. Series";
        }
        field(16; "Leave Letter Numbers"; code[20])
        {
            TableRelation = "No. Series";
        }
        field(17; "Authority Number"; code[20])
        {
            TableRelation = "No. Series";
        }
        field(18; "Pay-change No."; code[20])
        {
            TableRelation = "No. Series";
        }
        field(19; "Document No"; code[30])
        {
            TableRelation = "No. Series";
        }
        field(20; "Leave Allowance No"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(21; "Cleaning Nos"; Code[30])
        {
            TableRelation = "No. Series";
        }

        field(22; "Tax Table"; Code[10])
        {
        }
        field(23; "Corporation Tax"; Decimal)
        {
        }
        field(24; "Housing Earned Limit"; Decimal)
        {
        }
        field(25; "Pension Limit Percentage"; Decimal)
        {
        }
        field(26; "Pension Limit Amount"; Decimal)
        {
        }
        field(27; "Round Down"; Boolean)
        {
        }
        field(28; "Working Hours"; Decimal)
        {
        }
        field(29; "Payroll Rounding Precision"; Decimal)
        {
        }
        field(30; "Payroll Rounding Type"; Option)
        {
            OptionMembers = Nearest,Up,Down;
        }
        field(31; "Special Duty Table"; Code[10])
        {
        }
        field(32; "CFW Round Deduction code"; Code[20])
        {
        }
        field(33; "BFW Round Earning code"; Code[20])
        {
        }
        field(34; "Company overtime hours"; Decimal)
        {
        }
        field(35; "Tax Relief Amount"; Decimal)
        {
        }
        field(36; "Posting Group"; Code[20])
        {
        }
        field(37; "General Payslip Message"; Text[100])
        {
        }
        field(38; "Overtime Indicator"; Decimal)
        {
        }
        field(39; "Bank Charges"; Decimal)
        {
        }
        field(40; "Batch File Path"; Text[250])
        {
        }
        field(41; "Incoming Mail Server"; Text[30])
        {
        }
        field(42; "Outgoing Mail Server"; Text[30])
        {
        }
        field(43; "Email Text"; Text[250])
        {
        }
        field(44; "Sender User ID"; Text[30])
        {
        }
        field(45; "Sender Address"; Text[100])
        {
        }
        field(46; "Email Subject"; Text[100])
        {
        }
        field(47; "Template Location"; Text[100])
        {
        }
        field(48; CopyTo; Text[100])
        {
        }
        field(49; "Delay Time"; Integer)
        {
        }
        field(50; BatchNo; Code[10])
        {
            Caption = 'Employee Nos.';
            TableRelation = "No. Series";
        }
        field(51; "HR Admin Address"; Text[150])
        {
        }
        field(52; "Base Calendar"; Code[10])
        {
            TableRelation = "Base Calendar".Code;
        }
        field(53; "Normal Leave Aprroval Levels"; Integer)
        {
        }
        field(54; "Manager Leave Approval Levels"; Integer)
        {
        }
        field(55; "Job ID"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(56; "Last Application No"; Integer)
        {
        }
        field(57; "Active Loans Manager"; Code[30])
        {
        }
        field(58; "Active Loans Director"; Code[30])
        {
        }
        field(59; "Appraisal Manager"; Code[30])
        {
        }
        field(60; "Low Intrest Loan Rate"; Decimal)
        {
        }
        field(61; "First Payroll Aprroval"; Code[30])
        {
            //todo TableRelation = Table2000000002.Field1;
        }
        field(62; "Second Payroll Aprroval"; Code[30])
        {
            TableRelation = User."User Name";
        }
        field(63; "Payroll Approved"; Boolean)
        {
        }
        field(64; "Payroll Control Accont"; Code[30])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(65; "Payroll Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(66; "Payroll Journal Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Payroll Journal Template"));
        }
        field(67; "Sal.Increament"; Decimal)
        {
        }
        field(68; "Training Application Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }

        field(69; "Employee Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(70; "Leave Posting Period[FROM]"; Date)
        {
        }
        field(71; "Leave Posting Period[TO]"; Date)
        {
        }
        field(72; "Job Application Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(73; "Exit Interview Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(74; "Appraisal Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(75; "Company Activities"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(76; "Induction Nos"; Code[50])
        {
            TableRelation = "No. Series";
        }
        field(77; "Medical Claims Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(78; "Medical Scheme Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(79; "Days To Retirement"; DateFormula)
        {
        }
        field(80; "Retirement Age"; Decimal)
        {
        }
        field(81; "Back To Office Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(82; "TNA Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(83; "Pension Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(84; "Disabled Retirement Age"; Decimal)
        {
        }
        field(85; "Total Females"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Gender = FILTER(Female)));
            FieldClass = FlowField;
        }
        field(86; "Total Males"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Gender = FILTER(Male)));
            FieldClass = FlowField;
        }
        field(87; "Visitor Nos"; code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(88; "Complaint Nos"; Code[50])
        {
            TableRelation = "No. Series".Code;
        }
        field(89; "ADR Nos"; Code[50])
        {
            TableRelation = "No. Series".Code;
        }
        field(90; "Leave Recall Nos"; code[20])
        {
            TableRelation = "No. Series".Code;
        }

    }

    keys
    {
        key(Key1; "Primary Key")
        {
        }
    }

    fieldgroups
    {
    }

    var
        EmployeeAbsence: Record "Employee Absence";
        HumanResUnitOfMeasure: Record "Human Resource Unit of Measure";
        Text001: Label 'You cannot change %1 because there are %2.';
}


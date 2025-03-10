table 52179200 "PRL-Period Transactions"
{
    DrillDownPageID = "PRL-PeriodTransaction List";
    LookupPageID = "PRL-PeriodTransaction List";

    fields
    {
        field(1; "Employee Code"; Code[50])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                HRMEmployeeD.Reset;
                HRMEmployeeD.SetRange("No.", "Employee Code");
               // if HRMEmployeeD.Find('-') then begin
               if HRMEmployeeD.Get("Employee Code") then
                    "Employee Category" := HRMEmployeeD."Employee Category";
                    "Employee Name" := HRMEmployeeD."First Name" + ' ' + HRMEmployeeD."Last Name";
                end;
           // end;

        }
        field(2; "Transaction Code"; Text[50])
        {
           //TableRelation = "PRL-Transaction Codes"."Transaction Code";
        }
        field(3; "Group Text"; Text[50])
        {
            Description = 'e.g Statutory, Deductions, Tax Calculation etc';
        }
        field(4; "Transaction Name"; Text[200])
        {
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; Balance; Decimal)
        {
        }
        field(7; "Original Amount"; Decimal)
        {
        }
        field(8; "Group Order"; Integer)
        {
        }
        field(9; "Sub Group Order"; Integer)
        {
        }
        field(10; "Period Month"; Integer)
        {
        }
        field(11; "Period Year"; Integer)
        {
        }
        field(12; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(13; "Payroll Period"; Date)
        {
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(14; Membership; Code[50])
        {

        }
        field(15; "Reference No"; Integer)
        {
        }
        field(16; "Department Code"; Code[20])
        {
        }
        field(17; Lumpsumitems; Boolean)
        {
        }
        field(18; TravelAllowance; Code[20])
        {
        }
        field(19; "GL Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(20; "Company Deduction"; Boolean)
        {
            Description = 'Dennis- Added to filter out the company deductions esp: the Pensions';
        }
        field(21; "Emp Amount"; Decimal)
        {
            Description = 'Dennis- Added to take care of the balances that need a combiantion btwn employee and employer';
        }
        field(22; "Emp Balance"; Decimal)
        {
            Description = 'Dennis- Added to take care of the balances that need a combiantion btwn employee and employer';
        }
        field(23; "Journal Account Code"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(24; "Journal Account Type"; Option)
        {
            OptionMembers = " ","G/L Account",Customer,Vendor;
        }
        field(25; "Post As"; Option)
        {
            OptionMembers = " ",Debit,Credit;
        }
        field(26; "Loan Number"; Code[30])
        {
        }
        field(27; "coop parameters"; Option)
        {
            Description = 'to be able to report the different coop contributions -Dennis';
            OptionMembers = "none",shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension,NSSF,Overtime;
        }
        field(28; "Payroll Code"; Code[20])
        {
            TableRelation = "PRL-Payroll Type";
        }
        field(29; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,SACCO;
        }
        field(30; "transaction type"; text[100])
        {
            TableRelation = "PRL-Transaction Codes"."Transaction Type";
        }
        field(31; "Change Advice Serial No."; code[20])
        {
            TableRelation = "No. Series";
        }
        field(32; "Total Statutories"; Decimal)
        {
            CalcFormula = Sum("PRL-Period Transactions".Amount WHERE("Employee Code" = FIELD("Employee Code"),
                                                                      "Group Text" = CONST('STATUTORIES'),
                                                                      "Period Month" = FIELD("Period Month"),
                                                                      "Period Year" = FIELD("Period Year")));
            FieldClass = FlowField;
        }
        field(33; "Employee Category"; Code[20])
        {
            TableRelation = "HRM-Staff Categories"."Category Code";
        }
        field(34; Grouping; Code[20])
        {
        }
        field(35; "View on Payslip"; Boolean)
        {
        }
        field(36; "Group Section"; Option)
        {
            OptionCaption = ' ,Header,Lines,Footer';
            OptionMembers = " ",Header,Lines,Footer;

        }
        field(37; "Journal Bal Acc"; code[50])
        {
        }
        field(38; "Shortcut Dimension 1 Code"; Code[30])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1), Blocked = filter(false));
            FieldClass = FlowField;
            CalcFormula = lookup("HRM-Employee C"."Global Dimension 1 Code" where("No." = field("Employee Code")));
        }
        field(39; "Shortcut Dimension 2 Code"; Code[30])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2), Blocked = filter(false));
            FieldClass = FlowField;
            CalcFormula = lookup("HRM-Employee C"."Global Dimension 2 Code" where("No." = field("Employee Code")));
        }
        field(40; "Shortcut Dimension 3 Code"; Code[30])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(3), Blocked = filter(false));
        }
        field(41; "Shortcut Dimension 4 Code"; Code[30])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(4), Blocked = filter(false));
        }
        field(42; "Shortcut Dimension 5 Code"; Code[30])
        {
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(5), Blocked = filter(false));
        }

        field(43; "Shortcut Dimension 6 Code"; Code[30])
        {
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(6), Blocked = filter(false));
        }
        field(44; "Employee Name"; Code[50])
        {

        }
    }

    keys
    {
        key(Key1; "Payroll Period", "Employee Code", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No")
        {
            SumIndexFields = Amount;
        }
        key(Key2; "Employee Code", "Period Month", "Period Year", "Group Order", "Sub Group Order", Membership, "Reference No")
        {
            SumIndexFields = Amount;

        }
        key(Key3; "Group Order", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No", "Department Code")
        {
            SumIndexFields = Amount;
        }
        key(Key4; Membership)
        {
        }
        key(Key5; "Transaction Code", "Payroll Period", Membership, "Reference No")
        {
            SumIndexFields = Amount;
        }
        key(Key6; "Payroll Period", "Group Order", "Sub Group Order")
        {
            SumIndexFields = Amount;
        }
        key(Key7; "Employee Code", "Department Code")
        {
            SumIndexFields = Amount;
        }
        key(Key8; "Transaction Name")
        {
        }
        key(Key9; "Group Order")
        {
        }
        key(key10; "transaction type")
        { }

    }

    fieldgroups
    {
    }

    var
        HRMEmployeeD: Record "HRM-Employee C";
}


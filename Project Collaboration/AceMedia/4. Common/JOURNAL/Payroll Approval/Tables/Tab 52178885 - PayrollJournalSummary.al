table 52178885 "Payroll Journal Summary"
{

    fields
    {
        field(1; "Transaction Code"; Code[20])
        {
        }
        field(2; "Transaction Name"; Code[250])
        {
        }
        field(3; "G/L Account"; Code[20])
        {
        }
        field(4; "Period Month"; Integer)
        {
        }
        field(5; "Period YearS"; Integer)
        {
        }
        field(6; "Posting Description"; Text[200])
        {
        }
        field(7; Amount; Decimal)
        {
            // CalcFormula = Sum("Payroll Journal Details".Amount WHERE("Transaction Code" = FIELD("Transaction Code"),
            // "Period Month" = FIELD("Period Month"),
            // "Period Year" = FIELD("Period Years")));
            // FieldClass = FlowField;
        }
        field(8; "Post as"; Option)
        {
            OptionCaption = ' ,Debit,Credit';
            OptionMembers = " ",Debit,Credit;
        }
        field(9; "Journal Account Type"; Option)
        {
            OptionMembers = " ","G/L Account",Customer,Vendor;
        }
        field(10; "coop parameters"; Option)
        {
            Description = 'to be able to report the different coop contributions -Dennis';
            OptionMembers = "none",shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension,NSSF,Overtime;
        }
        field(11; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Payroll Period"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Shortcut Dimension 1 Code"; Code[30])
        {
        
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1), Blocked = filter(false));
        }
        field(15; "Shortcut Dimension 2 Code"; Code[30])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2), Blocked = filter(false));
        }
        field(16; "Shortcut Dimension 3 Code"; Code[30])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(3), Blocked = filter(false));
        }
        field(17; "Shortcut Dimension 4 Code"; Code[30])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(4), Blocked = filter(false));
        }
        field(18; "Shortcut Dimension 5 Code"; Code[30])
        {
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(5), Blocked = filter(false));
        }

        field(19; "Shortcut Dimension 6 Code"; Code[30])
        {
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(6), Blocked = filter(false));
        }
        field(20; "Employee Code"; Code[50])
        {
            TableRelation = "HRM-Employee C";
        }
        field(21; "Balancing Account"; Code[20])
        {
        }



    }

    keys
    {
        key(Key1; "Transaction Code", "Period Month", "Period Years", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Payroll Period")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}


table 52178886 "Payroll Journal Details"
{

    fields
    {
        field(1; "Employee Code"; Code[20])
        {
        }
        field(2; "Transaction Code"; Code[20])
        {
        }
        field(3; "Transaction Name"; Code[250])
        {
        }
        field(4; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(5; "Period Month"; Integer)
        {
        }
        field(6; "Period Year"; Integer)
        {
        }
        field(7; "Posting Description"; Text[200])
        {
        }
        field(8; Amount; Decimal)
        {
        }
        field(9; "Post as"; Option)
        {
            OptionCaption = ' ,Debit,Credit';
            OptionMembers = " ",Debit,Credit;
        }
        field(10; "Journal Account Type"; Option)
        {
            OptionMembers = " ","G/L Account",Customer,Vendor;
        }
        field(11; "coop parameters"; Option)
        {
            Description = 'to be able to report the different coop contributions -Dennis';
            OptionMembers = "none",shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension,NSSF,Overtime;
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
        field(20; "Payroll Period"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Balancing Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(22; "Group Text"; Text[100])
        {

        }
        field(23; "Line No."; integer)
        {

        }
    }

    keys
    {
        key(Key1; "Payroll Period", "Employee Code", "Transaction Code", "Period Month", "Period Year")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

}


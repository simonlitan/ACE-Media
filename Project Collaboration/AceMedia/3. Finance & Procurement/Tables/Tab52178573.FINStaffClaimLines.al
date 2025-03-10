table 52178573 "FIN-Staff Claim Lines"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            NotBlank = true;
            Editable = true;
        }
        field(2; "Account No."; Code[10])
        {
            TableRelation = "G/L Account"."No.";
            Editable = true;
            //NotBlank = false;
            trigger OnValidate()
            begin
                if GLAcc.Get("Account No.") then
                    "Account Name" := GLAcc.Name;
            end;

        }
        field(3; "Account Name"; Text[80])
        {
            Editable = false;
            //TableRelation = "G/L Account".Name where("No." = field("Account No:"));
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "Due Date"; Date)
        {
        }
        field(6; "Imprest Holder"; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(7; "Actual Spent"; Decimal)
        {
        }
        field(8; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(9; "Apply to"; Code[20])
        {
        }
        field(10; "Apply to ID"; Code[20])
        {
        }
        field(11; "Surrender Date"; Date)
        {
        }
        field(12; Surrendered; Boolean)
        {
        }
        field(13; "M.R. No"; Code[20])
        {
        }
        field(14; "Date Issued"; Date)
        {
        }
        field(15; "Type of Surrender"; Option)
        {
            OptionMembers = " ",Cash,Receipt;
        }
        field(16; "Dept. Vch. No."; Code[20])
        {
        }
        field(17; "Cash Surrender Amt"; Decimal)
        {
        }
        field(18; "Bank/Petty Cash"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(19; "Surrender Doc No."; Code[20])
        {
        }
        field(20; "Date Taken"; Date)
        {
        }
        field(21; Purpose; Text[500])
        {
        }
        field(22; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(23; "Budgetary Control A/C"; Boolean)
        {
            Editable = false;
        }
        field(24; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(25; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the fourth global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(26; Committed; Boolean)
        {
        }
        field(27; "Advance Type"; Code[20])
        {
            Caption = 'Claim Type';
            TableRelation = "FIN-Receipts and Payment Types".Code WHERE(Type = CONST(Claim), Blocked = filter(false));
            trigger onvalidate()
            begin
                Paymenttypes.Reset();
                paymenttypes.SetRange(paymenttypes.code, "Advance Type");
                if Paymenttypes.Find('-') then begin
                    "Account No." := Paymenttypes."G/L Account";
                    GLAcc.Reset();
                    GLAcc.SetRange("No.", "Account No.");
                    if GLAcc.Find('-') then
                        "Account Name" := GLAcc.Name;
                end;
            end;

        }
        field(28; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(29; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(30; "Amount LCY"; Decimal)
        {
        }
        field(31; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(32; "Claim Receipt No"; Code[20])
        {
        }
        field(33; "Expenditure Date"; Date)
        {
        }
        field(34; "Attendee/Organization Names"; Text[250])
        {
        }
        field(35; "Lecturer No"; Code[20])
        {
            //TableRelation = "HRM-Employee C"."No." WHERE (Lecturer=filter(true));
        }
        field(36; "Semester Code"; Code[20])
        {
            //TableRelation = ACA-Semesters.Code;
        }
        field(37; "Campus Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(38; "Unit Code"; Code[20])
        {
            //TableRelation = "ACA-Lecturers Units - Old".Unit WHERE (Semester=FIELD(Semester Code));
        }
        field(39; "No. of Hours"; Decimal)
        {
        }
        field(40; "PAYE Amount"; Decimal)
        {
        }
        field(41; "PAYE Code"; Code[20])
        {
        }
        field(42; "Net Amount"; Decimal)
        {
        }
        field(43; "Pay mode"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Cash,Cheque,EFT,Custom 2,Custom 3,Custom 4,Custom 5';
            OptionMembers = " ",Cash,Cheque,EFT,"Custom 2","Custom 3","Custom 4","Custom 5";
        }
    }

    keys
    {
        key(Key1; "Line No.", "Document No.")
        {
            Clustered = true;
            SumIndexFields = Amount, "Amount LCY";
        }
    }

    fieldgroups
    {
    }


    var
        ClaimHeader: record "FIN-Staff Claims Header";
        Claimlines: Record "FIN-Staff Claim Lines";
        GLAcc: Record "G/L Account";
        Paymenttypes: Record "FIN-Receipts and Payment Types";
        RecPay: Record "FIN-Receipts and Payment Types";

}
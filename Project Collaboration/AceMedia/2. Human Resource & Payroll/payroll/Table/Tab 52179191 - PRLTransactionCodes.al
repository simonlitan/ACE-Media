table 52179191 "PRL-Transaction Codes"
{
    DataCaptionFields = "Transaction Name";
    DrillDownPageID = "PRL-List TransCode";
    LookupPageID = "PRL-List TransCode";

    fields
    {
        field(1; "Transaction Code"; Code[100])
        {
            Description = 'Unique Trans line code';
        }
        field(2; "Transaction Name"; Text[300])
        {
            Description = 'Description';
        }
        field(3; "Balance Type"; Option)
        {
            Description = 'None,Increasing,Reducing';
            OptionMembers = "None",Increasing,Reducing;
        }
        field(4; "Transaction Type"; Option)
        {
            Description = 'Income,Deduction';
            OptionMembers = Income,Deduction;
        }
        field(5; Frequency; Option)
        {
            Description = 'Fixed,Varied';
            OptionMembers = "Fixed",Varied;
        }
        field(6; "Is Cash"; Boolean)
        {
            Description = 'Does staff receive cash for this transaction';
        }
        field(7; Taxable; Boolean)
        {
            Description = 'Is it taxable or not';
        }
        field(8; "Is Formula"; Boolean)
        {
            Description = 'Is the transaction based on a formula';
        }
        field(9; Formula; Text[200])
        {
            Description = '[Formula] If the above field is "Yes", give the formula';
        }
        field(10; "Is Leave"; Boolean)
        {

        }
        field(11; "Amount Preference"; Option)
        {
            Description = 'Either (Posted Amount), (Take Higher) or (Take Lower)';
            OptionMembers = "Posted Amount","Take Higher","Take Lower ";
        }
        field(12; "Special Transactions"; Option)
        {
            Description = 'Represents all Special Transactions';
            OptionCaption = 'Ignore,Defined Contribution,Home Ownership Savings Plan,Life Insurance,Owner Occupier Interest,Prescribed Benefit,Salary Arrears,Staff Loan,Value of Quarters,Morgage,Gratuity,Insurance Relief,Allowance Recovery,Staff Welfare';
            OptionMembers = Ignore,"Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan","Value of Quarters",Morgage,Gratuity,"Insurance Relief","Allowance Recovery","Staff Welfare";
        }
        field(13; "Deduct Premium"; Boolean)
        {
            Description = '[Insurance] Should the Premium be treated as a payroll deduction?';
        }
        field(14; "Interest Rate"; Decimal)
        {
            Description = '[Loan] If above is "Yes", give the interest rate';
        }
        field(15; "Repayment Method"; Option)
        {
            Description = '[Loan] Reducing,Straight line';
            OptionMembers = Reducing,"Straight line",Amortized;
        }
        field(16; "Fringe Benefit"; Boolean)
        {
            Description = '[Loan] should the loan be treated as a Fringe Benefit?';
        }
        field(17; "Employer Deduction"; Boolean)
        {
            Description = 'Caters for Employer Deductions';
        }
        field(18; isHouseAllowance; Boolean)
        {
            Description = 'Flags if its house allowance - Dennis';
        }
        field(19; "Include Employer Deduction"; Boolean)
        {
            Description = 'Is the transaction to include the employer deduction? - Dennis';
        }
        field(20; "Is Formula for employer"; Text[200])
        {
            Description = '[Is Formula for employer] If the above field is "Yes", give the Formula for employer Dennis';
        }
        field(21; "Transaction Code old"; Code[50])
        {
            Description = 'Old Unique Trans line code - Dennis';
        }
        field(22; "GL Account"; Code[50])
        {
            Description = 'to post to GL account - Dennis';

            TableRelation = "G/L Account"."No.";
        }
        field(23; "GL Employee Account"; Code[50])
        {
            Description = 'to post to GLemployee  account - Dennis';
            Caption = 'GL Employeer Account';
            TableRelation = "G/L Account"."No.";
        }
        field(24; "coop parameters"; Option)
        {
            Caption = 'Other Categorization';
            Description = 'to be able to report the different coop contributions -Dennis';
            OptionMembers = "none",shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension,NSSF,Overtime;
        }
        field(25; "IsCoop/LnRep"; Boolean)
        {
            Description = 'to be able to report the different coop contributions -Dennis';
        }
        field(26; "Deduct Mortgage"; Boolean)
        {
        }
        field(27; Subledger; Option)
        {
            OptionMembers = " ",Customer,Vendor;
        }
        field(28; Welfare; Boolean)
        {
        }
        field(29; CustomerPostingGroup; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(30; Pension; Boolean)
        {
        }
        field(31; "Affects Overtime"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Affects Lost Hours"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Calculate from Days"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Is a Rate"; Boolean)
        {

        }
        field(35; "Is Rate of"; Option)
        {
            OptionCaption = 'Basic Pay';
            OptionMembers = "Basic Pay","Basic & House Allowance";
        }
        field(36; "Mortgage interest"; Boolean)
        {

        }
        field(37; "Salary Advance"; Boolean)
        {

        }
        field(38; Allowable; Boolean)
        {

        }
    }

    keys
    {
        key(Key1; "Transaction Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        RecType := RecType::prTrans;
        //todo  ValidateUser.validateUser(RecType);
    end;

    trigger OnInsert()
    begin
        RecType := RecType::prTrans;
        //ValidateUser.validateUser(RecType);
    end;

    trigger OnModify()
    begin
        RecType := RecType::prTrans;
        //ValidateUser.validateUser(RecType);
    end;

    trigger OnRename()
    begin
        RecType := RecType::prTrans;
        //ValidateUser.validateUser(RecType);
    end;

    Procedure UpdateTcode()
    begin
        TrCodes.Reset();
        TrCodes.SetRange("Special Transactions", TrCodes."Special Transactions"::"Staff Loan");
        if TrCodes.Find('-') then begin
            repeat
                NewCode := TrCodes."Transaction Code" + '-INT';
                TrCodes1.Reset();
                TrCodes1.SetRange("Transaction Code", NewCode);
                if Not TrCodes1.Find('-') then begin
                    TrCodes1.Init();
                    TrCodes1."Transaction Code" := NewCode;
                    TrCodes1."Transaction Name" := TrCodes."Transaction Name" + ' ' + 'Interest';
                    TrCodes1."Transaction Type" := TrCodes1."Transaction Type"::Deduction;
                    TrCodes1."Balance Type" := TrCodes1."Balance Type"::None;
                    TrCodes1."GL Account" := TrCodes."GL Account";
                    TrCodes1."Special Transactions" := TrCodes1."Special Transactions"::Ignore;
                    TrCodes1.Insert();
                end else begin

                end;
            until TrCodes.Next() = 0;
        end;

    end;

    var
        //todo ValidateUser: Codeunit "Validate User Permissions";
        RecType: Option " ",GL,Cust,Item,Supp,FA,Emp,Sal,CourseReg,prTrans,EmpTrans;
        TrCodes: Record "PRL-Transaction Codes";
        TrCodes1: Record "PRL-Transaction Codes";
        NewCode: Code[50];
}


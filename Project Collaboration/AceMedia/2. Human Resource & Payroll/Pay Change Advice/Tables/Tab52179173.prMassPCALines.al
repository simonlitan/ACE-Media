table 52179173 prMassPCALines
{

    fields
    {
        field(1; "Change Advice Serial No."; Code[50])
        {
        }
        field(2; "Employee Code"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(3; "Transaction Code"; Code[30])
        {
            TableRelation = "PRL-Transaction Codes"."Transaction Code";

            trigger OnValidate()
            begin
                IF objTransCodes.GET("Employee Code") THEN
                    "Transaction Code" := objTransCodes."Transaction Name";
                //"Payroll Period":=SelectedPeriod;
                //"Period Month":=PeriodMonth;
                //"Period Year":=PeriodYear;
                //  IF objTransCodes."Special Transactions"=8 THEN blnIsLoan:=TRUE;
            end;
        }
        field(4; "Transaction Name"; Text[100])
        {
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; "Period Month"; Integer)
        {
        }
        field(7; "Period Year"; Integer)
        {
        }
        field(8; "Payroll Period"; Date)
        {
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(9; Membership; Code[20])
        {
            //TableRelation = "prInstitutional Membership"."Institution No";
        }
        field(10; "Reference No"; Text[100])
        {
        }
        field(11; "Recurance Index"; Integer)
        {

        }
        field(12; Balance; Decimal)
        {

        }


    }

    keys
    {
        key(Key1; "Change Advice Serial No.", "Employee Code")
        {
        }
    }

    fieldgroups
    {
    }



    var
        objTransCodes: Record "PRL-Transaction Codes";
        objemp: Record "HRM-Employee C";
        objLines: Record prMassPCALines;
        slagrade: Record "HRM-Salary Grades";
        objPeriod: Record "PRL-Payroll Periods";
        uSetup: Record "User Setup";
        mPayrollCode: Code[50];
        objEmpTrans: Record "PRL-Employee Transactions";
        objEmpTransPCA: Record prMassPCAHD;
        intMonth: Integer;
        intYear: Integer;
        Ints: Integer;
        dtPAyrollPeriod: Date;
        dim1: Code[50];
        dim2: Code[50];
        dim3: Code[50];
        dim4: Code[50];
        UserSetup: Record "User Setup";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Work Flow Code";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}


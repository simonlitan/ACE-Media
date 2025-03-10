table 52178614 "FIN-Imprest Details"
{

    fields
    {
        field(1; No; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                // IF Pay.GET(No) THEN
                // "Imprest Holder":=Pay."Account No.";
            end;
        }
        field(2; "Account No:"; Code[10])
        {
            NotBlank = true;
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin
                IF GLAcc.GET("Account No:") THEN
                    "Account Name" := GLAcc.Name;

                IF Pay.GET(No) THEN BEGIN
                    IF Pay."Payment Type" = Pay."Payment Type"::Imprest THEN BEGIN
                        IF Pay."Account No." <> '' THEN
                            "Imprest Holder" := Pay."Account No."
                        ELSE
                            ERROR('Please Enter the Customer/Account Number');
                    END;
                END;



                CALCFIELDS("Payment Type");
                IF ("Payment Type" = "Payment Type"::Imprest) OR ("Payment Type" = "Payment Type"::Claims) THEN BEGIN
                    IF Pay.Department = '' THEN ERROR('Please select the department');
                    "Check Vote"();
                END;
            end;
        }
        field(3; "Account Name"; Text[50])
        {
        }
        field(4; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                CALCFIELDS("Department Lookup");
                //IF ("Payment Type"="Payment Type"::Imprest) OR ("Payment Type"="Payment Type"::Claims) THEN BEGIN
                IF "Department Lookup" = '' THEN ERROR('Please select the department');
                "Check Vote"();
                //END;
            end;
        }
        field(5; "Due Date"; Date)
        {
        }
        field(6; "Imprest Holder"; Code[50])
        {
            TableRelation = Customer."No.";
        }
        field(7; "Actual Spent"; Decimal)
        {

            trigger OnValidate()
            begin
                IF ("Actual Spent" + "Cash Surrender Amt") > Amount THEN
                    ERROR('Please Note You Can Not Surrender More Than Intial Amount');
            end;
        }
        field(8; "Apply to"; Code[20])
        {
        }
        field(9; "Apply to ID"; Code[20])
        {
        }
        field(10; "Surrender Date"; Date)
        {
        }
        field(11; Surrendered; Boolean)
        {
        }
        field(12; "Surrender Type No"; Code[100])
        {
        }
        field(13; "Date Issued"; Date)
        {
        }
        field(14; "Type of Surrender"; Option)
        {
            OptionCaption = ' ,REC,SAL,PV No,No Refund,Cash';
            OptionMembers = " ",REC,SAL,"PV No","No Refund",Cash;
        }
        field(15; "Dept. Vch. No."; Code[20])
        {
        }
        field(16; "Cash Surrender Amt"; Decimal)
        {

            trigger OnValidate()
            begin
                IF ("Actual Spent" + "Cash Surrender Amt") > Amount THEN
                    ERROR('Please Note You Can Not Surrender More Than Intial Amount');
            end;
        }
        field(17; "Bank/Petty Cash"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(18; Purpose; Code[50])
        {
            NotBlank = true;
            TableRelation = "G/L Account";
        }
        field(19; Remarks; Option)
        {
            OptionMembers = ,,"Under Expenditure","Over Expenditure";
        }
        field(20; Balance; Decimal)
        {
        }
        field(21; "Department Filter"; Code[10])
        {
            TableRelation = "Dimension Value".Code;
        }
        field(22; "Apply To Pv No"; Code[10])
        {
            TableRelation = "FIN-Payments".No;
        }
        field(23; "Doc. Received Date"; Date)
        {
        }
        field(24; "Line No"; Integer)
        {
        }
        field(25; "count"; Integer)
        {
            CalcFormula = Count("FIN-Imprest Details" WHERE(No = FIELD(No)));
            FieldClass = FlowField;
        }
        field(26; "Department Lookup"; Code[20])
        {
            CalcFormula = Lookup("FIN-Payments".Department WHERE(No = FIELD(No)));
            FieldClass = FlowField;
        }
        field(27; "Date Raised"; Date)
        {
            CalcFormula = Lookup("FIN-Payments".Date WHERE(No = FIELD(No)));
            FieldClass = FlowField;
        }
        field(28; "Status Lookup"; Option)
        {
            CalcFormula = Lookup("FIN-Payments".Status WHERE(No = FIELD(No)));
            FieldClass = FlowField;
            InitValue = New;
            OptionMembers = New,Pending,"1st Approval","2nd Approval","Cheque Printing",Cancelled,Issued,Surrendered;
        }
        field(29; "Payment Type"; Option)
        {
            CalcFormula = Lookup("FIN-Payments"."Payment Type" WHERE(No = FIELD(No)));
            FieldClass = FlowField;
            OptionMembers = Normal,"Petty Cash",Imprest,Claims,Salary;
        }
        field(30; "Posted Lookup"; Boolean)
        {
            CalcFormula = Lookup("FIN-Payments".Posted WHERE(No = FIELD(No)));
            FieldClass = FlowField;
        }
        field(31; "Customer No"; Code[20])
        {
            CalcFormula = Lookup("FIN-Payments"."Account No." WHERE(No = FIELD(No)));
            FieldClass = FlowField;
        }
        field(32; "Imprest Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; No, "Account No:", "Line No")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Imprest Holder")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        CALCFIELDS("Status Lookup");
        IF "Status Lookup" <> "Status Lookup"::New THEN
            ERROR('You can NOT delete a processed document!');
    end;

    var
        GLAcc: Record "G/L Account";
        Pay: Record "FIN-Payments";
        BudgetRec: Record "G/L Budget Entry";
        PayRec: Record "FIN-Payments";
        GenSetUp: Record "General Ledger Setup";
        Allocation: Decimal;
        Spent: Decimal;
        //ImpRec: Record 61126;
        GLEntry: Record "G/L Entry";
        //Comm: Record 61135;
        CommAmount: Decimal;

    procedure "Check Vote"()
    begin
        /*
        GenSetUp.GET();
      // Calculate Allocations
        CALCFIELDS("Department Lookup");
        Allocation:=0;
        BudgetRec.RESET;
       // BudgetRec.SETFILTER(BudgetRec.Date,'%1..%2',GenSetUp."Current Budget Start Date",GenSetUp."Current Budget End Date");
        BudgetRec.SETFILTER(BudgetRec."Budget Name",GenSetUp."Current Budget");
        BudgetRec.SETFILTER(BudgetRec."G/L Account No.","Account No:");
        BudgetRec.SETFILTER(BudgetRec."Global Dimension 2 Code","Department Lookup");
        IF BudgetRec.FIND('-') THEN BEGIN
        REPEAT
        Allocation:=Allocation+BudgetRec.Amount
        UNTIL BudgetRec.NEXT=0;
        END;

      // Calculate Expenses
        GLEntry.RESET;
        GLEntry.SETRANGE(GLEntry."G/L Account No.","Account No:");
        GLEntry.SETFILTER(GLEntry."Posting Date",'%1..%2',GenSetUp."Current Budget Start Date",GenSetUp."Current Budget End Date");
        GLEntry.SETFILTER(GLEntry."Global Dimension 2 Code","Department Lookup");
        IF GLEntry.FIND('-') THEN BEGIN
        REPEAT
        Spent:=Spent+GLEntry.Amount
        UNTIL GLEntry.NEXT=0;
        END;
       // Calculate  Committements
        Comm.RESET;
        Comm.SETRANGE(Comm.Account,"Account No:");
        Comm.SETRANGE(Comm.Closed,FALSE);
        Comm.SETFILTER(Comm.Date,'%1..%2',GenSetUp."Current Budget Start Date",GenSetUp."Current Budget End Date");
        Comm.SETFILTER(Comm.Department,"Department Lookup");

        IF Comm.FIND('-') THEN BEGIN
        REPEAT
        CommAmount:=CommAmount+Comm."Committed Amount";
        UNTIL Comm.NEXT=0;
        END;


         Spent:=Spent+CommAmount+Amount;

         IF (Allocation-Spent)<0 THEN ERROR('You have Exceed the Budget allocation by '+FORMAT((Allocation-Spent)));
         */

    end;
}


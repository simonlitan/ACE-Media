table 50037 "HRM-Leave Allowance Header"
{
    LookupPageId = "HRM-Leave Allowance List";
    DrillDownPageId = "HRM-Leave Allowance List";
    Caption = 'HRM-Leave Allowance Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            DataClassification = ToBeClassified;
        }
        field(2; "Payroll Period"; Date)
        {
            Caption = 'Payroll Period';
            TableRelation = "PRL-Payroll Periods"."Date Opened" where(Closed = filter(false));

            DataClassification = ToBeClassified;
           
        }
        field(3; "Period Month"; Integer)
        {
            Caption = 'Period Month';
            DataClassification = ToBeClassified;
        }
        field(4; "Period Year"; Integer)
        {
            Caption = 'Period Year';
            DataClassification = ToBeClassified;
        }
        field(5; "Period Name"; Text[50])
        {
            Caption = 'Period Name';
            DataClassification = ToBeClassified;
        }
        field(6; "Created By"; Text[100])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(7; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "Not Posted",Posted;
            DataClassification = ToBeClassified;
        }
        field(8; "No. Series"; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin

        if Rec."No." = '' then begin
            HumanResSetup.Get();
            HumanResSetup.TestField("Leave Allowance No");
            NoSeriesMgt.InitSeries(HumanResSetup."Leave Allowance No", xRec."No. Series", 0D, Rec."No.", Rec."No. Series");
            Rec."Created By" := UserId;
            rec.Validate("No.");
           

        end;
    end;


    procedure validatePeriod()
    begin
     payrolPeriod.Reset;
        payrolPeriod.SetFilter(payrolPeriod.Closed, '=%1', false);
        payrolPeriod.SetFilter(payrolPeriod."Date Opened", '<>%1', 0D);
        if payrolPeriod.Find('-') then begin
            // dateFilter := payrolPeriod."Date Opened";
            "Period Month" := payrolPeriod."Period Month";
            "Period Name" := payrolPeriod."Period Name";
            "Period Year" := payrolPeriod."Period Year";
        end;

    end;


    var
        HumanResSetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        leaveAll: record "HRM-Leave Allowance Reg.";
        dateFilter: Date;
        payrolPeriod: Record "PRL-Payroll Periods";
        salarycard: record "PRL-Salary Card";

        emps: Record "HRM-Employee C";
        salarygrades: Record "HRM-Job_Salary grade/steps";
        emptrans: Record "PRL-Employee Transactions";
        leavereq: Record "HRM-Leave Requisition";
        Allheader: Record "HRM-Leave Allowance Header";
        TGroup: Text[30];
        TGroupOrder: Integer;
        TSubGroupOrder: Integer;
}

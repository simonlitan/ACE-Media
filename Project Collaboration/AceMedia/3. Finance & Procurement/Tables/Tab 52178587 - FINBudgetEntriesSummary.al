table 52178587 "FIN-Budget Entries Summary"
{
    Caption = 'G/L Budget Entry';
    DrillDownPageID = "G/L Budget Entries";
    LookupPageID = "G/L Budget Entries";

    fields
    {
        field(1; "Budget Name"; Code[10])
        {
            Caption = 'Budget Name';
            TableRelation = "G/L Budget Name";
        }
        field(2; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";
        }
        field(3; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(4; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(5; "Budget Start Date"; Date)
        {
            AutoFormatType = 1;
            Caption = 'Budget Start Date';
        }
        field(6; "Budget End Date"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(7; Allocation; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = Sum("FIN-Budget Entries".Amount WHERE("Transaction Type" = FILTER(Allocation),
            //CalcFormula = Sum("FIN-Budget Entries"."Debit Amount" WHERE("Transaction Type" = FILTER(Allocation),
             "Commitment Status" = FILTER(' '), "Budget Name" = FIELD("Budget Name"),
              "G/L Account No." = FIELD("G/L Account No."), "Global Dimension 1 Code" = field("Global Dimension 1 Code"),
                "Global Dimension 2 Code" = field("Global Dimension 2 Code"),
                "Budget Dimension 3 Code" = field("Global Dimension 3 Code")));

        }
        field(17; Revision; Decimal)
        {

            FieldClass = FlowField;
            TableRelation = "FIN-Budget Entries";
            CalcFormula = Sum("FIN-Budget Entries".Amount WHERE("Transaction Type" = FILTER(Revision),
                                                                 "Commitment Status" = FILTER(' '),
                                                                 "Budget Name" = FIELD("Budget Name"),
                                                                 Date = FIELD("Budget End Date"),
                                                                 "G/L Account No." = FIELD("G/L Account No."),
                                                                "Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
                                                                "Global Dimension 2 Code" = FIELD("Global Dimension 2 Code")));

        }
        field(16; "Revised Allocations"; Decimal)
        {
            TableRelation = "FIN-Budget Entries";
            FieldClass = FlowField;
            CalcFormula = sum("FIN-Budget Entries".Amount WHERE("Transaction Type" = FILTER(Revision | Allocation),
                                                                 "Commitment Status" = FILTER(' '),
                                                                 "Budget Name" = FIELD("Budget Name"),
                                                                 Date = FIELD("Budget End Date"),
                                                                 "G/L Account No." = FIELD("G/L Account No."),
                                                                "Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
                                                                "Global Dimension 2 Code" = FIELD("Global Dimension 2 Code")));
        }
        field(8; Commitments; Decimal)
        {
            // Caption = 'Utilization';
            TableRelation = "FIN-Budget Entries".Amount;

            CalcFormula = Sum("FIN-Budget Entries".Amount WHERE("Transaction Type" = FILTER(Commitment),

                                                                 "Commitment Status" = FILTER(Commitment),
                                                                // Date = FIELD("Budget End Date"),
                                                                "Budget Name" = FIELD("Budget Name"),
                                                                  "G/L Account No." = FIELD("G/L Account No."),
                                                                  "Global Dimension 1 Code" = field("Global Dimension 1 Code"),
                                                                "Global Dimension 2 Code" = field("Global Dimension 2 Code"),
                                                                 "Budget Dimension 3 Code" = field("Global Dimension 3 Code")
                                                                ));
            FieldClass = FlowField;
        }
        field(9; Expenses; Decimal)
        {
            TableRelation = "FIN-Budget Entries".Amount;
            CalcFormula = Sum("FIN-Budget Entries".Amount WHERE("Transaction Type" = FILTER(Expense),
                // Date = FIELD("Budget End Date"),
                "Budget Name" = FIELD("Budget Name"), "G/L Account No." = FIELD("G/L Account No."),
                 "Global Dimension 1 Code" = field("Global Dimension 1 Code"),
                 "Budget Dimension 3 Code" = field("Global Dimension 3 Code"),
                  "Global Dimension 2 Code" = field("Global Dimension 2 Code")));
            //, 

            FieldClass = FlowField;
        }
        field(10; Balance; Decimal)
        {
            TableRelation = "FIN-Budget Entries".Amount;

            CalcFormula = Sum("FIN-Budget Entries".Amount WHERE("Transaction Type" = FILTER(Allocation | Commitment | Expense),
                                                                 //("Transaction Type" = FILTER(Allocation | Commitment | Expense)
                                                                 "Commitment Status" = FILTER(<> "Commited/Posted"),
                                                                 "Commitment Status" = filter(<> Cancelled),
                                                                 "Budget Name" = FIELD("Budget Name"),

                                                                  "G/L Account No." = FIELD("G/L Account No."),
                                                                  "Global Dimension 1 Code" = field("Global Dimension 1 Code"),
                                                                "Global Dimension 2 Code" = field("Global Dimension 2 Code"),
                                                                "Budget Dimension 3 Code" = field("Global Dimension 3 Code")
                                                                ));

            FieldClass = FlowField;

        }
        field(11; "Net Balance"; Decimal)
        {
            TableRelation = "FIN-Budget Entries".Amount;
            CalcFormula = Sum("FIN-Budget Entries".Amount WHERE("Transaction Type" = FILTER(Allocation | Commitment | Expense),
                                                                 "Commitment Status" = FILTER(<> "Commited/Posted"),
                                                                "Budget Name" = FIELD("Budget Name"),

                                                                "G/L Account No." = FIELD("G/L Account No."),
                                                                "Global Dimension 1 Code" = field("Global Dimension 1 Code"),
                                                                "Global Dimension 2 Code" = field("Global Dimension 2 Code"),
                                                                "Budget Dimension 3 Code" = field("Global Dimension 3 Code")
                                                                ));

            FieldClass = FlowField;
        }
        field(19; "Total Expense/Commitment"; Decimal)
        {
            FieldClass = FlowField;
            TableRelation = "FIN-Budget Entries";
            CalcFormula = Sum("FIN-Budget Entries".Amount WHERE("Transaction Type" = FILTER(Expense | Commitment),
                                                                 "Budget Name" = FIELD("Budget Name"),
                                                                 "Commitment Status" = FILTER(<> "Commited/Posted"),
                                                                 // Date = FIELD("Budget End Date"),
                                                                 "G/L Account No." = FIELD("G/L Account No."),
                                                                 "Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
                                                                 "Global Dimension 2 Code" = FIELD("Global Dimension 2 Code")));
        }
        field(12; "% Balance"; Decimal)
        {

        }
        field(13; "% Net Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Vote Name"; Text[100])
        {
            TableRelation = "G/L Account";
            FieldClass = FlowField;
            CalcFormula = lookup("G/L Account".Name where("No." = field("G/L Account No.")));
        }
        field(15; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(18; "Stored Total Balance"; Decimal)

        {
            DataClassification = ToBeClassified;
        }
        field(20; "Commitment/Posted"; Decimal)
        {
            FieldClass = FlowField;
            TableRelation = "FIN-Budget Entries";
            CalcFormula = Sum("FIN-Budget Entries".Amount WHERE("Transaction Type" = FILTER(Commitment),
                                                                 "Budget Name" = FIELD("Budget Name"),
                                                                 "Commitment Status" = FILTER("Commited/Posted"),
                                                                 // Date = FIELD("Budget End Date"),
                                                                 "G/L Account No." = FIELD("G/L Account No."),
                                                                 "Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
                                                                 "Global Dimension 2 Code" = FIELD("Global Dimension 2 Code")));

        }
    }


    keys
    {
        key(Key1; "Budget Name", "G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
            Clustered = true;
        }
    }


    fieldgroups
    {

    }



    trigger OnInsert()
    var
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
    begin

    end;


    var
        Text000: Label 'The dimension value %1 has not been set up for dimension %2.';
        Text001: Label '1,5,,Budget Dimension 1 Code';
        Text002: Label '1,5,,Budget Dimension 2 Code';
        Text003: Label '1,5,,Budget Dimension 3 Code';
        Text004: Label '1,5,,Budget Dimension 4 Code';
        GLBudgetName: Record "G/L Budget Name";
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
        //DimMgt: Codeunit 408;
        GLSetupRetrieved: Boolean;
}

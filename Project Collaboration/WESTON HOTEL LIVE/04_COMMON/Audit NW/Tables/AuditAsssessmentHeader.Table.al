table 52178871 "Audit Asssessment Header"
{

    fields
    {
        field(1; No; Code[50])
        {
            DataClassification = ToBeClassified;
            // Editable = false;
        }
        field(2; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Department; Code[50])
        {
            Caption = 'Project';
            DataClassification = ToBeClassified;
            TableRelation = "Audit-Activity"."Depart Code";
            /* FieldClass = FlowField;
            CalcFormula = lookup("Audit-Activity"."Depart Code"); */

        }
        field(4; "Department Name"; Text[250])
        {
            Caption = 'Project Name';

            CalcFormula = Lookup("Dimension Value"."Name" WHERE(Code = field(Department)));
            FieldClass = FlowField;
        }
        field(5; "Current Location"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,In Review, Re-opened,Completed';
            OptionMembers = Open,"In Review","Re-opened",Completed;
        }
        field(6; Scope; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Process; Text[250])
        {
            CalcFormula = Lookup("Audit-Activity"."Activities" WHERE("Depart Code" = FIELD(Department)));
            FieldClass = FlowField;
        }
        field(8; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Modified on"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Modified By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Assessment Start Date"; Date)
        {
            /* CalcFormula = Lookup("Audit-Activity"."Start Date" WHERE ("Depart Code"=FIELD(Department),
                                                                    Activities=FIELD(Process))); */
            CalcFormula = Lookup("Audit-Activity"."Start Date" WHERE(Activities = FIELD(Process)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Assessment End Date"; Date)
        {
            /* CalcFormula = Lookup("Audit-Activity"."End Date" WHERE ("Depart Code"=FIELD(Department),
                                                                  Activities=FIELD(Process))); */
            CalcFormula = Lookup("Audit-Activity"."End Date" WHERE(Activities = FIELD(Process)));
            FieldClass = FlowField;
        }
        field(13; Asessor; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer"."No." WHERE("Customer Posting Group" = CONST('IMPREST'));
        }
        field(14; "Assessor Name"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD(Asessor)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Re-Assign Assessor"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer"."No." WHERE("Customer Posting Group" = CONST('IMPREST'));
        }
        field(16; "Re-Assign Assessor Name"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Re-Assign Assessor")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Review,"Re-Opened",Completed;
        }
        field(18; "Completion Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Closed On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Objective; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(21; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(23; Archived; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Ext. Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(51; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Archived On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Archived By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //  IF No = '' THEN BEGIN
        //ACAGeneralSetUp .GET;
        //ACAGeneralSetUp.TESTFIELD("Further Info Nos"); //rsk
        //NoSeriesMgt.InitSeries(ACAGeneralSetUp."Further Info Nos",xRec."No Series" ,0D,No,"No Series");
        "Created By" := USERID;
    END;



    trigger OnModify()
    begin
        "Modified By" := USERID;
        "Modified on" := CREATEDATETIME(TODAY, TIME);
    end;

    var
        //ACAGeneralSetUp: Record 61534;
        NoSeriesMgt: Codeunit NoSeriesManagement;
}


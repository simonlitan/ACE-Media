table 52179097 "HRM-Jobs"
{
    DrillDownPageID = "HRM-Jobs List";
    LookupPageID = "HRM-Jobs List";


    fields
    {
        field(1; "Job ID"; Code[50])
        {

        }

        field(2; "Job Title"; Text[250])
        {
            Editable = true;
        }
        field(32;"Job Description"; Text[50])
        {
            Editable = true;
        }

        field(3; "No of Posts"; Integer)
        {
            trigger OnValidate()
            begin
                if "No of Posts" <> "No of Posts" then
                    Supernumerary := "No of Posts" - "Occupied Positions";
                if Supernumerary < 0 then
                    "Vacant Positions" := 0 else
                    "Vacant Positions" := "No of Posts" - "Occupied Positions";


            end;

        }
        field(4; "Position Reporting to"; Code[20])
        {
            TableRelation = "HRM-Jobs"."Job ID" WHERE(Status = CONST(Approved));
        }
        field(5; "Occupied Positions"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("Job Title" = FIELD("Job Title")));
            Editable = false;
            FieldClass = FlowField;
            trigger OnValidate()
            begin

                if "Occupied Positions" > "No of Posts" then begin
                    Supernumerary := "Occupied Positions" - "No of Posts";
                end;
            end;
        }
        field(6; "Vacant Positions"; Integer)
        {
            Editable = false;

        }
        field(7; "Score code"; Code[20])
        {
        }
        field(8; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


        }
        field(9; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));


        }
        field(10; "No series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));


        }
        field(12; "Employment Grade"; Code[20])
        {
            TableRelation = "HRM-Job_Salary grade/steps"."Salary Grade code" WHERE("Employee Category" = FIELD("Employment Category"));

            trigger OnValidate()
            begin
                Grade := "Employment Grade";
            end;
        }


        field(13; "Employment Category"; Code[20])
        {
            TableRelation = "HRM-Employee Categories".Code;
        }
        field(14; "Supernumerary"; Integer)
        {
            Editable = false;
        }

        field(15; "Total Score"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(16; "Main Objective"; Text[250])
        {
        }
        field(17; "Key Position"; Boolean)
        {
        }
        field(18; Category; Code[20])
        {
        }
        field(19; Grade; Code[20])
        {
            TableRelation = "HRM-Salary Grades"."Salary Grade";
        }
        field(20; "Employee Requisitions"; Integer)
        {
            CalcFormula = Count("HRM-Employee Requisitions" WHERE("Job ID" = FIELD("Job ID")));
            FieldClass = FlowField;
        }
        field(21; UserID; Code[50])
        {
        }
        field(22; "Supervisor/Manager"; Code[10])
        {
            TableRelation = "HRM-Employee C"."No." WHERE(Status = CONST(Active));

            trigger OnValidate()
            begin
                HREmp.Get("Supervisor/Manager");
                "Supervisor Name" := HREmp.FullName;
            end;
        }
        field(23; "Supervisor Name"; Text[30])
        {
            Editable = false;
        }
        field(24; Status; Option)
        {
            Editable = false;
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(25; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(26; "Date Created"; Date)
        {
        }
        field(27; "No. of Requirements"; Integer)
        {
            CalcFormula = Count("HRM-Job Requirements" WHERE("Job Id" = FIELD("Job ID")));
            FieldClass = FlowField;
        }
        field(28; "No. of Responsibilities"; Integer)
        {
            CalcFormula = Count("HRM-Job Responsiblities (B)" WHERE("Job ID" = FIELD("Job ID")));
            FieldClass = FlowField;
        }
        field(29; "Reason for Job creation"; Text[200])
        {
        }
        field(30; "Memo Ref No."; Code[100])
        {
        }
        field(31; "Memo Approval Date"; Date)
        {
        }

    }

    keys
    {
        key(Key1; "Job ID")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Job Title")
        {
        }
    }

    trigger OnDelete()
    begin

        CALCFIELDS("Occupied Positions");
        //   IF "Occupied Positions" > 0 THEN
        //  ERROR('Cannot delete job if it has occupants');


    end;

    trigger OnInsert()
    begin
        requisitionno := '';
        if hrmsetup.Get then begin
            if hrmsetup."Job ID" <> '' then begin
                Nosetup.Reset;
                Nosetup.SetRange(Nosetup."Series Code", hrmsetup."Fuel Register");
                if Nosetup.Find('-') then requisitionno := Nosetup."Last No. Used";
            end;
        end;
        if "Job ID" = '' then begin
            hrmsetup.Get;
            hrmsetup.TestField(hrmsetup."Job ID");
            NoSeriesMgt.InitSeries(hrmsetup."Job ID", xRec."No Series", 0D, "Job ID", "No Series");
            //"Requisition No":=requisitionno;
        end;

        if xRec."Job ID" <> '' then "Job ID" := xRec."Job ID";
        UserID := UserID;
        "Date Created" := Today;
    end;


    trigger OnModify()
    begin
        /* CALCFIELDS("Occupied Positions");
         IF "Occupied Positions">0 THEN
         ERROR('Cannot modify job if it has occupants');
        */

    end;


    var
        Nosetup: Record "No. Series Line";
        requisitionno: code[20];
        NoOfPosts: Decimal;
        HREmp: Record "HRM-Employee C";
        Dimn: Record "Dimension Value";
        Hrmsetup: Record "HRM-Setup";
        NoSeriesMgt: codeunit NoSeriesManagement;
}


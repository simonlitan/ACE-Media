table 52179255 "HRM-Training Projection Header"
{
    Caption = 'HRM-Training Projection Header';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Training and Development Card";
    LookupPageId = "Training and Development Card";


    fields
    {
        field(1; "Document No"; code[100])
        {
            editable = false;

        }
        field(2; period; Code[50])
        {
            Caption = 'period';
            TableRelation = "HRM-Leave Periods".Year where(Closed = const(false));
            trigger OnValidate()
            begin
                Leaveperiods.Reset();
                Leaveperiods.SetRange(Year, Period);
                if Leaveperiods.Find('-') then begin
                    "Start Date" := Leaveperiods."Start Date";
                    "End Date" := Leaveperiods."End Date";
                end;
            end;
        }
        field(3; "End Date"; Date)
        {
            editable = false;
            Caption = 'Period End Date';
        }
        field(4; "Created By"; Code[50])
        {
            editable = false;
            Caption = 'Created By';
        }
        field(5; "Employee No"; Code[50])
        {
            Caption = 'Employee No';
            tablerelation = "HRM-Employee C"."No." where(status = const(Active));
            trigger OnValidate()
            begin
                Empc.Reset();
                Empc.SetRange("No.", "Employee No");
                if Empc.Find('-') then begin
                    "Employee Name" := Empc."First Name" + ' ' + empc."Middle Name" + ' ' + Empc."Last Name";
                    "Global Dimension 1 Code" := Empc."Global Dimension 1 Code";
                    "Shortcut Dimension 3 Code" := Empc."Shortcut Dimension 3 Code";
                    "Job Group" := Empc."Salary Grade";
                    "Job Group" := Empc."Grade Level";
                    Designation := Empc."Job Title";
                    "Responsibility Center" := empc."Responsibility Centre";
                    Validate("Responsibility Center");

                end

            end;
        }
        field(6; "Employee Name"; Text[150])
        {
            editable = false;
            Caption = 'Employee Name';
            trigger OnValidate()
            var
                myInt: Integer;
            begin

            end;

        }
        field(7; Designation; Text[250])
        {
            Caption = 'Designation';
        }
        field(8; "Job Group"; Code[50])
        {
            Caption = 'Job Group';
        }
        field(9; "Global Dimension 1 Code"; Code[50])
        {
            Caption = 'Global Dimension 1 Code';
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }

        field(10; Remarks; Text[2048])
        {
            Caption = 'Remarks';

        }
        field(11; "Course Last Two Years"; Text[500])
        {
            Caption = 'Course Attended In Last Two Years';
        }
        field(12; "Last Course Start Date"; Date)
        {

        }
        field(13; "Last Course End Date"; Date)
        {

        }
        field(14; "Shortcut Dimension 3 Code"; Code[50])
        {

            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));
        }
        field(15; Status; option)
        {
            optionmembers = Open,"Pending Approval",Approved;
        }
        field(16; "Start Date"; Date)
        {
            editable = false;
            Caption = 'Period Start Date';
        }
        field(17; "Created On"; date)
        {
            editable = false;
        }
        field(18; "No. Series"; Code[20])
        {
        }
        field(19; "Supervisor No"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";
            trigger OnValidate()
            var
                emp: Record "HRM-Employee C";
            begin
                emp.SetRange(emp."No.", "Supervisor No");
                if emp.Find('-') then begin
                    "Supervisor Name" := emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";

                end;
                //"Highest Academic Qualification":=emp
            end;

        }
        Field(20; "Supervisor Name"; Text[100])
        {



        }
        field(21; "User Name"; Code[20])
        {

        }
        field(22; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }

    }
    keys
    {
        key(PK; "Document No", period, "Employee No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        emp: Record "HRM-Employee C";
        HRSetup: Record "HRM-Setup";
    begin
        if "Document No" = '' then begin
            HRSetup.Reset;
            if HRSetup.Find('-') then begin
                HRSetup.TestField(HRSetup."Training Application Nos.");
                NoSeriesMgt.InitSeries(HRSetup."Training Application Nos.", xRec."No. Series", 0D, "Document No", "No. Series");


            end;
            "User Name" := UserId
        end;
    end;



    var
        Leaveperiods: record "HRM-Leave Periods";
        Empc: Record "HRM-Employee C";
        usersetup: record "User Setup";


}

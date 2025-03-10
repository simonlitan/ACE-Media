table 52179101 "HRM-Employee Requisitions"
{
    DrillDownPageID = "HRM-Employee Requisitions List";
    LookupPageID = "HRM-Employee Requisitions List";

    fields
    {
        field(1; "Job Title"; Text[250])
        {

        }
        field(2; "Job ID"; Code[20])
        {
            //NotBlank = true;
            TableRelation = "HRM-Jobs"."Job ID";

            trigger OnValidate()
            begin
                HRJobs.Reset;
                HRJobs.SetRange("Job ID", rec."Job ID");
                if HRJobs.find('-') then begin
                    "Job Title" := HRJobs."Job Title";
                    "Global Dimension 1 Code" := HRJobs."Global Dimension 1 Code";
                    "Job Ref No" := rec."Job ID";
                    "Job Description" := HRJobs."Job Title";
                    "Vacant Positions" := HRJobs."Vacant Positions";
                    "Job Grade" := HRJobs.Grade;
                    "Shortcut Dimension 3 Code" := HRJobs."Shortcut Dimension 3 Code";

                    "Global Dimension 2 Code" := HRJobs."Global Dimension 2 Code";
                    "Job Supervisor/Manager" := HRJobs."Supervisor/Manager";
                    validate("Vacant Positions");

                end;

            end;
        }

        field(3; "Requisition Date"; Date)
        {

            trigger OnValidate()
            begin
                if (Rec."Requisition Date" - Today) < 0 then
                    Message('Days in the past are not allowed');
            end;
        }
        field(4; Priority; Option)
        {
            OptionCaption = 'High,Medium,Low';
            OptionMembers = High,Medium,Low;
        }
        field(5; Positions; Integer)
        {
        }
        field(6; Approved; Boolean)
        {

            trigger OnValidate()
            begin
                "Date Approved" := Today;
            end;
        }
        field(7; "Date Approved"; Date)
        {
        }
        field(8; "Job Description"; Text[200])
        {
            Editable = false;
        }
        field(9; Stage; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(10; Score; Integer)
        {
            FieldClass = Normal;
        }
        field(11; "Stage Code"; Code[20])
        {
        }
        field(12; Qualified; Boolean)
        {
            FieldClass = Normal;
        }
        field(13; "Job Supervisor/Manager"; Code[10])
        {
            FieldClass = Normal;
        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2), Blocked = CONST(false));
        }
        field(15; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


        }
        field(16; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));


        }
        field(17; "Turn Around Time"; Integer)
        {
            Editable = false;
        }
        field(18; "Grace Period"; Integer)
        {
        }
        field(19; Closed; Boolean)
        {
            Editable = false;
        }
        field(20; "Requisition Type"; Option)
        {
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External,Both;
        }
        field(21; "Closing Date"; Date)
        {
        }
        field(22; Status; Option)
        {
            Editable = true;
            OptionCaption = 'New,Pending Approval,Approved';
            OptionMembers = New,"Pending Approval",Approved;
        }
        field(23; "Required Positions"; Integer)
        {

            trigger OnValidate()
            begin
                if "Required Positions" > "Vacant Positions" then begin
                    Error('Required positions exceed the total  no of Vacant Positions');
                end;

                if "Required Positions" <= 0 then begin
                    Error('Required positions cannot be Less Than or Equal to Zero');
                end;
            end;
        }
        field(24; "Vacant Positions"; Integer)
        {

            Editable = false;
        }
        field(25; "Date of Interview"; Date)
        {
        }
        field(26; "From Time"; Time)
        {
        }
        field(27; "To Time"; Time)
        {
        }
        field(28; Venue; Text[30])
        {
        }
        field(29; "Interview Type"; Option)
        {
            OptionCaption = 'Oral,Oral&Written,Written,Practicals,';
            OptionMembers = Oral,"Oral&Written",Written,Practicals,;
        }
        field(30; "Room No"; Text[30])
        {
        }
        field(31; Floor; Text[30])
        {
        }
        field(32; Shortlisted; Boolean)
        {

        }
        field(33; "Reason for Request(Other)"; Text[250])
        {
        }
        field(34; "Any Additional Information"; Text[250])
        {
        }
        field(35; "Job Grade"; Text[100])
        {
            Editable = false;
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST(Grade));
        }
        field(36; "Type of Contract Required"; Option)
        {

            OptionMembers = ,Temporary,Contract;
        }
        field(37; "Reason For Request"; Option)
        {
            OptionMembers = "New Vacancy",Replacement,Other;
        }
        field(38; Requestor; Code[50])
        {
            Editable = false;
        }
        field(39; "No. Series"; Code[10])
        {
        }
        field(40; "Requisition No."; Code[20])
        {
        }
        field(41; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(42; Gender; Option)
        {
            OptionCaption = 'Male,Female';
            OptionMembers = Male,Female;
        }
        field(43; "Job Ref No"; Code[100])
        {
        }
        field(44; Advertised; Boolean)
        {
        }
        field(45; "Opening Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Requisition No.")
        {
        }
    }



    trigger OnDelete()
    begin

        if Status <> Status::New then
            Error('You cannot delete this record if its status is' + ' ' + Format(Status));
    end;

    trigger OnInsert()
    begin
        //GENERATE DOCUMENT NUMBER
        if "Requisition No." = '' then begin
            HRSetup.Reset;
            if HRSetup.Find('-') then begin end;
            HRSetup.TestField(HRSetup."Employee Requisition Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Employee Requisition Nos.", xRec."No. Series", 0D, "Requisition No.", "No. Series");
        end;
        //POPULATE FIELDS
        Requestor := UserId;
        "Requisition Date" := Today;
    end;

    var
        HRSetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRJobs: Record "HRM-Jobs";
        HREmployeeReq: Record "HRM-Employee Requisitions";
}


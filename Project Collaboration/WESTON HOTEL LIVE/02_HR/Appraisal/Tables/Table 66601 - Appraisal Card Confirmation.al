table 66601 "Appraisal Card Confirmation"
{

    fields
    {
        field(1; "Appraisal Code"; Code[50])
        {
        }
        field(2; "Staff No"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                HrEmp.SETRANGE(HrEmp."No.", "Staff No");
                // IF HrEmp.FIND('-') THEN
                "Staff Name" := HrEmp."First Name" + '  ' + HrEmp."Middle Name" + '  ' + HrEmp."Last Name";
                "Current Department" := HrEmp."Department Name";
                "Job Title" := HrEmp."Job Title";
                "Position Held Since" := HrEmp."Date Of Join";
            end;
        }
        field(3; "Appraisal Type"; Code[20])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST("Appraisal Type"));
        }
        field(4; "Appraisal Period"; Code[10])
        {
            TableRelation = "HRM-Lookup Values"."Code" WHERE(Type = CONST("Appraisal Period"));
        }
        field(8; Status; Option)
        {
            OptionMembers = Appraisee,Moderation,Concurrence,Supervisor,"Closed/HR";
        }
        field(9; Supervisor; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                HrEmp.SETRANGE(HrEmp."No.", Supervisor);
                IF HrEmp.FIND('-') THEN BEGIN
                    "Supervisor Name" := HrEmp."First Name" + '  ' + HrEmp."Middle Name" + '  ' + HrEmp."Last Name";
                    "Supervisor ID" := HrEmp."User ID";
                END;
            end;
        }
        field(12; "Staff Name"; Text[100])
        {
        }
        field(13; "Email Address"; Text[10])
        {
        }
        field(14; "Current Division"; Text[50])
        {
        }
        field(15; "Current Department"; Text[50])
        {
        }
        field(16; Grade; Code[10])
        {
        }
        field(19; "Supervisor Name"; Text[100])
        {
        }
        field(20; "Job Title"; Text[80])
        {
        }
        field(21; "Position Held Since"; Date)
        {
        }
        field(22; "Supervisor Email"; Text[50])
        {
        }
        field(33; "Date of Last promotion"; Date)
        {
        }
        field(34; "Promotion Recommended"; Option)
        {
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(35; Text1; Text[200])
        {
        }
        field(36; Text2; Text[200])
        {
        }
        field(37; Text3; Text[200])
        {
        }
        field(38; Text4; Text[200])
        {
        }
        field(39; Text5; Text[200])
        {
        }
        field(40; Text6; Text[200])
        {
        }
        field(41; Text7; Text[200])
        {
        }
        field(42; Text8; Text[200])
        {
        }
        field(43; Text9; Text[200])
        {
        }
        field(44; Text10; Text[200])
        {
        }
        field(45; Text11; Text[240])
        {
        }
        field(46; "Supervisor ID"; Code[70])
        {
        }
        field(47; Text12; Text[200])
        {
        }
        field(48; Text13; Text[200])
        {
        }
        field(50; "No. Series"; Code[10])
        {
        }
        field(51; "Comments by HR"; Text[200])
        {
        }
        field(52; "Approval by VC/DVC"; Text[200])
        {
        }
        field(53; "Deffered for"; Text[50])
        {
        }
        field(56; "VC/DVC Action"; Option)
        {
            OptionCaption = ' ,Approved,Deffered,Not Approved';
            OptionMembers = " ",Approved,Deffered,"Not Approved";
        }
        field(57; "VC/DVC Comments"; Text[150])
        {
        }
    }

    keys
    {
        key(Key1; "Appraisal Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        IF "Appraisal Code" = '' THEN BEGIN
            HRSetup.GET;
            HRSetup.TESTFIELD(HRSetup."Appraisal Nos");
            NoSeriesMgt.InitSeries(HRSetup."Appraisal Nos", xRec."No. Series", 0D, "Appraisal Code", "No. Series");
        END;
    end;

    var
        HrEmp: Record "HRM-Employee C";
        HRSetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
}


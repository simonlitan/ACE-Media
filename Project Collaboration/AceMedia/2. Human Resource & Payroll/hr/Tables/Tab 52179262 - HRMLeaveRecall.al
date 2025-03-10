table 52179262 "HRM-Leave Recall"
{
    DrillDownPageId = "HRM-Recalled Leave List";
    Caption = 'HRM-Leave Recall';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[50])
        {
            editable = false;
            Caption = 'No';
        }
        field(2; "Leave No"; Code[50])
        {
            Caption = 'Leave No';
            TableRelation = "HRM-Leave Requisition"."No." where(Status = const(Posted),
            "User ID" = field("Created By"));
            trigger OnValidate()
            begin
                LeaveReq.Reset();
                LeaveReq.SetRange("No.", "Leave No");
                if LeaveReq.Find('-') then begin
                    "Employee No" := LeaveReq."Employee No";
                    "Employee Name" := leavereq."Employee Name";
                    "Applied Days" := leavereq."Applied Days";
                    "Type of leave" := LeaveReq."Leave Type";
                    "Global Dimension 1 Code" := LeaveReq."Institution Code";
                    "Global Dimension 2 Code" := LeaveReq."Department Code";


                end;
            end;
        }
        field(3; "Employee No"; Code[50])
        {
            // editable = false;
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                hremp.Reset();
                hremp.SetRange("No.", "Employee No");
                if hremp.Find('-') then begin
                    "Employee Name" := hremp."First Name" + ' ' + hremp."Middle Name" + ' ' + hremp."Last Name";
                    "Global Dimension 1 Code" := hremp."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := hremp."Global Dimension 2 Code";
                    "Shortcut Dimension 3 Code" := hremp."Shortcut Dimension 3 Code";
                    "Leave No" := hremp."Current Leave No";

                end;
            end;
        }
        field(4; "Employee Name"; Text[250])
        {
            editable = false;
            Caption = 'Employee Name';
        }
        field(5; "Days Recalled"; Decimal)
        {
            Editable = false;
            Caption = 'Days Recalled';
        }
        field(6; "Reason for Recall"; Text[500])
        {
            Caption = 'Reason for Recall';
        }
        field(7; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = New,"Pending Approval",Approved,Posted;
        }
        field(8; "Created By"; Code[50])
        {
            editable = false;
            Caption = 'Created By';
        }
        field(9; "Applied Days"; Decimal)
        {
            editable = false;
            Caption = 'Applied Days';
        }
        field(10; "Type of leave"; Code[50])
        {
            editable = false;
            Caption = 'Type of leave';
        }
        field(11; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(12; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


        }
        field(13; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));


        }
        field(14; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));
        }
        field(15; "Utilized Days"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Utilized Days" > "Applied Days" then Error('Days utilized cannot be more than the applied days');
                "Days Recalled" := "Applied Days" - "Utilized Days";
                Validate("Days Recalled");
            end;
        }
        field(16; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(17; "Leave Period"; Code[20])
        {
            TableRelation = "HRM-Leave Periods".Year where(Closed = const(false));
            trigger OnValidate()
            begin
                Leaveperiods.Reset();
                Leaveperiods.SetRange(Year, "Leave Period");
                if Leaveperiods.Find('-') then begin
                    "Start Date" := Leaveperiods."Start Date";
                    "End Date" := Leaveperiods."End Date";
                end
            end;
        }
        field(18; "Start Date"; date)
        {
            Editable = false;
        }
        field(19; "End Date"; date)
        {
            Editable = false;
        }
        field(20; "Posted By"; Code[20])
        {
            Editable = false;
        }
        field(21; "Date Posted"; Date)
        {
            Editable = false;
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }

    }
    var

        Hrsetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Fieldeditable: Boolean;
        Leaveperiods: Record "HRM-Leave Periods";
        LeaveEntry: Record "HRM-Leave Ledger";
        hremp: Record "HRM-Employee C";
        Leavereq: Record "HRM-Leave Requisition";
}

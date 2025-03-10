table 52178892 "ICT Support Desk"
{
    DrillDownPageId = "ICT Support Desk";
    LookupPageId = "ICT Support Desk";
    fields
    {
        field(1; "No."; Code[20])
        {
        }

        field(2; "Issue Area"; Text[50])
        {
            TableRelation = "ICT Support Areas";
            trigger OnValidate()
            var
                SupportAreas: Record "ICT Support Areas";
            begin
                SupportAreas.Reset();
                if SupportAreas.Get("Issue Area") then begin
                    "Area Description" := SupportAreas."Area Description";
                end;
            end;
        }
        field(3; "Issue Description"; text[200])
        {

        }
        field(4; "Issue Status"; Option)
        {
            OptionCaption = 'New,Submitted,Assigned,Escalated,Resolved,Closed';
            OptionMembers = New,Submitted,Assigned,Escalated,Resolved,Closed;
        }
        field(5; "Assignining Adminstrator"; Code[50])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("User Setup"."User ID" where("Global Dimension 2 Code" = filter('ICT'), HOD = filter(true)));
        }
        field(6; "Assigned Technician"; Code[30])
        {
            TableRelation = "ICT Support Desk team" where(Status = filter(Active));
            trigger OnValidate()
            begin
                Rec."Assignining Adminstrator" := UserID;
            end;
        }
        field(7; "Solution Method"; text[200])
        {

        }
        field(8; "Escalation Levels"; Option)
        {
            OptionCaption = '   ,Level 2, Level 3,Service Provider';
            OptionMembers = "  ","Level 2","Level 3","Service Provider";
        }
        field(9; "Level 2 USERID"; Code[30])
        {
            TableRelation = "ICT Support Desk team"."User ID" where(Status = filter(Active));
        }
        field(10; "Level 3 USERID"; Code[30])
        {
            TableRelation = "ICT Support Desk team"."User ID" where(Status = filter(Active));
        }
        field(11; "Consultant Resolving"; Code[30])
        {

        }
        field(12; "Requesting User"; Code[30])
        {
            TableRelation = "User Setup"."User ID";
            Editable = false;
        }

        field(14; "Area Description"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Solution Description"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Raised Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Resolved Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Escallation Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Closing Consultant"; Code[30])
        {
            Editable = false;
        }
        field(20; "Date Closed"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; Status; Option)
        {
            OptionMembers = Pending,"Pending Approval",Approved,Cancelled,Rejected,Closed,Posted;
            Editable = false;
        }
        field(22; "Support type"; Option)
        {
            OptionMembers = " ","Hardware Issues","Software Issues",Both;
        }
    }
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        ICTSetUp: Record "ICT Support Desk Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        // Rec.Reset();
        /* Rec.SetRange("Requesting User", UserId);
        Rec.SetFilter("Issue Status", '=%1', Rec."Issue Status"::New);
        if Rec.Find('-') then
            Error('%1, you already have a New Support Request No. %2. Please utilize it first', UserId, "Ticket No.") else begin
         */
        if "No." = '' then begin
            ICTSetUp.Get();
            ICTSetUp.TestField("Ticket No.");
            // NoSeriesMgt.GetNextNo(ICTSetUp."Ticket No.",0D,true);
            NoSeriesMgt.InitSeries(ICTSetUp."Ticket No.", ICTSetUp."Ticket No.", WorkDate(), "No.", ICTSetUp."Ticket No.");
            "Requesting User" := UserId;
            "Raised Date" := CurrentDateTime;
            // end;
        end;
    end;

    var
        CommonAppMgnt: Codeunit "Common App Management";
}
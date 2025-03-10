table 52179082 "HRM-Disciplinary Cases (B)"
{
    LookupPageID = "HRM-Disciplinary Cases List";
    DrillDownPageId = "HRM-Disciplinary Cases List";

    fields
    {
        field(1; "Case Number"; Code[20])
        {
            Editable = false;
        }
        field(2; "Date of Complaint"; Date)
        {
            Caption = 'Date of Case';
        }
        field(3; "Type Complaint"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST("Disciplinary Case"));
        }
        field(4; "Recommended Action"; Code[20])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST("Disciplinary Action"));
        }
        field(5; "Description of Complaint"; Text[500])
        {
        }
        field(6; Accuser; Code[10])
        {
            Caption = 'Reported By';
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                if "Accused Employee" = Accuser then
                    Error('An employee cannot accuse him/her self');

                Emp.Reset;
                Emp.SetRange(Emp."No.", Accuser);
                if Emp.Find('-') then
                    "Accuser Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
        }
        field(7; "Witness #1"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange(Emp."No.", "Witness #1");
                if Emp.Find('-') then
                    "Witness #1 Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
        }
        field(8; "Witness #2"; Code[20])
        {
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange(Emp."No.", "Witness #2");
                if Emp.Find('-') then
                    "Witness #2  Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
        }
        field(9; "Action Taken"; Code[20])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST("Disciplinary Action"));
        }
        field(10; "Date To Discuss Case"; Date)
        {
        }
        field(11; "Document Link"; Text[200])
        {
        }
        field(12; "Disciplinary Remarks"; Code[50])
        {
        }
        field(13; Comments; Text[250])
        {
        }
        field(14; "Case Discussion"; Boolean)
        {
        }
        field(15; "Body Handling The Complaint"; Code[100])
        {
            TableRelation = "HRM-Committees (B)".Code;
        }
        field(16; Recomendations; Code[10])
        {
        }
        field(17; "HR/Payroll Implications"; Integer)
        {
        }
        field(18; "Support Documents"; Option)
        {
            OptionMembers = Yes,No;
        }
        field(19; "Policy Guidlines In Effect"; Code[10])
        {
            //TableRelation = "HR Policies".Chapter;
        }
        field(20; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,Approved';
            OptionMembers = New,"Pending Approval",Approved;
        }
        field(21; "Mode of Lodging the Complaint"; Text[30])
        {
        }
        field(22; "No. Series"; Code[20])
        {
        }
        field(23; "Accused Employee"; Code[50])
        {

            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange(Emp."No.", "Accused Employee");
                if Emp.FindFirst() then
                    "Accused Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
        }
        field(24; Selected; Boolean)
        {
        }
        field(25; "Closed By"; Code[20])
        {
        }
        field(26; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            var
                dimV: Record "Dimension Value";
            begin
                if dimV.Get("Department Code") then
                    Department := Dimv.Name;
            end;
        }
        field(27; "Department"; Text[200])
        {

        }
        field(28; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center";
        }
        field(29; "Accuser Name"; Text[40])
        {
            Caption = 'Initiator Name';
        }
        field(30; "Witness #1 Name"; Text[50])
        {
        }
        field(31; "Witness #2  Name"; Text[50])
        {
        }
        field(32; "Disciplinary Stage Status"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Reported,Investigation ,Inprogress,Closed,Under review';
            OptionMembers = " ",Reported,"Investigation ",Inprogress,Closed,"Under review";
        }
        field(33; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Payment Voucher,Petty Cash,Imprest,Requisition,ImprestSurrender,Interbank,Receipt,Staff Claim,Staff Advance,AdvanceSurrender,Store Requisition,Employee Requisition,Leave Application,Transport Requisition,Training Requisition,Job Approval,Induction Approval,Disciplinary Approvals,Activity Approval';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Disciplinary Approvals","Activity Approval";
        }
        field(34; "User ID"; Code[50])
        {
        }
        field(35; "Accused Employee Name"; Text[250])
        {

        }
        field(36; "Accussed By"; Text[250])
        {
            Caption = 'Reported By';
            // OptionMembers = Employee,"Non-Employee";
        }
        field(37; "Non Employee Name"; Text[100])
        {

            trigger OnValidate()
            begin
                //  if "Accussed By" = "Accussed By"::Employee then
                Error('You are not allowed to Type Name if accused is an employee');
            end;
        }
        field(38; Appealed; Boolean)
        {
        }
        field(39; "Date of Complaint was Reported"; Date)
        {
            Caption = 'Date Reported';
        }
        field(40; "Severity Of the Complain"; Option)
        {
            OptionMembers = Major,Minor;
        }
        field(41; "Campus"; Code[20])
        {

        }
        field(42; "Case Category"; text[250])
        {




        }
        field(43; "Case Description"; Text[500])
        {

        }
        field(44; "Incident Date"; Date)
        {

        }


        field(45; "Disc. Committee Case Date"; Date)
        {
            Caption = 'Disciplinary Committee Case Date';
        }
        field(46; "Disciplinary Committee Verdict"; Text[100])
        {
            Caption = 'Disciplinary Committee Verdict';
        }
        field(47; "Appeal (Yes/No)"; Boolean)
        {
            Caption = 'Appeal (Yes/No)';
        }
        field(48; "Appeal Date"; Date)
        {
            Caption = 'Appeal Date';
        }
        field(49; "Verdict on Appeal"; Text[200])
        {
            Caption = 'Verdict on Appeal';
        }
        field(50; "Letter Date"; Date)
        {

        }


    }

    keys
    {
        key(Key1; "Case Number")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Case Number" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Disciplinary Cases Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Disciplinary Cases Nos.", xRec."No. Series", 0D, "Case Number", "No. Series");
        end;

        "User ID" := UserId;
        "Date of Complaint" := Today;
    end;

    trigger OnModify()
    begin
        /*IF Status=Status::"" THEN
        ERROR('You cannot modify a case Under Investigation');
         */

    end;

    var
        HRSetup: Record "HRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Emp: Record "HRM-Employee C";
}


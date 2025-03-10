table 52178516 "Casual Requisition"
{
    DrillDownPageId = "Casual Requisition Card";
    LookupPageId = "Casual Requisition Card";

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
        }
        field(2; "Request Date"; Date)
        {
            Editable = false;
        }
        field(23; Casuals; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(35; Staff; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                if Packs > 0 then 
                begin
               "Casual Required" := ("Casual Required" - Staff);
                if "Casual Required" < 0 then Error('You are not allowed to request for Casuals');
                end
                else
                Validate(Staff);
                
                

            end;
           
        }
        field(36; Packs; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 0;
            trigger OnValidate()
            begin
                "Casual Required" := abs(Packs / Casuals)

            end;
        }
        field(39; Packss; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Casual Required"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 0;
            //tableRelation = "Casual Requisition".Packs;
        }
        field(3; Branch; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                Dimval.RESET;
                Dimval.SETRANGE(Dimval."Global Dimension No.", 1);
                Dimval.SETRANGE(Dimval.Code, Branch);
                IF Dimval.FIND('-') THEN
                    "Branch Name" := Dimval.Name
            end;
        }
        field(4; "Cost Center"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                Dimval.RESET;
                Dimval.SETRANGE(Dimval."Global Dimension No.", 2);
                Dimval.SETRANGE(Dimval.Code, "Cost Center");
                IF Dimval.FIND('-') THEN begin
                    "Cost Center Name" := Dimval.Name;
                    Casuals := Dimval.Casuals
                end;

            end;
        }
        field(5; "User ID"; Code[50])
        {
            Editable = false;
        }
        field(6; Narration; Text[100])
        {
        }
        field(7; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Posted';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Posted;
        }
        field(8; "Total Amount"; Decimal)
        {
            CalcFormula = Sum("Casual Requisition Lines".Total WHERE("No" = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "No series"; Code[20])
        {
        }
        field(10; "Branch Name"; Code[100])
        {
            Editable = false;
        }
        field(11; "Cost Center Name"; Code[100])
        {
            Editable = false;
        }
        field(12; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center";
        }
        field(13; "Date From"; Date)
        {
            Editable = true;
        }
        field(14; "Date To"; Date)
        {
            Editable = true;
        }
        field(15; Responsibilities; Text[100])
        {
            Editable = true;
        }
        field(16; Position; Text[50])
        {
            Editable = true;
        }
        field(17; "Musterroll Approval"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
            Editable = true;
        }
        field(21; Names; text[20])
        {

        }
        field(18; "First Name"; Text[30])
        {
        }
        field(19; "Middle Name"; Text[30])
        {
        }
        field(20; "Last Name"; Text[30])
        {

            trigger OnValidate()
            var
                Reason: Text[30];
            begin
                Names := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";

            end;
        }
        field(22; Gender; Option)
        {
            OptionMembers = " ",Male,Female;
        }
        field(24; DateOfBirth; Text[8])
        {
        }
        field(25; DateEngaged; Text[8])
        {
        }
        field(26; "Postal Address2"; Text[50])
        {
        }
        field(27; City; Text[30])
        {
        }
        field(28; "ID Number"; Code[20])
        {

        }
        field(29; "E-Mail"; Text[100])
        {
        }
        field(30; "Post code"; Text[50])
        {
        }
        field(31; "Postal Address"; Text[50])
        {
        }
        field(32; "Search Name"; Code[50])
        {
        }
        field(33; Initials; Text[30])
        {
            TableRelation = "HRM-Staff Title".Code;

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Initials)) or ("Search Name" = '') then
                    "Search Name" := Initials;
            end;
        }
        field(34; "Ext."; Text[20])
        {
        }
        field(37; "DateTime Posted"; DateTime)
        {

        }
        field(40; "Posted By"; Code[30])
        {

        }
        field(41; "Confirmed Amount"; Decimal)
        {
            CalcFormula = Sum("Casual Requisition Lines".Total WHERE("No" = FIELD("No."), Confirmed = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(43; "Posting Date"; date)
        {

        }
  
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            CashOff.GET;
            CashOff.TESTFIELD(CashOff."Casual Req. No's");
            NoSeriesMgt.InitSeries(CashOff."Casual Req. No's", xRec."No series", 0D, "No.", "No series");
        END;
        "User ID" := USERID;
        "Request Date" := TODAY;
    end;

    var
        CashOff: Record "Cash Office Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Dimval: Record "Dimension Value";


    var

        //OpLines: Record "Journals Voucher Lines";
        GenJnLine: Record "Gen. Journal Line";
        Batch: Record "Gen. Journal Batch";
        LineNo: Integer;
        Batchname: Code[30];
        Jtemp: Code[30];
        sno: Integer;
        CKP: Codeunit "Posting Check FP";
        setup: Record "Cash Office Setup";
        CasualReq : Record "Casual Requisition";


    procedure PostCasual(var Header: Record "Casual Requisition")
    begin
        if Header.Status = Header.Status::Approved then begin
            Header.CalcFields("Confirmed Amount");
            Jtemp := 'General';
            Batchname := 'Casuals';
            setup.Get();
            Header.TestField("Posting Date");
            setup.TestField("Casual Expense AC");
            setup.TestField("Casual Liability AC");

            if Header."Confirmed Amount" > 0 then begin
                GenJnLine.RESET;
                GenJnLine.SETRANGE(GenJnLine."Journal Template Name", Jtemp);
                GenJnLine.SETRANGE(GenJnLine."Journal Batch Name", Batchname);
                GenJnLine.DELETEALL;

                Batch.INIT;
                Batch."Journal Template Name" := Jtemp;
                Batch.Name := Batchname;
                IF NOT Batch.GET(Batch."Journal Template Name", Batch.Name) THEN
                    Batch.INSERT;

                GenJnLine.INIT;
                GenJnLine."Journal Template Name" := Jtemp;
                GenJnLine."Journal Batch Name" := Batchname;
                GenJnLine."Line No." := 10000;
                GenJnLine."Account Type" := GenJnLine."Account Type"::"G/L Account";
                GenJnLine."Account No." := setup."Casual Expense AC";
                GenJnLine."Posting Date" := Header."Posting Date";
                //Check Posting Date
                CKP.ValidatePostingDate(GenJnLine."Posting Date");

                GenJnLine."Document No." := Header."No.";
                GenJnLine.Description := CopyStr(Header.Narration, 1, 100);
                GenJnLine.Amount := Header."Confirmed Amount";
                GenJnLine.VALIDATE(GenJnLine.Amount);
                GenJnLine."External Document No." := Header."No.";
                GenJnLine."Amount (LCY)" := Header."Confirmed Amount";
                GenJnLine."Shortcut Dimension 1 Code" := Header.Branch;
                GenJnLine."Shortcut Dimension 2 Code" := Header."Cost Center";
                GenJnLine.Validate("Shortcut Dimension 1 Code");
                GenJnLine.Validate("Shortcut Dimension 2 Code");
                GenJnLine."Bal. Account Type" := GenJnLine."Account Type"::"G/L Account";
                GenJnLine."Bal. Account No." := setup."Casual Liability AC";
                IF GenJnLine.Amount <> 0 THEN
                    GenJnLine.INSERT;


                CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJnLine);
                Batch.setrange("Journal Template Name", Jtemp);
                Batch.setrange(Name, Batchname);
                Batch.Delete();

                Header.Status := Header.Status::Posted;
                Header."DateTime Posted" := System.CurrentDateTime;
                Header."Posted By" := UserId;
                Header.Modify();
                Message('Posted successifully');

            end else
                Error('Confirmed Amount should be more than zero');

        end else
            Error('Can post only if approved');
    end;









}


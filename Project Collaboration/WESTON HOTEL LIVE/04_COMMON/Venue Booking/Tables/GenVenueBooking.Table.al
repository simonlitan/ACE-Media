table 52178970 "Gen-Venue Booking"
{
    DrillDownPageID = "HRM-Emp. Beneficiaries List";
    LookupPageID = "HRM-Emp. Beneficiaries List";

    fields
    {
        field(1; "Booking Id"; Code[10])
        {
        }
        field(2; Department; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('REGIONS'));
            trigger OnValidate()
            var
                Dimval: Record "Dimension Value";
            begin
                if Dimval.Get(Department) then begin
                    "Department Name" := Dimval.Name;
                end;
            end;
        }
        field(3; "Request Date"; Date)
        {
        }
        field(4; "Booking Date"; Date)
        {
        }
        field(5; "Meeting Description"; Text[50])
        {
        }
        field(6; "Required Time"; Time)
        {
        }
        field(7; Venue; Code[20])
        {
            TableRelation = "Venue Setup"."Venue Code";
        }
        field(8; "Contact Person"; Text[50])
        {
        }
        field(9; "Contact Number"; Text[30])
        {
        }
        field(10; "Contact Mail"; Text[30])
        {
        }
        field(11; Pax; Integer)
        {
        }
        field(12; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved,Cancelled,Rejected;
        }
        field(13; "Caterring Approval Date"; Date)
        {
        }
        field(14; "HOD Approve Date"; Date)
        {
        }
        field(15; "Finance Approve Date"; Date)
        {
        }
        field(16; "Registrar Approve Date"; Date)
        {
        }
        field(17; "Department Name"; Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE(Code = FIELD(Department)));
            FieldClass = FlowField;
        }
        field(18; "Total Cost"; Decimal)
        {
            //  CalcFormula = Sum("CAT-Meal Booking Lines".Cost WHERE("Booking Id" = FIELD("Booking Id")));
            //FieldClass = FlowField;
        }
        field(19; "Requested By"; Code[20])
        {
        }
        field(20; "No. Series"; Code[10])
        {
        }
        field(21; "Booking Time"; Time)
        {
        }
        field(22; "Venue Dscription"; Code[250])
        {
            CalcFormula = Lookup("Fixed Asset".Description WHERE("No." = FIELD(Venue)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Booking Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Booking Id" = '' THEN BEGIN
            NoSeries.GET;
            //NoSeries.TESTFIELD(NoSeries."Cheque Bank");
            //NoSeriesMgt.InitSeries(NoSeries."Cheque Bank", xRec."No. Series", 0D, "Booking Id", "No. Series");
        END;

        "Requested By" := USERID;
        //"Booking Time":=TIME;
        // "Booking Date":=TODAY;
        HRMEmployeeC.RESET;
        HRMEmployeeC.SETRANGE("User ID", USERID);
        IF HRMEmployeeC.FIND('-') THEN BEGIN
            Department := HRMEmployeeC."Department Code";
            "Contact Mail" := HRMEmployeeC."E-Mail";
            "Contact Number" := HRMEmployeeC."Cellular Phone Number" + '/' + HRMEmployeeC."Ext.";
            "Contact Person" := HRMEmployeeC."First Name" + ' ' + HRMEmployeeC."Middle Name" + ' ' + HRMEmployeeC."Last Name";
        END;
    end;

    var
        NoSeries: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRMEmployeeC: Record "HRM-Employee C";
}


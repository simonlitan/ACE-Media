table 52178895 "TR Workticket Lines"
{
    Caption = 'TR Workticket Lines';
    DataClassification = ToBeClassified;
    LookupPageId = "TR Workticket Lines";
    DrillDownPageId = "TR Workticket Lines";

    fields
    {
        field(1; "Ticket No"; Code[50])
        {
            Editable = false;
            Caption = 'Ticket No';
            DataClassification = ToBeClassified;
        }
        field(2; "Registration No"; Code[20])
        {
            Editable = false;
            Caption = 'Registration No';
            DataClassification = ToBeClassified;
        }
        field(3; "Entry No"; Integer)
        {
            Editable = false;
            AutoIncrement = true;
            Caption = 'Entry No';
            DataClassification = ToBeClassified;
        }
        field(4; "Tr Request No"; Code[50])
        {
            TableRelation = "TR Transport Request"."Request No" where(Status = const(Approved), "Vehicle Allocated" = field("Registration No"));
        }
        field(5; "Driver No"; code[20])
        {
            TableRelation = "TR Drivers"."Driver No" where(Active = const(true));
        }
        field(6; "Driver Name"; Text[150])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("TR Drivers"."Drivers Name" where("Driver No" = field("Driver No")));
        }
        field(7; Route; text[250])
        {

        }
        field(8; "Time In"; Time)
        {

        }
        field(9; "Time Out"; Time)
        {

        }
        field(10; "Authorizing Officer No"; Code[50])
        {
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));
            trigger OnValidate()
            begin
                Employeec.Reset();
                Employeec.SetRange("No.", "Authorizing Officer No");
                if Employeec.Find('-') then begin
                    "Authorizing Officer Name" := Employeec."First Name" + ' ' + Employeec."Middle Name" + ' ' + Employeec."Last Name";
                end;
            end;
        }
        field(11; "Authorizing Officer Name"; Text[150])
        {
            Editable = false;
        }
        field(12; "Date"; Date)
        {
            trigger OnValidate()
            begin
                Wticketheader.Reset();
                Wticketheader.SetRange("Ticket No", rec."Ticket No");
                Wticketheader.SetRange("Registration No", rec."Registration No");
                if Wticketheader.Find('-') then begin
                    if (rec.Date > Wticketheader."Ending Date") or (rec.date < Wticketheader."Starting Date") then
                        Error('The date does not fall within the range of %1 .. %2', Wticketheader."Starting Date", Wticketheader."Ending Date");
                end;
            end;
        }
        field(13; "Oil Drawn"; Decimal)
        {

        }
        field(14; "Fuel Drawn"; Decimal)
        {

        }
        field(15; "Odometer Reading"; Decimal)
        {

        }
        field(16; "Distance Covered"; Decimal)
        {

        }

    }
    keys
    {
        key(PK; "Ticket No", "Registration No", "Entry No", "Tr Request No")
        {
            Clustered = true;
        }
    }
    trigger OnModify()
    begin
        Wticketheader.Reset();
        Wticketheader.SetRange(Wticketheader."Ticket No", rec."Ticket No");
        if Wticketheader.Find('-') then begin
            if Wticketheader.Closed = true then Error('The workticket is already closed');
        end;
    end;

    var
        Wticketheader: Record "TR Workticket Header";
        Wticketlines: Record "TR Workticket Lines";
        Employeec: record "HRM-Employee C";
}

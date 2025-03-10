table 52178879 "TR Workticket Header"
{
    Caption = 'TR Workticket Header';
    DataClassification = ToBeClassified;
    LookupPageId = "TR Workticket List";
    DrillDownPageId = "TR Workticket List";

    fields
    {
        field(1; "Ticket No"; Code[50])
        {
            Caption = 'Ticket No';
            DataClassification = ToBeClassified;
        }
        field(2; "Registration No"; Code[20])
        {
            Caption = 'Registration No';
            DataClassification = ToBeClassified;
            TableRelation = "TR Vehicles"."Registration No";
            trigger OnValidate()
            begin
                Vehicle.Reset();
                Vehicle.SetRange("Registration No", "Registration No");
                if Vehicle.Find('-') then begin
                    Make := Vehicle.Make;
                end;
            end;
        }
        field(3; Closed; Boolean)
        {

        }
        field(4; "Starting Date"; Date)
        {
            trigger OnValidate()
            begin
                "Ending Date" := CalcDate('1M', "Starting Date");
            end;

        }
        field(5; "Ending Date"; date)
        {
            Editable = false;
        }
        field(6; Station; Code[50])
        {

        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(9; "Previous Ticket No"; Code[50])
        {

        }
        field(10; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                         Blocked = CONST(false));

        }
        field(11; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                         Blocked = CONST(false));

        }
        field(12; "Odometer at Start"; Decimal)
        {

        }
        field(13; Make; code[50])
        {

        }
        field(14; "Fuel Consumed"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("TR Workticket Lines"."Fuel Drawn" where("Registration No" = field("Registration No"), "Ticket No" = field("Ticket No")));
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Ticket No", "Registration No")
        {
            Clustered = true;
        }
    }
    trigger OnModify()
    begin
        // if Closed = true then Error('The workticket is already closed');
    end;

    trigger OnDelete()
    begin
        if Closed = true then Error('The workticket is already closed');
    end;

    procedure MarkAsClosed()
    begin
        Wtctheader.Reset();
        Wtctheader.SetRange("Registration No", rec."Registration No");
        Wtctheader.SetRange("Ticket No", Rec."Ticket No");
        Wtctheader.SetRange(Closed, false);
        if Wtctheader.Find('-') then begin
            Wtctheader.Closed := true;
            Wtctheader.Modify();
            Message('Closed Successfully');
        end;
    end;

    var
        Vehicle: Record "TR Vehicles";
        Wtctheader: Record "TR Workticket Header";
}

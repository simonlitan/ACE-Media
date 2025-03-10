table 52178887 "Booking Schedule"
{
    fields
    {
        field(1; "Block Code"; Code[30])
        {
            TableRelation = Blocks where("Dimension 1 Code" = field("Dimension 1 Code"), Blocked = filter(false));
        }
        field(2; "Unit Code"; Code[30])
        {
            TableRelation = "Block Units"."Unit Code" where("Dimension 1 Code" = field("Dimension 1 Code"), "Block Code" = field("Block Code"), Blocked = filter(false));
        }
        field(3; "Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        field(4; "Start date"; Date)
        {
            trigger OnValidate()
            begin
                validateBooking();
                GetLastdate();
            end;
        }
        field(5; "No of days"; Integer)
        {
            trigger OnValidate()
            begin
                GetLastdate();
            end;

        }
        field(6; "End date"; Date)
        {
            Editable = false;

        }
        field(7; "Opportunity"; Code[30])
        {
            TableRelation = Opportunity."No.";
        }
        field(8; "Booking Status"; Option)
        {
            OptionMembers = Processing,Confirmed;
        }
        field(9; "View Opportunity"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Opportunity."No." where("No." = field("Opportunity")));
        }
        field(10; "Booking Confirmed"; Boolean)
        {

        }
        field(11; "Confirmed By"; Code[30])
        {

        }
        field(12; "Date Confirmed"; DateTime)
        {

        }
    }

    keys
    {
        key(pk; "Opportunity", "Block Code", "Unit Code", "Dimension 1 Code")
        {

        }
    }

    trigger OnDelete()
    begin
        if Rec."Booking Status" = Rec."Booking Status"::Confirmed then
            Error('Cannot delete a confirmed schedule');
    end;

    trigger OnModify()
    begin
        if Rec."Booking Status" = Rec."Booking Status"::Confirmed then
            Error('Cannot modify a confirmed schedule');
    end;

    procedure GetLastdate()
    begin
        if (("Start date" <> 0D) and ("No of days" <> 0)) then
            "End date" := "Start date" + "No of days" - 1;
    end;

    procedure CheckConfirmation()
    begin
    end;


    procedure validateBooking()
    var
        booking: Record "Booking Schedule";
        sdate: date;
        edate: date;
    begin
        if rec."Start date" < Today then Error('Should not be before today');
        booking.Reset();
        booking.SetRange("Block Code", rec."Block Code");
        booking.SetRange("Dimension 1 Code", rec."Dimension 1 Code");
        booking.SetRange("Unit Code", rec."Unit Code");
        booking.SetRange("Booking Status", booking."Booking Status"::Confirmed);
        if booking.Find('-') then begin

            sdate := booking."Start date";
            edate := booking."End date";
            if Rec."Start date" = sdate then
                Error('Already Booked');
            if ((rec."Start date" > sdate) and (Rec."Start date" <= edate))
            then
                Error('Already booked');

        end;


    end;
}
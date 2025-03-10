table 52178644 "NW-Board Payroll Periods"
{
    DrillDownPageID = "NW-Board Payroll PeriodsView";
    LookupPageID = "NW-Board Payroll PeriodsView";

    fields
    {
        field(1; "Period Month"; Integer)
        {
            NotBlank = true;
        }
        field(2; "Period Year"; Integer)
        {
            NotBlank = true;
        }
        field(3; "Period Name"; Text[30])
        {
            Description = 'e.g November 2009';
            NotBlank = true;
        }
        field(4; "Date Opened"; Date)
        {
            NotBlank = true;
        }
        field(5; "Date Closed"; Date)
        {
        }
        field(6; Closed; Boolean)
        {
            Description = 'A period is either closed or open';

            trigger OnValidate()
            begin
                //IF NOT "Approved For Closure" THEN ERROR('The Payroll Has not been Approved for closure.');
            end;
        }
        field(7; "Payroll Code"; Option)
        {
            OptionMembers = Board;
        }

        field(8; "Payslip Message"; Text[250])
        {
        }
        field(9; "Allow View of Online Payslips"; Boolean)
        {

            trigger OnValidate()
            begin
                //IF NOT "Approved For Closure" THEN ERROR('The Payroll Has not been Approved for closure.');
            end;
        }
        field(10; "Approved For Closure"; Boolean)
        {
        }
        field(11; "Approved By"; Code[20])
        {
        }
        field(12; "Approved Date"; Date)
        {
        }
        field(13; "Approved Time"; Time)
        {
        }
        field(14; "Approval Comments"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Date Opened", "Payroll Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        if "Closed" = true then
            Error('You cannot modify a closed period');
    end;

    trigger OnDelete()
    begin
        if "Closed" = true then
            Error('You cannot modify a closed period');
    end;

    procedure ApprovePayroll() Approves: Boolean
    var
        usersetup: Record "User Setup";
    begin
        Approves := false;
        if usersetup.Get(UserId) then begin
            //if usersetup."Approve Payroll Closure" then Approves := true;
        end;
    end;
}
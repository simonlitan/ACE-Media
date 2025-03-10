table 52178949 "FLT-Driver"
{
    DrillDownPageID = "FLT-Driver List";
    LookupPageID = "FLT-Driver List";

    fields
    {
        field(1; Driver; Code[10])
        {
            TableRelation = "HRM-Employee C"."No." where(Driver = filter('True'),
            Status = filter('Active'));

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.Get(Driver);
                "Driver Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                "Driver License Number" := emp."Driver License Number";
                grade := emp.Grade;
            end;
        }
        field(2; "Driver Name"; Text[100])
        {
        }
        field(3; "Driver License Number"; Code[20])
        {
        }
        field(4; "Last License Renewal"; Date)
        {
        }
        field(5; "Renewal Interval"; Option)
        {
            OptionMembers = " ",Days,Weeks,Months,Quarterly,Years;
        }
        field(6; "Renewal Interval Value"; Integer)
        {

            trigger OnValidate()
            begin
                StrValue := 'D';

                if "Renewal Interval" = "Renewal Interval"::Days then begin
                    StrValue := 'D';
                end
                else
                    if "Renewal Interval" = "Renewal Interval"::Weeks then begin
                        StrValue := 'W';
                    end
                    else
                        if "Renewal Interval" = "Renewal Interval"::Months then begin
                            StrValue := 'M';
                        end
                        else
                            if "Renewal Interval" = "Renewal Interval"::Quarterly then begin
                                StrValue := 'Q';
                            end
                            else
                                if "Renewal Interval" = "Renewal Interval"::Years then begin
                                    StrValue := 'Y';
                                end;

                "Next License Renewal" := CalcDate(Format("Renewal Interval Value") + StrValue, "Last License Renewal");
            end;
        }
        field(7; "Next License Renewal"; Date)
        {
        }
        field(8; "Year Of Experience"; Decimal)
        {
        }
        field(9; Grade; Code[20])
        {
        }
        field(10; Active; Boolean)
        {
        }
        field(11; "License Class"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; Driver)
        {
        }
    }

    fieldgroups
    {
    }

    var
        Emp: Record "HRM-Employee C";
        StrValue: Text[1];
}


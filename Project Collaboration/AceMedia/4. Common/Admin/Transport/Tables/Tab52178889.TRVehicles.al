table 52178880 "TR Vehicles"
{
    Caption = 'TR Vehicles';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "FA No"; Code[20])
        {

            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where(Blocked = const(false), "Is Vehicle" = const(true));
            trigger OnValidate()
            begin
                FA.Reset();
                FA.SetRange("No.", "FA No");
                if FA.Find('-') then begin
                    "Registration No" := FA."Vehicle Registration No.";
                    Description := FA.Description;
                    "Driver No" := FA."Responsible Employee";
                    Model := FA.Model;
                end;

            end;

        }
        field(2; "Registration No"; Code[20])
        {

        }
        field(3; Make; code[50])
        {

        }
        field(4; Model; code[50])
        {

        }
        field(5; "Engine No"; code[50])
        {

        }
        field(6; "Chasis No"; Code[50])
        {

        }
        field(7; "Fuel Consumption"; Decimal)
        {

            CalcFormula = sum("TR Workticket Lines"."Fuel Drawn" where("Registration No" = field("Registration No")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(8; "Insurance Start Date"; date)
        {

        }
        field(9; "Insurance Ending Date"; date)
        {
            Editable = false;

        }
        field(10; "Driver No"; code[50])
        {

            TableRelation = "TR Drivers"."Driver No" where(Active = const(true));
            ValidateTableRelation = true;
            /* trigger OnValidate()
            begin
                Drivers.Reset();
                Drivers.SetRange("Driver No", "Driver No");
                if Drivers.Find('-') then begin
                    "Driver Name" := Drivers."Drivers Name";
                end;
            end; */
        }
        field(11; "Driver Name"; text[150])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("TR Drivers"."Drivers Name" where("Driver No" = FIELD("Driver No")));

        }
        field(12; "Insurance Provider"; Text[150])
        {

        }
        field(13; Available; Boolean)
        {

        }
        field(14; "No of passengers"; Decimal)
        {

        }
        field(15; Description; Text[150])
        {

        }
        field(16; "Renewal Interval Value"; Integer)
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
                                if "Renewal Interval" = "Renewal Interval"::"Year(s)" then begin
                                    StrValue := 'Y';
                                end;

                "Insurance Ending Date" := CalcDate(Format("Renewal Interval Value") + StrValue, "Insurance Start Date");
            end;
        }
        field(17; "Renewal Interval"; Option)
        {
            OptionMembers = " ",Days,Weeks,Months,Quarterly,"Year(s)";
        }
        field(18; "Civilian No"; Code[50])
        {

        }


    }
    keys
    {
        key(PK; "FA No", "Registration No")
        {

            Clustered = true;
        }
    }
    var
        FA: Record "Fixed Asset";
        StrValue: Text[2];
        Drivers: Record "TR Drivers";
}

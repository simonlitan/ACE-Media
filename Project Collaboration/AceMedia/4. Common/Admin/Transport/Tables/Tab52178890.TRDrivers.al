table 52178881 "TR Drivers"
{
    Caption = 'TR Drivers';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Driver No"; Code[50])
        {
            Caption = 'Driver No';
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));
            trigger OnValidate()
            begin
                Emp.Reset();
                emp.SetRange("No.", "Driver No");
                if Emp.Find('-') then begin
                    "Drivers Name" := Emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";
                    "Global Dimension 1 Code" := emp."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := emp."Global Dimension 2 Code";
                    "Shortcut Dimension 3 Code" := emp."Shortcut Dimension 3 Code";
                end;
            end;
        }
        field(2; "Drivers Name"; Text[150])
        {
            Editable = false;
        }
        field(3; Active; Boolean)
        {

        }
        field(4; "License No"; code[20])
        {

        }
        field(6; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


        }

        /*  field(5; "Renewal Interval"; Option)
         {
             OptionMembers = " ",Days,Weeks,Months,Quarterly,"Year(s)";
         } */
        field(7; "Renewal Interval Value"; Integer)
        {

            trigger OnValidate()
            begin
                /*  StrValue := 'D';

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
                                 end; */

                "Next License Renewal" := CalcDate(Format("Renewal Interval Value") + 'Y', "Last License Renewal");
            end;
        }
        field(8; "Next License Renewal"; Date)
        {
            Editable = false;
        }
        field(9; "Years Of Experience"; Decimal)
        {
        }
        field(10; "License Class"; Code[20])
        {
        }
        field(11; "Last License Renewal"; Date)
        {
        }
        field(12; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(13; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                         Blocked = CONST(false));

        }
    }
    keys
    {
        key(PK; "Driver No")
        {
            Clustered = true;
        }
    }
    var
        Emp: Record "HRM-Employee C";
        StrValue: Text[1];
}

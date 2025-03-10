table 52178877 "TR Transport Request"
{
    Caption = 'TR Transport Request';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Request No"; Code[50])
        {
            Editable = false;
            Caption = 'Request No';
            DataClassification = ToBeClassified;
        }
        field(2; "Requested Date"; date)
        {
            Editable = false;

        }
        field(3; "Request Description"; Text[500])
        {

        }
        field(4; "Date of Travel"; date)
        {

        }
        field(5; "No of days requested"; Integer)
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

                "Expected Return Date" := CalcDate(Format("No of days requested") + 'D', "Date of Travel");
            end;
        }
        field(6; "Expected Return Date"; date)
        {
            Editable = false;
        }
        field(7; "No of Passengers"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("TR Passengers" where("Requisition No" = FIELD("Request No")));

        }
        field(8; "Commencing Place"; Text[50])
        {

        }
        field(9; "Destination"; text[50])
        {

        }
        field(10; "Requested By"; code[50])
        {
            Editable = false;
        }
        field(11; "No Series"; code[10])
        {

        }
        field(12; Status; Option)
        {

            OptionMembers = New,"Pending Approval",Approved;
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(15; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                         Blocked = CONST(false));

        }
        field(16; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                         Blocked = CONST(false));

        }
        field(17; "Vehicle Allocated"; code[20])
        {
            TableRelation = "TR Vehicles"."Registration No" where(Available = const(True));
        }
        field(18; "Allocating Officer"; Code[150])
        {
            Editable = false;
        }
        field(19; "Allocated Driver"; code[50])
        {
            TableRelation = "TR Drivers"."Driver No" where(Active = const(true));
        }
        field(20; "Driver Name"; Text[150])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("TR Drivers"."Drivers Name" where("Driver No" = FIELD("Allocated Driver")));
        }

    }
    keys
    {
        key(PK; "Request No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "Request No" = '' then begin
            Hrsetup.Get();
            Hrsetup.TestField(Hrsetup."Transport Requisition No");
            NoSeriesMgt.InitSeries(Hrsetup."Transport Requisition No", xRec."No Series", 0D, "Request No", "No Series");
        end;
        "Requested By" := UserId;
        "Requested Date" := Today;

    end;

    var
        Hrsetup: Record "HRM-Setup";
        NoseriesMgt: Codeunit NoSeriesManagement;

}

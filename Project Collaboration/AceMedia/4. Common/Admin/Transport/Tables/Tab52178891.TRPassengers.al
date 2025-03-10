table 52178882 "TR Passengers"
{
    Caption = 'TR Passengers';


    fields
    {
        field(1; "Requisition No"; Code[50])
        {
            Editable = false;
            Caption = 'Requisition No';
            DataClassification = ToBeClassified;
        }
        field(2; "Passenger No"; Code[50])
        {
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));
            Caption = 'Passenger No';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Employeec.Reset();
                Employeec.SetRange("No.", "Passenger No");
                if Employeec.Find('-') then begin
                    "Passenger Name" := Employeec."First Name" + ' ' + Employeec."Middle Name" + ' ' + Employeec."Last Name";
                    "Phone No" := Employeec."Home Phone Number";
                end;
            end;
        }
        field(3; "Passenger Name"; Text[150])
        {
            Editable = false;
        }
        field(4; "Phone No"; text[30])
        {

        }

    }
    keys
    {
        key(PK; "Requisition No", "Passenger No")
        {
            Clustered = true;
        }
    }
    var
        Employeec: Record "HRM-Employee C";
}

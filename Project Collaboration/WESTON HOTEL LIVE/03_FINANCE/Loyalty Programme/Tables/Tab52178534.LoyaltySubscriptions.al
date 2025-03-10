table 52178534 "Loyalty Subscriptions"
{
    DrillDownPageId = "Loyalty Subscription";
    LookupPageId = "Loyalty Subscription";
    fields
    {
        field(1; "No."; Code[30])
        {
        }
        field(2; "Name"; Text[100])
        {
        }
        field(3; "Telephone No."; Text[100])
        {

            trigger OnValidate()
            begin
                CheckTelephone(Rec);
            end;
        }
        field(4; "Email"; Text[30])
        {
        }
        field(5; "ID/Passport No."; Code[30])
        {
            trigger OnValidate()
            begin
                CheckID(Rec);
            end;
        }
        field(6; "Document Date"; date)
        {
        }
        field(7; "Details confirmed"; Boolean)
        {

        }
        field(8; "Earned Points"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Loyalty Points Ledger"."Total Points" where("Account No." = field("No.")));

        }
        field(9; "Subscription Balance"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Loyalty Subscription Ledger".Amount where("Account No." = field("No.")));

        }
    }

    keys
    {
        key(pk; "No.")
        {

        }
    }

    trigger OnInsert()
    var
        setup: Record "Loyalty Setups";
        noseries: Codeunit NoSeriesManagement;
    begin

        if "No." = '' then begin
            setup.Get();
            "No." := noseries.GetNextNo(setup."Loyalty Customers", 0D, true);
            "Document Date" := Today;
        end;

    end;

    procedure CheckID(var lsub: Record "Loyalty Subscriptions")
    var
        sub: Record "Loyalty Subscriptions";
    begin
        sub.Reset();
        sub.SetRange("ID/Passport No.", lsub."ID/Passport No.");
        if sub.Find('-') then begin
            Error('%1%2', sub."ID/Passport No.", ' Already exist');
        end;
    end;

    procedure CheckTelephone(var lsub: Record "Loyalty Subscriptions")
    var
        sub: Record "Loyalty Subscriptions";
    begin
        sub.Reset();
        sub.SetRange("Telephone No.", lsub."Telephone No.");
        if sub.Find('-') then begin
            Error('%1%2', sub."Telephone No.", ' Already exist');
        end;
    end;

    procedure confirmDetails()
    begin
        if Confirm('Confirm Details ?', true) = false then Error('Cancelled');
        Rec."Details confirmed" := true;
        Rec.Modify();
        Message('Complete');
    end;
}
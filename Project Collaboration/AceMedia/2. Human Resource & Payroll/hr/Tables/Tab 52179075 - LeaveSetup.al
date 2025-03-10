table 52179075 "Leave Setup"
{
    Caption = 'Leave Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
            AutoIncrement = true;
        }
        field(2; "Leave Period"; Code[20])
        {
            Caption = 'Leave Period';
        }
        field(3; Closed; Boolean)
        {
            Caption = 'Closed';
        }
        field(4; Active; Boolean)
        {
            Caption = 'Active';
        }
    }
    keys
    {
        key(PK; Id, "Leave Period")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Dropdown; "Leave Period")
        {

        }
    }
    trigger OnInsert()
    begin
        if rec."Leave Period" <> '' then begin
            Rec.Reset();
            Rec.SetRange(rec."Leave Period", xRec."Leave Period");
            if rec.Find('-') then begin
                Error('Record Already Exists');
            end;
        end;
        // Rec.Closed := False;
    end;
}

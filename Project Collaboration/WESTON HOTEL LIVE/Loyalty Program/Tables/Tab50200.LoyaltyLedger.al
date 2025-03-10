table 50200 "Loyalty Ledger"
{
    DataClassification = CustomerContent;
    Caption = 'Loyalty Ledger Entries';

    fields
    {
        field(1; "Entry No"; BigInteger)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.';
            AutoIncrement = true;
        }

        field(2; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
        }

        field(3; "Customer No"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
        }

        field(4; "Document No"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            TableRelation = "Sales Invoice Header"."No.";
        }

        field(5; "Points Earned"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Points Earned';
            ObsoleteState = Removed;
        }
        field(6; "Earned Points"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Points Earned';
            ObsoleteState = Removed;
        }
        field(7; "Points"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Points';
        }
    }

    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
        key(custDoc; "Customer No", "Document No") { }
        key(custDate; "Customer No", "Posting Date") { }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
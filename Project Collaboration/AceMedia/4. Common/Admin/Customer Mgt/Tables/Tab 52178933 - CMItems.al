table 52178933 "CM Items"
{
    Caption = 'CM Items';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[50])
        {
            Editable = false;
            Caption = 'No.';
        }
        field(2; "Entry No"; Integer)
        {

            Caption = 'Entry No';
        }
        field(3; "Model No"; Code[100])
        {
            Caption = 'Model No';
        }
        field(4; "Shelf No"; Code[50])
        {
            Caption = 'Shelf No';
        }
        field(5; Description; Text[500])
        {
            Caption = 'Description';
        }
        field(6; "Serial No"; Code[100])
        {
            Caption = 'Serial No';
        }
        field(7; "Firearm Type"; Text[250])
        {
            Caption = 'Firearm Type';
        }
        field(8; "Butt No"; Code[100])
        {
            Caption = 'Butt No';
        }
        field(9; "No of Magazine"; Integer)
        {
            Caption = 'No of Magazine';
        }
        field(10; "No of Rounds"; Integer)
        {
            Caption = 'No of Rounds';
        }
        field(11; "Time In"; Time)
        {
            Editable = false;
            Caption = 'Time In';
        }
        field(12; "Time Out"; Time)
        {
            Editable = false;
            Caption = 'Time Out';
        }
        field(13; Collected; Boolean)
        {
            Editable = false;
            Caption = 'Collected';
        }
        field(14; "Checked Out By"; Code[50])
        {
            Editable = false;
            Caption = 'Checked Out By';
        }
        field(15; "Checked In By"; Code[50])
        {
            Editable = false;
            Caption = 'Checked In By';
        }
        field(16; Select; Boolean)
        {

        }
    }
    keys
    {
        key(PK; "No.", "Entry No")
        {
            Clustered = true;
        }
    }
    procedure MarkAsCollected()
    begin
        Cmitems.Reset();
        Cmitems.SetRange(Select, true);
        if Cmitems.Find('-') then begin
            repeat
                Cmitems.Collected := true;
                Cmitems."Checked Out By" := UserId;
                Cmitems."Time Out" := Time;
                Cmitems.Modify();
            until Cmitems.Next() = 0;


        end else
            Error('No item selected to check out');
    end;

    trigger OnInsert()
    begin
        "Checked In By" := UserId;
        "Time In" := Time;
    end;

    trigger OnDelete()
    begin
      //  Access.CheckIfCanDelete();
    end;

    var
        Cmitems: Record "CM Items";
       // Access: Codeunit "Access Management";
}

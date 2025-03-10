table 52178514 "Item Group"
{
    Caption = 'Item Group';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[50])
        {

        }
        field(3; "Def. Gen. Prod. Posting Group"; Code[20])

        {

        }
        field(4; "Def. Inventory Posting Group"; Code[20])
        {

        }
        field(5; "Def. Tax Group Code"; Code[20])
        {

        }
        field(6; "Def. Costing Method"; Option)
        {
            OptionMembers = " ",FIFO,LIFO,Specific,Average,Standard;
        }
        field(7; "Def. VAT Prod. Posting Group"; Code[20])
        {

        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}

table 52178515 "Product Groups"
{
    Caption = 'Product Group';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            NotBlank = true;
            TableRelation = "Item Category".Code;
            ValidateTableRelation = false;
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7300; "Warehouse Class Code"; Code[10])
        {
            Caption = 'Warehouse Class Code';
            TableRelation = "Warehouse Class";
            ValidateTableRelation = false;
        }
        // field(1; "Code"; Code[20])
        // {
        //     // Caption = 'Code';
        //     // DataClassification = ToBeClassified;
        //     Caption = 'Item Category Code';
        //     NotBlank = true;
        //     TableRelation = "Item Category".Code;
        //     ValidateTableRelation = false;
            
        // }
        // field(2; Description; Code[20])
        // {

        // }
        // field(4; "Item Category Code"; Code[20])
        // {

        // }
    }
    keys
    {
        key(PK; "Item Category Code","Code")
        {
            Clustered = true;
        }
    }
}

tableextension 52179314 "Item Category" extends "Item Category"
{
    fields
    {
        field(52179300; "Items No"; Code[20])
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
        field(52179301; "Def. Gen. Prod. Posting Group"; Code[20])
        {

        }
        field(52179302; "Def. Inventory Posting Group"; Code[20])
        {

        }
        field(52179303; "Def. Tax Group Code"; Code[20])
        {

        }
        field(52179304; "Def. Costing Method"; Option)
        {
            //OptionCaption = FIFO,LIFO,Specific,Average,Standard;
            OptionMembers = " ",FIFO,LIFO,Specific,Average,Standard;

        }
        field(52179305; "Def. VAT Prod. Posting Group"; Code[20])
        {

        }
        field(52179306; "Item Group Code"; Code[20])
        {

        }
        field(52179307; "Items Code  Cost"; Decimal)
        {

        }
        field(52179308; "Cost Center Filter"; Code[20])
        {

        }
    }
}

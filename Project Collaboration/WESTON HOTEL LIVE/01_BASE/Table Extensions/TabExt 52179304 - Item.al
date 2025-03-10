tableextension 52179304 ExtItem extends Item
{
    fields
    {
        field(5000; "Item G/L Budget Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(99008503; "Is Controlled"; Boolean)
        {

        }
        field(52179300; Store; Code[10])
        {
            TableRelation = IF (Type = CONST(Inventory)) Location;
            // else
            // IF (Type = CONST("Minor Asset")) "FA Location";

            // trigger OnValidate()
            // begin
            //     //IF Loc.GET("Issuing Store") THEN
            //     //  "Issue UserID":=Loc."Milk Collection Vehicle";
            // end;




        }
        field(52179302; "Location code"; Code[20])
        {
            TableRelation = Location;
        }
        field(52179303; "Item Group"; Code[20])
        {

        }
        field(52179304; "Item Category"; Code[20])
        {
            
        }
        field(52179305; "Item Sub-Group"; Code[20])
        {

        }
        field(52179301; StoreLocation; Option)
        {
            OptionMembers = " ",General,Beaverage,"Food stuff";
        }
        field(52179306; "Products Group Code";Code[20] )
        {
            //DataClassification = ToBeClassified;
            //TableRelation = "Products Groups".Code where ("Item Category Code" = field("Item Category Code"));
             //TableRelation = "Product Groups".Code where("Item Category Code" = field("Item Sub-Group"));
        
        }
        modify("Item Category Code")
        {
            TableRelation = "Item Category" where ("Item Group Code"= field("Item Group"));
        
        }

    }
    
    trigger OnInsert()
    var
        USetup: record "User Setup";
    begin

        USetup.RESET;
        USetup.SETRANGE(USetup."User ID", USERID);
        USetup.SETRANGE(USetup."Create Items", false);
        IF USetup.FIND('-') THEN ERROR('You are not authorised');


    end;

}
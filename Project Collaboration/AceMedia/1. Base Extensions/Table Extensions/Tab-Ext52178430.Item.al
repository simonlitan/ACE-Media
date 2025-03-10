tableextension 52178430 "ExtItem" extends Item
{
    fields
    {
        field(6000; "Item G/L Budget Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(6001; "Is Controlled"; Boolean)
        {

        }
        field(6002; "Place of Manufacture"; option)
        {
            OptionMembers = " ","Local",Foreign;
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
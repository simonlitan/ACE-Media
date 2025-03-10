table 50009 "All Stages Per Contract"
{

    fields
    {
        field(1; "Contract No"; Code[10])
        {
        }
        field(2; "Cycle Code"; Code[10])
        {
        }
        field(3; "Cycle Stage"; Integer)
        {
        }
        field(4; Description; Time)
        {
        }
        field(5; Type; Option)
        {
            OptionCaption = ' ,Vendor,Customer';
            OptionMembers = " ",Vendor,Customer;
        }
        field(6; "Contractor No."; Code[10])
        {
        }
        field(7; "Payment Expected"; Option)
        {
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(8; "%age of Payment"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Contract No")
        {
        }
    }

    fieldgroups
    {
    }
}


table 50062 "Gym/Spa Central Setup"
{

    fields
    {
        field(1; "Title Code"; Code[10])
        {
        }
        field(2; Description; Text[30])
        {
        }
        field(3; Category; Option)
        {
            OptionCaption = ' ,Titles,Religions,Denominations,Relationships,Counties,Countries,Nationality,Districts,Positions';
            OptionMembers = " ",Titles,Religions,Denominations,Relationships,Counties,Countries,Nationality,Districts,Positions;
        }
    }

    keys
    {
        key(Key1; "Title Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}


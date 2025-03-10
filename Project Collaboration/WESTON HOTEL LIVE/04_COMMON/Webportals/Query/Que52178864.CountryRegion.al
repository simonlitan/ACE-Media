query 52178864 "Country/Region"
{
    Caption = 'Country/Region';
    QueryType = Normal;

    elements
    {
        dataitem(CountryRegion; "Country/Region")
        {
            column("Code"; "Code")
            {
            }
            column(Name; Name)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}

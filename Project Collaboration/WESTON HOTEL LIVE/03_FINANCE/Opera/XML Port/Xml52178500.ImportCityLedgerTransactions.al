xmlport 52178500 "ImportCity Ledger Transactions"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement(CityLedger; "City Ledger Import")
            {
                XmlName = 'Table';
                fieldelement(a; CityLedger."Customer No.")
                {
                }
                fieldelement(b; CityLedger."Field 1")
                {
                }
                fieldelement(c; CityLedger.Date)
                {
                }
                fieldelement(d; CityLedger."Field 2")
                {
                }
                fieldelement(e; CityLedger.Amount)
                {
                }
                fieldelement(f; CityLedger."Field 3")
                {
                }
                fieldelement(m; CityLedger."Field 4")
                {
                }
                fieldelement(n; CityLedger."Field 5")
                {
                }
                fieldelement(g; CityLedger."Invoice No.")
                {
                }
                fieldelement(h; CityLedger."Names 1")
                {
                }
                fieldelement(q; CityLedger."Field 9")
                {
                }
                fieldelement(r; CityLedger."Currency Code")
                {
                }
                fieldelement(s; CityLedger."Amount USD")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}


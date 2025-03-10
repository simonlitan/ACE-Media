xmlport 52178513 "Import Safari Transactions"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement(OperaBuffer; "Opera  Buffer Import")
            {

                fieldelement(a; OperaBuffer."G/L Account")
                {
                }
                fieldelement(b; OperaBuffer."Field 2 Buffer")
                
                {
                    MinOccurs = Zero;
                }
                fieldelement(vg; OperaBuffer.Date)
                {
                   MinOccurs = Zero; 
                }
                fieldelement(d; OperaBuffer."Field 3 Buffer")
                {
                    MinOccurs = Zero;
                }
                fieldelement(o; OperaBuffer."Field 4 Buffer")
                {
                    MinOccurs = Zero;
                }
                fieldelement(e; OperaBuffer."Field 5 Buffer")
                {
                    MinOccurs = Zero;
                }
                fieldelement(f; OperaBuffer."Cost Center")
                {
                    MinOccurs = Zero;
                }
                fieldelement(m; OperaBuffer."Posting Description")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ab; OperaBuffer."Currency Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ef; OperaBuffer.Amount)
                {
                    MinOccurs = Zero;
                }
                fieldelement(rt; OperaBuffer."Field 6 Buffer")
                {
                    MinOccurs = Zero;
                }

                trigger OnAfterInsertRecord()
                begin
                    NovBuffer.RESET;
                    NovBuffer.SETRANGE(NovBuffer."Line No.", OperaBuffer."Line No.");
                    IF NovBuffer.FIND('-') THEN BEGIN

                        IF NovBuffer."Cost Center" = 'GSTLD' THEN
                            NovBuffer."G/L Account" := '1272';

                        IF NovBuffer."Cost Center" = 'DEPLD' THEN
                            NovBuffer."G/L Account" := '1272';
                        IF NovBuffer."Cost Center" = 'PKGLD' THEN
                            NovBuffer."G/L Account" := '1284';

                        //NovBuffer."Cost Center":='';
                        NovBuffer.MODIFY;

                    END;
                    //club weston
                    /*ELSE IF NovBuffer."Cost Center"='4000|4001|4030|4031|4032|4040|4041|4042|4050|4051|4052' THEN NovBuffer."Cost Center":='1002'
                    //banquetting
                    ELSE IF NovBuffer."Cost Center"='2200|2201|2202|2210|2211|2212|2216|2217|2220|2221' THEN NovBuffer."Cost Center":='1003'
                    ELSE IF NovBuffer."Cost Center"='3200|3201|3202|3230|3231|3232|3240|3241|3242|3250|3251|3252' THEN NovBuffer."Cost Center":='1002'
                    ELSE IF NovBuffer."Cost Center"='4600|4601|4602|4607|4608|4612|4613|4614|4620|4621|4622|4053|4054|4055|4056|4057' THEN NovBuffer."Cost Center":='1081'
                    ELSE IF NovBuffer."Cost Center"='3900|3901|5400|5401|5403|4003|4004|4005|4006|4007|4033|4034|4035|4036|4037|4043|4044|4045|4046|4047' THEN NovBuffer."Cost Center":='1002'
                    ELSE IF NovBuffer."Cost Center"='2203|2204|2213|2214|2218|2219|2222|2223|2225' THEN NovBuffer."Cost Center":='1002'
                    ELSE IF NovBuffer."Cost Center"='3203|3204|3233|3233|3234|3243|3244|3253|3254' THEN NovBuffer."Cost Center":='1002'
                    ELSE IF NovBuffer."Cost Center"='4603|4604|4606|4609|4610|4615|4616|4623|4624' THEN NovBuffer."Cost Center":='1002'
                    //fand b
                    ELSE IF NovBuffer."Cost Center"='2000|2001|2002|2007|2008|2009|2013|2014|2015|2020|2021|2022|2026|2027|2028|2031|2032|2033|2040|2041|2042|2050|2051|2052' THEN NovBuffer."Cost Center":='1013'
                    ELSE IF NovBuffer."Cost Center"='2003|2004|2010|2011|2016|2017|2023|2024|2029|2030|2034|2035|2043|2044|2053|2054' THEN NovBuffer."Cost Center":='1002'
                    //safari
                    ELSE IF NovBuffer."Cost Center"='2100|2101|2102|2110|2111|2112|2115|2116|2117|2120|2121|2122|2130|2131|2132|2140|2141|2142|2150|2151|2152' THEN NovBuffer."Cost Center":='1002'
                    ELSE IF NovBuffer."Cost Center"='2103|2104|2113|2114|2118|2119|2123|2124|2133|2134|2143|2144|2153|2154' THEN NovBuffer."Cost Center":='1002'
                    //lelai
                    ELSE IF NovBuffer."Cost Center"='2160|2161|2162|2166|2167|2168|2172|2173|2174|2178|2179|2183|2184|2185|2189|2190|2194|2195|2191|2196' THEN NovBuffer."Cost Center":='1015'
                    ELSE IF NovBuffer."Cost Center"='2163|2164|2169|2170|2175|2176|2180|2181|2181|2187|2192|2193|2197|2198' THEN NovBuffer."Cost Center":='1002'
                    //swara
                    ELSE IF NovBuffer."Cost Center"='5001|5002|5003|5004|5005|5006|5007|5008|5009|5010|5012|5013|5014|5040|5050|5051|5052|5053|5054|5055|5056|5057|5058|5059|5060|5100|5101|'
                     THEN NovBuffer."Cost Center":='1012'
                    ELSE IF NovBuffer."Cost Center"='5130|5150|5200|5230|5250|6001|6002|6003|6004|6005|6006|6010|6011|6012|6015' THEN NovBuffer."Cost Center":='1012'
                    //business center
                    ELSE IF NovBuffer."Cost Center"='4500|4501|4502|4507|4505|4506|4508|4509|4510|4511' THEN NovBuffer."Cost Center":='1082'
                    //barber
                    ELSE IF NovBuffer."Cost Center"='|4400|4401|4402|4405|4406|4404' THEN NovBuffer."Cost Center":='1002'
                    //laundry
                    ELSE IF NovBuffer."Cost Center"='4301|4302|4303|4304|4305|4306|4307|4308|4309|4310'  THEN NovBuffer."Cost Center":='1002'
                    //gym
                    
                    ELSE IF NovBuffer."Cost Center"='1100|1101|1102|1201|1202|1203|1000|1001|1200|8000|8001|8002|9000|9001|9002|9003|9004|9005|9006|9007|9008|9010|9011|9012|9030'  THEN NovBuffer."Cost Center":='1002'
                    ELSE IF NovBuffer."Cost Center"='9100|9101|9102|9103|9110|9111||9112|9113|9114|9115|9116|9117'  THEN NovBuffer."Cost Center":='1002'
                    ELSE IF NovBuffer."Cost Center"='9501|9502|9503|9504|9505|9506|9507|9508|9509|9510|9511|9512|9513|9514|9515'  THEN NovBuffer."Cost Center":='1002'
                    ELSE IF NovBuffer."Cost Center"='1500'  THEN NovBuffer."Cost Center":='1002';
                    //front office
                    
                    
                    
                    
                    NovBuffer.MODIFY;
                    
                    UNTIL NovBuffer.NEXT=0;
                    END;
                     */

                end;

                trigger OnBeforeInsertRecord()
                begin
                    /*NovBuffer.RESET;
                    NovBuffer.SETRANGE(NovBuffer."Reference No.","Novacom Buffer Import"."Reference No.");
                    NovBuffer.SETRANGE(NovBuffer."Posting Date","Novacom Buffer Import"."Posting Date");
                    IF NOT NovBuffer.FIND ('-') THEN BEGIN
                    END ELSE BEGIN
                    ERROR('File already exists!');
                    END;
                    */

                end;
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

    trigger OnPostXmlPort()
    begin
        MESSAGE('Done!');
    end;

    var
        NovBuffer: Record "Opera  Buffer Import";
}


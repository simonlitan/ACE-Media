tableextension 52178439 "ExtFixed Asset" extends "Fixed Asset"
{
    fields
    {
        field(6000; "Is Vehicle"; Boolean)
        {

        }
        field(6001; "Fuel Rate"; Decimal)
        {

        }
        field(6002; "Fuel consumption Rate"; decimal)
        {

        }
        field(6003; "Vehicle Registration No."; Code[30])
        {

        }
        field(6004; Model; text[100])
        {

        }
        field(6005; Condition; text[250])
        {

        }
        field(6006; "Tag No."; text[250])
        {

        }
        field(6007; "Desription 2"; text[250])
        {

        }
        field(6008; "FIxed Asset Location"; text[250])
        {

        }
        field(6009; "Title Status"; text[250])
        {

        }
        field(6010; "Title NO."; text[250])
        {

        }
        field(6011; "Land Size "; text[250])
        {

        }
        field(6012; "Google Coordinates"; text[250])
        {

        }
        field(6013; "Water Tanks"; text[250])
        {

        }
        field(6014; Reserviors; text[250])
        {

        }
        field(6015; County; text[250])
        {

        }
        field(6016; "Location/Region"; text[250])
        {

        }
        field(6017; Name; text[250])
        {

        }
        field(6018; Remarks; text[250])
        {

        }
    }
    keys
    {
        key(key11; "Vehicle Registration No.")
        {

        }
    }
    trigger OnInsert()
    var
        USetup: record "User Setup";
    begin

        USetup.RESET;
        USetup.SETRANGE(USetup."User ID", USERID);
        USetup.SETRANGE(USetup."Create FA", false);
        IF USetup.FIND('-') THEN ERROR('You are not authorised');


    end;
}
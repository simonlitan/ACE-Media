tableextension 52179316 "Fixed Assets Ext" extends "Fixed Asset"
{
    fields
    {
        field(5000; "Is Vehicle"; Boolean)
        {

        }
        field(5001; "Fuel Rate"; Decimal)
        {

        }
        field(5002; "Fuel consumption Rate"; decimal)
        {

        }
        field(5003; "Vehicle Registration No."; Code[30])
        {

        }
        field(52179301; Model; text[100])
        {

        }
        field(52179302; Condition; text[250])
        {

        }
        field(52179303; "Tag No."; text[250])
        {

        }
        field(52179304; "Desription 2"; text[250])
        {

        }
        field(52179305; "FIxed Asset Location"; text[250])
        {

        }
        field(52179306; "Title Status"; text[250])
        {

        }
        field(52179307; "Title NO."; text[250])
        {

        }
        field(52179308; "Land Size "; text[250])
        {

        }
        field(52179309; "Google Coordinates"; text[250])
        {

        }
        field(52179310; "Water Tanks"; text[250])
        {

        }
        field(52179311; Reserviors; text[250])
        {

        }
        field(52179312; County; text[250])
        {

        }
        field(52179313; "Location/Region"; text[250])
        {

        }
        field(52179314; Name; text[250])
        {

        }
        field(52179315; Remarks; text[250])
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
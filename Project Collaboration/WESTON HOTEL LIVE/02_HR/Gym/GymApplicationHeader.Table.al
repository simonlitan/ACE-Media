table 50061 "Gym Application Header_"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(4; City; Text[30])
        {
            Caption = 'City';
            TableRelation = IF ("Country/Region Code"=CONST()) "Post Code".City
                            ELSE IF ("Country/Region Code" = FILTER(<>'')) "Post Code".City WHERE ("Country/Region Code"=FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(5;"Phone No.";Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(6;"Country/Region Code";Code[10])
        {
            Caption = '"Country/Region" Code';
            TableRelation = "Country/Region";
        }
        field(7;"ID Number";Code[20])
        {
        }
        field(8;Gender;Option)
        {
            OptionMembers = " ",Male,Female;
        }
        field(9;"Date Of Birth";Date)
        {

            trigger OnValidate()
            begin
                //Age:=HrDates.DetermineAge("Date Of Birth",TODAY);
            end;
        }
        field(10;Age;Text[50])
        {
            Editable = false;
        }
        field(11;Religion;Code[50])
        {
            Caption = 'Religions';
            TableRelation = "Gym/Spa Central Setup"."Title Code" WHERE (Category=CONST(Religions));
        }
        field(12;Citizenship;Text[30])
        {
            TableRelation = "Gym/Spa Central Setup"."Title Code" WHERE (Category=CONST(Nationality));
        }
        field(13;"Passport No";Code[30])
        {
        }
        field(14;"E-Mail";Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;
        }
        field(15;Status;Option)
        {
            OptionMembers = Open,"Pending Approval",Approved;

            trigger OnValidate()
            begin
                IF Status=Status::Approved THEN BEGIN
                NewCode:='';
                IF SalesSetup.GET THEN
                NewCode:=NoSeriesMgt.GetNextNo(SalesSetup."Gym Nos",0D,TRUE);
                Cust.INIT;
                Cust."No.":=NewCode;
                Cust.Name:=Name;
                Cust.Address:=Address;
                Cust.City:=City;
                Cust."Phone No.":="Phone No.";
                Cust."ID No":="ID Number";
                Cust.Gender:=Gender;
                Cust."Date Of Birth":="Date Of Birth";
                //Cust.Religion:=Religion;
                Cust.Citizenship:=Citizenship;
                //Cust."Passport No":="Passport No";
                Cust."E-Mail":="E-Mail";
                Cust."Customer Posting Group":='TRADE';
                Cust."Gen. Bus. Posting Group":='LOCAL';
                //Cust."Customer Type":=Cust."Customer Type"::Gym;
                Cust.INSERT;
                END;
            end;
        }
        field(16;"No series";Code[20])
        {
        }
        field(17;"Registration Date";Date)
        {
        }
        field(18;"Expiry Date";Date)
        {
        }
        field(19;Remarks;Text[150])
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        IF  "No." = '' THEN
        BEGIN
          SalesSetup.GET;
           SalesSetup.TESTFIELD(SalesSetup."Gym Application Nos");
          NoSeriesMgt.InitSeries(SalesSetup."Gym Application Nos",xRec."No series",0D,"No." ,"No series");
        END;
    end;

    var
        SalesSetup: Record 311;
        NoSeriesMgt: Codeunit 396;
        NewCode: Code[20];
        Cust: Record 18;
        HrDates: Codeunit 50002;
}


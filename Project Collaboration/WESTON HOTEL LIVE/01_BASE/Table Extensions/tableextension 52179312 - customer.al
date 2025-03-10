tableextension 52179312 customer extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(27002; "Customer Type"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(27003; "Catering Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27004; Age; Integer)
        {
            DataClassification = ToBeClassified;
        }


            field(52179300; "Passport No"; Code[20])
            {
                DataClassification = ToBeClassified;
            }
            field(52179301; "Gym Status"; Option)
            {
                OptionMembers = Active,Inactive;
            }
            field(52179302; "Date of Registration"; Date)
            {
                DataClassification = ToBeClassified;
            }
            field(52179303; "Date of Expiry"; Date)
            {
                DataClassification = ToBeClassified;
            }
            field(52179304; "Gym Rate"; Decimal)
            {
                DataClassification = ToBeClassified;
            }
            field(52179305; "Gym Membership Type"; Option)
            {
                OptionMembers = ,Monthly,Quartely,"Semi-Annualy",Yearly;
            }
            field(52179306; "Gym Remarks"; Text[200])
            {
                DataClassification = ToBeClassified;
            }
            field(52179307; "Gym Amount Paid"; Decimal)
            {
                DataClassification = ToBeClassified;
            }
            field(52179308; "Gym Payment Status"; Option)
            {
                OptionMembers = ,"Fully Paid","Partially Paid",Unpaid;
            }


        field(27005; "Date Of Birth"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27006; Gender; Option)
        {
            OptionCaption = 'Male,Female';
            OptionMembers = Male,Female;
        }
        field(27007; "Marital Status"; Option)
        {
            OptionCaption = 'Single,Married';
            OptionMembers = Single,Married;
        }
        field(27008; "Blood Group"; Text[5])
        {
            DataClassification = ToBeClassified;
        }
        field(27009; Weight; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27010; Height; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27011; Religion; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27012; Citizenship; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(27013; "Payments By"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(27014; "ID No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(27015; "Birth Cert"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(27016; "Staff No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(27017; "Balance (Cafe)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27018; "KRA pin"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(27019; "HS Code"; code[20])
        {
            DataClassification = ToBeClassified;
        }


    }
    trigger OnInsert()
    var
        USetup: record "User Setup";
    begin

        USetup.RESET;
        USetup.SETRANGE(USetup."User ID", USERID);
        USetup.SETRANGE(USetup."Create Customer", false);
        IF USetup.FIND('-') THEN ERROR('You are not authorised');


    end;
}
table 52178934 "FacePrint Biometric"
{
   // DrillDownPageID = "Biometric Logs";
   // LookupPageID = "Biometric Logs";

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Staff Number"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Full Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Time; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Temperature; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Area"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Terminal Serial No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Punch State"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Daily Hours"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Date)
        {
        }
        key(Key3; Time)
        {
        }
    }

    fieldgroups
    {
    }
}


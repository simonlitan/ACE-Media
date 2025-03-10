table 52179214 "HRM-Control-Information"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; Name; Text[50])
        {
        }
        field(3; "Name 2"; Text[50])
        {
        }
        field(4; Address; Text[50])
        {
        }
        field(5; "Address 2"; Text[50])
        {
        }
        field(6; City; Text[50])
        {
        }
        field(7; "Phone No."; Text[150])
        {
        }
        field(8; "Phone No. 2"; Text[20])
        {
        }
        field(9; "Telex No."; Text[20])
        {
        }
        field(10; "Fax No."; Text[20])
        {
        }
        field(11; "Giro No."; Text[20])
        {
        }
        field(12; "Bank Name"; Text[30])
        {
        }
        field(13; "Bank Branch No."; Text[20])
        {
        }
        field(14; "Bank Account No."; Text[20])
        {
        }
        field(15; "Payment Routing No."; Text[20])
        {
        }
        field(16; "Customs Permit No."; Text[10])
        {
        }
        field(17; "Customs Permit Date"; Date)
        {
        }
        field(18; "VAT Registration No."; Text[20])
        {
        }
        field(19; "Registration No."; Text[20])
        {
        }
        field(20; "Telex Answer Back"; Text[20])
        {
        }
        field(21; "Ship-to Name"; Text[30])
        {
        }
        field(22; "Ship-to Name 2"; Text[30])
        {
        }
        field(23; "Ship-to Address"; Text[30])
        {
        }
        field(24; "Ship-to Address 2"; Text[30])
        {
        }
        field(25; "Ship-to City"; Text[30])
        {
        }
        field(26; "Ship-to Contact"; Text[30])
        {
        }
        field(27; "Location Code"; Code[10])
        {
            TableRelation = Location;
        }
        field(28; Picture; BLOB)
        {
            SubType = Bitmap;
        }
        field(29; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if PostCode.Get("Post Code") then
                    City := PostCode.City;
            end;
        }
        field(30; County; Text[30])
        {
        }
        field(31; "Ship-to Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if PostCode.Get("Ship-to Post Code") then
                    "Ship-to City" := PostCode.City;
            end;
        }
        field(32; "Ship-to County"; Text[30])
        {
        }
        field(33; "E-Mail"; Text[80])
        {
        }
        field(34; "Home Page"; Text[80])
        {
        }
        field(35; "Company P.I.N"; Code[30])
        {
        }
        field(36; "N.S.S.F No."; Code[30])
        {
        }
        field(37; "Company code"; Code[10])
        {
        }
        field(38; "Working Days Per Year"; Integer)
        {
        }
        field(39; "Working Hours Per Week"; Integer)
        {
        }
        field(40; "Working Hours Per Day"; Integer)
        {
        }
        field(41; Mission; Text[250])
        {
        }
        field(42; "Mission/Vision Link"; Text[50])
        {
        }
        field(43; Vision; Text[250])
        {
        }
        field(44; "N.H.I.F No"; Text[100])
        {
        }
        field(45; "Payslip Message"; Text[250])
        {
            Description = 'Dennis Added';
        }
        field(46; "Multiple Payroll"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
        }
    }

    fieldgroups
    {
    }

    var
        PostCode: Record "Post Code";
}


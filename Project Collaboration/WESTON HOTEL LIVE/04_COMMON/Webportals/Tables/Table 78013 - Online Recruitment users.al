table 52178885 "Online Recruitment users"
{

    fields
    {
        field(1; Initials; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mr,Mrs,Miss';
            OptionMembers = Mr,Mrs,Miss;
        }
        field(2; "First Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Middle Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Last Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Postal Address"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Postal Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "ID Number"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Male,Female';
            OptionMembers = Male,Female;
        }
        field(9; "Cell Phone Number"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Home Phone Number"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Residential Address"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Citizenship; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; County; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Marital Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Single,Married,Separated,Divorced,Widow(er),Other';
            OptionMembers = Single,Married,Separated,Divorced,"Widow(er)",Other;
        }
        field(15; "Ethnic Origin"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'African,Indian,White,Coloured';
            OptionMembers = African,Indian,White,Coloured;
        }
        field(16; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Desability Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Date of Birth"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Driving License"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "KRA PIN Number"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "1st Language"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "2nd Language"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Additional Language"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Applicant Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'External,Internal';
            OptionMembers = External,Internal;
        }
        field(25; "Email Address"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(26; Password; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Initials)
        {
        }
    }

    fieldgroups
    {
    }
}


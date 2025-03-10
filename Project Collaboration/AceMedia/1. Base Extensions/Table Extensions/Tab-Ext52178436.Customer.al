tableextension 52178436 "ExtCustomer" extends Customer
{
    // Add changes to table fields here



    fields
    {
        field(6000; "Bank code"; code[10])
        {
            NotBlank = true;


        }
        field(6001; "Bank Name"; text[100])
        {
            NotBlank = true;
            Editable = false;
        }
        field(6002; "Branch Code"; code[10])
        {


        }
        field(6003; "Branch Name"; Text[100])
        {
            Editable = false;
            NotBlank = true;

        }
        field(6004; "Account No"; code[50])
        {
            NotBlank = true;

        }
        field(6005; "Customer Type"; Option)
        {
            OptionMembers = " ",Interns,Staff,Board,Others;
        }
        field(6006; "Catering Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6007; Age; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6008; "Date Of Birth"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6009; Gender; Option)
        {
            OptionCaption = 'Male,Female';
            OptionMembers = Male,Female;
        }
        field(6010; "Marital Status"; Option)
        {
            OptionCaption = 'Single,Married';
            OptionMembers = Single,Married;
        }
        field(6011; "Blood Group"; Text[5])
        {
            DataClassification = ToBeClassified;
        }
        field(6012; Weight; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6013; Height; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6014; Religion; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6015; Citizenship; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6016; "Payments By"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(6017; "ID No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6018; "Birth Cert"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6019; "Staff No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6020; "Balance (Cafe)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6021; "KRA pin"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6022; "HS Code"; code[20])
        {
            DataClassification = ToBeClassified;
        }


        // Add changes to table fields here
    }
    trigger OnInsert()
    begin

        USetup.RESET;
        USetup.SETRANGE(USetup."User ID", USERID);
        USetup.SETRANGE(USetup."Create Customer", false);
        IF USetup.FIND('-') THEN ERROR('You are not authorised');


    end;

    var
        USetup: record "User Setup";

}
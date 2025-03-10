table 52178424 "OTP Numbers"
{
    Caption = 'OTP Numbers';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "User Id"; Code[50])
        {
            Caption = 'User Id';
        }
        field(2; "OTP No"; Integer)
        {
            Caption = 'Entry No';
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(4; "E-Mail"; Code[100])
        {
            Caption = 'E-Mail';
        }


    }
    keys
    {
        key(PK; "User Id","OTP No")
        {
            Clustered = true;
        }
    }
}

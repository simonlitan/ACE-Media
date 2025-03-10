table 52178543 "Casual Attendance"
{
    Caption = 'Casual Attendance';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Person ID"; Code[50] )
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Department; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Time; Date)
        {
            DataClassification =  ToBeClassified;
        }
        field(7; "Attendance Status"; Option)
        {
            OptionMembers = "", "Check-In"," Check-Out";
        }
        field(8; "Check Point"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
           field(9; "Custom Name"; Option)
        {
            OptionMembers = "", Check_In, Check_Out;
        }
        field(10; "Data Source"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Person ID")
        {
            Clustered = true;
        }
    }
}

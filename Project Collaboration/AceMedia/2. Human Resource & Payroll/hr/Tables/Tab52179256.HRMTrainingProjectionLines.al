table 52179256 "HRM-Training Projection Lines"
{
    Caption = 'HRM-Training Projection Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Period; Code[50])
        {
            Caption = 'Period';
        }
        field(2; "Employee No"; Code[50])
        {
            Caption = 'Employee No';
        }
        field(3; "S/No"; Integer)
        {
            Caption = 'S/No';
        }
        field(4; "Course Projected"; Text[500])
        {
            Caption = 'Course Projected';
        }
        field(5; Reason; Text[2048])
        {
            Caption = 'Reason';
        }
        field(6; "Training Institution"; Text[500])
        {
            Caption = 'Training Institution';
        }
        field(7; "Course Duration"; Code[50])
        {
            Caption = 'Course Duration';
        }
        field(8; "Proposed Sponsor"; Code[50])
        {
            Caption = 'Proposed Sponsor';
        }
        field(9; "Estimated Cost"; Decimal)
        {
            Caption = 'Estimated Cost';
        }
        field(10; Type; Option)
        {
            OptionMembers = " ", "DSA &Transport","Tuition Cost","Confremce Cost";
        }
    }
    keys
    {
        key(PK; Period, "Employee No", "S/No")
        {
            Clustered = true;
        }
    }
}

table 52179242 "Appraisal Comments"
{
    Caption = 'Appraisal Comments';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = True;
        }
        field(2; "Appraisal No"; Code[30])
        {
            Caption = 'Appraisal No';
        }
        field(3; Comment; Text[100])
        {
            Caption = 'Comment';
        }
        field(4; UserId; Code[30])
        {
            Caption = 'UserId';
        }
        field(5; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Open,Submitted,Rejected,"Supervisor Agreed",Agreed,Disagreed;
        }
        field(6; "Comment Date"; Date)
        {
            Caption = 'Comment Date';
        }
        field(7; "Rating Status"; Option)
        {
            OptionMembers = Open,Submitted,Rejected,"Supervisor's Rating",Agreed,Disagreed,Closed;

        }
    }
    keys
    {
        key(PK; "Entry No", "Appraisal No")
        {
            Clustered = true;
        }
    }
}

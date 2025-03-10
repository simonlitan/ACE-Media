table 52178544 "Casuals Regestration List"
{
    Caption = 'Casuals Regestration List';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No"; code[30])
        {
           DataClassification = ToBeClassified;
        }
        field(2;"First Name"; code[30])
        {
            

        }
        field(3; "Middle Name"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Last Name"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "ID No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Department; Code[20])
        {
            //TableRelation = Dimension.Code where(Department= const(2))
        }
    }
    keys
    {
        key(PK; "no")
        {
            Clustered = true;
        }
    }
}

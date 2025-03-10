/// <summary>
/// Table Project monitoring Params (ID 52178480).
/// </summary>
table 52178865 "Project monitoring Params"
{
    fields
    {
        field(1; "Line No."; integer)
        {
            AutoIncrement = true;
        }
        field(2; "Code"; code[30])
        {
            TableRelation = "Contract Monitoring Param".Code;
        }
        field(3; Description; Text[100])
        {

        }
        field(4; "Ability to comply"; Option)
        {
            OptionCaption = 'Poor,Fair,Good,Very good,Excellent';
            OptionMembers = Poor,Fair,Good,"Very good",Excellent;
        }
        field(5; "Remarks"; Text[100])
        {

        }

    }
    keys
    {
        key(key1; "Line No.", Code)
        {
            Clustered = true;
        }

    }


}
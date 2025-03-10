table 85515 "Perfomance Evaluation"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;objCode;Code[5])
        {
        }
        field(2;"PF. No.";Code[20])
        {
            Editable = true;
            NotBlank = true;
        }
        field(3;Objective;Text[100])
        {
        }


        field(4; Punctuality; Text[200])
        {
        }
        field(5; Productivity; Text[200])
        {
        }
        field(6; Quality; Text[200])
        {
        }
        field(7; Knowledge; Text[200])
        {
        }
        field(8; Development; Text[200])
        {
        }
        field(9; Iniciative; Text[200])
        {
        }
        field(10; Judgement; Text[200])
        {
        }
        field(11; Reliability; Text[200])
        {
        }
        field(12; Communication; Text[200])
        {
        }
        field(13; Teamwork; Text[200])
        {
        }
        field(14; Ethics; Text[200])
        {
        }
    }
    keys
    {
        key(Key1;objCode)
        {
            Clustered = true;
        }
    }
}

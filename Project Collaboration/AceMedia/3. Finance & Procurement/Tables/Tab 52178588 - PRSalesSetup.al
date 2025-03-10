table 52178588 "PR Sales Setup"
{

   DrillDownPageId = "PR Sales Setup";
   LookupPageId = "PR Sales Setup";


    fields
    {
        field(1; "Service Code"; Code[20])
        {

        }
        field(2; "Service Name"; Code[50])
        {

        }
        field(3; Account; Code[20])
        {
            TableRelation = "G/L Account"."No.";
            trigger OnValidate()
            var
                GL: Record "G/L Account";
            begin
                GL.Reset();
                if GL.Get(Account) then
                    "Account Name" := GL."No.";
            end;
        }
        field(4; Amount; Decimal)
        {

        }
        field(5; "Account Name"; Code[50])
        {

        }
        field(6; "Service Rate"; Decimal)
        {

        }
    }
    keys
    {
        key(PK; "Service Code", "Service Name")
        {
            Clustered = true;
        }
    }
}

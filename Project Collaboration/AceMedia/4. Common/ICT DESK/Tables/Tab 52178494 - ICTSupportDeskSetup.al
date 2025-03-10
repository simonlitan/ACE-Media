table 52178893 "ICT Support Desk Setup"
{
    DrillDownPageId = "ICT No. Series";
    LookupPageId = "ICT No. Series";

    fields
    {
        field(1; "No."; Integer)
        {

        }
        field(2; "Support Desk"; Code[30])
        {
            TableRelation = "No. Series".Code;

            trigger OnValidate()
            var
                RRec: Record "No. Series";
            begin
                NoSeries := '';
                RRec.Reset();
                RRec.SetRange(RRec.Code, "Support Desk");
                if RRec.Find('-') then
                    NoSeries := RRec.Code;
            end;
        }
        field(4; "NoSeries"; Code[30])
        {

        }
        field(3; "Token No."; Code[30])
        {
            TableRelation = "No. Series".Code;

        }
        field(5; "Ticket No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6; "Support Area No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }

    }
}
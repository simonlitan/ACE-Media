table 52178423 "EDMS"
{
    LookupPageId = EDMS;
    DrillDownPageId = EDMS;

    fields
    {

        field(1; "Document Type"; Option)
        {

            OptionMembers = " ",Memo,LPO,"Staff File",Imprest,"Staff Claims","Imprest SURR","PC RQS","PC SURR","Payment Voucher";
        }
        field(2; "url path"; Text[250])
        {
        }
        field(3; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type")
        {

        }
    }

    fieldgroups
    {
    }
}

